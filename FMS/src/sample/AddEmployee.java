package sample;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

public class AddEmployee {
    @FXML
    private JFXTextField eid;
    @FXML
    private JFXTextField phonenum;
    @FXML
    private JFXTextField speciality;
    @FXML
    private JFXButton addemp;

    @FXML
    private JFXButton search;
    @FXML
    private JFXButton delete;
    @FXML
    private JFXButton update;

    @FXML
    private JFXTextField name;
    @FXML
    private TableView<?> employeeTable;
    @FXML
    private TableColumn<?, ?> empIdColumn;
    @FXML
    private TableColumn<?, ?> empphonenumcol;
    @FXML
    private TableColumn<?, ?> empspecialitycol;
    @FXML
    private TableColumn<?, ?> empnamecol;
}
