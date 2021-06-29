<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>考勤统计</title>

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
        
        #win hr {
            width: 300px;
            float: left;
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
        <span><a href="index" style="color:white;text-decoration:none;">首页</a></span>
        <span><a href="staffAdminister" style="color:white;text-decoration:none;">人事管理</a></span>
        <span style="background-color: #277de6">考勤统计</span>
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
        <span><a id="choice1" href="javascript:void(0);" onclick="hide_table0()" class="p" style="color:grey;text-decoration:none;background-color: rgb(222 232 244)">每周统计</a></span>
        <span><a id="choice2" href="javascript:void(0);" onclick="hide_table1()" class="p" style="color:grey;text-decoration:none;">每月统计</a></span>
        
        <span id="title">考勤统计</span>
        <div id="lists1" style="width:1000px;margin-left: 40px;margin-top: 35px;"><table id="list1" style="width:1000px"></table></div>
        <div id="lists2" style="width:1000px;margin-left: 40px;margin-top: 35px;display:none"><table id="list2" style="width:1000px"></table></div>
        
        <div id="tb1">
            员工ID：<input id="s11" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
            周数：<select id="s12" data-options="iconCls:'icon-search'" style="width:160px">
            <option value="1">第一周</option>
            <option value="2">第二周</option>
            <option value="3">第三周</option>
            <option value="4">第四周</option>
            <option value="5">第五周</option>
            <option value="6">第六周</option>
            <option value="7">第七周</option>
            <option value="8">第八周</option>
            <option value="9">第九周</option>
            <option value="10">第十周</option>
            <option value="11">第十一周</option>
            <option value="12">第十二周</option>
            <option value="13">第十三周</option>
            <option value="14">第十四周</option>
            <option value="15">第十五周</option>
            <option value="16">第十六周</option>
            <option value="17">第十七周</option>
            <option value="18">第十八周</option>
            </select>
            <button id="res1">重置</button>
            <button id="sss1">搜索</button>
        </div>
        <div id="tb2">
	        员工ID：<input id="s21" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
	        月份：<select id="s22" data-options="iconCls:'icon-search'" style="width:160px">
            <option value="1">一月</option>
            <option value="2">二月</option>
            <option value="3">三月</option>
            <option value="4">四月</option>
            <option value="5">五月</option>
            <option value="6">六月</option>
            <option value="7">七月</option>
            <option value="8">八月</option>
            <option value="9">九月</option>
            <option value="10">十月</option>
            <option value="11">十一月</option>
            <option value="12">十二月</option>
            </select>
	        <button id="res2">重置</button>
	        <button id="sss2">搜索</button>
        </div>
    </div>
    
    <script type="text/javascript">
	    function hide_table0(){
	    	search1('', '1');
	        document.getElementById("choice1").style.backgroundColor="rgb(222 232 244)";
	        document.getElementById("choice2").style.backgroundColor="";
	        document.getElementById("lists2").style.display="none";
	        document.getElementById("lists1").style.display="";
	    }
	    function hide_table1(){
	    	search2('','1');
	        document.getElementById("choice1").style.backgroundColor="";
	        document.getElementById("choice2").style.backgroundColor="rgb(222 232 244)";
	        document.getElementById("lists2").style.display="";
	        document.getElementById("lists1").style.display="none";
	    }
	    
//	     搜索按钮
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
//	     重置按钮
	    $("#res1").click(function(){
	        $("#s11").textbox('reset');
	        $("#s21").textbox('reset');
	    });
	    $("#res2").click(function(){
	        $("#s21").textbox('reset');
	        $("#s22").textbox('reset');
	    });
	    
	    $(function() {
	        $("#list1").datagrid({
	            //url:后台数据查询的地址
	            url: "/attendanceInformationByWeek",
	            queryParams:{number:'', week:'1'},
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
	                        field:"area1Hour",
	                        title:"区域1工作时长(分钟)",
	                        width:150
	                    },
	                    {
	                        field:"area2Hour",
	                        title:"区域2工作时长(分钟)",
	                        width:150
	                    },
	                    {
	                        field:"area3Hour",
	                        title:"区域3工作时长(分钟)",
	                        width:150
	                    },
	                    {
	                        field:"totalHour",
	                        title:"总时长(分钟)",
	                        width:80
	                    }
	                ]],
	            pagination:true,
	            toolbar:"#tb1",
	            //单击行不选中
	            onClickRow: function (rowIndex, rowData) {
	                $(this).datagrid('unselectRow', rowIndex);
	            },
	        });
	        
	        $("#list2").datagrid({
                //url:后台数据查询的地址
                url: "/attendanceInformationByMonth",
                queryParams:{number:'',month:'1'},
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
                            field:"area1Hour",
                            title:"区域1工作时长(分钟)",
                            width:150
                        },
                        {
                            field:"area2Hour",
                            title:"区域2工作时长(分钟)",
                            width:150
                        },
                        {
                            field:"area3Hour",
                            title:"区域3工作时长(分钟)",
                            width:150
                        },
                        {
                            field:"totalHour",
                            title:"总时长(分钟)",
                            width:80
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
	    
	    
	    //   实现按照number和month条件搜索功能
    function search1(number, week) {
        $(function f1(){
        	$("#list1").datagrid({
                //url:后台数据查询的地址
                url: "/attendanceInformationByWeek",
                queryParams:{number:number, week:week},
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
                            field:"area1Hour",
                            title:"区域1工作时长(分钟)",
                            width:150
                        },
                        {
                            field:"area2Hour",
                            title:"区域2工作时长(分钟)",
                            width:150
                        },
                        {
                            field:"area3Hour",
                            title:"区域3工作时长(分钟)",
                            width:150
                        },
                        {
                            field:"totalHour",
                            title:"总时长(分钟)",
                            width:80
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
	    
	//   实现按照number和month条件搜索功能
	    function search2(number, month) {
	        $(function f1(){
	        	$("#list2").datagrid({
	                //url:后台数据查询的地址
	                url: "/attendanceInformationByMonth",
	                queryParams:{number:number,month:month},
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
	                            field:"area1Hour",
	                            title:"区域1工作时长(分钟)",
	                            width:150
	                        },
	                        {
	                            field:"area2Hour",
	                            title:"区域2工作时长(分钟)",
	                            width:150
	                        },
	                        {
	                            field:"area3Hour",
	                            title:"区域3工作时长(分钟)",
	                            width:150
	                        },
	                        {
	                            field:"totalHour",
	                            title:"总时长(分钟)",
	                            width:80
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

    </script>
</body>
</html>