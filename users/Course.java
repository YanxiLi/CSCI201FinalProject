package users;

import java.util.ArrayList;
import java.util.List;

public class Course {
    private int ProfessorId;
    private List<Integer> tasId = new ArrayList<Integer>();//TAs
    private List<Integer> studentsId =  new ArrayList<Integer>();
    private String courseName;
    private List<Integer> postId = new ArrayList<Integer>();
    private List<Integer> announcementsId = new ArrayList<Integer>();
    public Course(String courseName, int ProfessorId) {
        this.courseName = courseName;
        this.ProfessorId = ProfessorId;
    }
    public String getCourseName() {
        return courseName;
    }
    public void setCourseName(String name) {
        courseName = name;
    }
    public int getProfessorId() {
        return ProfessorId;
    }
    public void setProfessorId(int professor){
        ProfessorId = professor;
    }
    public List<Integer> getTAId(){
        return tasId;
    }
    public void setTA(List<Integer> TAs) {
        this.tasId = TAs;
    }
    public List<Integer> getStudentsId(){
        return studentsId;
    }
    public void setStudents(List<Integer> studentsId) {
        this.studentsId = studentsId;
    }
    public List<Integer> getPostsId(){
        return postId;
    }
    public void setPosts(List<Integer> posts){
        postId = posts;
    }
    public List<Integer> getAnnouncementsId(){
        return announcementsId;
    }
    public void setAnnouncement(List<Integer> a) {
        announcementsId = a;
    }
    public void addStudent(Integer studentId) {
        studentsId.add(studentId);
    }
    public void addTA(Integer TA) {
        tasId.add(TA);
    }
    public void addPost(Integer id) {
        postId.add(id);
    }
    public void addAnnouncement(Integer announcementId) {
        announcementsId.add(announcementId);
    }
    public void deleteStudent(Integer stu) {
        for(int i = 0;i<studentsId.size();i++) {
            if(studentsId.get(i).equals(stu)) {
                studentsId.remove(i);
            }
        }
    }
    public void deleteTA(Integer ta) {
        for(int i = 0;i<tasId.size();i++) {
            if(tasId.get(i).equals(ta)) {
                tasId.remove(i);
            }
        }
    }
    public void deletePost(Integer post) {
        for(int i = 0;i<postId.size();i++) {
            if(postId.get(i).equals(post)) {
                postId.remove(i);
            }
        }
    }
    public void deleteAnnouncement(Integer announcement) {
        for(int i = 0;i<announcementsId.size();i++) {
            if(announcementsId.get(i).equals(announcement)) {
                announcementsId.remove(i);
            }
        }
    }
}
