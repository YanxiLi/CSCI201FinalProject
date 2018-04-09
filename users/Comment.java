import java.time.LocalDateTime;
public class Comment {
    private int userId;
    private String content;
    private LocalDateTime postDate;
    public Comment(int userId, String content, LocalDateTime time) {
        this.userId=userId;
        this.content=content;
        this.postDate = time;
    }
    public int getUserId() {
        return userId;
    }
    public String getContent(){
        return content;
    }
    public LocalDateTime getTimeAdded() {
        return postDate;
    }
}
