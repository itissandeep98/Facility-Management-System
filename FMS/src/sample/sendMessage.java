package sample;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class sendMessage {

  static String apikey = "qb0D+13jsho-tidiqrAJCoQe2UqRxhKcDvxWfVZ9wJ";
  //jgzG0pSNTqc-oB2LD3OLxicWcfqC4Wg66neukvANMQ

  public static String send(String msg, String tophone) {
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

}

