import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public class Question {
    private int id;
    private String title;
    private String content;
    private LocalDateTime postDate;
    private int senderId;
    private int category_id;
    private List<Integer> answersId;
    public Question(int id, String title, int senderId, String content, int courseId, LocalDateTime time, int category) {
        this.id = id;
        this.senderId = senderId;
        this.title = title;
        this.content = content;
        this.postDate = time;
        this.category_id = category;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public LocalDateTime getTime() {
        return postDate;
    }
    public void setTime(LocalDateTime time) {
        this.postDate = time;
    }
    public int getUser_id() {
        return senderId;
    }
    public void setUser_id(int user_id) {
        this.senderId = user_id;
    }
    public int getCategory_id() {
        return category_id;
    }
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
    public List<Integer> getanswersId(){
        return answersId;
    }
    public void setAnswersId(List<Integer> answers){
        this.answersId = answers;
    }

}