package users;

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

abstract public class User {
    protected String firstname;
    protected String lastname;
    protected String username;
    protected String password;
    protected String email;
    protected String imageURL;
    protected LocalDateTime enrollDate;
    protected List<Integer> QuestionInvolvedId = new ArrayList<Integer>();
    protected List<Integer> AnswerInvolvedId = new ArrayList<Integer>();
    protected int Id;
    protected int credibilityPoint;
    protected List<Integer> preference = new ArrayList<Integer>();
    /*
    public User(String username, int Id){
        this.username = username;
        this.Id = Id;
        this.enrollDate = LocalDateTime.now();
    }*/

    public String getFirstname(){ return this.firstname;}
    public void setFirstname(String firstname){
        this.firstname = firstname;
    }
    public String getLastname(){ return this.lastname;}
    public void setLastname(String lastname){
        this.lastname = lastname;
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
    public void setEnrollDate(LocalDateTime ldt){
        this.enrollDate = ldt;
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
    public void setId(int id){
        this.Id = id;
    }
    public int getCredibilityPoint(){
        return this.credibilityPoint;
    }
    public void setCredibilityPoint(int cp){
        this.credibilityPoint = cp;
    }
    public List<Integer> getPreference(){
        return this.preference;
    }
    abstract public String type();
}