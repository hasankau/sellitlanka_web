package POJOS;
// Generated Dec 22, 2016 8:20:52 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Interfaces generated by hbm2java
 */
public class Interfaces  implements java.io.Serializable {


     private int id;
     private String url;
     private Set<UserTypeHasInterfaces> userTypeHasInterfaceses = new HashSet<UserTypeHasInterfaces>(0);

    public Interfaces() {
    }

	
    public Interfaces(int id) {
        this.id = id;
    }
    public Interfaces(int id, String url, Set<UserTypeHasInterfaces> userTypeHasInterfaceses) {
       this.id = id;
       this.url = url;
       this.userTypeHasInterfaceses = userTypeHasInterfaceses;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    public Set<UserTypeHasInterfaces> getUserTypeHasInterfaceses() {
        return this.userTypeHasInterfaceses;
    }
    
    public void setUserTypeHasInterfaceses(Set<UserTypeHasInterfaces> userTypeHasInterfaceses) {
        this.userTypeHasInterfaceses = userTypeHasInterfaceses;
    }




}

