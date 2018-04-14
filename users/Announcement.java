package users;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Announcement {
    private int id;
    private String title;
    private List<Integer> followupId = new ArrayList<Integer>();
    private int senderId;
    private LocalDateTime postDate;
    private String content;
    private int courseId;
    public Announcement(int id, String title, int senderId, String content, int courseId, LocalDateTime time) {
        this.id = id;
        this.courseId = courseId;
        this.senderId = senderId;
        this.title = title;
        this.content = content;
        this.postDate = time;
    }
    public int getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String newt) {
        title = newt;
    }
    public List<Integer> getFollowupId(){
        return followupId;
    }
    public void addFollowup(int id) {
        followupId.add(id);
    }
    public LocalDateTime getPostDate() {
        return postDate;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public int getSenderId() {
        return senderId;
    }
    public int getCourseId() {
        return courseId;
    }
}
