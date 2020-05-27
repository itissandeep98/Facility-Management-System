import com.jfoenix.controls.JFXTextField;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;

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
  private TableColumn<Work, Timestamp> completed_starttime;
  @FXML
  private TableColumn<Work, Timestamp> completed_endtime;

  @FXML
  private TableColumn<Work, String> completed_request;

  @FXML
  private TableColumn<Work, Integer> completed_id;
  @FXML
  private TableColumn<Work, Integer> completed_hostel;

  @FXML
  private TableColumn<Work, String> completed_room;

  @FXML
  private TableView<Work> assignedtable;

  @FXML
  private TableColumn<Work, String> assigned_request;

  @FXML
  private TableColumn<Work, Timestamp> assigned_time;

  @FXML
  private TableColumn<Work, String> assigned_room;

  @FXML
  private TableColumn<Work, Integer> assigned_id;
  @FXML
  private TableColumn<Work, Integer> assigned_hostel;

  @FXML
  private ChoiceBox<String> details;
  private LoginUser user;

  public void login() {
    Main.changeScene("WelcomeScreen.fxml");
  }

  @Override
  public void initialize(URL url, ResourceBundle resourceBundle) {
    user = new LoginUser();
    String[] values = new String[]{"Name", "Phone Number", "Speciality", "Supervisor ID"};
    details.setItems(FXCollections.observableArrayList(values));
    details.setValue("Choose Below");
    details.setOnAction(actionEvent -> {
      try {
        ResultSet rs = Main.con.createStatement()
            .executeQuery("SELECT  * FROM worker WHERE id=" + user.getID());
        rs.next();
        switch (details.getValue()) {
          case "Name":
            newvalue.setText(rs.getString("name"));
            break;
          case "Phone Number":
            newvalue.setText(rs.getString("contactinfo"));
            break;
          case "Speciality":
            newvalue.setText(rs.getString("speciality"));
            break;
          case "Supervisor ID":
            newvalue.setText(rs.getString("SupervisorID"));
            break;
        }
      } catch (SQLException e) {
        System.out.println("Employee: error in initialize function");
      }
    });

    completed_id.setCellValueFactory(new PropertyValueFactory<>("ID"));
    completed_room.setCellValueFactory(new PropertyValueFactory<>("RoomNo"));
    completed_request.setCellValueFactory(new PropertyValueFactory<>("RequestType"));
    completed_starttime.setCellValueFactory(new PropertyValueFactory<>("starttime"));
    completed_endtime.setCellValueFactory(new PropertyValueFactory<>("closedtime"));
    completed_hostel.setCellValueFactory(new PropertyValueFactory<>("Hostel"));

    assigned_id.setCellValueFactory(new PropertyValueFactory<>("ID"));
    assigned_room.setCellValueFactory(new PropertyValueFactory<>("RoomNo"));
    assigned_request.setCellValueFactory(new PropertyValueFactory<>("RequestType"));
    assigned_time.setCellValueFactory(new PropertyValueFactory<>("starttime"));
    assigned_hostel.setCellValueFactory(new PropertyValueFactory<>("Hostel"));
  }

  public void updatelabel(LoginUser user) {
    this.user = user;
    empid.setText(empid.getText() + " " + user.getName());
    FillAssignedTable();
  }

  public void FillCompletedTable() {
    if (user == null) {
      return;
    }
    ObservableList<Work> list = FXCollections.observableArrayList();
    ResultSet rs;
    try {
      String query =
          String.format(
              "SELECT ar.id,starttime,requesttype,ar.roomnum,closedtime,ar.hostel "
                  + "FROM allrecord ar,students s "
                  + "WHERE s.id=ar.studentid and ar.workerid=%d and ar.status=\"Close\"",
              user.getID());
      rs = Main.con.createStatement().executeQuery(query);
      while (rs.next()) {
        list.add(
            new Work(rs.getInt("ID"), rs.getString("RoomNum"), rs.getTimestamp("starttime"),
                rs.getTimestamp("closedtime"), rs.getString("requesttype"), user.getID(),
                rs.getString("hostel")));
      }

    } catch (Exception e) {
      System.out.println("Employee: error in Fillcompletedtable" + e);
      return;
    }
    completedtable.setItems(list);
  }

  public void FillAssignedTable() {
    if (user == null) {
      return;
    }
    ObservableList<Work> list = FXCollections.observableArrayList();
    ResultSet rs;
    try {
      String query =
          String.format(
              "SELECT ar.id,starttime,requesttype,ar.roomnum,ar.hostel "
                  + "FROM allrecord ar,students s "
                  + "WHERE s.id=ar.studentid and ar.workerid=%d and ar.status=\"Open\"",
              user.getID());
      rs = Main.con.createStatement().executeQuery(query);

      while (rs.next()) {
        list.add(
            new Work(rs.getInt("ID"), rs.getString("RoomNum"), rs.getTimestamp("starttime"),
                rs.getString("requesttype"), user.getID(), rs.getString("hostel")));
      }

    } catch (Exception e) {
      System.out.println("Employee:error in Fillassignedtable\n" + e);
      return;
    }

    assignedtable.setItems(list);
  }

  public void changedetails() {
    String content = details.getValue();
    String value = newvalue.getText();
    Statement stmt;
    String query;
    try {

      stmt = Main.con.createStatement();
      switch (content) {
        case "Name":
          query = String
              .format("UPDATE worker set name=\"%s\" where id =%d", value, user.getID());

          break;
        case "Phone Number":
          query = String
              .format("UPDATE worker set contactinfo=\"%s\" where id =%d", value,
                  user.getID());
          break;
        case "Speciality":
          query = String
              .format("UPDATE worker set speciality=\"%s\" where id =%d", value,
                  user.getID());
          break;
        default:
          query = String.format("UPDATE worker set supervisorid= %d" + " where id = %d",
              Integer.parseInt(value), user.getID());
          break;
      }
      stmt.executeUpdate(query);

      query = String
          .format("SELECT contactinfo FROM worker where id =%d", user.getID());
      ResultSet rs = Main.con.createStatement().executeQuery(query);
      if (rs.next()) {
        System.out.println(Features.sendSMS("New " + content + " has been updated Successfully",
            rs.getString("ContactInfo")));
      }

    } catch (SQLException e) {
      System.out.println("Employee: error in changedetails function");
      return;
    }
    Main.showalert("Success", "New " + content + " has been updated Successfully", pane,
        Color.GREEN);
    reset();
  }

  public void markcompleted() {
    int workid = Integer.parseInt(id.getText());

    try {
      java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
      //always put timestamp datatype under quotes otherwise it will throw an error
      String query = String.format(
          "UPDATE allrecord SET status = \"Close\", closedtime =\"%s\" WHERE status = \"Open\" and id= %d",
          date, workid);
      Main.con.createStatement().executeUpdate(query);

      String query2 = String.format(
          "SELECT contactinfo FROM students s,allrecord ar WHERE s.id=ar.StudentID and ar.id=%d",
          workid);
      ResultSet rs = Main.con.createStatement().executeQuery(query2);
      if (rs.next()) {
        String msg = "FMS services \nWork Completed \n";
        System.out.println(Features.sendSMS(msg, rs.getString("ContactInfo")));
      }

    } catch (Exception e) {
      System.out.println("Employee: error in markcompleted function\n" + e);
      return;
    }
    Main.showalert("Success", "Work has been marked as completed Successfully", pane,
        Color.GREEN);
    reset();
  }

  public void reset() {
    id.setText("");
    details.setValue("Choose Below");
    newvalue.setText("");
    FillAssignedTable();
    FillCompletedTable();
  }

  public void export() {
    Features.exportExcel(assignedtable, "AssignedWork-" + user.getName());
    Features.exportExcel(completedtable, "CompletedWork" + user.getName());
  }
}
