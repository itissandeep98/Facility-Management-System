package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXDialog;
import com.jfoenix.controls.JFXDialogLayout;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.control.ButtonBar.ButtonData;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Dialog;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.util.Pair;

public class WelcomeScreen implements Initializable {

  @FXML
  private RadioButton employee;
  @FXML
  private RadioButton user;
  @FXML
  private RadioButton fms;
  @FXML
  private TextField username;
  @FXML
  private PasswordField password;
  @FXML
  private StackPane pane;
  private LoginUser log;


  @Override
  public void initialize(URL url, ResourceBundle resourceBundle) {
    ToggleGroup group = new ToggleGroup();

    employee.setToggleGroup(group);
    user.setToggleGroup(group);
    fms.setToggleGroup(group);

    user.setSelected(true);
  }

  public void execute_login() {

    String Username = username.getText();
    String Password = password.getText();
    if (Username.isEmpty()) { // if username is empty
      Main.showalert("Failure", "Username Can't be empty", pane, Color.RED);
      return;
    } else if (Password.isEmpty()) { // if password is empty
      Main.showalert("Failure", "Password Can't be empty", pane, Color.RED);
      return;
    }

    if (Main.checkinternet()) { //check internet connection
      Main.warnconnection("Failure", "NO internet connection!!", pane, Color.RED);
      return;
    }

    if (check(Username, Password)) { // check if user id and password is correct
      Main.showalert("Failure", "Wrong Username or Password!!", pane, Color.RED);
      username.setText("");
      password.setText("");
      return;
    }

    showalert("Success", "Logged in Successfully", pane, Color.GREEN);

  }

  // check if user id and password is correct
  public Boolean check(String Username, String Password) {

    if (fms.isSelected()) {
      log = Main.getConnection(Username, Password, "fms");
    } else if (user.isSelected()) {
      log = Main.getConnection(Username, Password, "user");
    } else {
      log = Main.getConnection(Username, Password, "employee");
    }

    return log.getID() == -1;
  }


  // Same Function as in Main Class just a little bit different
  public void showalert(String title, String message, StackPane pane, Color col) {
    JFXDialogLayout content = new JFXDialogLayout();
    Text t = new Text(title);
    t.setFill(col);
    content.setHeading(t);
    t = new Text(message);
    t.setFill(col);
    content.setBody(t);
    JFXButton button = new JFXButton("Done");
    button.setBackground(
        new Background(new BackgroundFill(Color.ALICEBLUE, CornerRadii.EMPTY, Insets.EMPTY)));
    JFXDialog dialog = new JFXDialog(pane, content, JFXDialog.DialogTransition.CENTER);
    button.setOnAction(actionEvent -> {
      dialog.close();
      if (fms.isSelected()) {
        Main.changeScene("FMS.fxml");
      } else if (user.isSelected()) {
        User u = (User) Main.changeScene("User.fxml");
        assert u != null;
        u.updatelabel(log);
      } else {
        Employee e = (Employee) Main.changeScene("Employee.fxml");
        assert e != null;
        e.updatelabel(log);
      }
    });
    content.setActions(button);
    dialog.show();
  }

  public void forgotpasswd() {
    Dialog<Pair<String, String>> dialog = new Dialog<>();
    dialog.setTitle("Set New Password");

    ButtonType loginButtonType = new ButtonType("OK", ButtonData.OK_DONE);
    dialog.getDialogPane().getButtonTypes().addAll(loginButtonType, ButtonType.CANCEL);
    Node buttok = dialog.getDialogPane().lookupButton(loginButtonType);
    buttok.setDisable(true);

    GridPane gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);
    gridPane.setPadding(new Insets(20, 10, 10, 10));

    TextField name = new TextField();
    name.setPromptText("Username");
    PasswordField oldpasswd = new PasswordField();
    oldpasswd.setPromptText("Old Password");
    PasswordField newpasswd = new PasswordField();
    newpasswd.setPromptText("New Password");
    gridPane.add(new Label("Username:"), 0, 0);
    gridPane.add(name, 1, 0);
    gridPane.add(new Label("Old Password:"), 0, 1);
    gridPane.add(oldpasswd, 1, 1);
    gridPane.add(new Label("New Password:"), 0, 2);
    gridPane.add(newpasswd, 1, 2);

    dialog.getDialogPane().setContent(gridPane);
    newpasswd.textProperty().addListener(observable -> {
      if (newpasswd.getText().length() > 3 && name.getText() != null
          && oldpasswd.getText() != null) {
        buttok.setDisable(false);
      }
    });

    Platform.runLater(name::requestFocus);
    dialog.setResultConverter(dialogButton -> {
      if (dialogButton == loginButtonType) {
        if (forgotquery(name.getText(), oldpasswd.getText(), newpasswd.getText())) {
          Main.showalert("Password change failed",
              "Username and Old Password doesn't Match\n Password not changed!!", pane, Color.RED);
        }
      }
      return null;
    });
    dialog.showAndWait();

  }

  private boolean forgotquery(String usrname, String oldpasswd, String newpasswd) {
    ResultSet rs;
    String query = String.format(
        "SELECT ar.ID,ar.Name FROM allusers ar WHERE ar.Username = \"%s\" AND "
            + "substring(ar.Password,11,CHAR_LENGTH(ar.Password)-20) = \"%s\"", usrname, oldpasswd);
    String s = Main.encoderstring();
    newpasswd = s + newpasswd + s;
    try {
      rs = Main.con.createStatement().executeQuery(query);
      if (rs.next()) {
        query = String
            .format("UPDATE allusers SET Password=\"%s\" WHERE ID=%d", newpasswd, rs.getInt("ID"));
        Main.con.createStatement().executeUpdate(query);
        return false;
      }

    } catch (SQLException e) {
      System.out.println("error in execute query\n" + e);
    }
    return true;

  }

}
