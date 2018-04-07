import java.time.LocalDateTime;

public class Comment {
	private int userId;
	private String content;
	private LocalDateTime postDate;
	public Comment(int userId, String content ) {
		this.userId=userId;
		this.content=content;
		postDate = LocalDateTime.now();
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
