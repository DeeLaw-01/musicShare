package com.example.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class StreamServlet extends HttpServlet {
    private static final String HOST = "localhost";
    private static final int PORT = 6000; // Same port as the HostServlet

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("audio/mpeg");

        try (Socket socket = new Socket(HOST, PORT);
             InputStream inputStream = socket.getInputStream();
             OutputStream outputStream = response.getOutputStream()) {

            byte[] buffer = new byte[1024];

            int bytesRead;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
                outputStream.flush();
            }
        } catch (IOException e) {
            throw new ServletException("Error connecting to host", e);
        }
    }
}
