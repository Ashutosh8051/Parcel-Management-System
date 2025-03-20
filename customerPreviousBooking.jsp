<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Booked Parcels</title>
  <style>
    :root {
      --primary-color: #4CAF50;
      --secondary-color: #f4f4f4;
    }
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--secondary-color);
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
    }
    .container {
      padding: 30px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }
    th {
      background-color: var(--primary-color);
      color: white;
    }
  </style>
</head>
<body>
  <div class="navbar">
    <div class="nav-links">
      <a href="customerHome.jsp">Home</a>
      <a href="customerBookingService.jsp">Booking Services</a>
      <a href="#">Tracking</a>
      <a href="#">Previous Booking</a>
      <a href="contactSupport.jsp">Contact Support</a>
      <a href="customerLogout.jsp">Logout</a>
    </div>
    <div class="username">Welcome <%= session.getAttribute("username") %></div>
  </div>

  <div class="container">
    <h2 style="color: #388e3c;">Your Booked Parcels</h2>
    <table>
      <thead>
        <tr>
          <th>Customer ID</th>
          <th>Booking ID</th>
          <th>Booking Date</th>
          <th>Receiver Name</th>
          <th>Delivered Address</th>
          <th>Amount</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // or "com.mysql.cj.jdbc.Driver" for newer versions
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel", "root", "Ashutosh@8051");

            String sql = "SELECT cr.customer_id, pd.parcel_id, pd.date, r.name AS receiver_name, r.address, pd.cost, ps.status_description " +
                    "FROM customer_register cr " +
                    "JOIN parcel_details pd ON cr.customer_id = pd.customer_iddd " +
                    "JOIN receiver r ON cr.customer_id = r.customer_idd " +
                    "JOIN parcel_status ps ON cr.customer_id = ps.custdddd_id " +
                    "WHERE cr.username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
%>
        <tr>
          <td><%= rs.getInt("customer_id") %></td>
          <td><%= rs.getInt("parcel_id") %></td>
          <td><%= rs.getString("date") %></td>
          <td><%= rs.getString("receiver_name") %></td>
          <td><%= rs.getString("Address") %></td>
          <td> &#8377; &nbsp;<%= rs.getString("cost") %></td>
          <td><%= rs.getString("status_description")%></td>
        </tr>
<%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    } else {
%>
        <tr><td colspan="7">Session expired. Please login again.</td></tr>
<%
    }
%>
      </tbody>
    </table>
  </div>
</body>
</html>
