package sample;

import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class editrecord implements Initializable {
    static Record toedit;
    @FXML
    private JFXTextField workerid;

    @FXML
    private Label id;

    @FXML
    private ChoiceBox<String> status;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        String[] values=new String[]{"Open","Close","Unassigned"};
        status.setItems(FXCollections.observableArrayList(values));
        reset();
        id.setText("ID: "+toedit.getId());
        reset();
    }


    @FXML
    void update(ActionEvent event) {
        String query="Update allrecord SET ";
        if(toedit.getStatus().equals("Unassigned") && status.getValue().equals("Open")){
            if(workerid.getText()==null){
                id.getScene().getWindow().hide();
                System.out.println("Worker id must be provided");
                return;
            }
            query+=" workerid="+Integer.parseInt(workerid.getText());
            query+=" ,status=\"Open\"";

        }
        else if(toedit.getStatus().equals("Unassigned") && status.getValue().equals("Close")){
            if(workerid.getText()==null){
                id.getScene().getWindow().hide();
                System.out.println("Worker id must be provided");
                return;
            }
            query+=" workerid="+Integer.parseInt(workerid.getText());
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            query+=",closedtime=\""+date+"\"";
            query+=" ,status=\"Close\"";
        }
        else if(toedit.getStatus().equals("Open") && status.getValue().equals("Unassigned")){
            query+=" workerid="+null;
            query+=" ,status=\"Unassigned\"";
            query+=" ,closedtime="+null;

        }
        else if(toedit.getStatus().equals("Open") && status.getValue().equals("Close")){
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            query+=" closedtime=\""+date+"\"";
            query+=" ,status=\"Close\"";

        }
        query+= " Where id="+toedit.getId();

        try {
            Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("editrecord: error in update function");
            return;
        }
        id.getScene().getWindow().hide();
    }


    @FXML
    void delete(ActionEvent event) {
        String query="Delete From allrecord where id="+toedit.getId();
        try {
            Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            System.out.println("editrecord: error in delete function");
            return;
        }
        id.getScene().getWindow().hide();
    }

    public static void edit(Record selection)  {
        try {
            Stage stage= new Stage();
            toedit=selection;  //Todo: change this way of data transfer between classes
            stage.initModality(Modality.APPLICATION_MODAL);
            Parent root= FXMLLoader.load(editemployee.class.getResource("editrecord.fxml"));
            stage.setTitle("Edit Record");
            stage.setScene(new Scene(root));
            stage.show();

        } catch (IOException e) {
            System.out.println("editrecord: error in edit function");
        }
    }
    public void reset(){
        status.setValue(toedit.getStatus());
        workerid.setText(null);
    }


}
