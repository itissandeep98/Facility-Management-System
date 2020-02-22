package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXDialog;
import com.jfoenix.controls.JFXDialogLayout;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.scene.paint.Paint;
import javafx.scene.text.Text;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class Main extends Application {
    public static Parent root;
    public static Stage stage;

    @Override
    public void start(Stage primaryStage) throws Exception{
        stage=primaryStage;
        Parent root = FXMLLoader.load(getClass().getResource("WelcomeScreen.fxml"));
//        Parent root = FXMLLoader.load(getClass().getResource("User.fxml"));
//        Parent root = FXMLLoader.load(getClass().getResource("AddEmployee.fxml"));
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


    public static void main(String[] args) {
        launch(args);
    }
}
