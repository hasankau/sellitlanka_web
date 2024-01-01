package POJOS;
// Generated Dec 22, 2016 8:20:52 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * LoginSession generated by hbm2java
 */
public class LoginSession  implements java.io.Serializable {


     private Integer id;
     private User user;
     private Date loginTime;
     private Date logoutTime;

    public LoginSession() {
    }

	
    public LoginSession(User user) {
        this.user = user;
    }
    public LoginSession(User user, Date loginTime, Date logoutTime) {
       this.user = user;
       this.loginTime = loginTime;
       this.logoutTime = logoutTime;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Date getLoginTime() {
        return this.loginTime;
    }
    
    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }
    public Date getLogoutTime() {
        return this.logoutTime;
    }
    
    public void setLogoutTime(Date logoutTime) {
        this.logoutTime = logoutTime;
    }




}


