<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Logout</title>
  <style>
    :root {
      --primary-color: #4CAF50;
      --secondary-color: #f4f4f4;
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--secondary-color);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }

    .logout-message {
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }

    .logout-message h1 {
      color: var(--primary-color);
      font-size: 32px;
      margin-bottom: 20px;
    }

    .logout-message a {
      text-decoration: none;
      color: white;
      background-color: var(--primary-color);
      padding: 12px 24px;
      border-radius: 5px;
      font-size: 16px;
      transition: background-color 0.3s;
    }

    .logout-message a:hover {
      background-color: #388e3c;
    }
  </style>
</head>
<body>
  <div class="logout-message">
    <h1>You are Successfully Logged Out...</h1>
    
    <a href="customerLogIn.jsp">Go Back To Log In Page</a>
  </div>
</body>
</html>
