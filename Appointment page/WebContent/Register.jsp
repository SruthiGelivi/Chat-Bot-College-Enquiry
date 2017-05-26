<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register here</title>
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
 h1{
color:#0000e6;
}
</style>
</head>
<body style = "background-image: url(imagee.jpg); background-repeat:no-repeat; background-size:cover ">


<center><h1>REGISTER HERE</h1></center>

<div>
  <form action="Login.jsp">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Your email id..">

	<label for="pwd">Password</label>
    <input type="password" id="pwd" name="password" placeholder="Your Password..">

    <label for="rpwd">Re-enter Password</label>
    <input type="password" id="rpwd" name="rpassword" placeholder="Repeat your Password..">
	    
    <input type="submit" value="REGISTER">
  </form>
</div>


</body>
</html>