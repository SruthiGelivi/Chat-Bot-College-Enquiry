<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UMKC ChatBot</title>
<style>
.button {
   background-color: #0000e6; /* Green */
   border: none;
   color: white;
   padding: 8px 30px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   -webkit-transition-duration: 0.4s; /* Safari */
   transition-duration: 0.4s;
   cursor: pointer;
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
h1{
color:#0000e6;
}
.fit { /* set relative picture size */
   max-width: 100%;
   max-height: 100%;
 }
 .center {
   display: block;
   margin: auto;
 }

input{
       font-family: arial, sans-serif;
       padding: 4px 50px;
       color:#cc2900;
}

td, th {
/*     
   border: 1px solid #dddddd;
*/ text-align: left;
   padding: 4px;
   width: 33%;
   color: #cc2900;
}
p{
   color: #0000e6;
 }
</style>
</head>
<center>
<body class="center fit" style= "background-image: url(image.jpg); background-repeat:no-repeat; background-size:cover " >    
<h1> <center> UMKC Chatbot </center></h1>
</br>
<form action="emma.jsp">
<p> TO SELECT THE DESIRED DOCTOR SELECT THE DOCTOR'S NAME AND CLICK SUBMIT</p>
<table>
<tr>
  <th>DOCTORS : </th>
  <td><select name="docs">
  <option value="bob">Bob,Heart Surgeon</option>
  <option value="emma">Emma, Orthopaedic</option>
  <option value="james">James, DMD DDS</option>
  <option value="john">John, MD</option>
</select></td>
<td>    <input  type="submit" value="SUBMIT">
</td>
</tr>
</table>
</form>
<p> NEED AN ADVICE TO SELECT A DOCTOR! CLICK THE BUTTON BELOW</p>
<table>
<tr>
<td>

<!--  link http://localhost:8080/--> 
<center>
  <a href="http://localhost:8080"> <button id="myBtn" class="button button1">GET ADVICE</button></a>
</center>
</td>
</tr>
</table>
</body>
</center>
</html>