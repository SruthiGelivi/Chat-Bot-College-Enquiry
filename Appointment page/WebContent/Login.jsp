<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat Bot</title>
<style>
input[type=text],input[type=password], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    width:800px; 
    margin:0 auto;
/*     padding: 250px;
 */}
 h1, label{
color:#0000e6;
}
.button {
   background-color: #0000e6; /* Green */
   border: none;
   color: white;
   padding: 24px 40px;
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
</style>
</head>

<body style = "background-image: url(imagee.jpg); background-repeat:no-repeat; background-size:cover ">


<h1><center>LOGIN HERE</center></h1>

<div>
  <form action="UserHome.jsp">
    
    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Your email id.." required= "true">

	<label for="pwd">Password</label>
    <input type="password" id="pwd" name="password" placeholder="Your Password.." required= "true">
    
    <input type="submit" value="LOGIN">
        <center>
<a href="http://127.0.0.1:50161/www/index.html#/firebase">Login As Admin</a>
</center>
  </form>
	
</div>

</body>
</html>