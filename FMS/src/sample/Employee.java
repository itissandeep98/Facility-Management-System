package sample;

import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;

import java.net.URL;
import java.util.ResourceBundle;

public class Employee implements Initializable {
    @FXML
    private ChoiceBox<String> details;
    public void login(ActionEvent e){
        Main.changeScene("WelcomeScreen.fxml");
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        String[] values=new String[]{"Name","Phone Number","Speciality","Supervisor ID"};
        details.setItems(FXCollections.observableArrayList(values));
        details.setValue("Name");

        //Todo: Create all Connections
    }
}
