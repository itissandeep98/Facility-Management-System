package sample;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Worker;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;

import javax.swing.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class AddEmployee implements Initializable {
    @FXML
    private JFXTextField eid;
    @FXML
    private JFXTextField name;
    @FXML
    private JFXTextField phonenum;
    @FXML
    private JFXTextField speciality;
    @FXML
    private JFXButton addemp;

    @FXML
    private ChoiceBox<String> spec;
    @FXML
    private JFXButton search;
    @FXML
    private JFXButton delete;
    @FXML
    private JFXButton update;

    @FXML
    private StackPane pane;


    @FXML
    private TableView<Workers> employeeTable;
    @FXML
    private TableColumn<Worker, Integer> empIdColumn;
    @FXML
    private TableColumn<Worker, String> empphonenumcol;
    @FXML
    private TableColumn<Worker, String> empspecialitycol;
    @FXML
    private TableColumn<Worker, String> empnamecol;
    ObservableList<Workers> list= FXCollections.observableArrayList();

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        String[] values=new String[]{"Cleaner","Carpenter","Plumber","Electrician"};
        spec.setItems(FXCollections.observableArrayList(values));
        spec.setValue("Cleaner");
        ResultSet rs;
        try {
            Connection con=Main.getConnection();
            rs= con.createStatement().executeQuery("SELECT  * FROM Worker");
            while (rs.next()){
                list.add(new Workers(rs.getInt("ID"), rs.getString("Name"), rs.getString("Speciality"), rs.getString("ContactInfo")));
            }

        } catch (SQLException | ClassNotFoundException e) {
            Main.showalert("Error!!", "Unable to Connect to server", pane, Color.RED);
            e.printStackTrace();
            return;
        }

        Main.showalert("Success", "Successfully connected To server", pane, Color.GREEN);

        empIdColumn.setCellValueFactory(new PropertyValueFactory<>("ID"));
        empnamecol.setCellValueFactory(new PropertyValueFactory<>("Name"));
        empspecialitycol.setCellValueFactory(new PropertyValueFactory<>("Speciality"));
        empphonenumcol.setCellValueFactory(new PropertyValueFactory<>("ContactInfo"));

        employeeTable.setItems(list);

    }
}
