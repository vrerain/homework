<%--
  explation: this is test java server page
  author: vrerain
  Date: 2021/5/19
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.gx.domain.Test" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Test> testData =  (List<Test>)request.getAttribute("allInf");
%>
<html>
<head>
    <title>角色管理</title>
</head>
<body>
<div>
    <% for (Test t : testData) { %>
    <span><%= t.getExplation() %></span><br>
    <% } %>
</div>

</body>
</html>
