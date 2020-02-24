package sample;

import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;

import java.net.URL;
import java.util.ResourceBundle;

public class User implements Initializable {
    //Todo: create a fxml file for user request history
    @FXML
    private ChoiceBox<String> hostels;
    @FXML
    private ChoiceBox<String> floor;
    @FXML
    private TextField room;
    @FXML
    private ChoiceBox<String> requesttype;
    @FXML
    private TextArea comment;
    @FXML
    private Label userid;
    @FXML
    private StackPane pane;


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        //Todo: get user id for below label
        userid.setText("User ID: "+" ");

        String values[]={"H1","H2","Old Boys","Girls"};
        hostels.setItems(FXCollections.observableArrayList(values));

        values= new String[]{"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
        floor.setItems(FXCollections.observableArrayList(values));

        values=new String[]{"Cleaner","Carpenter","Plumber","Electrician"};
        requesttype.setItems(FXCollections.observableArrayList(values));

        reset();
    }

    public void request(ActionEvent e){ // action handler after pressing the request button
        try{
            int i=Integer.parseInt(room.getText());
            room.setText("0"+room.getText());
        }
        catch (Exception ex){
            Main.showalert("Wrong Input", "Room Number Must be an Integer", pane, Color.RED);
            room.setText("");
            return;
        }

        Request r=new Request(hostels.getValue(), floor.getValue()+room.getText(), requesttype.getValue(), comment.getText());
        System.out.println(r);

        //Todo: store this request and process it

        Main.showalert("Success","Request made Successfully ",pane,Color.GREEN);
        reset();
    }

    public void reset(){  // Resets all the fields
        hostels.setValue("H1");
        floor.setValue("0");
        room.setText("");
        requesttype.setValue("Cleaner");
        comment.setText("");

    }
    public void login(ActionEvent e){
        Main.changeScene("WelcomeScreen.fxml");
    }



}
