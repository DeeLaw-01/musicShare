package com.example.servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.websocket.Session;
import java.io.IOException;

public class handleLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.equals("admin") && password.equals("admin")) {
            HttpSession session = request.getSession();
            System.out.println("New Host Created Session ID: " + session.getId());
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            response.sendRedirect("hostServer.jsp");
        } else {
            System.out.println("New User Created Session ID: " + request.getSession().getId());
            response.sendRedirect("Join");
        }
    }

}
