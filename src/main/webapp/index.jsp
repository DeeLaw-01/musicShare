<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Music Player Home</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            width: 80%;
            max-width: 600px;
            animation: fadeIn 0.5s ease-out;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        p {
            color: #555;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .button-container {
            margin-top: 30px;
        }

        .button-container a {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 15px 30px;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button-container a:hover {
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
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Music Player</h1>
    <p>Your one-stop solution for enjoying your favorite tunes. Our sleek and modern player will give you the best music experience. Get started by exploring our player.</p>
    <div class="button-container">
        <a href="login.jsp">Login</a>
    </div>
</div>
</body>
</html>
