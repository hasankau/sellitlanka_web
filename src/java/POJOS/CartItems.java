package POJOS;
// Generated Dec 22, 2016 8:20:52 PM by Hibernate Tools 4.3.1



/**
 * CartItems generated by hbm2java
 */
public class CartItems  implements java.io.Serializable {


     private Integer id;
     private AdType adType;
     private Cart cart;
     private Double qty;
     private Double subTotal;

    public CartItems() {
    }

	
    public CartItems(AdType adType, Cart cart) {
        this.adType = adType;
        this.cart = cart;
    }
    public CartItems(AdType adType, Cart cart, Double qty, Double subTotal) {
       this.adType = adType;
       this.cart = cart;
       this.qty = qty;
       this.subTotal = subTotal;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public AdType getAdType() {
        return this.adType;
    }
    
    public void setAdType(AdType adType) {
        this.adType = adType;
    }
    public Cart getCart() {
        return this.cart;
    }
    
    public void setCart(Cart cart) {
        this.cart = cart;
    }
    public Double getQty() {
        return this.qty;
    }
    
    public void setQty(Double qty) {
        this.qty = qty;
    }
    public Double getSubTotal() {
        return this.subTotal;
    }
    
    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }




}


