package users;

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

abstract public class User {
    private String username;
    private String password;
    private String email;
    private String imageURL;
    private LocalDateTime enrollDate;
    private List<Integer> QuestionInvolvedId = new ArrayList<Integer>();
    private List<Integer> AnswerInvolvedId = new ArrayList<Integer>();
    private int Id;
    private int credibilityPoint;
    private List<String> preference = new ArrayList<String>();

    public User(String username, int Id){
        this.username = username;
        this.Id = Id;
        this.enrollDate = LocalDateTime.now();
    }
    public String getUsername(){
        return this.username;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getPassword(){
        return this.password;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public String getEmail(){
        return this.email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public String getImageURL(){
        return this.imageURL;
    }
    public void setImageURL(String url){
        this.imageURL = url;
    }
    public LocalDateTime getEnrollDate(){
        return this.enrollDate;
    }
    public List<Integer> getQuestionInvolvedId() {
        return this.QuestionInvolvedId;
    }
    public void setQuestionInvolvedId(List<Integer> questionlist){
        this.QuestionInvolvedId = questionlist;
    }
    public void addQuestion(int newquestion){
        this.QuestionInvolvedId.add(newquestion);
    }
    public List<Integer> getAnswerInvolvedId(){
        return this.AnswerInvolvedId;
    }
    public void setAnswerInvolvedId(List<Integer> answerlist){
        this.AnswerInvolvedId = answerlist;
    }
    public void addAnswer(int newanswer){
        this.AnswerInvolvedId.add(newanswer);
    }
    public int getId(){
        return this.Id;
    }
    public int getCredibilityPoint(){
        return this.credibilityPoint;
    }
    public void setCredibilityPoint(int cp){
        this.credibilityPoint = cp;
    }
    public List<String> getPreference(){
        return this.preference;
    }
    abstract public String type();
}

