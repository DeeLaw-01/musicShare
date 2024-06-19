package com.example.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class JoinServlet extends HttpServlet {
    private static final String HOST = "localhost";
    private static final int PORT = 6000; // Same port as the HostServlet

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Join Music Stream</title>");
            out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css' integrity='sha512-Bs7vJ6o3IyWvEudjm9Jp7PaVJcyn3zZLgT5+xA34yjX/3k8VpWJlDpZM1SrJ5F4a1KD5v/Ej3FvgXGNTlL4iZA==' crossorigin='anonymous' referrerpolicy='no-referrer' />");
            out.println("<style>");
            out.println("body { font-family: 'Arial', sans-serif; background-color: #f0f0f0; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; }");
            out.println(".container { background-color: #fff; border-radius: 15px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); padding: 30px; width: 400px; text-align: center; animation: fadeIn 0.5s ease-out; }");
            out.println(".header { color: #333; margin-bottom: 20px; font-size: 24px; font-weight: bold; }");
            out.println(".audio-player { margin-top: 20px; }");
            out.println(".info { margin-top: 20px; text-align: left; }");
            out.println(".info p { margin: 5px 0; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<div class='header'>Listening to the Music Stream</div>");
            out.println("<div class='audio-player'>");
            out.println("<audio controls autoplay>");
            out.println("<source src='Stream' type='audio/mpeg'>");
            out.println("Your browser does not support the audio element.");
            out.println("</audio>");
            out.println("</div>");
            out.println("<div class='info'>");

            out.println("<p><i class='fas fa-music'></i> Now Playing:"+ request.getSession().getAttribute("songname") +"</p>");
            out.println("<p><i class='fas fa-user'></i> Artist: Artist Name</p>");
            out.println("</div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
