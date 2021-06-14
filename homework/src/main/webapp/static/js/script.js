const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const firstForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
    container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
    container.classList.add("right-panel-active");
});

function check() {
    var p1 = form1.password.value;
    var p2 = form1.repassword.value;
    if (p1 == p2) {
        alert("注册成功");
        firstForm.submit();
    } else {
        alert("两次密码输入不一致,请重新输入");
    }
}
// fistForm.addEventListener("submit", (e) => e.preventDefault());
// secondForm.addEventListener("submit", (e) => e.preventDefault());