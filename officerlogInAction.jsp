<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcel", "root", "Ashutosh@8051");

        // Use prepared statement properly
        String sql = "SELECT * FROM officer WHERE username = ? AND password = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            session.setAttribute("username", username);
            response.sendRedirect("officerHome.jsp");
        } else {
            response.sendRedirect("officerLogIn.jsp?msg=invalid");
        }

        rs.close();
        pst.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace(); // For debugging
        response.sendRedirect("officerLogIn.jsp?msg=invalid");
    }
%>
