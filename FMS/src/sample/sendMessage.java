package sample;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class sendMessage {

  static String apikey = "qb0D+13jsho-tidiqrAJCoQe2UqRxhKcDvxWfVZ9wJ";

  public static String sendSms(String msg) {
    try {
      // Construct data
      String apiKey = "apikey=" + apikey;
      String message = "&message=" + msg;
      String sender = "&sender=" + "DBMS";
      String numbers = "&numbers=" + "8448145804";

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
        stringBuffer.append(line);
      }
      rd.close();

      return stringBuffer.toString();
    } catch (Exception e) {
      System.out.println("Error SMS " + e);
      return "Error " + e;
    }
  }

  public static void main(String[] args) {
    System.out.println(sendSms("test"));
  }
}

