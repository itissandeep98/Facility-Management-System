package sample;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class EmployeeHistory implements Initializable {

  @FXML
  private TableColumn<Work, String> request;

  @FXML
  private TableColumn<Work, Integer> hostel;

  @FXML
  private TableView<Work> historytable;

  @FXML
  private TableColumn<Work, Integer> id;

  @FXML
  private TableColumn<Work, Timestamp> time;

  @FXML
  private TableColumn<Work, String> room;

  private int Workerid;

  @Override
  public void initialize(URL location, ResourceBundle resources) {
    id.setCellValueFactory(new PropertyValueFactory<>("ID"));
    room.setCellValueFactory(new PropertyValueFactory<>("RoomNo"));
    request.setCellValueFactory(new PropertyValueFactory<>("RequestType"));
    time.setCellValueFactory(new PropertyValueFactory<>("starttime"));
    hostel.setCellValueFactory(new PropertyValueFactory<>("Hostel"));

  }

  public void setWorkerid(int workerid) {
    this.Workerid = workerid;
    FillTable();
  }

  public void FillTable() {

    ObservableList<Work> list = FXCollections.observableArrayList();
    try {
      String query =
          String.format(
              "SELECT ar.id,starttime,requesttype,roomno,ar.hostel "
                  + "FROM allrecord ar,students s "
                  + "WHERE s.id=ar.studentid and ar.workerid=%d ", Workerid);
      ResultSet rs = Main.con.createStatement().executeQuery(query);

      while (rs.next()) {
        list.add(
            new Work(rs.getInt("ID"), rs.getString("RoomNo"), rs.getTimestamp("starttime"),
                rs.getString("requesttype"), Workerid, rs.getString("hostel")));
      }

    } catch (Exception e) {
      System.out.println("EmployeeHistory:error in Filltable \n" + e);
      return;
    }
    historytable.setItems(list);
  }
}
