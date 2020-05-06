package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXDialog;
import com.jfoenix.controls.JFXDialogLayout;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.CornerRadii;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.Stage;


public class Main extends Application {

  public static Parent root;
  public static Stage stage;
  public static Connection con;

  //ToDo: Don't forget to update the below strings according to your local MySQL Host
  private static String dbusername = "fms";
  private static String dbpassword = "Fmsdb123";

  @Override
  public void start(Stage primaryStage) throws Exception {
    initconnection();
    stage = primaryStage;
    root = FXMLLoader.load(getClass().getResource("WelcomeScreen.fxml"));
    Image icon = new Image("sample/icons/icon.png");
    primaryStage.getIcons().add(icon);
    primaryStage.setTitle("Facility  Management System");
    primaryStage.setScene(new Scene(root));
    primaryStage.show();
  }

  private void initconnection() throws SQLException {
//    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms",
//        dbusername, dbpassword);  //localhost
//
//    con = DriverManager
//        .getConnection("jdbc:mysql://alert-shape-272706:us-central1:dbms:3306/dbms", dbusername,
//            dbpassword); //googlecloud
//
//    con = DriverManager
//        .getConnection("jdbc:mysql://fmsdbms.mysql.database.azure.com:3306/dbms?serverTimezone=UTC",
//            dbusername, dbpassword); // Azure credentials
    con = DriverManager
        .getConnection("jdbc:mysql://dbms.czdw77kneec2.us-east-1.rds.amazonaws.com:3306/dbms",
            dbusername, dbpassword); // AWS credentials

  }

  // custom made function which helps in changing the scene
  public static Object changeScene(String file) {
    try {
      FXMLLoader root1 = new FXMLLoader(Main.class.getResource(file));
      root = root1.load();
      Main.stage.setScene(new Scene(root));
      return root1.getController();

    } catch (Exception e) {
      System.out.println("Main:Error in changing scene to " + file);
    }
    return null;
  }

  public static void showalert(String title, String message, StackPane pane, Color col) {
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
    button.setOnAction(actionEvent -> dialog.close());
    content.setActions(button);
    dialog.show();
  }

  public static void warnconnection(String title, String message, StackPane pane, Color col) {
    JFXDialogLayout content = new JFXDialogLayout();
    Text t = new Text(title);
    t.setFill(col);
    content.setHeading(t);
    t = new Text(message);
    t.setFill(col);
    content.setBody(t);

    JFXDialog dialog = new JFXDialog(pane, content, JFXDialog.DialogTransition.CENTER);

    JFXButton button = new JFXButton("Done");
    button.setBackground(
        new Background(new BackgroundFill(Color.ALICEBLUE, CornerRadii.EMPTY, Insets.EMPTY)));
    button.setOnAction(actionEvent -> dialog.close());

    JFXButton retry = new JFXButton("Retry");
    retry.setBackground(
        new Background(new BackgroundFill(Color.RED, CornerRadii.EMPTY, Insets.EMPTY)));
    retry.setOnAction(actionEvent -> {
      if (!checkinternet()) {
        Text te = new Text("Success");
        te.setFill(Color.GREEN);
        content.setHeading(te);
        te = new Text("Connection Established successfully");
        te.setFill(Color.GREEN);
        content.setBody(te);
        retry.setVisible(false);
      }
    });
    content.getActions().addAll(button, retry);

    dialog.show();
  }

  public static LoginUser getConnection(String username, String password, String type) {
    try {
      ResultSet rs;
      String query = String.format(
          "SELECT ar.ID,ar.Name FROM allusers ar WHERE ar.Username = \"%s\" and substring(ar.Password,11,CHAR_LENGTH(ar.Password)-20) = \"%s\" and ar.Type = \"%s\"",
          username, password, type);
      rs = Main.con.createStatement().executeQuery(query);
      if (rs.next()) {
        LoginUser user = new LoginUser(rs.getInt("ID"), rs.getString("Name"));
        return user;
      }

    } catch (Exception e) {
      System.out.println("No Such User Found\n" + e);
    }

    return new LoginUser();
  }


  public static Boolean checkinternet() { // check internet connection
    try {
      URL url = new URL("http://www.google.com");
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.connect();
      if (con.getResponseCode() == 200) {
        return false;
      }
    } catch (Exception exception) {
      return true;
    }
    return true;
  }
  public static String encoderstring(){
    StringBuilder s= new StringBuilder();
    Random r = new Random();
    for (int i=0;i<10;i++){
      s.append((char) (r.nextInt(26) + 'a'));
    }
    return s.toString();
  }


  public static void main(String[] args) {
    launch(args);
  }
}
