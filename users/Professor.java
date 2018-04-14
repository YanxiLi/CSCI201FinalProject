package users;

import java.util.ArrayList;
import java.util.List;

public class Professor extends User{
    private List<Integer> courseTeachingId = new ArrayList<Integer>();
    private List<Integer> announcementMadeId = new ArrayList<Integer>();
    /*
    public Professor(String username, int Id, List<Integer> courseteaching){
        super(username,Id);
        this.coursesTeachingId = courseteaching;
    }*/
    public List<Integer> getCourseTeachingId() {
        return courseTeachingId;
    }
    public List<Integer> getAnnouncementMadeId() {
        return announcementMadeId;
    }
    public void addAnnouncementMadeId(int announcement){
        this.announcementMadeId.add(announcement);
    }
    public String type(){
        return "professor";
    }
}