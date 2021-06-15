<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人中心</title>
<%@ page import="com.gx.domain.*" %>
<%
User user = (User) request.getSession().getAttribute("user"); 
String name = user.getName();
%>

<!-- 导入easyui的资源文件 -->
        <script type="text/javascript" src="static/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="static/easyui/locale/easyui-lang-zh_CN.js"></script>
        <link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
        <link id="themeLink" rel="stylesheet" type="text/css" href="static/easyui/themes/default/easyui.css">
        <link rel="stylesheet" href="static/css/zTreeStyle/zTreeStyle.css">
        <script src="static/js/jquery.ztree.all.min.js"></script>

<style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        
        #sidebar {
            background-color: #000;
            float: left;
            display: block;
            width: 200px;
            height: 750px;
        }
        
        h1 {
            text-align: center;
            display: block;
            color: white;
            margin: 15px 0px;
        }
        
        #sidebar span {
            color: white;
            font-size: 18px;
            text-align: center;
            display: block;
            padding: 5px 0px;
            width: 100%;
            height: 40px;
            line-height: 35px;
        }
        
        #header {
            float: left;
            display: block;
            height: 40px;
            background-color: #277de6;
        }
        
        #header span {
            font-size: 18px;
            text-align: center;
            display: block;
            float: left;
            border: 1.5px solid grey;
            width: 210px;
            height: 37px;
            line-height: 37px;
        }
        
        #function:hover {
            background: #8f949a;
        }
        
        #content {
            float:left;
            display:block;
            width:1275px;
            height:710px;
        }
    </style>
</head>
<body>
    <div id="sidebar">
        <sapn>
            <h1>导航</h1>
        </sapn>
        <span><a href="index" style="color:white;text-decoration:none;">首页</a></span>
        <span><a href="staffAdminister" style="color:white;text-decoration:none;">人事管理</a></span>
        <span><a href="attendanceCount" style="color:white;text-decoration:none;">考勤统计</a></span>
        <span><a href="salaryAdminister" style="color:white;text-decoration:none;">工资管理</a></span>
        <span style="background-color: #277de6">个人中心</span>
    </div>
    <div id="header">
        <span id="function">首页</span>
        <span id="function">人事管理</span>
        <span id="function">考勤统计</span>
        <span id="function">工资管理</span>
        <span id="function">个人中心</span>
        <span style="border-right: 0px;">欢迎您，<%=name %></span>
    </div>
    <div id="content">
        <!-- 从这里编写个人中心页面内容-->
    </div>
</body>
</html>