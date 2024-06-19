<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Music Player</title>
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

        .player-container {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 350px;
            text-align: center;
            animation: fadeIn 0.5s ease-out;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: bold;
        }

        .player-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .player-controls form {
            display: inline;
        }

        .player-controls button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 20px;
            margin: 0 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .player-controls button:hover {
            background-color: #45a049;
        }

        .stop-button {
            background-color: #f44336;
        }

        .stop-button:hover {
            background-color: #e53935;
        }

        .card {
            background-color: #191414;
            border-radius: 15px;
            padding: 20px;
            margin-top: 20px;
            color: white;
            text-align: left;
        }

        .card .song-info {
            display: flex;
            align-items: center;
        }

        .card .song-info img {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            margin-right: 15px;
        }

        .card .song-info .song-details {
            flex: 1;
        }

        .card .song-info .song-details .song-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
        }

        .card .song-info .song-details .song-artist {
            font-size: 14px;
            color: #aaa;
            margin: 5px 0 0;
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

        .icon {
            fill: white;
            width: 24px;
            height: 24px;
        }


        /* Style for the "Host Another Song" button */
        .host-another-button {
            background-color: #191414;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            margin: 10px 0;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .host-another-button:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
<div class="player-container">
    <h1>You are Now Hosting:<br> <%= session.getAttribute("filePath") %></h1>
    <div class="player-controls">
        <form action="Handleplayer" method="post">
            <input type="hidden" name="action" value="play">
            <button type="submit" class="play-button">
                <svg class="icon" viewBox="0 0 24 24">
                    <polygon points="5,3 19,12 5,21"/>
                </svg>
            </button>
        </form>
        <form action="Handleplayer" method="post">
            <input type="hidden" name="action" value="pause">
            <button type="submit" class="pause-button">
                <svg class="icon" viewBox="0 0 24 24">
                    <rect x="5" y="3" width="4" height="18"/>
                    <rect x="15" y="3" width="4" height="18"/>
                </svg>
            </button>
        </form>
        <form action="Handleplayer" method="post">
            <input type="hidden" name="action" value="stop">
            <button type="submit" class="stop-button">
                <svg class="icon" viewBox="0 0 24 24">
                    <rect x="5" y="5" width="14" height="14"/>
                </svg>
            </button>
        </form>
        <form action="Handleplayer" method="post">
            <input type="hidden" name="action" value="broadcast">
            <button type="submit" class="broadcast-button">
                <svg class="icon" viewBox="0 0 24 24">
                    <path d="M12 3a9 9 0 00-9 9H1a11 11 0 0122 0h-2a9 9 0 00-9-9zm0 6a3 3 0 00-3 3H7a5 5 0 0110 0h-2a3 3 0 00-3-3zm-1 4h2v4h-2zm1-15a2 2 0 00-2 2h2a2 2 0 002-2h-2zm4 1a2 2 0 00-2 2h2a2 2 0 002-2h-2zm-8 0a2 2 0 00-2 2h2a2 2 0 002-2H8zm4 19a2 2 0 002 2v-2h-2v2zm-2 0a2 2 0 002 2v-2H8v2z"/>
                </svg>
            </button>
        </form>
    </div>
    <div class="card">
        <div class="song-info">
            <div class="song-details">
                <p class="song-title"><%= session.getAttribute("songName") %></p>
                <p class="song-artist">Artist Name</p>
            </div>
        </div>
    </div>
    <form action="hostServer.jsp" method="post">
        <input type="hidden" name="action" value="hostAnother">
        <button type="submit" class="host-another-button">Host Another Song</button>
</div>
</body>
</html>
