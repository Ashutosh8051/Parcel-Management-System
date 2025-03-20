<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Registration Form</title>
  <link rel="stylesheet" href="CSS/customerRegister.css">
</head>
<body>
  <div class="container">
    <h2>Registration Form</h2>
    <form action="customerRegisterAction.jsp" method="POST" id="registrationForm" >
      <label for="name">Name:</label>
      <input type="text" id="name" maxlength="50" name="name" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>

      <label for="countryCode">Country Code:</label>
      <select id="countryCode" name="countrycode" required>
        <option value="">Select Code</option>
        <option value="+91">+91</option>
        <option value="+1">+1</option>
        <option value="+44">+44</option>
      </select>

      <label for="mobile">Mobile Number:</label>
      <input type="text" id="mobile" name="mobile" maxlength="10" required>

      <label for="country">Country:</label>
      <select id="country" name="country" required>
        <option value="">Select Country</option>
        <option value="India">India</option>
        <option value="USA">USA</option>
        <option value="UK">UK</option>
      </select>

      <label for="state">State:</label>
      <select id="state" name="state" required>
        <option value="">Select State</option>
        <option value="Maharashtra">Maharashtra</option>
        <option value="California">California</option>
        <option value="London">London</option>
      </select>

      <label for="city">City:</label>
      <input type="text" id="city" name="city" required>

      <label for="address">Address:</label>
      <textarea id="address" name="address" rows="3" required></textarea>

      <label for="zip">Zip Code:</label>
      <input type="number" id="zip" name="zip" maxlength="6" required>

      <label for="postal">Postal Code:</label>
      <input type="number" id="postal" name="postal" maxlength="6" required>

      <label for="username">User Name:</label>
      <input type="text" id="username" name="username" minlength="5" maxlength="20" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" maxlength="30" required>

      <label for="confirmPassword">Confirm Password:</label>
      <input type="password" id="confirmPassword" maxlength="30" required>

      <div class="checkbox-group">
        <input type="checkbox" id="preferences" name="preference">
        <label for="preferences"><b>Would you like to receive mail delivery SMS Notification?</b></label>
      </div>

      <div class="buttons">
        <button type="submit">Register</button>
        <button type="reset">Reset</button>
      </div>
      <div class="link">
        <a href="#">Forgot Password?</a>
      </div>
      <div class="link">
        Already Registered ? <a href="customerLogIn.html">LogIn</a>
      </div>
    </form>
  </div>
	 <script src="JS/customerRegister.js"></script>

  
</body>
</html>
