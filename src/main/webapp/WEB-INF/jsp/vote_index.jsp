<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: daihong
  Date: 2018/7/26
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class=" js no-touch csstransforms3d csstransitions">
<head id="ctl01_Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        创建在线投票
    </title>
    <script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>


    <link rel="stylesheet" type="text/css" href="/css/vote1.css" media="all">
</head>
<body>

<div id="BS">
    <div class="header">
        <div class="my-container clearfix">


            <div id="ctl01_divreturn" class="logo pull-left">
                <a href="javascript:history.go(-1)" class="hover" id="hrefPGoBack"><em
                        class="icon returnicon"></em>返回</a>
            </div>
            <div class="user-wrapper pull-right" id="userbutton">
                <dl class="my-question pull-left">

                    <dt class="box user-info">
                        <a class="user-name" href="/index.jsp"><i
                                class="icon questions-icon"><em></em></i><span id="ctl01_spanMyq">我的投票</span></a>
                    </dt>
                    <dd class="line"></dd>


                </dl>
                <dl class="user-info pull-left">
                    <dd class="spinner-list">
                        <a href="#" class="user-name"><span id="ctl01_lblUserName"
                                                            style="text-align: center;">${sessionScope.user.userName}</span><span
                                class="caret"></span></a>
                        <ul style="width: 100px;">
                            <span class="caret-inverted"></span>
                            <li><a href="#">用户信息</a></li>
                            <li id="ctl01_hrefUpgrade">
                                <a href="#">升级</a></li>
                            <li id="ctl01_liClient"><a href="#">客服中心</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl class="user-info pull-left">
                    <a class="user-name" href="https://www.wjx.cn/newwjx/manage/myask.aspx">
                        <dt id="ctl01_spanMessage" class="icon info-icon">
                        </dt>
                        <dd class="spinner-list">
                            <span>消息</span>
                        </dd>
                    </a>
                </dl>
                <dl id="ctl01_hrefWjxout" class="user-info pull-left IE-8">
                    <a class="user-name" href="/Login/login?tag=exit">
                        <dt class="icon out-icon"></dt>
                        <dd class="spinner-list">
                            <span>退出</span>
                        </dd>
                    </a>
                </dl>

            </div>
        </div>
    </div>

    <div class="BS-box" style="text-align: left;">
        <div id="ctl01_ContentPlaceHolder1_divCss">

        </div>
        <form name="aspnetForm" method="post"
              action="/vote/voteIndex" id="aspnetForm">

            <div id="ctl01_ContentPlaceHolder1_divCreate" class="nav-header">
                <div class="container">
                    <div class="nav-wrapper clearfix">
                        <h1 id="ctl01_ContentPlaceHolder1_spanTitle" class="hd-title pull-left">创建在线投票</h1>

                    </div>
                </div>
            </div>
            <div class="main-wrapper">
                <div class="create-box">
                    <div class="create__fill">
                        <div class="fill__name-box clearfix">
                            <label class="pull-left" id="spanName">投票名称：</label>
                            <div class="pull-left">
                                <input name="votetitle"
                                       id="ctl01_ContentPlaceHolder1_txtQName" class="pull-left"
                                       style="line-height: 50px; margin-bottom: 14px;" type="text">
                            </div>
                        </div>
                        <div class="btn-block" style="position: relative;">
                            <table align="center">
                                <tbody>
                                <tr>
                                    <td valign="top">
                                        <div id="spanCode" style="float: left; display: inline; margin-top: 60px;">
                                            <span id="ctl01_ContentPlaceHolder1_spanVerifyTxt"></span>

                                            <span>
</span>
                                        </div>
                                        &nbsp; &nbsp; &nbsp;
                                    </td>
                                    <td style="padding-bottom: 30px;" valign="middle">
                                        <input value="立即创建"
                                               onclick="return checkLogin();"
                                               id="ctl01_ContentPlaceHolder1_lbtnNextStep"
                                               class="btn btn-default create__btn-new" style="width: 200px;"
                                               type="submit">

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>

            <script type="text/javascript">

                var txtQName = document.getElementById("ctl01_ContentPlaceHolder1_txtQName");

                function checkLogin() {
                    var name = txtQName.value;
                    if (!name) {
                        alert("问卷名不能为空！");
                        return false;
                    }
                    if (name.indexOf("<") > -1) {
                        alert("问卷名不能包含“<”号号！");
                        return false;
                    }
                    if (name.indexOf(">") > -1) {
                        alert("问卷名不能包含“>”号！");
                        return false;
                    }
                    return true;
                }

            </script>
        </form>

    </div>

</div>
</body>
</html>

