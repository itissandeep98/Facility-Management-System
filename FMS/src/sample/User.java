package sample;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ResourceBundle;
import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.Timeline;
import javafx.beans.binding.Bindings;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.Label;
import javafx.scene.control.MenuItem;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.util.Duration;

public class User implements Initializable {

  @FXML
  private ChoiceBox<String> hostels;
  @FXML
  private ChoiceBox<String> floor;
  @FXML
  private TextField room;
  @FXML
  private ChoiceBox<String> requesttype;
  @FXML
  private TextArea comment;
  @FXML
  private Label userid;
  @FXML
  private StackPane pane;

  @FXML
  private TableView<Record> historytable;
  @FXML
  private TableColumn<Record, String> hostelcol;
  @FXML
  private TableColumn<Record, Timestamp> starttimecol;
  @FXML
  private TableColumn<Record, String> requestcol;
  @FXML
  private TableColumn<Record, String> roomcol;
  @FXML
  private TableColumn<Record, Timestamp> completetimecol;
  @FXML
  private TableColumn<Record, String> commentcol;
  @FXML
  private ScrollPane scrollpane;

  int id;


  @Override
  public void initialize(URL url, ResourceBundle resourceBundle) {
    //Todo: get user id for below label
    id = 3;
    userid.setText(userid.getText()+" " + id);

    String[] values = {"H1", "H2", "Old Boys", "Girls"};
    hostels.setItems(FXCollections.observableArrayList(values));

    values = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
    floor.setItems(FXCollections.observableArrayList(values));

    values = new String[]{"Cleaner", "Carpenter", "Plumber", "Electrician"};
    requesttype.setItems(FXCollections.observableArrayList(values));

    starttimecol.setCellValueFactory(new PropertyValueFactory<>("starttime"));
    completetimecol.setCellValueFactory(new PropertyValueFactory<>("closedtime"));
    commentcol.setCellValueFactory(new PropertyValueFactory<>("comment"));
    hostelcol.setCellValueFactory(new PropertyValueFactory<>("hostel"));
    requestcol.setCellValueFactory(new PropertyValueFactory<>("requesttype"));
    roomcol.setCellValueFactory(new PropertyValueFactory<>("roomnum"));

    historytable.getSelectionModel().setCellSelectionEnabled(true);
    historytable.setEditable(true);

    commentcol.setCellFactory(TextFieldTableCell.forTableColumn());
    commentcol.setOnEditCommit(event -> {
      String query = String
          .format("Update allrecord SET comment = \"%s\" Where id=%d", event.getNewValue(),
              event.getRowValue().getId());
      try {
        Main.con.createStatement().executeUpdate(query);
      } catch (SQLException e) {
        System.out.println("User: error in comment update");
        return;
      }
      filltable();
    });

    roomcol.setCellFactory(TextFieldTableCell.forTableColumn());
    roomcol.setOnEditCommit(event -> {
      String query =
          String.format("Update allrecord SET roomnum = \"%s\" Where id=%d",
              event.getNewValue(), event.getRowValue().getId());
      try {
        Main.con.createStatement().executeUpdate(query);
      } catch (SQLException e) {
        System.out.println("User: error in room update");
        return;
      }
      filltable();
    });

    hostelcol.setCellFactory(ComboBoxTableCell
        .forTableColumn(FXCollections.observableArrayList("H1", "H2", "Old Boys", "Girls")));
    hostelcol.setOnEditCommit(event -> {
      String query =
          String
              .format("Update allrecord SET hostel = \"%s\" Where id=%d", event.getNewValue(),
                  event.getRowValue().getId());
      try {
        Main.con.createStatement().executeUpdate(query);
      } catch (SQLException e) {
        System.out.println("User: error in hostel update");
        return;
      }
      filltable();
    });

    requestcol.setCellFactory(ComboBoxTableCell.forTableColumn(
        FXCollections.observableArrayList("Cleaner", "Carpenter", "Plumber", "Electrician")));
    requestcol.setOnEditCommit(event -> {
      String query =
          String.format("Update allrecord SET requesttype=\"%s\" Where id=%d", event.getNewValue(),
              event.getRowValue().getId());
      try {
        Main.con.createStatement().executeUpdate(query);
      } catch (SQLException e) {
        System.out.println("User: error in request update");
        return;
      }
      filltable();
    });

    historytable.setRowFactory(tableView -> {
      final TableRow<Record> row = new TableRow<>();
      final ContextMenu contextMenu = new ContextMenu();
      final MenuItem removeMenuItem = new MenuItem("Remove");
      removeMenuItem.setOnAction(event -> {
        String query = String.format("Delete From allrecord where id=%d",
            row.getTableView().getSelectionModel().getSelectedItem().getId());

        try {
          Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
          System.out.println("User: error in deleting");
          return;
        }
        filltable();
      });
      contextMenu.getItems().add(removeMenuItem);
      // Set context menu on row, but use a binding to make it only show for non-empty rows:
      row.contextMenuProperty().bind(
          Bindings.when(row.emptyProperty())
              .then((ContextMenu) null)
              .otherwise(contextMenu)
      );
      return row;
    });
    reset();
  }

