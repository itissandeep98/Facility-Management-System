package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXDialog;
import com.jfoenix.controls.JFXDialogLayout;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.scene.control.PasswordField;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;

import java.net.URL;
import java.util.ResourceBundle;

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


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        ToggleGroup group = new ToggleGroup();

        employee.setToggleGroup(group);
        user.setToggleGroup(group);
        fms.setToggleGroup(group);

        user.setSelected(true);

    }

    public void execute_login(ActionEvent e) throws Exception {
        String Username=username.getText();
        String Password=password.getText();
        if(Username.isEmpty()){ // if username is empty
            Main.showalert("Failure", "Username Can't be empty",pane,Color.RED);
            return;
        }
        else if(Password.isEmpty()){ // if password is empty
            Main.showalert("Failure", "Password Can't be empty",pane,Color.RED);
            return;
        }
        if(check(Username,Password)){ // check if user id and password is correct
            Main.showalert("Failure", "Wrong Username or Password!!",pane,Color.RED);
            username.setText("");
            password.setText("");
            return;
        }
        showalert("Success", "Logged in Successfully",pane,Color.GREEN);

    }
    public Boolean check(String id,String pass){  // check if user id and password is correct
        //ToDo: enter JDBC code to check user details
        return false;
    }

    public void showalert(String title, String message, StackPane pane,Color col){ // Same Function as in Main Class just a little bit different
        JFXDialogLayout content=new JFXDialogLayout();
        Text t=new Text(title);
        t.setFill(col);
        content.setHeading(t);
        t=new Text(message);
        t.setFill(col);
        content.setBody(t);
        JFXButton button =new JFXButton("Done");
        button.setBackground(new Background(new BackgroundFill(Color.ALICEBLUE, CornerRadii.EMPTY, Insets.EMPTY)));
        JFXDialog dialog =new JFXDialog(pane,content,JFXDialog.DialogTransition.CENTER);
        button.setOnAction(actionEvent -> {
            dialog.close();
            if (fms.isSelected()) {
                Main.changeScene("FMS.fxml");
            } else if (user.isSelected()) {
                Main.changeScene("User.fxml");
            } else {
                Main.changeScene("Employee.fxml");
            }
        });
        content.setActions(button);
        dialog.show();
    }
}
