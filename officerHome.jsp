<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome Officer Dashboard</title>
  <link rel="stylesheet" href="CSS/officerHome.css">
</head>
<body>
  <nav class="navbar">
    <div class="nav-links">
      <a href="officerHome.jsp">Home</a>
      <a href="#">Tracking</a>
      <a href="#">Delivery Status</a>
      <a href="#">Pickup Scheduling</a>
      <a href="#">Previous Booking</a>

      <a href="officerLogout.jsp">Logout</a>
    </div>
  </nav>

  <div class="welcome">
  Welcome <span style="color: var(--primary-color);" class="username">
    <%= session.getAttribute("username") %>
  </span>
</div>
  <div class="description">
    <marquee behavior="" direction="">
    Easily manage your parcels with our convenient dashboard. Book, track, and view your past bookings all in one place. Stay connected with our dedicated support for any of your delivery needs.
</marquee>
</div>
</body>
</html>