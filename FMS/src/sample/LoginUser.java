package sample;

public class LoginUser {
  private  int ID;
  private String Name;

  public LoginUser(int id, String name) {
    this.Name=name;
    this.ID=id;
  }

  public LoginUser() {
    this.ID=-1;
    this.Name="";
  }

  public int getID() {
    return ID;
  }

  public String getName() {
    return Name;
  }
}
