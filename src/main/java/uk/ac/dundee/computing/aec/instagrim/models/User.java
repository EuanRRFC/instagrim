/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.RequestDispatcher;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Avatar;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
import uk.ac.dundee.computing.aec.instagrim.stores.ProfileAvatarBean;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public boolean RegisterUser(String username, String Password, String email, String fName, String sName){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps= session.prepare("select * from userprofiles where login =?");
        
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs= session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted())
        {
            //We are assuming this always works.  Also a transaction would be good here !
            ps= session.prepare("insert into userprofiles (login,password,email,first_name,last_name,profilePic) Values(?,?,?,?,?,?)");
            boundStatement = new BoundStatement(ps);
            session.execute( // this is where the query is executed
                    boundStatement.bind( // here you are binding the 'boundStatement'
                            username,EncodedPassword,email,fName,sName));
            //We are assuming this always works.  Also a transaction would be good here !

            return true;
        }else{
            return false;
        }
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("Username not recognised");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
        
   
    
    return false;  
    }
    
    public ProfileAvatarBean getProfile(ProfileAvatarBean pab, String user, Avatar av)
    {
        Session session= cluster.connect("instagrim");
        PreparedStatement ps= session.prepare("select * from userprofiles where login=?");
        ResultSet rs= null;
        ResultSet rs1= null;
        BoundStatement bs= new BoundStatement(ps);
        rs= session.execute(bs.bind(user));
        ps= session.prepare("select image,imagelength,type from pics where picid =?");
        bs= new BoundStatement(ps);
        for(Row row : rs){
            if(row.getUUID("profilepic")!= null){
                rs1= session.execute(bs.bind(row.getUUID("profilepic")));
            }
            pab.setFName(row.getString("first_name"));
            pab.setSName(row.getString("last_name"));
            pab.setEmail(row.getString("email"));
            if(rs1.isExhausted())
            {}
            else
            {
            for(Row row1 : rs1)
            {
                av.setPic(row1.getBytes("image"), row1.getInt("imageLength"), row1.getString("type"));
                av.setUUID(row.getUUID("profilepic"));
                pab.setAvatar(av);
                }
        }
    }
        return pab;
    }
    
    public boolean userExist(String username){
     return true;
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
// protected ProfileAvatarBean DisplayProfile(String username)
//    {
//        System.out.println("We're in display profile");
//        PicModel tm = new PicModel();
//        tm.setCluster(cluster);
//        java.util.LinkedList<Pic> lsPics = tm.getProfilePicsForUser(User);
//        RequestDispatcher rd = request.getRequestDispatcher("Instagrim/profile.jsp");
//        request.setAttribute("Pics", lsPics);
//        rd.forward(request, response);
//        
//        //select all from it & update strings.
//    }
    
}
