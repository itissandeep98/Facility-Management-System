package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXDialog;
import com.jfoenix.controls.JFXDialogLayout;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main extends Application {
    public static Parent root;
    public static Stage stage;
    public static Connection con;

    @Override
    public void start(Stage primaryStage) throws Exception{
        stage=primaryStage;
        root = FXMLLoader.load(getClass().getResource("WelcomeScreen.fxml"));
//      root = FXMLLoader.load(getClass().getResource("User.fxml"));
//        root = FXMLLoader.load(getClass().getResource("AddEmployee.fxml"));
        Image icon=new Image("sample/icon.png");
        primaryStage.getIcons().add(icon);
        primaryStage.setTitle("Facility  Management System");
        primaryStage.setScene(new Scene(root));

        primaryStage.show();
    }

    public static void changeScene(String file){ // custom made function which helps in changing the scene
        try {
            root = FXMLLoader.load(Main.class.getResource(file));
            Main.stage.setScene(new Scene(root));
        }
        catch (Exception e){
            System.out.println("Error in changing scene");
        }
    }

    public static void showalert(String title, String message, StackPane pane,Color col){
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
        button.setOnAction(actionEvent -> dialog.close());
        content.setActions(button);
        dialog.show();
    }

    public static void warnconnection(String title, String message, StackPane pane,Color col,String username, String password){
        JFXDialogLayout content=new JFXDialogLayout();
        Text t=new Text(title);
        t.setFill(col);
        content.setHeading(t);
        t=new Text(message);
        t.setFill(col);
        content.setBody(t);

        JFXDialog dialog =new JFXDialog(pane,content,JFXDialog.DialogTransition.CENTER);

        JFXButton button =new JFXButton("Done");
        button.setBackground(new Background(new BackgroundFill(Color.ALICEBLUE, CornerRadii.EMPTY, Insets.EMPTY)));
        button.setOnAction(actionEvent -> dialog.close());

        JFXButton retry =new JFXButton("Retry");
        retry.setBackground(new Background(new BackgroundFill(Color.RED, CornerRadii.EMPTY, Insets.EMPTY)));
        retry.setOnAction(actionEvent -> {
            if(checkinternet()!=null){
                Text te=new Text("Success");
                te.setFill(Color.GREEN);
                content.setHeading(te);
                te=new Text("Connection Established successfully");
                te.setFill(Color.GREEN);
                content.setBody(te);
                retry.setVisible(false);
            }
        });
        content.getActions().addAll(button,retry);

        dialog.show();
    }

    public static Connection getConnection(String username,String password)  {
        if (con==null) {
            try {
                con = DriverManager.getConnection("jdbc:mysql://itissandeep.mysql.database.azure.com:3306/dbms?serverTimezone=UTC", username, password); // Azure credentials
//                con = DriverManager.getConnection("jdbc:mysql://dbms-proj.cndnhuvgnze7.ap-south-1.rds.amazonaws.com:3306/DBMS", "sandeep", "BHTebyH3EphEcRJB4Jyb"); // AWS credentials
            } catch (SQLException e) {
                System.out.println("Unable to connect");
            }
        }
        return con;
    }


    public static Boolean checkinternet(){ // check internet connection
        try {
            URL url = new URL("http://www.google.com");
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.connect();
            if (con.getResponseCode() == 200){
                return false;
            }
        } catch (Exception exception) {
            return true;
        }
        return true;
    }

    public static void main(String[] args) {
        launch(args);
    }
}
