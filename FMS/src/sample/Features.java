package sample;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import javafx.scene.control.TableView;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class Features {

  static String apikey = "jgzG0pSNTqc-oB2LD3OLxicWcfqC4Wg66neukvANMQ";

  public static String sendSMS(String msg, String tophone) {
    try {
      String apiKey = "apikey=" + apikey;
      String message = "&message=" + msg;
      String sender = "&sender=" + "TXTLCL";
      String numbers = "&numbers=" + tophone;

      HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?")
          .openConnection();
      String data = apiKey + numbers + message + sender;
      conn.setDoOutput(true);
      conn.setRequestMethod("POST");
      conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
      conn.getOutputStream().write(data.getBytes(StandardCharsets.UTF_8));
      final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      final StringBuilder stringBuffer = new StringBuilder();
      String line;
      while ((line = rd.readLine()) != null) {
        if (line.contains("success")) {
          rd.close();
          return "Success";
        }
        stringBuffer.append(line);
      }
      rd.close();

      return stringBuffer.toString();
    } catch (Exception e) {
      System.out.println("Error SMS " + e);
      return "Error " + e;
    }
  }
  public static boolean exportExcel(TableView<?> table, String name){
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

