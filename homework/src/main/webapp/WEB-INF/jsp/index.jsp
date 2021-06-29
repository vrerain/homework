<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>首页</title>
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
        
        .p {
            font-size: 18px;
            text-align: center;
            display: block;
            float: left;
            border: 1.5px solid grey;
            width: 210px;
            height: 37px;
            line-height: 37px;
            margin-top: 10px;
        }
        .p:active{
           background-color: #277de6; 
        }
        .table_p{
            font-size: 30px;
            width:850px;
            text-align:center;
            border-width:2px;
            border-style:solid;
            margin-top: 160px;
            margin-left: 250px;
            color:grey;
        }
        .th_p{
            height: 100px;
            border-width:3px;
            border-style:solid;
            max-width: 100px;
            color:grey;
        }
        .td_p{
            height: 80px;
            border-width:3px;
            border-style:solid;
            max-width: 100px;
            color:grey;
        }

        .salary{
            left:620px;
            position:absolute;
            top:130px;
            font-size:30px;
        }
    </style>
</head>
<body>
    <div id="sidebar">
        <sapn>
            <h1>导航</h1>
        </sapn>
        <span style="background-color: #277de6">首页</span>
        <span><a href="staffAdminister" style="color:white;text-decoration:none;">人事管理</a></span>
        <span><a href="attendanceCount" style="color:white;text-decoration:none;">考勤统计</a></span>
        <span><a href="salaryAdminister" style="color:white;text-decoration:none;">工资管理</a></span>
        <span><a href="personalCenter" style="color:white;text-decoration:none;">个人中心</a></span>
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
        <!-- 从这里编写主页内容-->
        <span><a id="choice1" href="javascript:void(0);" onclick="hide_table0()" class="p" style="color:grey;text-decoration:none;background-color: rgb(222 232 244)">考勤地图</a></span>
        <span><a id="choice2" href="javascript:void(0);" onclick="hide_table1()" class="p" style="color:grey;text-decoration:none;">实时考勤</a></span>
        
        <div id="dis1">
            <div style="display: block;text-align: center;line-height: 50px;font-size: 26px;margin-top: 75px;margin-bottom: 37px;font-weight: bold;">打卡机分布图</div>
            <div style="text-align:center"><img style="width:700px;height:400px" src="static/images/machine.jpg"></div>
        </div>
        <div id="lists1" style="width:1000px;margin-left: 40px;margin-top: 95px;"><table id="list1" style="width:1000px"></table></div>
        <div id="print" style="margin-top:20px;margin-left:40px;width: 50px;height: 25px;display:none"><button style="display:block;width:100%;height:100%"><a href="/simulateDownloadExcel" style="text-decoration: none;color:black">打印</a> </button></div>
    </div>
    
    <script type="text/javascript">
        function hide_table0(){
            document.getElementById("choice1").style.backgroundColor="rgb(222 232 244)";
            document.getElementById("choice2").style.backgroundColor="";
            document.getElementById("lists1").style.display="none";
            document.getElementById("print").style.display="none";
            document.getElementById("dis1").style.display="";
        }
        function hide_table1(){
            search1();
            document.getElementById("choice1").style.backgroundColor="";
            document.getElementById("choice2").style.backgroundColor="rgb(222 232 244)";
            document.getElementById("lists1").style.display="block";
            document.getElementById("dis1").style.display="none";
            document.getElementById("print").style.display="";
        }
        
        //   实现按照number和month条件搜索功能
        function search1() {
            $(function f1(){
                $("#list1").datagrid({
                    //url:后台数据查询的地址
                    url: "/simulateInformation",
                    //columns：填充的列数据
                    //field:后台对象的属性
                    //tille:列标题
                    columns:[[
                            {
                                field:"number",
                                title:"员工ID",
                                width:120
                            },
                            {
                                field:"name",
                                title:"员工姓名",
                                width:120
                            },
                            {
                                field:"machineID",
                                title:"打卡机编号",
                                width:80
                            },
                            {
                                field:"attendanceDate",
                                title:"打卡日期",
                                width:110
                            },
                            {
                                field:"startTime",
                                title:"签到时间",
                                width:110
                            },
                            {
                                field:"endTime",
                                title:"签退时间",
                                width:110
                            },
                            {
                                field:"areaID",
                                title:"工作区域号",
                                width:100
                            },
                            {
                                field:"minutes",
                                title:"单次时长(分)",
                                width:100
                            }
                        ]],
                    pagination:true,
                    //单击行不选中
                    onClickRow: function (rowIndex, rowData) {
                        $(this).datagrid('unselectRow', rowIndex);
                    },
                }); 
            });
        }

       </script>
</body>
</html>