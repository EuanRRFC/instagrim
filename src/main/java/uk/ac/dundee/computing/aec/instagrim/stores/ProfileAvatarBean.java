/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Euan
 */
@WebServlet(name = "ProfileAvatar", urlPatterns = {"/ProfileAvatar"})
public class ProfileAvatarBean {
    private String fName= null;
    private String sName= null;
    private String email= null;
    private String profilePicID= null;
    
    public void ProfileAvatarBean(){
        
    }
    
    public void setFName(String fName)
    {
        this.fName= fName;
    }
    
    public void setSName(String sName)
    {
        this.sName= sName;
    }
    
    public void setEmail(String email)
    {
        this.email= email;
    }

    
    public void setAvatar(String profilePic)
    {
        this.profilePicID= profilePic;
    }
    
    public String getFName()
    {
        return fName;
    }
    
    public String getSName()
    {
        return sName;
    }
    
    public String getEmail()
    {
        return email;
    }
    
    public String getAvatar()
    {
        return this.profilePicID;
    }
}
