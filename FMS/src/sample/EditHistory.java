package sample;

import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class EditHistory implements Initializable
{
    private static Record toedit;
    @FXML
    private ChoiceBox<String> request;

    @FXML
    private ChoiceBox<String> hostel;

    @FXML
    private JFXTextField room;
    @FXML
    private JFXTextArea comment;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        String values[]={"H1","H2","Old Boys","Girls"};
        hostel.setItems(FXCollections.observableArrayList(values));
        values=new String[]{"Cleaner","Carpenter","Plumber","Electrician"};
        request.setItems(FXCollections.observableArrayList(values));
        reset();
    }
    @FXML
    void update(){   //update the record in all record table
        String query="Update allrecord SET ";
        query+="hostel=\""+hostel.getValue()+"\"";
        query+=", requesttype=\""+request.getValue()+"\"";
        query+=", roomnum=\""+room.getText()+"\"";
        query+=", comment=\""+comment.getText()+"\"";
        query+= " Where id="+toedit.getId();

        try {
            Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("EditHistory: error in update function");
            return;
        }
        request.getScene().getWindow().hide();
    }

    @FXML
    void delete(ActionEvent event) {  // deletes the record from all record table
        String query="Delete From allrecord where id="+toedit.getId();
        try {
            Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("EditHistory: error in delete function");
            return;
        }
        request.getScene().getWindow().hide();
    }

    public static void edit(Record selection)  {  // used for exchanging data between User.java and this file and showing the edit menu option
        try {
            Stage stage= new Stage();
            toedit=selection;  //Todo: change this way of data transfer between classes
            stage.initModality(Modality.APPLICATION_MODAL);
            Parent root= FXMLLoader.load(EditEmployee.class.getResource("EditHistory.fxml"));
            stage.setTitle("Edit History");
            stage.setScene(new Scene(root));
            stage.show();

        } catch (IOException e) {
            System.out.println("EditHistory: error in edit function");
        }
    }

    public void reset(){
        hostel.setValue(toedit.getHostel());
        request.setValue(toedit.getRequesttype());
        room.setText(String.valueOf(toedit.getRoomnum()));
        comment.setText(toedit.getComment());
    }


}
