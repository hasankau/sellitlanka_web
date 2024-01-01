/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class SendMail {
    String fromE,toE,pwE,subE,mesE;
    public void sendMail2( String toEmail, String url) throws Exception {
        System.out.println("OK1");
        fromE = "workosell@gmail.com";
        toE = toEmail;
        pwE = "worko123";
        subE = "Email Verification";
        mesE = url;

       // Properties props = new Properties();
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", 587);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", fromE);
        properties.put("mail.password", pwE);


        System.out.println("ok2");
        
        Session session = Session.getDefaultInstance(properties,
                new javax.mail.Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromE, pwE);
                    }
                });
        System.out.println("ok3");

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(fromE));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(toE));
            message.setSubject(subE);
            message.setText(mesE);

            System.out.println("ok4");

            Transport.send(message);

            
            System.out.println("ok over");
        } catch (MessagingException e) {
            e.printStackTrace();
            //throw new RuntimeException(e);
        }


    }
    
}
