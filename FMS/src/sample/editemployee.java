package sample;

import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class editemployee implements Initializable {
    @FXML
    private JFXTextField speciality;

    @FXML
    private JFXTextField contact;

    @FXML
    private JFXTextField name;

    @FXML
    private Label id;
    static Workers toedit;
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            speciality.setText(toedit.getSpeciality());
            name.setText(toedit.getName());
            contact.setText(toedit.getContactInfo());
            id.setText("ID: "+toedit.getID());
        }
        catch (Exception e){
            System.out.println("toedit null");
        }


    }
    @FXML
    public void update() {
        String query="Update worker SET ";
        Boolean flag=false;
        if(!toedit.getName().equals(name.getText())){
            query+="name = \""+name.getText()+"\"";
            flag=true;
        }
        if(!toedit.getContactInfo().equals((contact.getText()))){
            if(flag){
                query+=", ";
            }
            flag=true;
            query+="contactinfo = \""+contact.getText()+"\"";
        }
        if(!toedit.getSpeciality().equals(speciality.getText())){
            if(flag){
                query+=", ";
            }
            flag=true;
            query+="speciality = \""+speciality.getText()+"\"";
        }
        query+=" Where id="+toedit.getID();
        try {
            if(flag) {
                Main.con.createStatement().executeUpdate(query);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
        name.getScene().getWindow().hide();
    }

    public void delete(){
        String query="Delete From worker where id="+toedit.getID()+" and contactinfo="+toedit.getContactInfo();
        try {
            Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
        name.getScene().getWindow().hide();
    }

    public static void edit(Workers selection)  {
        try {
            Stage stage= new Stage();
            toedit=selection;
            stage.initModality(Modality.APPLICATION_MODAL);
            Parent root= FXMLLoader.load(editemployee.class.getResource("editemployee.fxml"));
            stage.setTitle("Edit Details");
            stage.setScene(new Scene(root));
            stage.show();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
