package sample;

import com.jfoenix.controls.JFXTextField;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
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
		public int Workerid;

		public void login(ActionEvent e) {
				Main.changeScene("WelcomeScreen.fxml");
		}

		@Override
		public void initialize(URL url, ResourceBundle resourceBundle) {
				String[] values = new String[]{"Name", "Phone Number", "Speciality", "Supervisor ID"};
				details.setItems(FXCollections.observableArrayList(values));
				details.setValue("Choose Below");
				details.setOnAction(actionEvent -> {
						try {
								ResultSet rs = Main.con.createStatement().executeQuery("SELECT  * FROM worker");
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

				//Todo: Workerid needs to be updated everytime
				Workerid = 1;
				empid.setText("Employee ID: " + Workerid);
				FillAssignedTable();
		}

		public void FillCompletedTable() {
				ObservableList<Work> list = FXCollections.observableArrayList();
				ResultSet rs;
				try {
						String query =
								String.format(
										"SELECT ar.id,starttime,requesttype,roomno,closedtime,ar.hostel "
												+ "FROM allrecord ar,students s "
												+ "WHERE s.id=ar.studentid and ar.workerid=%d and ar.status=\"Close\"",
										Workerid);
						rs = Main.con.createStatement().executeQuery(query);
						while (rs.next()) {
								list.add(
										new Work(rs.getInt("ID"), rs.getString("RoomNo"), rs.getTimestamp("starttime"),
												rs.getTimestamp("closedtime"), rs.getString("requesttype"), Workerid,
												rs.getString("hostel")));
						}

				} catch (Exception e) {
						System.out.println("Employee: error in Fillcompletedtable" + e);
						return;
				}
				completedtable.setItems(list);
		}

		public void FillAssignedTable() {
				ObservableList<Work> list = FXCollections.observableArrayList();
				ResultSet rs;
				try {
						String query =
								String.format(
										"SELECT ar.id,starttime,requesttype,roomno,ar.hostel "
												+ "FROM allrecord ar,students s "
												+ "WHERE s.id=ar.studentid and ar.workerid=%d and ar.status=\"Open\"",
										Workerid);
						rs = Main.con.createStatement().executeQuery(query);

						while (rs.next()) {
								list.add(
										new Work(rs.getInt("ID"), rs.getString("RoomNo"), rs.getTimestamp("starttime"),
												rs.getString("requesttype"), Workerid, rs.getString("hostel")));
						}

				} catch (Exception e) {
						System.out.println("Employee:error in Fillassignedtable");
						return;
				}
				assignedtable.setItems(list);
		}

		public void changedetails(ActionEvent ev) {
				String content = details.getValue();
				String value = newvalue.getText();
				Statement stmt = null;
				String query = "";
				try {

						stmt = (Statement) Main.con.createStatement();
						switch (content) {
								case "Name":
										query = String
												.format("UPDATE worker set name=\"%s\" where id =%d", value, Workerid);

										break;
								case "Phone Number":
										query = String
												.format("UPDATE worker set contactinfo=\"%s\" where id =%d", value,
														Workerid);
										break;
								case "Speciality":
										query = String
												.format("UPDATE worker set speciality=\"%s\" where id =%d", value,
														Workerid);
										break;
								default:
										query = String.format("UPDATE worker set supervisorid= %d" + " where id = %d",
												Integer.parseInt(value), Workerid);
										break;
						}
						stmt.executeUpdate(query);
				} catch (SQLException e) {
						System.out.println("Employee: error in changedetails function");
						return;
				}
				Main.showalert("Success", "New " + content + " has been updated Successfully", pane,
						Color.GREEN);
				reset();
		}

		public void markcompleted(ActionEvent ev) {
				int workid = Integer.parseInt(id.getText());
				Statement stmt = null;

				try {
						java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
						//always put timestamp datatype under quotes otherwise it will throw an error
						String query = String.format(
								"UPDATE allrecord SET status = \"Close\", closedtime =\"%s\" WHERE status = \"Open\" and id= %d",
								date, workid);
						Main.con.createStatement().executeUpdate(query);
				} catch (SQLException e) {
						System.out.println("Employee: error in markcompleted function");
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
}