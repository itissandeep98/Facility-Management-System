package sample;

import com.jfoenix.controls.JFXButton;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;

public class FMS {
    public void addemployee(ActionEvent e){
        Main.changeScene("AddEmployee.fxml");
    }
    public void login(ActionEvent e){
        Main.changeScene("WelcomeScreen.fxml");
    }

}
