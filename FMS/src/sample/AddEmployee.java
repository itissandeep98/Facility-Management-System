package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Worker;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import java.net.URL;
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
    private ChoiceBox<String> spec;

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

    String tablequery;
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        String[] values=new String[]{"Cleaner","Carpenter","Plumber","Electrician"};
        spec.setItems(FXCollections.observableArrayList(values));

        empIdColumn.setCellValueFactory(new PropertyValueFactory<>("ID"));
        empnamecol.setCellValueFactory(new PropertyValueFactory<>("Name"));
        empspecialitycol.setCellValueFactory(new PropertyValueFactory<>("Speciality"));
        empphonenumcol.setCellValueFactory(new PropertyValueFactory<>("ContactInfo"));

        reset();
        filltable();

        employeeTable.getSelectionModel().selectedItemProperty().addListener((obs, oldSelection, newSelection) -> {
            if(newSelection!=null)
            editemployee.edit(newSelection);
        });

    }

    public void back(ActionEvent e){
        Main.changeScene("FMS.fxml");
    }

    public void filltable(){
//        System.out.println("update");
        ObservableList<Workers> list= FXCollections.observableArrayList();
        ResultSet rs;
        try {
            rs= Main.con.createStatement().executeQuery(tablequery);
            while (rs.next()){
                list.add(new Workers(rs.getInt("ID"), rs.getString("Name"), rs.getString("Speciality"), rs.getString("ContactInfo")));
            }

        } catch (Exception e) {
            System.out.println("AddEmployee: error in filltable function");
            return;
        }

        employeeTable.setItems(list);
    }

    public void addnewemployee(){
        String empname=name.getText();
        String empspeciality= speciality.getText();
        String empphone=phonenum.getText();
        try {
            Main.con.createStatement().executeUpdate("Insert into worker (name,speciality,contactinfo) VALUES (\""+empname+"\", \""+empspeciality+"\", \""+empphone+"\")");
        } catch (SQLException e) {
            System.out.println("AddEmployee: error in addnewemployee function");
            return;
        }
        Main.showalert("Success", "Employee added successfully", pane, Color.GREEN);
        filltable();
    }

    public void search(){
        tablequery="Select * From worker Where";
        boolean flag=false;
        if(eid.getText()!=null){
            tablequery+=" id= "+eid.getText();
            flag=true;
        }
        if(spec.getValue()!=null){
            if(flag){
                tablequery+=" and";
            }
            tablequery+=" speciality= \""+spec.getValue()+"\"";
        }
        filltable();
    }
    public void reset(){
        tablequery="SELECT  * FROM worker";
        filltable();
        eid.setText(null);
        spec.setValue(null);
    }
}
