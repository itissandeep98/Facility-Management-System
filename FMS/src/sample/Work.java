package sample;

import java.sql.Time;
import java.sql.Timestamp;

public class Work {
    int ID;
    String Status;
    String RoomNo;
    Timestamp Starttime;
    Timestamp Closedtime;

    public Timestamp getClosedtime() {
        return Closedtime;
    }

    public void setClosedtime(Timestamp closedtime) {
        Closedtime = closedtime;
    }

    int WorkerID;
    String RequestType;

    public Work(int ID, String RoomNo, Timestamp starttime, String requestType, int workerID) {
        this.ID = ID;
        this.RoomNo = RoomNo;
        Starttime = starttime;
        WorkerID = workerID;
        RequestType = requestType;
    }
    public Work(int ID, String RoomNo, Timestamp starttime, Timestamp closedtime,String requestType, int workerID) {
        this.ID = ID;
        this.RoomNo = RoomNo;
        this.Starttime = starttime;
        this.WorkerID = workerID;
        this.RequestType = requestType;
        this.Closedtime=closedtime;
    }
    @Override
    public String toString(){
        return "ID: "+ID+" Roomnum: "+ RoomNo+" Request type: "+RequestType;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
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
}
