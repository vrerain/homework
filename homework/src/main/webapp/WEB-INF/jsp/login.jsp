<%--
  explation: this is test login server page
  author: vrerain
  Date: 2021/5/19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <!-- partial:index.partial.html -->
    <div class="container right-panel-active">
        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="/insertUser" method="POST" class="form" id="form1" name="form1">
                <h2 class="form__title">注册</h2>
                <input type="text" placeholder="账号" class="input" name="number" />
                <input type="password" placeholder="密码" class="input" name="password" />
                <input type="passwordagain" placeholder="确认密码" class="input" name="repassword" />
                <input type="text" placeholder="请输入注册码" class="input" name="verify"/>
                <input class="btn" type="button" onclick="check()" value="注册" />
            </form>
        </div>

        <!-- Sign In -->
        <div class="container__form container--signin">
            <form action="/findByMobile" class="form" id="form2">
                <h2 class="form__title">登陆</h2>
                <input type="email/number" placeholder="账号" class="input" name="mobile" />
                <input type="password" placeholder="密码" class="input" name="password" />
                <button class="btn">登陆</button>
            </form>
        </div>

        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="btn" id="signIn">注册</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="btn" id="signUp">登陆</button>
                </div>
            </div>
        </div>
    </div>
    <!-- partial -->
    <script src="static/js/script.js"></script>
</body>
</html>
