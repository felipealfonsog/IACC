<%@page language="java" contentType="text/html;
charset=UTF-8"%>
// developed by Felipe Alfonso GOnzalez
// f.alfonso@res-ear.ch 
<%request.getSession().invalidate();%>
// go to home page
<%response.sendRedirect("pages/home.jsp");%>