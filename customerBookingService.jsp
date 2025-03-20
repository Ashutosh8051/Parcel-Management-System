<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Parcel Booking Form</title>
  <link rel="stylesheet" href="CSS/customerHome.css">
  <style>
    :root {
      --primary-color: #4CAF50;
      --secondary-color: #f4f4f4;
    }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--secondary-color);
      margin: 0;
    }
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: var(--primary-color);
      padding: 10px 20px;
      color: white;
      flex-wrap: wrap;
    }
    .nav-links {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }
    .nav-links a {
      color: white;
      text-decoration: none;
      padding: 10px 15px;
      border-radius: 5px;
      transition: background-color 0.3s;
    }
    .nav-links a:hover {
      background-color: #388e3c;
    }
    .username {
      font-weight: bold;
      margin-top: 10px;
      margin-left: -62px;
    }
    .container {
      padding: 30px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
        .container {
      padding: 30px;
    }
	.booking-wrapper {
      max-width: 1000px;
      margin: 30px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    h1, h2 {
      text-align: center;
      color: var(--primary-color);
    }
    form {
      width: 100%;
    }
    label {
      display: block;
      margin: 10px 0 5px;
    }
    input, select, textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    textarea {
      resize: vertical;
    }
    .form-group {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }
    .form-group > div {
      flex: 1;
      min-width: 200px;
    }
    button {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 12px 24px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      display: block;
      margin: 20px auto 0;
    }
    button:hover {
      background-color: #388e3c;
    }
    .checkbox-group {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }
    .checkbox-group input[type="checkbox"] {
      width: 23px;
      height: 23px;
      margin-right: 16px;
      margin-bottom: -7px;
      border-radius: 30px;
      cursor: pointer;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
  <div class="nav-links">
    <a href="customerHome.jsp">Home</a>
    <a href="customerBookingService.jsp">Booking Services</a>
    <a href="#">Tracking</a>
    <a href="customerPreviousBooking.jsp">Previous Booking</a>
    <a href="contactSupport.jsp">Contact Support</a>
    <a href="customerLogout.jsp">Logout</a>
  </div>
  <div class="username">Welcome <%= session.getAttribute("username") %></div>
</div>

<%
  String customer_id="", name = "", address = "", city = "", state = "", country = "", postalcode = "", zipcode = "";
  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel", "root", "Ashutosh@8051");
      String str1 = (String) session.getAttribute("username");

      String sql = "SELECT customer_id,name, address, city, state, country, postalcode, zipcode FROM customer_register WHERE username = ?";
      PreparedStatement pst = con.prepareStatement(sql);
      pst.setString(1, str1);
      ResultSet rs = pst.executeQuery();

      if (rs.next()) {
          customer_id = rs.getString("customer_id");
          name = rs.getString("name");
          address = rs.getString("address");
          city = rs.getString("city");
          state = rs.getString("state");
          country = rs.getString("country");
          postalcode = rs.getString("postalcode");
          zipcode = rs.getString("zipcode");
      }

      rs.close();
      pst.close();
      con.close();
  } catch (Exception e) {
      e.printStackTrace();
  }
%>

<div class="booking-wrapper">
  <h1>Booking Service</h1>
  <form method="post" action="customerBookingServiceAction.jsp">
    <h2>Sender Information</h2>
    <input type="hidden" name="customer_id" value="<%= customer_id %>">
    <label>Name</label>
    <input type="text" name="sname" value="<%= name %>" readonly>
    <label>Address</label>
    <textarea name="saddress" readonly><%= address %></textarea>
    <label>City</label>
    <input type="text" name="scity" value="<%= city %>" readonly>
    <label>State</label>
    <input type="text" name="sstate" value="<%= state %>" readonly>
    <label>Country</label>
    <input type="text" name="scountry" value="<%= country %>" readonly>
    <label>Postal Code</label>
    <input type="text" name="spostalcode" value="<%= postalcode %>" readonly>
    <label>Zip Code</label>
    <input type="text" name="szipcode" value="<%= zipcode %>" readonly>

    <h2>Receiver Information</h2>
    <label>Name</label>
    <input type="text" name="rname" required>
    <label>Address</label>
    <textarea name="raddress" required></textarea>
    <div class="form-group">
      <div>
        <label>City</label>
        <select name="rcity" required>
          <option value="">Select City</option>
          <option value="City A">City A</option>
          <option value="City B">City B</option>
        </select>
      </div>
      <div>
        <label>State</label>
        <select name="rstate" required>
          <option value="">Select State</option>
          <option value="State A">State A</option>
          <option value="State B">State B</option>
        </select>
      </div>
    </div>
    <label>Country</label>
    <input type="text" name="rcountry" required>
    <label>Postal Code</label>
    <input type="text" name="rpostalcode" maxlength="6" required>
    <label>Zip Code</label>
    <input type="text" name="rzipcode" maxlength="6" required>
    <label>Country Code</label>
    <select name="rcountrycode" required>
      <option value="">Select Code</option>
      <option value="+91">+91</option>
      <option value="+1">+1</option>
    </select>
    <label>Mobile Number</label>
    <input type="text" name="rmobilenumber" maxlength="10" pattern="[0-9]{10}" required>

    <h2>Parcel Details</h2>
    <label>Size (In CM)</label>
    <input type="text" id="size" name="size" required>
    <label>Weight (In Gram)</label>
    <input type="text" id="weight" name="weight" required>
    <label>Description</label>
    <textarea name="description" required></textarea>

    <h2>Shipping Options</h2>
    <label>Choose Delivery Speed</label>
    <select name="delivery_speed" required>
      <option value="Standard">Standard</option>
      <option value="Express">Express</option>
      <option value="Next Day">Next Day</option>
    </select>
    <label>Select Packaging Preference</label>
    <select name="packaging" required>
      <option value="Standard Packaging">Standard Packaging</option>
      <option value="Custom Packaging">Custom Packaging</option>
      <option value="Eco-Friendly Packaging">Eco-Friendly Packaging</option>
      <option value="Fragile Item Handling">Fragile Item Handling</option>
    </select>

    <h2>Date and Time</h2>
    <label>Choose Pickup Date</label>
    <input type="date" name="date" required>
    <label>Choose Pickup Time</label>
    <input type="time" name="time" required>

    <h2>Service Cost and Payment</h2>
    <label>Estimated Cost (In &#x20B9;)</label>
    <input type="text" name="cost" id="cost" readonly>
    <label>Payment Method</label>
    <select name="payment" required>
      <option value="Credit Card">Credit Card</option>
      <option value="Debit Card">Debit Card</option>
      <option value="UPI">UPI</option>
      <option value="Cash on Pickup">Cash on Pickup</option>
    </select>

    <h2>Additional Services</h2>
    <div class="checkbox-group">
      <input type="checkbox" id="insurance" name="insurance">
      <label for="insurance">Insurance Service</label>
    </div>
    <div class="checkbox-group">
      <input type="checkbox" id="tracking" name="tracking">
      <label for="tracking">Tracking Service</label>
    </div>

    <button type="submit">Proceed to Payment</button>
  </form>
</div>

<script>
  function calculateCost() {
    const size = parseFloat(document.getElementById('size').value);
    const weight = parseFloat(document.getElementById('weight').value);
    if (!isNaN(size) && !isNaN(weight)) {
      const cost = 0.5 * weight + 0.1 * size + 50;
      document.getElementById('cost').value = cost.toFixed(2);
    } else {
      document.getElementById('cost').value = '';
    }
  }

  document.getElementById('size').addEventListener('input', calculateCost);
  document.getElementById('weight').addEventListener('input', calculateCost);
</script>

</body>
</html>
