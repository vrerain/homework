<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>人事管理</title>
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
            margin-top: 50px;
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
    </style>
</head>
<body>
    <div id="sidebar">
        <sapn>
            <h1>导航</h1>
        </sapn>
        <span><a href="index" style="color:white;text-decoration:none;">首页</a></span>
        <span style="background-color: #277de6">人事管理</span>
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
        <span id="title">人事管理</span>
        <div id="lists"><table id="list"></table></div>
        <div id="print" style="margin-top:20px;margin-left:40px;width: 50px;height: 25px;"><button style="display:block;width:100%;height:100%"><a href="/staffDownloadExcel" style="text-decoration: none;color:black">打印</a> </button></div>
        
        
        
        <!-- 工具条 -->
        <div id="tb">
            <a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
            <a id="deletebanchesBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<!--            </div> -->
            员工ID：<input id="s1" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
            员工姓名：<input id="s2" class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
            <button id="res">重置</button>
            <button id="sss">搜索</button>
        </div>
        
        
         <!-- 编辑保存窗口 -->
        <div id="win" class="easyui-window" title="员工数据编辑" style="width:800px;height:400px" data-options="iconCls:'icon-save',modal:true,closed:true"> 
            <form method="post" id="editForm"> 
                <%--提供 id 隐藏域 --%>
                <input type="hidden" name="id">
                员工ID：<input type="text" name="number" class="easyui-validatebox" data-options="required:true"/><br/> 
                用户姓名：<input type="text" name="name" class="easyui-validatebox" data-options="required:true"/><br/> 
                年龄：<input type="text" name="age" class="easyui-validatebox" data-options="required:true"/><br/> 
                工资级别：<input type="text" name="salaryLevel" class="easyui-validatebox" data-options="required:true"/><br/> 
                身体状况：<input type="text" name="bodyStatus" class="easyui-validatebox" data-options="required:true"/><br/> 
                家庭地址：<input type="text" name="address" class="easyui-validatebox" data-options="required:true"/><br/> 
                联系方式：<input type="text" name="phone" class="easyui-validatebox" data-options="required:true"/><br/> 
                <a id="saveBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> 
            </form>            
        </div>       
    </div>
    <script type="text/javascript">
    
//     搜索按钮
    $("#sss").click(function(){
        var s1 = $("#s1").val();
        var s2 = $("#s2").val();
        search(s1,s2);
    });
    
//     重置按钮
    $("#res").click(function(){
        $("#s1").textbox('reset');
        $("#s2").textbox('reset');
    });
    
  //保存数据
    $("#saveBtn").click(function(){
        $("#editForm").form("submit",{
            //url: 提交到后台的地址
            url:"saveStaffInformation",
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
                    $("#win").window("close");
                    //刷新datagrid
                    $("#list").datagrid("reload");
                    
                    $.messager.alert("提示","保存成功","info");
                }else{
                    $.messager.alert("提示","保存失败："+data.msg,"error");
                }
            }
        });
    });
  
  //打开编辑窗口
    $("#addBtn").click(function(){ 
        $("#win").window("open"); 
        });
  
