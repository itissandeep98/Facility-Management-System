package sample;

import java.sql.Timestamp;

public class Record {
    private int id;
    private int workerid;
    private int studentid;
    private int roomnum;
    private String status;
    private String requesttype;
    private String hostel;
    private String comment;
    private Timestamp starttime;
    private Timestamp closedtime;

    Record(int id,int workerid,int studentid,int roomnum, String status,String requesttype,Timestamp starttime,Timestamp closedtime,String hostel,String comment){
        this.id=id;
        this.workerid=workerid;
        this.studentid=studentid;
        this.requesttype=requesttype;
        this.roomnum=roomnum;
        this.status=status;
        this.starttime=starttime;
        this.closedtime=closedtime;
        this.hostel=hostel;
        this.comment=comment;
    }

    public String getHostel() {
        return hostel;
    }

    public void setHostel(String hostel) {
        this.hostel = hostel;
    }
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getWorkerid() {
        return workerid;
    }

    public void setWorkerid(int workerid) {
        this.workerid = workerid;
    }

    public int getStudentid() {
        return studentid;
    }

    public void setStudentid(int studentid) {
        this.studentid = studentid;
    }

    public int getRoomnum() {
        return roomnum;
    }

    public void setRoomnum(int roomnum) {
        this.roomnum = roomnum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRequesttype() {
        return requesttype;
    }

    public void setRequesttype(String requesttype) {
        this.requesttype = requesttype;
    }

    public Timestamp getStarttime() {
        return starttime;
    }

    public void setStarttime(Timestamp starttime) {
        this.starttime = starttime;
    }

    public Timestamp getClosedtime() {
        return closedtime;
    }

    public void setClosedtime(Timestamp closedtime) {
        this.closedtime = closedtime;
    }

}
