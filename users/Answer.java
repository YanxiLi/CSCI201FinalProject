package users;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Answer{
    private int id;
    private LocalDateTime time;
    private String content;
    private int user_answering_id;
    private int related_post_id;
    //private int related_announcement_id;
    private List<Integer> followupId = new ArrayList<Integer>();
    public Answer(int id, LocalDateTime time, String content, int user_answering_id, int related_post_id){
        this.id = id;
        this.time = time;
        this.content = content;
        this.user_answering_id = user_answering_id;
        this.related_post_id = related_post_id;
        //this.related_announcement_id = related_announcement_id;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public LocalDateTime getTime() {
        return time;
    }
    public void setTime(LocalDateTime time) {
        this.time = time;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public int getUser_answering_id() {
        return user_answering_id;
    }
    public void setUser_answering_id(int user_answering_id) {
        this.user_answering_id = user_answering_id;
    }
    public int getRelated_post_id() {
        return related_post_id;
    }
    public void setRelated_post_id(int related_post_id) {
        this.related_post_id = related_post_id;
    }
    /*
    public int getRelated_announcement_id() {
        return related_announcement_id;
    }
    public void setRelated_announcement_id(int related_announcement_id) {
        this.related_announcement_id = related_announcement_id;
    }*/
    public List<Integer> getFollowupId(){
        return followupId;
    }
}