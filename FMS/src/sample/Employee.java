package sample;

import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class Employee implements Initializable {
    @FXML
    private StackPane pane;

    @FXML
    private TextField newvalue;
    @FXML
    private JFXTextField id;
    @FXML
    private Label empid;

    @FXML
    private TableView<Work> completedtable;

    @FXML
    private TableColumn<Work, ?> completed_starttime;
    @FXML
    private TableColumn<Work, ?> completed_endtime;

    @FXML
    private TableColumn<Work, String> completed_request;

    @FXML
    private TableColumn<Work, Integer> completed_id;

    @FXML
    private TableColumn<Work, String> completed_room;

    @FXML
    private TableView<Work> assignedtable;

    @FXML
    private TableColumn<Work, String> assigned_request;

    @FXML
    private TableColumn<Work, ?> assigned_time;

    @FXML
    private TableColumn<Work, String> assigned_room;

    @FXML
    private TableColumn<Work, Integer> assigned_id;

    @FXML
    private ChoiceBox<String> details;
    public int Workerid;

    public void login(ActionEvent e){
        Main.changeScene("WelcomeScreen.fxml");
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        String[] values=new String[]{"Name","Phone Number","Speciality","Supervisor ID"};
        details.setItems(FXCollections.observableArrayList(values));
        details.setValue("Name");

        completed_id.setCellValueFactory(new PropertyValueFactory<>("ID"));
        completed_room.setCellValueFactory(new PropertyValueFactory<>("RoomNo"));
        completed_request.setCellValueFactory(new PropertyValueFactory<>("RequestType"));
        completed_starttime.setCellValueFactory(new PropertyValueFactory<>("starttime"));
        completed_endtime.setCellValueFactory(new PropertyValueFactory<>("closedtime"));

        assigned_id.setCellValueFactory(new PropertyValueFactory<>("ID"));
        assigned_room.setCellValueFactory(new PropertyValueFactory<>("RoomNo"));
        assigned_request.setCellValueFactory(new PropertyValueFactory<>("RequestType"));
        assigned_time.setCellValueFactory(new PropertyValueFactory<>("starttime"));

        //Todo: Workerid needs to be updated everytime
        Workerid=1;
        empid.setText("Employee ID: "+Workerid);
        FillAssignedTable();

    }

    public void FillCompletedTable(){
        ObservableList<Work> list= FXCollections.observableArrayList();
        ResultSet rs;
        try {
            String query="SELECT cr.id,starttime,requesttype,roomno,closedtime FROM closedrecord cr,students s WHERE s.id=cr.studentid and cr.workerid="+ Workerid;
            rs= Main.con.createStatement().executeQuery(query);

            while (rs.next()){
                list.add(new Work(rs.getInt("ID"), rs.getString("RoomNo"), rs.getTimestamp("starttime"), rs.getTimestamp("closedtime"),rs.getString("requesttype"),Workerid));
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in sql");
            return;
        }
        completedtable.setItems(list);
    }
    public void FillAssignedTable(){
        ObservableList<Work> list= FXCollections.observableArrayList();
        ResultSet rs;
        try {
            String query="SELECT opr.id,starttime,requesttype,roomno FROM openrecord opr,students s WHERE s.id=opr.studentid and opr.workerid="+ Workerid;
            rs= Main.con.createStatement().executeQuery(query);

            while (rs.next()){
                list.add(new Work(rs.getInt("ID"), rs.getString("RoomNo"), rs.getTimestamp("starttime"), rs.getString("requesttype"),Workerid));
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error in sql");
            return;
        }
        assignedtable.setItems(list);
    }
    public void changedetails(ActionEvent ev){
        String content=details.getValue();
        String value=newvalue.getText();
        Statement stmt = null;
        String query="";
        try {

            stmt = (Statement) Main.con.createStatement();
            if(content.equals("Name")){
                query="UPDATE worker set name=\""+value+"\" where id ="+Workerid;

            }
            else if(content.equals("Phone Number")){
                query="UPDATE worker set contactinfo=\""+value+"\" where id ="+Workerid;
            }
            else if(content.equals("Speciality")){
                query="UPDATE worker set speciality=\""+value+"\" where id ="+Workerid;
            }
            else{
                query="UPDATE worker set supervisorid="+Integer.parseInt(value) +" where id ="+Workerid;
            }
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
        Main.showalert("Success", "New "+content+" has been updated Successfully", pane, Color.GREEN);
        reset();
    }

    public void markcompleted(ActionEvent ev){
        int workid=Integer.parseInt(id.getText());
        Statement stmt = null;

        try {
            ResultSet rs;
            String query="SELECT * FROM openrecord WHERE id="+workid;
            rs= Main.con.createStatement().executeQuery(query);
            String query1="DELETE FROM openrecord Where id="+workid;

            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            rs.next();
            String query2="INSERT INTO closedrecord VALUES( "+rs.getString("ID") + ", "+
                    rs.getString("Studentid")+", "+rs.getString("Workerid")+", \""+rs.getTimestamp("starttime")+"\", \""+ date+"\", \""+rs.getString("requesttype") +"\")";

            stmt = Main.con.createStatement();
            stmt.executeUpdate(query2);

            stmt = Main.con.createStatement();
            stmt.executeUpdate(query1);
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
        Main.showalert("Success", "Work has been marked as completed Successfully", pane, Color.GREEN);
        reset();
    }
    public void reset(){
        id.setText("");
        details.setValue("Name");
        newvalue.setText("");
        FillAssignedTable();
        FillCompletedTable();
    }
}
