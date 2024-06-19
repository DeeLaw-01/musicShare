<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Host Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 90%;
            max-width: 500px;
            text-align: center;
            animation: fadeIn 0.5s ease-out;
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        p {
            color: #555555;
            margin-bottom: 20px;
        }

        .custom-file-upload {
            border: 2px solid #4CAF50;
            color: #4CAF50;
            background-color: transparent;
            border-radius: 25px;
            padding: 14px 28px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 16px;
            display: inline-block;
        }

        .custom-file-upload:hover {
            background-color: #4CAF50;
            color: #ffffff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media screen and (max-width: 480px) {
            .container {
                width: 95%;
            }
        }
    </style>
</head>
<body>
<div class="container">

    <h1>Welcome, <%= session.getAttribute("username") %> (Host)</h1>
    <p>Select an audio file to start hosting:</p>
    <label for="file-upload" class="custom-file-upload">
        <i class="fas fa-cloud-upload-alt"></i> Choose File
    </label>
    <form action="Host" method="post" enctype="multipart/form-data">
        <input id="file-upload" type="file" name="audioFile" accept=".mp3" required style="display: none;">
        <input type="submit" value="Start Hosting">
    </form>
</div>
</body>
</html>
