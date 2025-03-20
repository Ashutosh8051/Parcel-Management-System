<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Parcel Booking Form</title>
 <style>
    :root {
      --primary-color: #4CAF50;
      --secondary-color: #f4f4f4;
    }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--secondary-color);
      margin: 0;
      padding: 20px;
    }
    .booking-wrapper {
      max-width: 1000px;
      margin: auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    .booking-wrapper h1 {
      text-align: center;
      color: var(--primary-color);
      margin-bottom: 30px;
    }
    form {
      width: 100%;
    }
    h2 {
      color: var(--primary-color);
      margin-top: 20px;
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
    .form-section {
      margin-bottom: 30px;
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
      appearance: none;
      width: 18px;
      height: 18px;
      border: 2px solid var(--primary-color);
      border-radius: 5px;
      margin-right: 10px;
      position: relative;
      cursor: pointer;
    }
    .checkbox-group input[type="checkbox"]:checked::after {
      content: '\2714';
      position: absolute;
      top: -4px;
      left: 3px;
      font-size: 22px;
      color: var(--primary-color);
    }
    .checkbox-group label {
      margin: 0;
      font-weight: normal;
      margin-top: -20px;
    }
  </style>

</head>
<body>

<%
  String name = "", address = "", city = "", state = "", country = "", postalcode = "", zipcode = "";
  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel", "root", "Ashutosh@8051");
      String username = (String) session.getAttribute("username");

      String sql = "SELECT name, address, city, state, country, postalcode, zipcode FROM customer_register WHERE username = ?";
      PreparedStatement pst = con.prepareStatement(sql);
      pst.setString(1, username);
      ResultSet rs = pst.executeQuery();

      if (rs.next()) {
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
  <form method="post" action="ParcelBookingServiceAction.jsp">

    <h2>Sender Information</h2>
    <div class="form-section">
      <label>Name</label>
      <input type="text" value="<%= name %>" readonly>
      <label>Address</label>
      <textarea readonly><%= address %></textarea>
      <label>City</label>
      <input type="text" value="<%= city %>" readonly>
      <label>State</label>
      <input type="text" value="<%= state %>" readonly>
      <label>Country</label>
      <input type="text" value="<%= country %>" readonly>
      <label>Postal Code</label>
      <input type="text" value="<%= postalcode %>" readonly>
      <label>Zip Code</label>
      <input type="text" value="<%= zipcode %>" readonly>
    </div>

    <h2>Receiver Information</h2>
    <div class="form-section">
      <label>Name</label>
      <input type="text" required name="r_name">
      <label>Address</label>
      <textarea required name="r_address"></textarea>
      <div class="form-group">
        <div>
          <label>City</label>
          <select required name="r_city">
            <option value="">Select City</option>
            <option>City A</option>
            <option>City B</option>
          </select>
        </div>
        <div>
          <label>State</label>
          <select required name="r_state">
            <option value="">Select State</option>
            <option>State A</option>
            <option>State B</option>
          </select>
        </div>
      </div>
      <label>Country</label>
      <input type="text" name="r_country" required>
      <label>Postal Code</label>
      <input type="text" name="r_postalcode" maxlength="6" required>
      <label>Zip Code</label>
      <input type="text" name="r_zipcode" maxlength="6" required>
      <label>Country Code</label>
      <select required name="r_countrycode">
        <option value="">Select Code</option>
        <option>+91</option>
        <option>+1</option>
      </select>
      <label>Mobile Number</label>
      <input type="text" name="r_mobilenumber" maxlength="10" required>
    </div>

    <h2>Parcel Details</h2>
    <div class="form-section">
      <label>Size</label>
      <input type="text" name="p_size" required>
      <label>Weight</label>
      <input type="text" name="p_weight" required>
      <label>Description</label>
      <textarea required name="p_description"></textarea>
    </div>

    <h2>Shipping Options</h2>
    <div class="form-section">
      <label>Choose Delivery Speed</label>
      <select name="p_delivery_speed" required>
        <option>Standard</option>
        <option>Express</option>
        <option>Next Day</option>
      </select>
      <label>Select Packaging Preference</label>
      <select name="p_packaging" required>
        <option>Standard Packaging</option>
        <option>Custom Packaging</option>
        <option>Eco-Friendly Packaging</option>
        <option>Fragile Item Handling</option>
      </select>
    </div>

    <h2>Date and Time</h2>
    <div class="form-section">
      <label>Choose Pickup Date</label>
      <input type="date" name="p_date" required>
      <label>Choose Pickup Time</label>
      <input type="time" name="p_time" required>
    </div>

    <h2>Service Cost and Payment</h2>
    <div class="form-section">
      <label>Estimated Cost</label>
      <input type="text" name="p_cost" value="$50.00" readonly>
      <label>Payment Method</label>
      <select name="p_payment" required>
        <option>Credit Card</option>
        <option>Debit Card</option>
        <option>UPI</option>
        <option>Cash on Pickup</option>
      </select>
    </div>

    <h2>Additional Services</h2>
    <div class="form-section">
      <div class="checkbox-group">
        <input type="checkbox" name="insurance" id="insurance">
        <label for="insurance">Insurance Service</label>
      </div>
      <div class="checkbox-group">
        <input type="checkbox" name="tracking" id="tracking">
        <label for="tracking">Tracking Service</label>
      </div>
    </div>

    <button type="submit">Proceed to Payment</button>
  </form>
</div>
</body>
</html>
