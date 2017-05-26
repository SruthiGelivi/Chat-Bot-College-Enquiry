<%@page import="com.pavan.chatbot.Utility.MySQLConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.ResultSet"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UMKC Chatbot</title>
<style>
/* The Modal (background) */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0,0,0); /* Fallback color */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
   background-color: #fefefe;
   margin: auto;
   padding: 20px;
   border: 1px solid #888;
   width: 80%;
}

/* The Close Button */
.close {
   color: #aaaaaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover,
.close:focus {
   color: #000;
   text-decoration: none;
   cursor: pointer;
}

.button {
   background-color: #0000e6; /* Green */
   border: none;
   color: white;
   padding: 12px 50px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   -webkit-transition-duration: 0.4s; /* Safari */
   transition-duration: 0.4s;
   cursor: pointer;
   align-: center;
}

.button1 {
   background-color: white; 
   color: #cc2900; 
   border: 2px solid #0000e6;
}

.button1:hover {
   background-color: #0000e6;
   color: white;
}


table {
   font-family: arial, sans-serif;
   border-collapse: collapse;
   width: 100%;
   color:red;
}
h1{
color:#0000e6;
}
td, th {
/*     border: 1px solid #dddddd;
*/    text-align: left;
   padding: 4px;
   width: 50%;
   color: #cc2900;
}
/* 
tr:nth-child(even) {
   background-color: #dddddd;
}
*/
.fit { /* set relative picture size */
   max-width: 100%;
   max-height: 100%;
 }
 .center {
   display: block;
   margin: auto;
 }
 
 p{
   font-family: arial, sans-serif;
      color: #cc2900;
  
 }
</style>
</head>

<body class="center fit" style= "background-image: url(image.jpg); background-repeat:no-repeat; background-size:cover " >    
<h1> <center> DOCTOR'S ADVICE </center></h1>
<h1>Doctor Information</h1>
<%
  Connection connection = null;
   Statement statement = null;
   ResultSet resultSet = null;
   String sql="select * from doctor_table where id=3";
   try{
	   connection = MySQLConnection.getConnection();
	   statement = connection.createStatement();
	   resultSet = statement.executeQuery(sql);
	   while (resultSet.next()) {
	 
	   
%>

<table>

 <tr>
   <th>DOCTOR NAME : </th>
   <td><%=resultSet.getString("doctor_name")%></td>
 </tr>
 <tr>
   <th>DEGREE : </th>
   <td><%=resultSet.getString("degree")%></td>
 <tr>
 </tr>
   <th>SPECIALIZATION : </th>
   <td><%=resultSet.getString("specialization")%></td>
 </tr>
 <tr>
   <th>FEE : </th>
   <td><%=resultSet.getInt("fee")%> $</td>
 </tr>
 </table>
 <h1>User Information</h1>
 <form method="post" action="DoctorsDisplay">
<table>

 <tr>
   <th>FIRST NAME : </th>
   <td> <input type="text" name="fname"> </td>
 </tr>
 <tr>
   <th>LAST NAME : </th>
   <td><input type="text" name="lname"></td>
 </tr>
 <tr>
   <th>AGE : </th>
   <td> <input type="text" name="age"> </td>
 </tr>
 <tr>
   <th>PHONE : </th>
   <td> <input type="text" name="phone"></td>
 </tr>
  <tr>
  <th>APPOINTMENT : </th>
  <td>
  <!-- <input type="date" id="demo"> -->
 <select>
  <option value="mon1">Mon 9 AM - 10 AM</option>
  <option value="mon2">Mon 10 AM - 11 AM</option>
  <option value="mon3">Mon 11 AM - 12 PM</option>
  <option value="mon4">Mon 12 PM - 1 PM</option>
  <option value="wed1">Wed 5 PM - 6 PM</option>
  <option value="wed2">Wed 6 PM - 7 PM</option>
</select> 
  <!-- <input type="radio" name="time1" value="time1" id="new"> time 1
  <input type="radio" name="time2" value="time2"> time 2
  <input type="radio" name="time3" value="time3"> time 3
  <input type="radio" name="time4" value="time4"> time 4 -->
 
 </td>
 </tr>
 </table>
 </form>
<center><button id="myBtn" class="button button1">BOOK NOW</button></center>
<div id="myModal" class="modal">

 <!-- Modal content -->
 <div class="modal-content">
   <span class="close">&times;</span>
   <p> YOUR APPOINTMENT HAS BEEN BOOKED</p>
 </div>

</div>
<%
}
   }catch (Exception e){
	   e.printStackTrace();
   }
%>

<script>

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
   modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
   modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
   if (event.target == modal) {
       modal.style.display = "none";
   }
}

function myFunction() {
	if(document.getElementById('demo').value=="04/17/2017"){
	   document.getElementById('new').disabled = true;
	}
}

</script>
</body>
</html>