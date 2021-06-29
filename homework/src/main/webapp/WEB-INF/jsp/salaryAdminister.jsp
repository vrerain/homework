<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>工资管理</title>
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
        #content #title{
            display: block;
            width: 150px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            font-size: 26px;
            margin-top: 75px;
            margin-left: 15px;
            font-weight: bold;
        }
        #lists {
            display:block;
            width:1000px;
            margin-left: 40px;
            margin-top: 35px;
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
    </div>
    <div id="sidebar">
        <sapn>
            <h1>导航</h1>
        </sapn>
        <span><a href="index" style="color:white;text-decoration:none;">首页</a></span>
        <span><a href="staffAdminister" style="color:white;text-decoration:none;">人事管理</a></span>
        <span><a href="attendanceCount" style="color:white;text-decoration:none;">考勤统计</a></span>
        <span style="background-color: #277de6">工资管理</span>
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
        <span><a id="choice1" href="salaryAdminister" class="p" style="color:grey;text-decoration:none;background-color: rgb(222 232 244)">计薪规则</a></span>
        <span><a id="choice2" href="javascript:void(0);" onclick="hide_table1()" class="p" style="color:grey;text-decoration:none;">工资明细</a></span>
        <span><a id="choice3" href="javascript:void(0);" onclick="hide_table2()" class="p" style="color:grey;text-decoration:none;">月工资单</a></span>
        
        <span id="title">工资管理</span>
        <div id="lists1" style="width:1000px;margin-left: 40px;margin-top: 35px;display:none"><table id="list1" style="width:1000px"></table></div>
        <div id="lists2" style="width:1000px;margin-left: 40px;margin-top: 35px;display:none"><table id="list2" style="width:1000px"></table></div>
        <div id="salary_col" class="salary">工资=∑区域i工作时长*区域i工作单价</div>
        <div id="table">
        <table class="table_p">
        <tr>
            <th class="th_p">工作区域</th>
            <th class="th_p">工资单价(/小时)</th>
        </tr>
        <tr>
            <td class="td_p">区域1</td>
            <td class="td_p">100</td>
        </tr>
        <tr>
            <td class="td_p">区域2</td>
            <td class="td_p">120</td>
        </tr>
          <tr>
            <td class="td_p">区域3</td>
            <td class="td_p">150</td>
        </tr>
      </table>
      </div>
      <div id="tb1">
            员工ID：<input id="s11" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
            月份：<input id="s12" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
            <button id="res1">重置</button>
            <button id="sss1">搜索</button>
      </div>
      <div id="tb2">
        员工ID：<input id="s21" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
        月份：<input id="s22" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
        <button id="res2">重置</button>
        <button id="sss2">搜索</button>
        </div>
    </div>
    <script type="text/javascript">
//界面隐藏
    function hide_table1(){
    	document.getElementById("choice1").style.backgroundColor="";
    	document.getElementById("choice2").style.backgroundColor="rgb(222 232 244)";
    	document.getElementById("choice3").style.backgroundColor="";
        document.getElementById("salary_col").style.display="none";
        document.getElementById("table").style.display="none";
        document.getElementById("lists2").style.display="none";
        document.getElementById("lists1").style.display="";
    }
    function hide_table2(){
    	document.getElementById("choice1").style.backgroundColor="";
        document.getElementById("choice2").style.backgroundColor="";
        document.getElementById("choice3").style.backgroundColor="rgb(222 232 244)";
        document.getElementById("salary_col").style.display="none";
        document.getElementById("table").style.display="none";
        document.getElementById("lists1").style.display="none";
        document.getElementById("lists2").style.display="";
    }
//     搜索按钮
    $("#sss1").click(function(){
        var s1 = $("#s11").val();
        var s2 = $("#s12").val();
        search1(s1,s2);
    });
    $("#sss2").click(function(){
        var s1 = $("#s21").val();
        var s2 = $("#s22").val();
        search2(s1,s2);
    });
