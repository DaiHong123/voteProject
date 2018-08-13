<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: daihong
  Date: 2018/7/19
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head id="Head1">
    <title>
        登录页面
    </title>
    <script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
    <link rel="canonical" href="https://www.wjx.cn/login.aspx">
    <link rel="alternate" media="only screen and(max-width: 640px)" href="https://www.wjx.cn/mobile/login.aspx">

    <script src="/js/zhezhao.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="/css/login.css" media="all">
    <script type="text/javascript">
        function _change() {
            var img = document.getElementById("img");
            img.src = "/Login/verify?a=" + new Date().getTime();
        }
    </script>
</head>
<body id="body1" class="fp-viewing">
<form name="form" method="post" action="/Login/login" >
    <div class="fullpage-wrapper">
        <div class="full-head clearfix">
            <div class="member pull-right">
                <a href="#" class="btn btn-default btn-lg pull-left login hidden" rel="nofollow">登入</a>
                <a href="/Login/register" class="btn btn-default btn-lg pull-left register " rel="nofollow">注册</a>
                <a href="/index.jsp" class="btn btn-default btn-lg pull-left back-wjx">返回首页</a>
            </div>
        </div>
        <div class="fullpage-main"></div>
        <div id="divSojump" class="validate-box">
            <fieldset class="validate-wrapper">
                <h1 id="hlogintxt" class="validate-caption">登录</h1>
                <ul>
                    <li>
                        <label class="icon user-icon"></label>
                        <input value="${cookie.userName.value}" name="userName" placeholder="用户名" class="validate-input user-name" type="text" >
                    </li>
                    <li>
                        <label class="icon password-icon"></label>
                        <input name="userPassword" placeholder="请输入登录密码" class="validate-input" type="password" value="${cookie.userPassword.value}">
                    </li>

                    <li>
                        <label class="icon password-icon"></label>
                        <input name="verify" placeholder="请输入验证码" class="validate-input" type="text"
                               style="width: 50%;">
                        <a href="javascript:_change()" style="margin-left: 7%" title="点击图片下一张"><img src="/Login/verify" style="width: 30%" id="img"/></a>
                    </li>

                </ul>
                <div id="trRemember" class="remember-box">
                        <span class="automatic-box pull-left">
                            <span class="login_checkbox centertxt"><input name="rember" type="checkbox" checked
                                                                          value="YES"></span>七天内记住密码
                        </span>
                    <span  class="centertxt" style="margin-left: 15%;color: red;">${message}</span>
                </div>
            </fieldset>
            <fieldset class="submit-wrapper" style="text-align: center; margin-top: 20px;">
                <input name="LoginButton" value="登 录" id="LoginButton" class="submitbutton"
                       onmouseover="this.className='submitbutton submitbutton_hover';"
                       onmouseout="this.className='submitbutton';" style="color: White;" type="submit">
                <span style="color: red; line-height: 28px;">
                        </span>
                <a href="/Login/register" id="hrefRegister" title="只需２０秒，就可完成注册" class="register-now">立即注册</a>
            </fieldset>
        </div>

    </div>
</form>
</body>
</html>

