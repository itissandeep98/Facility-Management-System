package sample;

import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.beans.binding.Bindings;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class AddEmployee implements Initializable {

  @FXML
  private JFXTextField ename;
  @FXML
  private JFXTextField name;
  @FXML
  private JFXTextField phonenum;
  @FXML
  private ChoiceBox<String> speciality;

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
    String[] values = new String[]{"Cleaner", "Carpenter", "Plumber", "Electrician"};
    spec.setItems(FXCollections.observableArrayList(values));
    speciality.setItems(FXCollections.observableArrayList(values));

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
      String query =
          String.format("Update worker SET name = \"%s\" Where id=%d", event.getNewValue(),
              event.getRowValue().getID());
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
      String query =
          String.format("Update worker SET contactinfo = \"%s\" Where id=%d",
              event.getNewValue(), event.getRowValue().getID());
      try {
        Main.con.createStatement().executeUpdate(query);
      } catch (SQLException e) {
        System.out.println("AddEmployee: error in contact info update");
        return;
      }
      filltable();
    });

    empspecialitycol.setCellFactory(
        ComboBoxTableCell.forTableColumn(FXCollections.observableArrayList(values)));
    empspecialitycol.setOnEditCommit(event -> {
      String query =
          String.format("Update worker SET speciality = \"%s\" Where id=%d",
              event.getNewValue(), event.getRowValue().getID());
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
      final MenuItem viewHistory = new MenuItem("History");
      removeMenuItem.setOnAction(event -> {
        String query =
            String.format("Delete From worker where id=%d",
                row.getTableView().getSelectionModel().getSelectedItem().getID());

        try {
          Main.con.createStatement().executeUpdate(query);
        } catch (SQLException e) {
          System.out.println("AddEmployee: error in deleting");
          return;
        }
        filltable();
      });
      viewHistory.setOnAction(event -> {
        showHistory(row);

      });
      contextMenu.getItems().addAll(viewHistory, removeMenuItem);
      // Set context menu on row, but use a binding to make it only show for non-empty rows:
      row.contextMenuProperty().bind(
          Bindings.when(row.emptyProperty())
              .then((ContextMenu) null)
              .otherwise(contextMenu)
      );
      return row;
    });


  }

  private void showHistory(TableRow<Workers> row) {
    int id = row.getTableView().getSelectionModel().getSelectedItem().getID();
    String name = row.getTableView().getSelectionModel().getSelectedItem().getName();
    try {
      Stage stage = new Stage();
      FXMLLoader root = new FXMLLoader(
          getClass().getResource("EmployeeHistory.fxml"));
      Parent rootPane = root.load();
      EmployeeHistory controller = root.getController();
      controller.setWorkerid(id);
      Scene scene = new Scene(rootPane);
      stage.setScene(scene);
      stage.setTitle("History for " + name);
      stage.show();

    } catch (IOException e) {
      System.out.println("error in showing history");
    }


  }

  public void back(ActionEvent e) {
    Main.changeScene("FMS.fxml");
  }

  public void filltable() {
    ObservableList<Workers> list = FXCollections.observableArrayList();
    ResultSet rs;
    try {
      rs = Main.con.createStatement().executeQuery(tablequery);
      while (rs.next()) {
        list.add(
            new Workers(rs.getInt("ID"), rs.getString("Name"), rs.getString("Speciality"),
                rs.getString("ContactInfo")));
      }

    } catch (Exception e) {
      System.out.println("AddEmployee: error in filltable function \n" + e);
      return;
    }

    employeeTable.setItems(list);
  }

  public void addnewemployee() {
    String empname = name.getText();
    String empspeciality = speciality.getValue();
    String empphone = phonenum.getText();
    try {
      Main.con.createStatement().executeUpdate(
          String.format("Insert into worker (name,speciality,contactinfo) "
              + "VALUES (\"%s\", \"%s\", \"%s\")", empname, empspeciality, empphone));
    } catch (SQLException e) {
      System.out.println("AddEmployee: error in addnewemployee function");
      return;
    }
    Main.showalert("Success", "Employee added successfully", pane, Color.GREEN);
    filltable();
  }

  public void search() {
    tablequery = "Select * From worker Where";
    boolean flag = false;
    if (ename.getText() != null) {
      tablequery += " name LIKE '%" + ename.getText() + "%'";
      flag = true;
    }
    if (spec.getValue() != null) {
      if (flag) {
        tablequery += " and";
      }
      tablequery += " speciality= \"" + spec.getValue() + "\"";
    }
    filltable();
  }

  public void reset() {
    tablequery = "SELECT  * FROM worker";
    filltable();
    ename.setText(null);
    spec.setValue(null);
  }
}
