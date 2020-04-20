package sample;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
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

		@FXML
		private MenuButton recordmenu;

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
				filltable();

				for (MenuItem i : recordmenu.getItems()) {
						if (i.getText().equals("Open Record")) {
								i.setOnAction(actionEvent -> {
										tablequery = "Select * From allrecord where status =\"Open\"";
										recordmenu.setText(i.getText());
										filltable();
								});
						} else if (i.getText().equals("Closed Record")) {
								i.setOnAction(actionEvent -> {
										tablequery = "Select * From allrecord where status =\"Close\"";
										recordmenu.setText(i.getText());
										filltable();
								});
						} else if (i.getText().equals("All Records")) {
								i.setOnAction(actionEvent -> {
										tablequery = "Select * From allrecord ";
										recordmenu.setText(i.getText());
										filltable();
								});
						} else if (i.getText().equals("Unassigned Record")) {
								i.setOnAction(actionEvent -> {
										tablequery = "Select * From allrecord where status=\"Unassigned\"";
										recordmenu.setText(i.getText());
										filltable();
								});
						}
				}

				//ToDo: make this a combobox and it will only have values according to the request type of that row
				workerid.setCellFactory(TextFieldTableCell.<Record>forTableColumn());
				workerid.setOnEditCommit(event -> {
						String query =
								String.format("Update allrecord SET workerid = \"%s\" Where id=%d",
										event.getNewValue(), event.getRowValue().getId());
						try {
								Main.con.createStatement().executeUpdate(query);
						} catch (SQLException e) {
								System.out.println("FMS: error in workerid update");
								return;
						}
						filltable();
				});
				status.setCellFactory(ComboBoxTableCell
						.forTableColumn(FXCollections.observableArrayList("Open", "Closed", "Unassigned")));
				status.setOnEditCommit(event -> {
						String query =
								String.format("Update allrecord SET status=\"%s\" Where id=%d", event.getNewValue(),
										event.getRowValue().getId());
						try {
								Main.con.createStatement().executeUpdate(query);
						} catch (SQLException e) {
								System.out.println("User: error in hostel update");
								return;
						}
						filltable();
				});

		}

		public void filltable() {

				ObservableList<Record> list = FXCollections.observableArrayList();
				ResultSet rs;
				try {
						rs = Main.con.createStatement().executeQuery(tablequery);
						while (rs.next()) {
								list.add(
										new Record(rs.getInt("ID"), rs.getString("workerid"), rs.getInt("studentid"),
												rs.getString("roomnum"), rs.getString("Status"),
												rs.getString("requesttype"),
												rs.getTimestamp("starttime"), rs.getTimestamp("closedtime"),
												rs.getString("hostel"),
												rs.getString("comment")));
						}

				} catch (Exception e) {
						System.out.println("AddEmployee: error in filltable function");
						return;
				}

				recordtable.setItems(list);
		}

		public void addemployee(ActionEvent e) {
				Main.changeScene("AddEmployee.fxml");
		}

		public void login(ActionEvent e) {
				Main.changeScene("WelcomeScreen.fxml");
		}


}
