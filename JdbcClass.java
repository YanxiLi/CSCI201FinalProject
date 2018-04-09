import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JdbcClass {
	private Connection conn = null;
    private static String driverName = "com.mysql.jdbc.Driver";
    public JdbcClass() {
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection("jdbc:mysql://localhost/201FinalProject?user=root&password=1304kenya&useSSL=false");
        } catch (SQLException sqle) {
            System.out.println("sqle: " + sqle.getMessage());
        } catch (ClassNotFoundException cnfe) {//if we cannot find from the driver
            System.out.println("hey");
            System.out.println("cnfe: " + cnfe.getMessage());
        }
    }
    public Boolean isEmailExist(String email) throws SQLException{//check whether email exists in database
        String queryCheck = "SELECT u.email " +
                "From User u " +
                "WHERE u.email=?";
        PreparedStatement ps = conn.prepareStatement(queryCheck);
        ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            return true;
        }else{
            return false;
        }
    }
    public Boolean isUSC(String email) 
    		throws SQLException{
    		String queryCheck = "SELECT u.email, u.type " +
                "FROM User u " +
                "WHERE u.email=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
        		if(rs.getInt("type") == 1 || rs.getInt("type") == 2) {
        			return true;
        		}
        }
        return false;
    }
    public Boolean isUser(String email, String password) throws SQLException{//check whether user can login
        String queryCheck = "SELECT u.email, u._password " +
                "FROM User u " +
                "WHERE u.email=?";
        PreparedStatement ps = conn.prepareStatement(queryCheck);
        ps.setString(1,email);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            if(email.equalsIgnoreCase(rs.getString("email")) && password.equalsIgnoreCase(rs.getString("_password"))) {//If the user hasn't registered, the password will be null
               return true;
            }
        }
        return false;
    }
    public int getUserId(String email) throws SQLException{
        	String queryCheck = "SELECT u.email, u.user_id " +
                "FROM User u " +
                "WHERE u.email=?";
        	PreparedStatement ps = conn.prepareStatement(queryCheck);
        	ps.setString(1,email);
        	ResultSet rs = ps.executeQuery();
        	int userid = 0;
        	if(rs.next()) {
        		userid = rs.getInt("user_id");
        	}
        	return userid;
    }
    public void registerStudent(String firstname, String lastname, String username, String password, String email)
            throws SQLException{
        int type = 1;
        String queryCheck = "UPDATE User SET fname=?, lname=?, username=?, _password=?, image_url=?, enrolled_date=? where email=? AND type=?";
        PreparedStatement ps = conn.prepareStatement(queryCheck);
        ps.setString(1, firstname);
        ps.setString(2, lastname);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setString(5, null);
        ps.setTime(6, null);
        ps.setString(7, email);
        ps.setInt(8, type);
        ps.executeUpdate();
    }
    public void registerProfessor(String firstname, String lastname, String username, String password, String email)
            throws SQLException{
        int type = 2;
        String queryCheck = "UPDATE User SET fname=?, lname=?, username=?, _password=?, image_url=?, enrolled_date=? where email=? AND type=?";
        PreparedStatement ps = conn.prepareStatement(queryCheck);
        ps.setString(1, firstname);
        ps.setString(2, lastname);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setString(5, null);
        ps.setTime(6, null);
        ps.setString(7, email);
        ps.setInt(8, type);
        ps.executeUpdate();
    }
    public void registerNormUser(String firstname, String lastname, String username, String password, String email)
            throws SQLException{
        int type = 3;
        String queryCheck = "INSERT INTO User (fname, lname, username, _password, email, image_url, enrolled_date, type)" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(queryCheck);
        ps.setString(1, firstname);
        ps.setString(2, lastname);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setString(5, email);
        ps.setString(6, null);
        ps.setTime(7, null);
        ps.setInt(8, type);
        ps.executeUpdate();
    }  
    public List<String> getCourseTakingNameList(int userid) 
    		throws SQLException {
    		List<String> coursenamelist = new ArrayList<String>();
    		String queryCheck = "SELECT cu.user_id, c.prefix, c.num" +
                " From Course_user cu, Course c" +
                " Where cu.user_id=?"
                + " AND cu.course_id=c.course_id"
                + " AND cu.type=1";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			coursenamelist.add(rs.getString("prefix") + " " + rs.getString("num"));
    		}
    		return coursenamelist;
    }
    public List<String> getCourseTeachingNameList(int userid)
    		throws SQLException {
    		List<String> coursenamelist = new ArrayList<String>();
    		String queryCheck = "SELECT cu.user_id, c.prefix, c.num" +
                " From Course_user cu, Course c" +
                " Where cu.user_id=?"
                + " AND cu.course_id=c.course_id"
                + " AND cu.type=2";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			coursenamelist.add(rs.getString("prefix") + " " + rs.getString("num"));
    		}
    		return coursenamelist;
    }
    public String getUserName(int userid) 
    		throws SQLException {
    		String name = "";
    		String queryCheck = "SELECT u.user_id, u.username" +
                " From User u" +
                " Where u.user_id=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			name = rs.getString("username");
    		}
    		return name;
    }
    public int getCourseTakingId(int userid, int index) 
    		throws SQLException{
    		String queryCheck = "SELECT cu.user_id, cu.course_id" +
                    " From Course_user cu" +
                    " Where cu.user_id=?"
                    + " AND cu.type=1";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		List<Integer> courselist = new ArrayList<Integer>();
    		while(rs.next()) {
    			courselist.add(rs.getInt("course_id"));
    		}
    		int courseid = courselist.get(index);
    		return courseid;
    }
    public int getCourseTeachingId(int userid, int index) 
    		throws SQLException{
    		String queryCheck = "SELECT cu.user_id, cu.course_id" +
                    " From Course_user cu" +
                    " Where cu.user_id=?"
                    + " AND cu.type=2";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		List<Integer> courselist = new ArrayList<Integer>();
    		while(rs.next()) {
    			courselist.add(rs.getInt("course_id"));
    		}
    		int courseid = courselist.get(index);
    		return courseid;
    }   
    public List<Announcement> getAnnouncementListForCourse(int courseid) 
    		throws SQLException{
    		List<Announcement> announcementlist = new ArrayList<Announcement>();
    		String queryCheck = "SELECT *" +
                " From Announcement a" +
                " Where a.course_id=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, courseid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			Announcement a = new Announcement(rs.getString("title"),rs.getInt("user_id"),
    					rs.getString("content"), courseid, rs.getTimestamp("time").toLocalDateTime());
    			queryCheck = "SELECT c.announcement_commented_id, c.comment_id" +
    	                " From Comment c" +
    	                " Where c.announcement_commented_id=?";
    			PreparedStatement ps2 = conn.prepareStatement(queryCheck);
    			ps2.setInt(1, rs.getInt("announcement_id"));
    			ResultSet rs2 = ps.executeQuery();
    			while(rs2.next()) {
    				a.getFollowupId().add(rs2.getInt("comment_id"));
    			}
    			announcementlist.add(a);
    		}
    		return announcementlist;
    }
    public List<Question> getQuestionListForCourse(int courseid) 
    		throws SQLException{
    		List<Question> questionlist = new ArrayList<Question>();
		String queryCheck = "SELECT p.course_id, p.question_id, p.title, p.content, p.time, p.user_asking_id, p.category_id" +
            " From Question q, Post p" +
            " Where p.course_id=?"
            + " AND q.question_id=p.question_id";
		PreparedStatement ps = conn.prepareStatement(queryCheck);
		ps.setInt(1, courseid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Question q = new Question(rs.getInt("question_id"),rs.getString("title"),
					rs.getInt("user_asking_id"), rs.getString("content"), courseid, rs.getTimestamp("time").toLocalDateTime(), rs.getInt("category_id"));
			queryCheck = "SELECT p.question_id, a.answer_id" +
	                " From Post p, Answer a" +
	                " Where p.question_id=?"
	                + " p.post_id=a.related_post_id";
			PreparedStatement ps2 = conn.prepareStatement(queryCheck);
			ps2.setInt(1, rs.getInt("question_id"));
			ResultSet rs2 = ps.executeQuery();
			while(rs2.next()) {
				q.getanswersId().add(rs2.getInt("answer_id"));
			}
			questionlist.add(q);
		}
		return questionlist;
    }
    public String getQuestionCategory(int questionid) 
    		throws SQLException {
    		String queryCheck = "SELECT q.question_id, c.type" +
                " From Question q, Category c" +
                " Where q.question_id=?"
                + " AND q.category_id=c.question_id";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, questionid);
    		ResultSet rs = ps.executeQuery();
    		String type="";
    		if(rs.next()) {
    			type = rs.getString("type");
    		}
    		return type;
    }
    public List<Comment> getCommentListToAnswer(int answerid)
    		throws SQLException{
    		List<Comment> commentlist = new ArrayList<Comment>();
    		String queryCheck = "SELECT *" +
    	            " From Comment c" +
    	            " Where c.answer_comment_id=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, answerid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			Comment c = new Comment(rs.getInt("user_id"),rs.getString("content"),
    					rs.getTimestamp("time").toLocalDateTime());
    			commentlist.add(c);
    		}
    		return commentlist;
    }
    public List<Comment> getCommentListToAnnouncement(int announcementid)
    		throws SQLException{
    		List<Comment> commentlist = new ArrayList<Comment>();
    		String queryCheck = "SELECT *" +
    	            " From Comment c" +
    	            " Where c.announcement_commented_id=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, announcementid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			Comment c = new Comment(rs.getInt("user_id"),rs.getString("content"),
    					rs.getTimestamp("time").toLocalDateTime());
    			commentlist.add(c);
    		}
    		return commentlist;
    }
    public List<Answer> getAnswerList(int questionid)
    		throws SQLException {
    		List<Answer> answerlist = new ArrayList<Answer>();
		String queryCheck = "SELECT *" +
            " From Answer a, Post p" +
            " Where p.question_id=?"
            + " AND a.related_post_id=p.question_id";
		PreparedStatement ps = conn.prepareStatement(queryCheck);
		ps.setInt(1, questionid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Answer a = new Answer(rs.getInt("answer_id"), rs.getTimestamp("time").toLocalDateTime(),
					rs.getString("content"), rs.getInt("user_answering_id"), rs.getInt("related_post_id"));
			queryCheck = "SELECT a.answer_id, c.comment_id" +
	                " From Answer a, Comment c" +
	                " Where a.answer_id=?"
	                + " a.answer_id=c.answer_commented_id";
			PreparedStatement ps2 = conn.prepareStatement(queryCheck);
			ps2.setInt(1, rs.getInt("answer_id"));
			ResultSet rs2 = ps.executeQuery();
			while(rs2.next()) {
				a.getFollowupId().add(rs2.getInt("comment_id"));
			}
			answerlist.add(a);
		}
		return answerlist;
    }
    public List<String> getCourseNameTakingForUser(int userid)
    		throws SQLException{
    		List<String> courselist = new ArrayList<String>();
    		String queryCheck = "SELECT cu.user_id, c.prefix, c.num" +
                " From Course_user cu, Course c" +
                " Where cu.user_id=?"
                + " AND cu.type=1"
                + " AND c.course_id=cu.course_id";
		PreparedStatement ps = conn.prepareStatement(queryCheck);
		ps.setInt(1, userid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String coursename = rs.getString("prefix") + " " + rs.getString("num");
			courselist.add(coursename);
		}
		return courselist;
    }
    public List<Integer> getCourseIdTakingForUser(int userid)
    		throws SQLException{
    		List<Integer> courselist = new ArrayList<Integer>();
    		String queryCheck = "SELECT cu.user_id, cu.course_id" +
                    " From Course_user cu" +
                    " Where cu.user_id=?"
                    + " AND cu.type=1";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			courselist.add(rs.getInt("course_id"));
    		}
    		return courselist;
    }
    public List<String> getCourseNameTeachingForUser(int userid)
    		throws SQLException{
    		List<String> courselist = new ArrayList<String>();
		String queryCheck = "SELECT cu.user_id, c.prefix, c.num" +
            " From Course_user cu, Course c" +
            " Where cu.user_id=?"
            + " AND cu.type=2"
            + " AND c.course_id=cu.course_id";
		PreparedStatement ps = conn.prepareStatement(queryCheck);
		ps.setInt(1, userid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String coursename = rs.getString("prefix") + " " + rs.getString("num");
			courselist.add(coursename);
		}
		return courselist;
    }
    public List<Integer> getCourseIdTeachingForUser(int userid)
    		throws SQLException{
    		List<Integer> courselist = new ArrayList<Integer>();
    		String queryCheck = "SELECT cu.user_id, cu.course_id" +
                    " From Course_user cu" +
                    " Where cu.user_id=?"
                    + " AND cu.type=2";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			courselist.add(rs.getInt("course_id"));
    		}
    		return courselist;
    }
    public List<String> getPreferenceForUser(int userid)
    		throws SQLException{
    		List<String> preferencelist = new ArrayList<String>();
    		String queryCheck = "SELECT p.user_id, c.type" +
    	            " From Preference p, Category c" +
    	            " Where p.user_id=?"
    	            + " AND c.category_id=p.category_id";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			String preference = rs.getString("type");
    			preferencelist.add(preference);
    		}
    		return preferencelist;
    }
    public List<String> getQuestionTitleForUser(int userid)
    		throws SQLException{
    		List<String> questionlist = new ArrayList<String>();
    		String queryCheck = "SELECT q.user_asking_id, q.title" +
    	            " From Question q" +
    	            " Where q.user_asking_id=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			String question = rs.getString("title");
    			questionlist.add(question);
    		}
    		return questionlist;
    }
    public List<Integer> getQuestionIdForUser(int userid)
    		throws SQLException{
    		List<Integer> questionlist = new ArrayList<Integer>();
    		String queryCheck = "SELECT q.user_asking_id, q.question_id" +
    	            " From Question q" +
    	            " Where q.user_asking_id=?";
    		PreparedStatement ps = conn.prepareStatement(queryCheck);
    		ps.setInt(1, userid);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			questionlist.add(rs.getInt("question_id"));
    		}
    		return questionlist;
    }
}
