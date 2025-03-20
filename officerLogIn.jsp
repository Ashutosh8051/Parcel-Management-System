<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="CSS/officerLogIn.css">
  <title>Officer Login</title>
</head>
<body>
  <div class="container">
    <h2>Login Form</h2>
    <form action="officerlogInAction.jsp" method="POST" id="loginForm">
      <label for="username">User Name:</label>
      <input type="text" id="username" name="username" minlength="5" maxlength="20" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" maxlength="30" required />

      <div class="buttons">
        <button type="submit">Login</button>
      </div>

    
      <div class="link">
        New user? <a href="officerRegister.html">Register here</a>
      </div>
    </form>
  </div>


 

</body>
</html>
