package sample;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.paint.Color;
import java.net.URL;
import java.util.ResourceBundle;

public class WelcomeScreen implements Initializable {
    @FXML
    private RadioButton employee;
    @FXML
    private RadioButton user;
    @FXML
    private TextField username;
    @FXML
    private PasswordField password;
    @FXML
    private Label emptywarn;
    @FXML
    private Label emptywarn1;
    @FXML
    private Label loginwarn;


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        ToggleGroup group = new ToggleGroup();
        emptywarn.setText("");
        emptywarn1.setText("");
        loginwarn.setText("");
        employee.setToggleGroup(group);
        employee.setSelected(true);
        user.setToggleGroup(group);
    }

    public void execute_login(ActionEvent e) throws Exception {
        String Username=username.getText();
        String Password=password.getText();
        if(Username.isEmpty()){ // if username is empty
            emptywarn.setText("Can't be Empty!!");
            emptywarn.setTextFill(Color.RED);
            return;
        }
        else if(Password.isEmpty()){ // if password is empty
            emptywarn1.setText("Can't be Empty!!");
            emptywarn1.setTextFill(Color.RED);
            return;
        }
        if(check(Username,Password)){ // check if user id and password is correct
            loginwarn.setText("Wrong Username or Password!!");
            username.setText("");
            password.setText("");
            return;
        }
        if(employee.isSelected()){
            Main.changeScene("Employee.fxml");
        }
        else{
            Main.changeScene("User.fxml");
        }
    }
    public Boolean check(String id,String pass){  // check if user id and password is correct
        //ToDo: enter JDBC code to check user details
        return false;
    }
}
