<%--
  explation: 打卡机模拟页面
  author: vrerain
  Date: 2021/5/19
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打卡机模拟</title>
    <style>
        body {
            align-items: center;
            background-color: rgba(242, 242, 242, 1);
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: grid;
            height: 100vh;
            place-items: center;
        }
        
        .head {
            width: 600px;
            text-align: center;
            display: block;
        }
        
        .body {
            width: 600px;
            text-align: center;
            display: block;
        }
        
        .input {
            background-color: #fff;
            border: 1px solid grey;
            padding: 0.9rem 0.9rem;
            margin: 0.5rem auto;
            width: 400px;
            display: block;
            text-align: center;
        }
        
        .input2 {
            background-color: #fff;
            border: 1px solid grey;
            padding: 0.9rem 0.9rem;
            margin: 0.5rem auto;
            width: 320px;
            display: inline-block;
            text-align: center;
        }
        
        .btn {
            background-color: rgba(204, 204, 204, 1);
            border-radius: 20px;
            border: 1px solid rgba(204, 204, 204, 1);
            cursor: pointer;
            font-size: 0.8rem;
            font-weight: bold;
            letter-spacing: 0.1rem;
            padding: 0.9rem 6rem;
        }
        
        .btn:hover {
            background-color: #277de6;
        }
        
        .form>.btn {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="head">
        <h1>考勤打卡模拟界面</h1>
        <hr class="line">
    </div>
    <div class="body">
        <form action="/uploadAttendance" method="POST" class="form" id="form1" name="form1">
            <input type="text" placeholder="员工ID" class="input" name="number" />
            <select class="input" name="machineID" style="width: 430px;">
                <option value ="1">1号机</option>
                <option value ="2">2号机</option>
                <option value="3">3号机</option>
                <option value="4">4号机</option>
                <option value="5">5号机</option>
                <option value="6">6号机</option>
              </select>
            <div class="time1">
                签到时间：<input type="time" class="input2" placeholder="dfsd" name="startTime">
            </div>
            <div class="time2">
                签退时间：
                <input type="time" class="input2" name="endTime">
            </div>
            <input type="submit" class="btn" value="打卡" />
        </form>
    </div>
    
    <script type="text/javascript">
    
    </script>
</body>
</html>