//   实现多条件搜索功能
    function search(number, name) {
        $(function(){
            $("#list").datagrid({
                url:"staffConditionalSearch",
                queryParams:{number:number, name:name},
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
                        width:120
                    },
                    {
                        field:"name",
                        title:"员工姓名",
                        width:120
                    },
                    {
                    	field:"age",
                    	title:"年龄",
                    	width:50
                    },
                    {
                        field:"salaryLevel",
                        title:"工资级别",
                        width:80
                    },
                    {
                        field:"bodyStatus",
                        title:"身体状况",
                        width:80
                    },
                    {
                        field:"address",
                        title:"家庭地址",
                        width:150
                    },
                    {
                        field:"phone",
                        title:"手机号",
                        width:120
                    },
                    {
                        field:"operate",
                        title:"操作",
                        width:200,
                        align:"center",
                        formatter:function(value, row, index){
                            var str = '<a href="#" name="editBtn" class="easyui-linkbutton" onclick="edit(\''+ index +'\')"></a>'
                            var str2 = '<a href="#" name="deleteBtn" class="easyui-linkbutton" onclick="del(\''+ index +'\')"></a>'
                            return str+str2;
                        }           
                    }
                ]],
                pagination:true,
                toolbar:"#tb",
                //单击行不选中
                onClickRow: function (rowIndex, rowData) {
                    $(this).datagrid('unselectRow', rowIndex);
                },
                //加载操作列按钮图标
                onLoadSuccess:function(data){
                    $("a[name='editBtn']").linkbutton({
                        text:"修改",
                        plain:true,
                        iconCls:"icon-edit",
                    });
                    
                    $("a[name='deleteBtn']").linkbutton({
                        text:"删除",
                        plain:true,
                        iconCls:"icon-remove",
                    });
                },
            });
        });
    }
  
  //修改回显
    function edit(index){   
        var page = $('#list').datagrid('options').pageNumber; //获取页数
        index=Number(index)+Number((page-1)*10);
        var rows = $("#list").datagrid("getRows");
        var row = rows[index];
        $("#editForm").form("load","findStaffById?id="+row.id);
        $("#win").window("open");
    }
  
  //删除操作
    function del(index){ 
    	var page = $('#list').datagrid('options').pageNumber; //获取页数
        index=Number(index)+Number((page-1)*10);
        var rows = $("#list").datagrid("getRows");
        var row = rows[index];
        $.messager.confirm("提示","确认删除数据吗?",function(value){
            if(value){      
                $.post("deleteOneStaff",{"index":row.id},function(data){
                    if(data.success){ 
                        //刷新 datagrid 
                        $("#list").datagrid("reload"); 
                        $.messager.alert("提示","删除成功","info");
                    }
                    else{
                        $.messager.alert("提示","删除失败： "+data.msg,"error");
                    }
                },"json");
            }
        });
      }
  
    $(function() {
        $("#list").datagrid({
            //url:后台数据查询的地址
            url: "/staffInformation",
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
                        width:120
                    },
                    {
                        field:"name",
                        title:"员工姓名",
                        width:120
                    },
                    {
                        field:"age",
                        title:"年龄",
                        width:50
                    },
                    {
                        field:"salaryLevel",
                        title:"工资级别",
                        width:80
                    },
                    {
                        field:"bodyStatus",
                        title:"身体状况",
                        width:80
                    },
                    {
                        field:"address",
                        title:"家庭地址",
                        width:150
                    },
                    {
                        field:"phone",
                        title:"手机号",
                        width:120
                    },
                    {
                        field:"operate",
                        title:"操作",
                        width:200,
                        align:"center",
                        formatter:function(value, row, index){
                            var str = '<a href="#" name="editBtn" class="easyui-linkbutton" onclick="edit(\''+ index +'\')"></a>'
                            var str2 = '<a href="#" name="deleteBtn" class="easyui-linkbutton" onclick="del(\''+ index +'\')"></a>'
                            return str+str2;
                        }           
                    }
                ]],
            pagination:true,
            toolbar:"#tb",
            //单击行不选中
            onClickRow: function (rowIndex, rowData) {
                $(this).datagrid('unselectRow', rowIndex);
            },
            //加载操作列按钮图标
            onLoadSuccess:function(data){
                $("a[name='editBtn']").linkbutton({
                    text:"修改",
                    plain:true,
                    iconCls:"icon-edit",
                });
                
                $("a[name='deleteBtn']").linkbutton({
                    text:"删除",
                    plain:true,
                    iconCls:"icon-remove",
                });
            },
        });
    })
    
    
    //批量删除
        $("#deletebanchesBtn").click(function(){
                    var rows =$("#list").datagrid("getSelections");
                    if(rows.length==0){
                        $.messager.alert("提示","删除操作至少选择一行","warning");
                        return;
                    }
                    
                    //格式： id=1&id=2&id=3
                    $.messager.confirm("提示","确认删除数据吗?",function(value){
                        if(value){
                            var idStr = "";
                            //遍历数据
                            $(rows).each(function(i){
                                idStr+=("id="+rows[i].id+"&");
                            });
                            idStr = idStr.substring(0,idStr.length-1);
                            
                            //传递到后台
                            $.post("deleteManyStaffs",idStr,function(data){
                                if(data.success){
                                    //刷新datagrid
                                    $("#list").datagrid("reload");
                                    
                                    $.messager.alert("提示","删除成功","info");
                                }else{
                                    $.messager.alert("提示","删除失败："+data.msg,"error");
                                }
                            },"json");
                        }
                    });
                });
    
    
    </script>
</body>
</html>