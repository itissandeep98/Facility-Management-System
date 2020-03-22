package sample;

import com.jfoenix.controls.JFXTextField;
import java.util.ArrayList;
import java.util.Arrays;
import javafx.beans.binding.Bindings;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Worker;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.util.Callback;

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
    private TableColumn<Workers, Integer> empIdColumn;
    @FXML
    private TableColumn<Workers, String> empphonenumcol;
    @FXML
    private TableColumn<Workers, String> empspecialitycol;
    @FXML
    private TableColumn<Workers, String> empnamecol;

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

        employeeTable.getSelectionModel().setCellSelectionEnabled(true);
        employeeTable.setEditable(true);

        empnamecol.setCellFactory(TextFieldTableCell.<Workers>forTableColumn());
        empnamecol.setOnEditCommit(event -> {
            String query="Update worker SET name = \""+event.getNewValue()+"\" Where id="+event.getRowValue().getID();
            try {
                Main.con.createStatement().executeUpdate(query);
            } catch (SQLException e) {
                System.out.println("AddEmployee: error in name update");
                return;
            }
            filltable();
        });

        empphonenumcol.setCellFactory(TextFieldTableCell.<Workers>forTableColumn());
        empphonenumcol.setOnEditCommit(event -> {
            String query="Update worker SET contactinfo = \""+event.getNewValue()+"\" Where id="+event.getRowValue().getID();
            try {
                Main.con.createStatement().executeUpdate(query);
            } catch (SQLException e) {
                System.out.println("AddEmployee: error in contact info update");
                return;
            }
            filltable();
        });

        ArrayList<String> exportDataTypeValues=new ArrayList<String>(Arrays.asList(values));

        empspecialitycol.setCellFactory(ComboBoxTableCell.forTableColumn(FXCollections.observableArrayList(values)));
        empspecialitycol.setOnEditCommit(event -> {
            String query="Update worker SET speciality = \""+event.getNewValue()+"\" Where id="+event.getRowValue().getID();
            try {
                Main.con.createStatement().executeUpdate(query);
            } catch (SQLException e) {
                System.out.println("AddEmployee: error in speciality update");
                return;
            }
            filltable();

        });

        employeeTable.setRowFactory(tableView -> {
            final TableRow<Workers> row = new TableRow<>();
            final ContextMenu contextMenu = new ContextMenu();
            final MenuItem removeMenuItem = new MenuItem("Remove");
            removeMenuItem.setOnAction(event -> {
                String query = "Delete From worker where id=" + row.getTableView().getSelectionModel().getSelectedItem().getID();

                try {
                    Main.con.createStatement().executeUpdate(query);
                } catch (SQLException e) {
                    System.out.println("AddEmployee: error in deleting");
                    return;
                }
                filltable();
            });
            contextMenu.getItems().add(removeMenuItem);
            // Set context menu on row, but use a binding to make it only show for non-empty rows:
            row.contextMenuProperty().bind(
                Bindings.when(row.emptyProperty())
                    .then((ContextMenu)null)
                    .otherwise(contextMenu)
            );
            return row ;
        });



    }

    public void back(ActionEvent e){
        Main.changeScene("FMS.fxml");
    }

    public void filltable(){
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
