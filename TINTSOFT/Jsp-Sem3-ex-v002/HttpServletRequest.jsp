<%@ page language="java" contentType="text/html;
charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;
charset=ISO-8859-1">
<title>Home de SimpleWeb</title>
</head>
<body>
 
<h1>Home de SimpleWeb</h1>
<p>Usuario: <%=request.getUserPrincipal().getName()%></p>
<% 
// pagina de entrada 
// developed by Felipe Alfonso GOnzalez
// f.alfonso@res-ear.ch 
if ( request.isUserInRole("ADMINISTRATOR"))
                {
%>
<p>Acceso a administración</p>
<% } %>
</body>
</html>


