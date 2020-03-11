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
import java.sql.SQLException;
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

    int id;


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        //Todo: get user id for below label
        id=3;
        userid.setText("User ID: "+id);

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
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        String query="Insert into allrecord (hostel,roomnum,status,requesttype,comment,studentid,starttime) Values (\""+r.getHostel()+"\", "+r.getRoom()+", \"Unassigned\", \""+r.getRequestType()+"\", \""+r.getComment()+"\","+id+",\""+ date+"\")";

        try {
            Main.con.createStatement().executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("User: error in request function");
            return;
        }

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

    public void showhistory(){
        //todo: show user request history and ability to cancel a request before it has been assigned
    }
<<<<<<< HEAD
=======



>>>>>>> master
}
