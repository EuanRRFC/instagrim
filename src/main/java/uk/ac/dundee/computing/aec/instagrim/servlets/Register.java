/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    Cluster cluster= null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String checkPassword=request.getParameter("password2");
        String email=request.getParameter("email");
        String fName=request.getParameter("fName");
        String sName=request.getParameter("sName");
        
            if (username.isEmpty() || password.isEmpty() || checkPassword.isEmpty() || email.isEmpty() || fName.isEmpty() || sName.isEmpty())
        {
            response.sendRedirect("register.jsp");
        }else{
                if (password.equals(checkPassword)){     // Check if passwords match or not
           
                    User us= new User();
                us.setCluster(cluster);
                boolean checkUN= us.RegisterUser(username, password, email, fName, sName);
                if (checkUN){
                    HttpSession session= request.getSession(); // Creates Http session to allow auto login
                    LoggedIn lg= new LoggedIn();
                    lg.setLogedin();
                    lg.setUsername(username);
                    lg.setFName(fName);
                    session.setAttribute("LoggedIn", lg);
                    response.sendRedirect("/Instagrim");
                }else{

                    response.sendRedirect("register.jsp");
                }
                }else{
                    System.out.println("Passwords didn't match");
                    response.sendRedirect("register.jsp");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
