package com.example.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/HandlePlayer")
public class HandlePlayer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "play":
                System.out.println("Play action triggered");
                break;
            case "pause":
                System.out.println("Pause action triggered");
                break;
            case "stop":
                System.out.println("Stop action triggered");
                break;
            case "broadcast":
                System.out.println("Broadcast action triggered");
                break;
            case "back":
                System.out.println("Back action triggered");
                response.sendRedirect("hostServer.jsp");
                break;


        }
        response.sendRedirect("player.jsp");
    }
}
