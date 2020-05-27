import java.sql.Timestamp;

public class Work {

  int ID;
  String Status;
  String RoomNo;
  String hostel;
  Timestamp Starttime;
  Timestamp Closedtime;
  int WorkerID;
  String RequestType;

  public Work(int ID, String RoomNo, Timestamp starttime, String requestType, int workerID,
      String hostel) {
    this.ID = ID;
    this.RoomNo = RoomNo;
    this.Starttime = starttime;
    this.WorkerID = workerID;
    this.RequestType = requestType;
    this.hostel = hostel;
  }

  public Work(int ID, String RoomNo, Timestamp starttime, Timestamp closedtime,
      String requestType,
      int workerID, String hostel) {
    this.ID = ID;
    this.RoomNo = RoomNo;
    this.Starttime = starttime;
    this.WorkerID = workerID;
    this.RequestType = requestType;
    this.Closedtime = closedtime;
    this.hostel = hostel;
  }

  @Override
  public String toString() {
    return "ID: " + ID + " Roomnum: " + RoomNo + " Request type: " + RequestType;
  }

  public int getID() {
    return ID;
  }

  public void setID(int ID) {
    this.ID = ID;
  }

  public Timestamp getClosedtime() {
    return Closedtime;
  }

  public void setClosedtime(Timestamp closedtime) {
    Closedtime = closedtime;
  }

  public String getStatus() {
    return Status;
  }

  public void setStatus(String status) {
    Status = status;
  }

  public String getRoomNo() {
    return RoomNo;
  }

  public void setRoomNo(String roomNo) {
    RoomNo = roomNo;
  }

  public Timestamp getStarttime() {
    return Starttime;
  }

  public void setStarttime(Timestamp starttime) {
    Starttime = starttime;
  }

  public int getWorkerID() {
    return WorkerID;
  }

  public void setWorkerID(int workerID) {
    WorkerID = workerID;
  }

  public String getRequestType() {
    return RequestType;
  }

  public void setRequestType(String requestType) {
    RequestType = requestType;
  }

  public String getHostel() {
    return hostel;
  }

  public void setHostel(String hostel) {
    this.hostel = hostel;
  }
}
