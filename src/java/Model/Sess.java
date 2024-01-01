/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import org.hibernate.Session;

/**
 *
 * @author User
 */
public class Sess {

    static Session s = null;

    public static Session getIntance() {
        if (s == null) {
            s = Control.NewHibernateUtil.getSessionFactory().openSession();

        }
        return s;
    }
}
