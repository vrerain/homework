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
        
        #info {
            margin: 20px;
            width: 100%;
            height: 300px;
            display: block;
        }
        
        #function2 {
            margin: 0 20px;
            width: 100%;
            height: 300px;
            display: block;
        }
        
        #function2>div {
            width: 650px;
            height: 40px;
            margin: 25px 0;
            font-size: 19px;
            line-height: 40px;
            text-align: center;
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
        <div id="info">
            <div style="display:inline-block;float: left;margin: 20px;"><img src="static/images/ahu.jpg" style="height: 200px;width: 200px;"></div>
            <div style="width: 400px;border: 1px solid grey;height: 40px;display: inline-block;text-align: center;line-height: 40px;margin: 39px 0;margin-right: 400px;"><%=user.getName() %></div>
            <div style="width: 400px;border: 1px solid grey;height: 40px;display: inline-block;text-align: center;line-height: 40px;margin: 30px 0;"><%=user.getAccount() %></div>
        </div>
        <div id="function2">
            <div><button id="btn1" style="display: block;width: 100%;height: 100%;">修改密码</button></div>
            <div><button id="btn2" style="display: block;width: 100%;height: 100%;">意见反馈</button></div>
            <div><button id="btn3" style="display: block;width: 100%;height: 100%;">关于我们</button></div>
        </div>
        
        <div id="win1" class="easyui-window" title="修改密码" style="width:400px;height:400px" data-options="iconCls:'icon-save',modal:true,closed:true"> 
            <form method="post" id="editForm1"> 
                修改的密码：<input type="text" name="password" class="easyui-validatebox" data-options="required:true"/><br/> 
                <a id="modify1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">修改</a> 
            </form>            
        </div> 
        
        <div id="win2" class="easyui-window" title="反馈信息" style="width:400px;height:400px" data-options="iconCls:'icon-save',modal:true,closed:true"> 
            <form method="post" id="editForm2"> 
                反馈信息：<br><textarea></textarea><br/> 
                <a id="modify2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">提交</a> 
            </form>            
        </div> 
        
        <div id="win3" class="easyui-window" title="关于我们" style="width:400px;height:400px" data-options="iconCls:'icon-save',modal:true,closed:true"> 
            <div style="display:block;">小组成员:<br>董艳民、谢东阳、杨富超、王相、张婷婷、王志诚</div>            
        </div> 
    </div>
    
    <script type="text/javascript">
	    $("#btn1").click(function(){
	    	$("#win1").window("open"); 
	    });
	    
	    $("#btn2").click(function(){
	    	$("#win2").window("open"); 
        });
        
	    $("#btn3").click(function(){
	    	$("#win3").window("open"); 
	    });
	    
	    $("#modify1").click(function(){
	        $("#editForm1").form("submit",{
	            //url: 提交到后台的地址
	            url:"modifyPassword",
	            //onSubmit: 表单提交前的回调函数，true：提交表单   false：不提交表单
	            onSubmit:function(){
	                //判断表单的验证是否都通过了
	                return $("#editForm").form("validate");
	            },
	            //success:服务器执行完毕回调函数
	            success:function(data){ //data: 服务器返回的数据，类型字符串类
	                //要求Controller返回的数据格式：  
	                //成功：{success:true} 失败:{success:false,msg:错误信息}
	                
	                //把data字符串类型转换对象类型
	                data = eval("("+data+")");
	                
	                if(data.success){
	                    //关闭窗口
	                    $("#win1").window("close");               
	                    $.messager.alert("提示","修改成功","info");
	                }else{
	                    $.messager.alert("提示","修改失败："+data.msg,"error");
	                }
	            }
	        });
	    });
	    
	    $("#modify2").click(function(){
	    	$.messager.alert("提示","反馈成功","info");
	    	$("#win2").window("close");  
        });
    </script>
</body>
</html>