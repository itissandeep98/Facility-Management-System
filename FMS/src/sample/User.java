package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXDialog;
import com.jfoenix.controls.JFXDialogLayout;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.*;
import javafx.scene.control.*;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;

import java.net.URL;
import java.util.ResourceBundle;

public class User implements Initializable {
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
        //Todo: get user id in below label
        userid.setText("User ID: "+" ");

        String st[]={"H1","H2","Old Boys","Girls"};
        hostels.setItems(FXCollections.observableArrayList(st));

        st= new String[]{"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
        floor.setItems(FXCollections.observableArrayList(st));

        st=new String[]{"Cleaner","Carpenter","Plumber","Electrician"};
        requesttype.setItems(FXCollections.observableArrayList(st));

        reset();
    }

    public void request(ActionEvent e){
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

        //Todo: store this request and process it

        Main.showalert("Success","Request made Successfully ",pane,Color.GREEN);
        reset();
    }

    public void reset(){
        hostels.setValue("H1");
        floor.setValue("0");
        room.setText("");
        requesttype.setValue("Cleaner");
        comment.setText("");

    }



}
