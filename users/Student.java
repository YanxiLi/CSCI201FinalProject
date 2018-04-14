package users;

import java.util.ArrayList;
import java.util.List;

public class Student extends User{
    private List<Integer> courseTakingId = new ArrayList<Integer>();
    private List<Integer> courseTeachingId = new ArrayList<Integer>();
    private List<Integer> announcementMadeId = new ArrayList<Integer>();
    /*
    public Student(String username, int Id, List<Integer> courseteaching, List<Integer> coursetaking){
        super(username, Id);
        this.courseTeachingId = courseteaching;
        this.courseTakingId = coursetaking;
    }*/
    public List<Integer> getCourseTeachingId() {
        return courseTeachingId;
    }
    public List<Integer> getCourseTakingId() {
        return courseTakingId;
    }
    public List<Integer> getAnnouncementMadeId() {
        return announcementMadeId;
    }
    public void addAnnouncementMadeId(int announcement){
        this.announcementMadeId.add(announcement);
    }
    public String type() {
        return "student";
    }
}