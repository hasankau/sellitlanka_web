package POJOS;
// Generated Dec 22, 2016 8:20:52 PM by Hibernate Tools 4.3.1



/**
 * Page generated by hbm2java
 */
public class Page  implements java.io.Serializable {


     private Integer id;
     private MainCatagory mainCatagory;
     private User user;
     private String title;
     private String description;
     private String email;
     private String contactPerson;
     private Integer tel;
     private String address;
     private String city;
     private String openTime;
     private String closingTime;

    public Page() {
    }

	
    public Page(MainCatagory mainCatagory, User user) {
        this.mainCatagory = mainCatagory;
        this.user = user;
    }
    public Page(MainCatagory mainCatagory, User user, String title, String description, String email, String contactPerson, Integer tel, String address, String city, String openTime, String closingTime) {
       this.mainCatagory = mainCatagory;
       this.user = user;
       this.title = title;
       this.description = description;
       this.email = email;
       this.contactPerson = contactPerson;
       this.tel = tel;
       this.address = address;
       this.city = city;
       this.openTime = openTime;
       this.closingTime = closingTime;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public MainCatagory getMainCatagory() {
        return this.mainCatagory;
    }
    
    public void setMainCatagory(MainCatagory mainCatagory) {
        this.mainCatagory = mainCatagory;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getContactPerson() {
        return this.contactPerson;
    }
    
    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }
    public Integer getTel() {
        return this.tel;
    }
    
    public void setTel(Integer tel) {
        this.tel = tel;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    public String getOpenTime() {
        return this.openTime;
    }
    
    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }
    public String getClosingTime() {
        return this.closingTime;
    }
    
    public void setClosingTime(String closingTime) {
        this.closingTime = closingTime;
    }




}

