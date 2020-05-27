import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;

public class FMS implements Initializable {

  @FXML
  private TableColumn<Record, Integer> studentid;

  @FXML
  private TableColumn<Record, String> workerid;

  @FXML
  private TableColumn<Record, String> requesttype;
  @FXML
  private TableColumn<Record, String> hostel;
  @FXML
  private TableColumn<Record, String> comment;

  @FXML
  private TableColumn<Record, Integer> roomnum;

  @FXML
  private TableColumn<Record, Integer> id;

  @FXML
  private TableColumn<Record, Timestamp> starttime;

  @FXML
  private TableColumn<Record, Timestamp> closedtime;

  @FXML
  private TableView<Record> recordtable;

  @FXML
  private TableColumn<Record, String> status;

  String tablequery;
  String countquery;

  @FXML
  private MenuButton recordmenu;

  @FXML
  private Label count;

  @Override
  public void initialize(URL url, ResourceBundle resourceBundle) {
    id.setCellValueFactory(new PropertyValueFactory<>("id"));
    starttime.setCellValueFactory(new PropertyValueFactory<>("starttime"));
    closedtime.setCellValueFactory(new PropertyValueFactory<>("closedtime"));
    studentid.setCellValueFactory(new PropertyValueFactory<>("studentid"));
    workerid.setCellValueFactory(new PropertyValueFactory<>("workerid"));
    requesttype.setCellValueFactory(new PropertyValueFactory<>("requesttype"));
    roomnum.setCellValueFactory(new PropertyValueFactory<>("roomnum"));
    status.setCellValueFactory(new PropertyValueFactory<>("Status"));
    hostel.setCellValueFactory(new PropertyValueFactory<>("hostel"));
    comment.setCellValueFactory(new PropertyValueFactory<>("comment"));
    tablequery = "Select * From allrecord";
    countquery = "select count(*) AS cnt from allrecord";
    filltable();

    for (MenuItem i : recordmenu.getItems()) {
      switch (i.getText()) {
        case "Open Record":
          i.setOnAction(actionEvent -> {
            tablequery = "Select * From allrecord where status =\"Open\"";
            countquery = "select count(*) AS cnt from allrecord group by status having status=\"Open\"";
            recordmenu.setText(i.getText());
            filltable();
          });
          break;
        case "Closed Record":
          i.setOnAction(actionEvent -> {
            tablequery = "Select * From allrecord where status =\"Close\"";
            countquery = "select count(*) AS cnt  from allrecord group by status having status=\"Close\"";
            recordmenu.setText(i.getText());
            filltable();
          });
          break;
        case "All Records":
          i.setOnAction(actionEvent -> {
            tablequery = "Select * From allrecord ";
            countquery = "select count(*) AS cnt from allrecord";
            recordmenu.setText(i.getText());
            filltable();
          });
          break;
        case "Unassigned Record":
          i.setOnAction(actionEvent -> {
            tablequery = "Select * From allrecord where status=\"Unassigned\"";
            countquery = "select count(*) AS cnt from allrecord group by status having status=\"Unassigned\"";
            recordmenu.setText(i.getText());
            filltable();
          });
          break;
      }
    }

    //ToDo: make this a combobox and it will only have values according to the request type of that row
    workerid.setCellFactory(TextFieldTableCell.<Record>forTableColumn());
    workerid.setOnEditCommit(event -> {
      if (!event.getNewValue().equals("")) {
        String query =
            String.format("Update allrecord SET workerid = \"%s\" Where id=%d",
                event.getNewValue(), event.getRowValue().getId());
        String query2 = String
            .format("SELECT contactinfo FROM worker WHERE id=%s", event.getNewValue());

        try {
          ResultSet rs = Main.con.createStatement().executeQuery(query2);
          if (rs.next()) {
            String msg = "FMS services \nNew Work \nLocation: " +
                event.getRowValue().getHostel() + " " + event.getRowValue().getRoomnum() + "\n";

            if (event.getRowValue().getComment() != null) {
              msg += "Comment: " + event.getRowValue().getComment();
            }
            System.out.println(Features.sendSMS(msg, rs.getString("ContactInfo")));
          }

          Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
          System.out.println("FMS: error in workerid update\n" + e);
          return;
        }
      }
      filltable();
    });
    status.setCellFactory(ComboBoxTableCell
        .forTableColumn(FXCollections.observableArrayList("Open", "Close", "Unassigned")));
    status.setOnEditCommit(event -> {
      String query = "";
      java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
      if (event.getOldValue().equals("Open") && event.getNewValue().equals("Close")) {
        query = String.format("Update allrecord SET status=\"%s\", closedtime=\"%s\"  Where id=%d",
            event.getNewValue(), date, event.getRowValue().getId());
      } else if (event.getOldValue().equals("Open") && event.getNewValue().equals("Unassigned")) {
        query = String.format(
            "Update allrecord SET status=\"%s\", WorkerID=NULL , comment=\"\"  Where id=%d",
            event.getNewValue(), event.getRowValue().getId());
      } else if (event.getOldValue().equals("Close") && event.getNewValue().equals("Open")) {
        query = String.format(
            "Update allrecord SET status=\"%s\", closedtime=NULL, comment=\"\"  Where id=%d",
            event.getNewValue(), event.getRowValue().getId());
      } else if (event.getOldValue().equals("Close") && event.getNewValue().equals("Unassigned")) {
        query = String.format(
            "Update allrecord SET status=\"%s\", closedtime= NULL , WorkerID=NULL, comment=\"\" Where id=%d",
            event.getNewValue(), event.getRowValue().getId());
      } else if (event.getOldValue().equals("Unassigned") && event.getNewValue().equals("Open")) {
        query = String.format(
            "Update allrecord SET status=\"%s\" Where id=%d", event.getNewValue(),
            event.getRowValue().getId());
      }

      try {
        Main.con.createStatement().executeUpdate(query);
      } catch (SQLException e) {
        System.out.println("User: error in hostel update\n" + e);
        return;
      }
      filltable();
    });

  }

  public void filltable() {

    ObservableList<Record> list = FXCollections.observableArrayList();
    ResultSet rs, rs1;
    try {
      rs = Main.con.createStatement().executeQuery(tablequery);
      rs1 = Main.con.createStatement().executeQuery(countquery);
      while (rs.next()) {
        list.add(
            new Record(rs.getInt("ID"), rs.getString("workerid"), rs.getInt("studentid"),
                rs.getString("roomnum"), rs.getString("Status"),
                rs.getString("requesttype"),
                rs.getTimestamp("starttime"), rs.getTimestamp("closedtime"),
                rs.getString("hostel"),
                rs.getString("comment")));
      }
      if (rs1.next()) {
        count.setText("Count: " + rs1.getInt("cnt"));
      }

    } catch (Exception e) {
      System.out.println(countquery);
      System.out.println("FMS: error in filltable function\n" + e);
      return;
    }

    recordtable.setItems(list);
  }

  public void addemployee() {
    AddEmployee e = (AddEmployee) Main.changeScene("AddEmployee.fxml");
  }

  public void login() {
    Main.changeScene("WelcomeScreen.fxml");
  }

  public void export() {
    Features.exportExcel(recordtable, "Allrecords");
  }
}
