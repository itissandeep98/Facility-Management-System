package sample;

public class Workers  {
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getSpeciality() {
        return Speciality;
    }

    public void setSpeciality(String speciality) {
        Speciality = speciality;
    }

    public String getContactInfo() {
        return ContactInfo;
    }

    public void setContactInfo(String contactInfo) {
        ContactInfo = contactInfo;
    }

    public int getSupervisorID() {
        return SupervisorID;
    }

    public void setSupervisorID(int supervisorID) {
        SupervisorID = supervisorID;
    }

    private int ID;
    private String Name;
    private String Speciality;
    private String ContactInfo;
    private int SupervisorID;
    Workers(int ID,String Name,String Spec,String ContactInfo){
        this.ID=ID;
        this.Name=Name;
        this.Speciality=Spec;
        this.ContactInfo = ContactInfo;
    }
    Workers(int ID, String Name, String Spec, String ContactInfo, int SupID){
        this.ID=ID;
        this.Name=Name;
        this.Speciality=Spec;
        this.ContactInfo = ContactInfo;
        this.SupervisorID=SupID;
    }

    @Override
    public String toString() {
        return "ID:"+ID+" Name:"+Name+" Speciality:"+Speciality+" Phone:"+ ContactInfo;
    }
}
