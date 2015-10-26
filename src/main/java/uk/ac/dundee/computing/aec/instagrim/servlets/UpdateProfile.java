/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.ProfileAvatarBean;

/**
 *
 * @author Euan
 */
@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {
Cluster cluster= null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String email=request.getParameter("email");
        String fName=request.getParameter("fName");
        String sName=request.getParameter("sName");
        
            if (email.isEmpty() || fName.isEmpty() || sName.isEmpty())
        {
            response.sendRedirect("updateProfile.jsp");
        }else{
                           
                    User us= new User();
                    us.setCluster(cluster);
                    HttpSession session= request.getSession(); // Creates Http session to allow auto login
                    ProfileAvatarBean pab = (ProfileAvatarBean) session.getAttribute("ProfileAvatarBean");
                    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                    session.setAttribute("username", lg.getUsername());
                    String username = lg.getUsername();
                    pab = us.UpdateProfile(pab, username, fName, sName, email);
                    session.setAttribute("ProfileBean", pab);
                    response.sendRedirect("index.jsp");
            }
        }
    }
