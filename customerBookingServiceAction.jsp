<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer RegisterAction</title>
</head>
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Parcel", "root", "Ashutosh@8051");

    // Receiver Info
    String customer_id = request.getParameter("customer_id");
    String r_name = request.getParameter("rname");
    String r_address = request.getParameter("raddress");
    String r_city = request.getParameter("rcity");
    String r_state = request.getParameter("rstate");
    String r_country = request.getParameter("rcountry");
    String r_postalcode = request.getParameter("rpostalcode");
    String r_zipcode = request.getParameter("rzipcode");
    String r_countrycode = request.getParameter("rcountrycode");
    String r_mob = request.getParameter("rmobilenumber");

    // Use PreparedStatement with placeholders
    String sql1 = "INSERT INTO receiver(name, address, city, state, country, postalcode, zipcode, countrycode, mobilenumber,customer_idd) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement pst = con.prepareStatement(sql1);
    pst.setString(1, r_name);
    pst.setString(2, r_address);
    pst.setString(3, r_city);
    pst.setString(4, r_state);
    pst.setString(5, r_country);
    pst.setString(6, r_postalcode);
    pst.setString(7, r_zipcode);
    pst.setString(8, r_countrycode);
    pst.setString(9, r_mob);
    pst.setInt(10, Integer.parseInt(customer_id));
    int i = pst.executeUpdate();

    // Parcel Info
    String size = request.getParameter("size");
    String weight = request.getParameter("weight");
    String description = request.getParameter("description");
    String delivery_speed = request.getParameter("delivery_speed");
    String packaging_preference = request.getParameter("packaging");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String cost = request.getParameter("cost");
    String payment_method = request.getParameter("payment");

    // Handle checkboxes safely
    String insurance_service = request.getParameter("insurance") != null ? "Yes" : "No";
    String tracking_service = request.getParameter("tracking") != null ? "Yes" : "No";

    String sql2 = "INSERT INTO parcel_details(size, weight, description, delivery_speed, packaging_preference, date, time, cost, payment_method, insurance_service, tracking_service,customer_iddd) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement pst1 = con.prepareStatement(sql2);
    pst1.setString(1, size);
    pst1.setString(2, weight);
    pst1.setString(3, description);
    pst1.setString(4, delivery_speed);
    pst1.setString(5, packaging_preference);
    pst1.setString(6, date);
    pst1.setString(7, time);
    pst1.setString(8, cost);
    pst1.setString(9, payment_method);
    pst1.setString(10, insurance_service);
    pst1.setString(11, tracking_service);
    pst1.setInt(12, Integer.parseInt(customer_id));
    int j = pst1.executeUpdate();

   	if(i>0 &&j>0){
   		response.sendRedirect("customerCheckout.jsp");
   	}
   	else{
   		response.sendRedirect("customerBookingService.jsp");
   	}

} catch (Exception e) {
	response.sendRedirect("customerBookingService.jsp");
}
%>
</body>
</html>