  public void request(ActionEvent e) { // action handler after pressing the request button
    try {
      int i = Integer.parseInt(room.getText());
      room.setText("0" + room.getText());
    } catch (Exception ex) {
      Main.showalert("Wrong Input", "Room Number Must be an Integer", pane, Color.RED);
      room.setText("");
      return;
    }

    Request r = new Request(hostels.getValue(), floor.getValue() + room.getText(),
        requesttype.getValue(), comment.getText());
    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
    String query =
        String.format(
            "Insert into allrecord (hostel,roomnum,status,requesttype,comment,studentid,starttime) "
                + "Values (\"%s\", %s, \"Unassigned\", \"%s\", \"%s\",%d,\"%s\")",
            r.getHostel(), r.getRoom(), r.getRequestType(), r.getComment(), id, date);

    try {
      Main.con.createStatement().executeUpdate(query);
    } catch (SQLException ex) {
      System.out.println("User: error in request function");
      return;
    }

    Main.showalert("Success", "Request made Successfully ", pane, Color.GREEN);
    reset();
  }

  public void reset() {  // Resets all the fields
    hostels.setValue("H1");
    floor.setValue("0");
    room.setText("");
    requesttype.setValue("Cleaner");
    comment.setText("");
    filltable();
  }

  public void login() { // logout option
    Main.changeScene("WelcomeScreen.fxml");
  }

  public void showhistory() { // scrolls the window to show the user history table
    final Timeline timeline = new Timeline();
    final KeyValue kv = new KeyValue(scrollpane.vvalueProperty(), 2.0);
    final KeyFrame kf = new KeyFrame(Duration.millis(500), kv);
    timeline.getKeyFrames().add(kf);
    timeline.play();
  }

  public void back() {  // scrolls the window back to its original request form page
    final Timeline timeline = new Timeline();
    final KeyValue kv = new KeyValue(scrollpane.vvalueProperty(), 0.0);
    final KeyFrame kf = new KeyFrame(Duration.millis(500), kv);
    timeline.getKeyFrames().add(kf);
    timeline.play();
  }

  @FXML
  void filltable() { // fills the user history table
    ObservableList<Record> list = FXCollections.observableArrayList();
    ResultSet rs;
    try {
      rs = Main.con.createStatement()
          .executeQuery("Select * FROM allrecord WHERE studentid=" + id);
      while (rs.next()) {
        list.add(
            new Record(rs.getInt("ID"), rs.getString("workerid"), rs.getInt("studentid"),
                rs.getString("roomnum"), rs.getString("Status"),
                rs.getString("requesttype"), rs.getTimestamp("starttime"),
                rs.getTimestamp("closedtime"), rs.getString("hostel"),
                rs.getString("comment")));
      }

    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("User: error in filltable function");
      return;
    }
    historytable.setItems(list);
  }

}
