public class Request {

  private String Hostel;
  private String Room;
  private String RequestType;
  private String comment;

  Request(String Hostel, String Room, String requestType, String comment) {
    this.Hostel = Hostel;
    this.Room = Room;
    this.RequestType = requestType;
    this.comment = comment;
  }

  @Override
  public String toString() {
    return Hostel + "-" + Room + " has requested for " + RequestType;
  }

  public String getHostel() {
    return Hostel;
  }

  public void setHostel(String hostel) {
    Hostel = hostel;
  }

  public String getRoom() {
    return Room;
  }

  public void setRoom(String room) {
    Room = room;
  }

  public String getRequestType() {
    return RequestType;
  }

  public void setRequestType(String requestType) {
    RequestType = requestType;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }


}
