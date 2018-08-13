<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head id="Head1">
    <title>
        注册页面
    </title>
    <link rel="stylesheet" type="text/css" href="/css/register.css" media="all">
    <script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function _exits(txtUser) {
            var userName = txtUser.value;
            if(userName!=""){
                if(userName!=null){
                    $.post("/Login/register", {name: userName}, function (data) {
                        var msg = document.getElementById("msg");
                        if (data == "y") {
                            msg.style.color = "red";
                            msg.innerText = "用户名以存在";
                        } else {
                            msg.style.color = "green";
                            msg.innerText = "用户名可用"
                        }
                    })
                }
            }



        }
    </script>
</head>
<body class="fp-viewing">
<form name="form" method="post" action="/Login/register" id="form" >
    <div id="fullpage" class="fullpage-wrapper">
        <div class="full-head clearfix">
            <div class="member pull-right">
                <a href="/Login/login" class="btn btn-default btn-lg pull-left login " rel="nofollow">登录</a>
                <a href="#" class="btn btn-default btn-lg pull-left register hidden" rel="nofollow">注册</a>
                <a href="/index.jsp" class="btn btn-default btn-lg pull-left back-wjx">返回首页</a>
            </div>
        </div>
        <div class="fullpage-main"></div>


        <div>
            <![endif]-->
            <div id="register-box" class="validate-box">
                <fieldset class="validate-wrapper">
                    <h1 id="Register1_divVT" class="validate-caption">用户注册</h1>
                    <div id="Register1_pnlCreate">
                        <ul>
                            <li>
                                <label class="icon user-icon"></label>
                                <input name="userName" maxlength="50"
                                       class="validate-input " placeholder="支持英文与数字，注册后不能修改" type="text"
                                       onblur="_exits(this)">
                                <span id="msg" style="font-size: 15px;"></span>
                                <c:if test="${message=='用户名不能为空'}">
                                    <span style="font-size: 15px;color: red">${message}</span>
                                </c:if>
                            </li>
                            <li>
                                <label class="icon password-icon"></label>
                                <input name="userPassword" maxlength="20" id="password"
                                       class="validate-input" placeholder="6~20位字母、数字或特殊符号" value="" type="password">
                                <c:if test="${message=='密码不能为空'}">
                                    <span style="font-size: 15px;color: red">${message}</span>
                                </c:if>
                            </li>
                           <%-- <li>
                                <label class="icon password-icon"></label>
                                <input name="surePassword" maxlength="20" id="surePassword" onblur="sure()"
                                       class="validate-input" placeholder="确认密码" value="" type="password">
                                <span id="password_message" style="font-size: 15px;color: red"></span>
                            </li>--%>
                            <li>
                                <label class="icon email-icon"></label>
                                <input name="userEmail" maxlength="20"
                                       class="validate-input" placeholder="请输入邮箱" type="text">
                                <c:if test="${message=='邮箱不能为空'||message=='邮箱格式不对'}">
                                    <span style="color: red;font-size: 15px">${message}</span>
                                </c:if>
                            </li>
                            <li>
                                <div>
                                    <div style="clear: both;"></div>
                                    <div style="padding-top: 20px;">
                                        <input value="创建用户" class="submitbutton" type="submit">
                                        <a href="/Login/login" class="log-on">已有账号，立即登录</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</form>
</body>
</html>
