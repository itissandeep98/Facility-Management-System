package sample;

import java.sql.Time;

public class Work {
    int ID;
    String Status;
    int RoomNum;
    Time Timing;
    int WorkerID;
    String RequestType;

    public Work(int ID, String status, int roomNum, Time timing, int workerID, String requestType) {
        this.ID = ID;
        Status = status;
        RoomNum = roomNum;
        Timing = timing;
        WorkerID = workerID;
        RequestType = requestType;
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

    public int getRoomNum() {
        return RoomNum;
    }

    public void setRoomNum(int roomNum) {
        RoomNum = roomNum;
    }

    public Time getTiming() {
        return Timing;
    }

    public void setTiming(Time timing) {
        Timing = timing;
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
