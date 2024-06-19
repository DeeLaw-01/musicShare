package com.example.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.*;
import java.net.*;
import java.nio.file.Paths;

@MultipartConfig
public class HostServlet extends HttpServlet {
    private ServerSocket serverSocket;
    private String filePath;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            serverSocket = new ServerSocket(6000);
            new Thread(this::acceptClients).start();
        } catch (IOException e) {
            throw new ServletException("Error initializing server socket", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle file upload
        Part filePart = request.getPart("audioFile");
        String fileName = getFileName(filePart);
        filePath = getServletContext().getRealPath("/WEB-INF/") + fileName;
        saveFile(filePart, filePath);

        // Isolate song name from filePath
        String songName = Paths.get(filePath).getFileName().toString();

        // Store song name in session
        HttpSession session = request.getSession();
        session.setAttribute("songName", songName);

        // Redirect to player page
        request.getSession().setAttribute("filePath", filePath);
        response.sendRedirect("player.jsp");
    }

    private void acceptClients() {
        while (true) {
            try {
                Socket clientSocket = serverSocket.accept();
                new Thread(new ClientHandler(clientSocket, filePath)).start();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private void saveFile(Part part, String filePath) throws IOException {
        InputStream fileContent = part.getInputStream();
        File file = new File(filePath);
        file.getParentFile().mkdirs();
        FileOutputStream outputStream = new FileOutputStream(file);
        byte[] buffer = new byte[1024];
        int bytesRead;

        while ((bytesRead = fileContent.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        fileContent.close();
        outputStream.close();
    }

    private class ClientHandler implements Runnable {
        private Socket clientSocket;
        private String filePath;

        public ClientHandler(Socket clientSocket, String filePath) {
            this.clientSocket = clientSocket;
            this.filePath = filePath;
        }

        public void run() {
            try {
                // Open input stream to read audio data from file
                FileInputStream fileInputStream = new FileInputStream(filePath);
                BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);

                // Open output stream to send data to client
                OutputStream outputStream = clientSocket.getOutputStream();
                byte[] buffer = new byte[1024];
                int bytesRead;

                // Stream audio data to client
                while ((bytesRead = bufferedInputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                    outputStream.flush();
                }

                // Close streams and socket
                bufferedInputStream.close();
                outputStream.close();
                clientSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
