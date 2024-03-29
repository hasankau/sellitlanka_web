package POJOS;
// Generated Dec 22, 2016 8:20:52 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * AdReview generated by hbm2java
 */
public class AdReview  implements java.io.Serializable {


     private Integer id;
     private Advert advert;
     private User user;
     private Date date;
     private Boolean status;

    public AdReview() {
    }

	
    public AdReview(Advert advert, User user) {
        this.advert = advert;
        this.user = user;
    }
    public AdReview(Advert advert, User user, Date date, Boolean status) {
       this.advert = advert;
       this.user = user;
       this.date = date;
       this.status = status;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Advert getAdvert() {
        return this.advert;
    }
    
    public void setAdvert(Advert advert) {
        this.advert = advert;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
    public Boolean getStatus() {
        return this.status;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }




}


