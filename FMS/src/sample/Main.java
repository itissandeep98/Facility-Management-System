package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class Main extends Application {
    public static Parent root;
    public static Stage stage;

    @Override
    public void start(Stage primaryStage) throws Exception{
        stage=primaryStage;
//        Parent root = FXMLLoader.load(getClass().getResource("WelcomeScreen.fxml"));
        Parent root = FXMLLoader.load(getClass().getResource("AddEmployee.fxml"));
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
    public static void showalert(String title, String message){
        Stage window=new Stage();
        window.initModality(Modality.APPLICATION_MODAL);
        window.setTitle(title) ;
        Label label=new Label(message);
        label.setTextFill(Color.GREEN);
        Button close=new Button("Ok");
        close.setOnAction(e->window.close());
        VBox layout =new VBox(10);
        layout.getChildren().addAll(label,close);
        layout.setAlignment(Pos.CENTER);
        Scene scene = new Scene(layout);
        window.setScene(scene);
        window.showAndWait();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
