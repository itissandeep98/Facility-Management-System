package sample;

import java.io.FileOutputStream;
import java.io.IOException;
import javafx.scene.control.TableView;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class Exportexcel {
  public static boolean export(TableView<?> table, String name){
    Workbook workbook = new HSSFWorkbook();
    Sheet spreadsheet = workbook.createSheet("sample");

    Row row = spreadsheet.createRow(0);

    for (int j = 0; j < table.getColumns().size(); j++) {
      row.createCell(j).setCellValue(table.getColumns().get(j).getText());
    }

    for (int i = 0; i < table.getItems().size(); i++) {
      row = spreadsheet.createRow(i + 1);
      for (int j = 0; j < table.getColumns().size(); j++) {
        if(table.getColumns().get(j).getCellData(i) != null) {
          row.createCell(j).setCellValue(table.getColumns().get(j).getCellData(i).toString());
        }
        else {
          row.createCell(j).setCellValue("");
        }
      }
    }

    try {
      FileOutputStream fileOut = new FileOutputStream(name+".xls");
      workbook.write(fileOut);
      fileOut.close();
    } catch (IOException e) {
      System.out.println(e);
      return false;
    }
    return  true;
  }

}