//     重置按钮
    $("#res1").click(function(){
        $("#s11").textbox('reset');
        $("#s21").textbox('reset');
    });
    $("#res2").click(function(){
        $("#s21").textbox('reset');
        $("#s22").textbox('reset');
    });
  
//   实现按照number和month条件搜索功能
    function search1(number,month) {
        $(function f1(){
            $("#list1").datagrid({
                url:"salaryConditionalSearch",
                queryParams:{number:number,month:month},
                columns:[[
                    {
                        field:"id",
                        title:"ID",
                        width:100,
                        checkbox:true
                    },
                    {
                        field:"number",
                        title:"员工ID",
                        width:160
                    },
                    {
                        field:"area1",
                        title:"区域1工资(元)",
                        width:200
                    },
                    {
                        field:"area2",
                        title:"区域2工资(元)",
                        width:200
                    },
                    {
                        field:"area3",
                        title:"区域3工资(元)",
                        width:200
                    },
                    {
                        field:"areaSum",
                        title:"总工资(元)",
                        width:200
                    }
                ]],
                pagination:true,
                toolbar:"#tb1",
                //单击行不选中
                onClickRow: function (rowIndex, rowData) {
                    $(this).datagrid('unselectRow', rowIndex);
                },
            });
        });
    }
    $(function f1() {
        $("#list1").datagrid({
            //url:后台数据查询的地址
            url: "/salaryInformation",
            //columns：填充的列数据
            //field:后台对象的属性
            //tille:列标题
            columns:[[
                    {
                        field:"id",
                        title:"ID",
                        width:100,
                        checkbox:true
                    },
                    {
                        field:"number",
                        title:"员工ID",
                        width:160
                    },
                    {
                        field:"area1",
                        title:"区域1工资",
                        width:200
                    },
                    {
                        field:"area2",
                        title:"区域2工资",
                        width:200
                    },
                    {
                        field:"area3",
                        title:"区域3工资",
                        width:200
                    },
                    {
                        field:"areaSum",
                        title:"总工资",
                        width:200
                    }
                ]],
            pagination:true,
            toolbar:"#tb1",
            //单击行不选中
            onClickRow: function (rowIndex, rowData) {
                $(this).datagrid('unselectRow', rowIndex);
            },
        });
    })
    function search2(number,month) {
        $(function f2(){
            $("#list2").datagrid({
                url:"salarySearch",
                queryParams:{number:number,month:month},
                columns:[[
                    {
                        field:"id",
                        title:"ID",
                        width:100,
                        checkbox:true
                    },
                    {
                        field:"number",
                        title:"员工ID",
                        width:300
                    },
                    {
                        field:"hours",
                        title:"小时",
                        width:300
                    },
                    {
                        field:"areaSum",
                        title:"总工资",
                        width:300
                    }
                ]],
                pagination:true,
                toolbar:"#tb2",
                //单击行不选中
                onClickRow: function (rowIndex, rowData) {
                    $(this).datagrid('unselectRow', rowIndex);
                },
            });
        });
    }
    $(function f2() {
        $("#list2").datagrid({
            //url:后台数据查询的地址
            url: "/salaryInformation",
            //columns：填充的列数据
            //field:后台对象的属性
            //tille:列标题
            columns:[[
                    {
                        field:"id",
                        title:"ID",
                        width:100,
                        checkbox:true
                    },
                    {
                        field:"number",
                        title:"员工ID",
                        width:300
                    },
                    {
                        field:"hours",
                        title:"小时",
                        width:300
                    },
                    {
                        field:"areaSum",
                        title:"总工资",
                        width:300
                    }
                ]],
            pagination:true,
            toolbar:"#tb2",
            //单击行不选中
            onClickRow: function (rowIndex, rowData) {
                $(this).datagrid('unselectRow', rowIndex);
            },
        });
    })
    </script>
</body>
</html>