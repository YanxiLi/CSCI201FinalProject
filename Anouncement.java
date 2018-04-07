
import java.time.LocalDateTime;
import java.util.List;



public class Anouncement {
		private String title;
		private List<Integer> followupId;
		private int senderId;
		private LocalDateTime postDate;
		private String content;
		private int courseId;
		public Anouncement(String title, int senderId, String content, int courseId) {
			this.courseId = courseId;
			this.senderId = senderId;
			this.title = title;
			this.content = content;
			postDate = LocalDateTime.now();
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
