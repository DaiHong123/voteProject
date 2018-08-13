<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: daihong
  Date: 2018/7/26
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建投票</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="/js/jquery-1.7.js"></script>
    <script type="text/javascript">
        var vote_max = 4;
        var vote_count = 2;

        function gotop() {
            var divSur = document.getElementById("sur");
            divSur.scrollTop = 0;
        }

        function gobottom() {
            var divSur = document.getElementById("sur");
            divSur.scrollTop = divSur.scrollHeight;
        }

        function number() {
            var A = document.getElementsByName("A");
            var time = document.getElementById("time").value;
            for (var i = 0; i < A.length; i++) {
                if (A[i].value == "") {
                    alert("选项不能为空");
                    return false;
                }
            }
            if (A.length < 2) {
                alert("至少需要两个选项")
                return false;
            } else if (time == "") {
                alert("请填写截至日期")
                return false;
            } else {
                return true;
            }
        }

        $(function () {
            $('.votedel').live("click", function () {
                vote_count--;
                    $(this).parent().remove();
            });
            $("#addchoice").click(function () {
                if (vote_count < vote_max) {
                    if (vote_count > 6) {

                        $("#vote").css("height", $("#vote").css("height") + 35);
                    }
                    vote_count++;
                    $('<li class="votechoice">' + '选项' + vote_count + '' +
                        '<input type="text" name="A"/><span class="votedel" title="删除"></span></li>')
                        .insertBefore(".addchoice");
                }
                else {
                    alert("已经" + vote_max + "个了，不能在添加了!");
                }
            });
        });

    </script>
    <link rel="stylesheet" type="text/css" href="/css/vote_add.css" media="all">
    <link rel="stylesheet" type="text/css" href="/css/vote1.css" media="all">
    <link rel="stylesheet" type="text/css" href="/css/vote2.css" media="all">
    <link rel="stylesheet" type="text/css" href="/css/vote_add1.css" media="all">
</head>
<body style="background: rgb(238, 238, 238) none repeat scroll 0% 0%; margin: 0px; padding: 0px;">
<form action="/vote/voteAdd" method="post" onsubmit="return number()">
    <div id="ss-header">
        <div style="visibility: visible;" id="divMenu">
            <div style="margin-right: 25px; float: right;">
                <a href="#" style="padding-left: 15px; padding-right: 15px;" class="sumitbutton"
                >${sessionScope.user.userName}</a>
                <a class=" sumitbutton" href="">
                    <span>退出</span>
                </a>

            </div>
        </div>
    </div>
    <div style="margin: 0px auto; text-align: left; width: 1000px; position: relative;">
        <div id="topnav" style="visibility: visible;">
            <ul id="divTouPiao" class="tabQTypet" style="width: 996px;">
                <li style="width: 100px;margin-top: 0px;margin-left: 5px;text-align: center"><a href="#"><i
                        class="design-icon design-qtype design-radio" style="margin-top: 0px"></i>创建投票</a></li>
                <div style="clear: both;"></div>
            </ul>

            <div style="right: -45px;" id="m-rightbar">
                <div class="m-menu">
                    <li class="m-top"><a href="javascript:;" onclick="gotop();return false;" title="返回顶部">返回顶部</a></li>
                    <li class="m-help"><a href="https://www.wjx.cn/help/help.aspx?catid=65&amp;h=1" title="帮助中心"
                                          target="_top">帮助中心</a></li>
                    <li class="m-comment"><a href="https://www.wjx.cn/jq/3779891.aspx" title="意见反馈"
                                             target="_top">意见反馈</a>
                    </li>
                    <li class="m-bottom"><a href="javascript:;" onclick="gobottom();return false;" title="返回底部">返回底部</a>
                    </li>
                </div>
            </div>
        </div>
        <div class="survey"
             style="padding-bottom: 5px; margin: 0px 26px 0px 0px; overflow: auto; background: rgb(255, 255, 255) none repeat scroll 0% 0%; width: 1000px; position: relative; height: 566px;"
             id="sur">
            <div style="width: 840px; margin: 0px auto;">
                <div class="surveycontent">
                    <div id="divId" class="surveyhead"
                         style="border: 2px solid rgb(255, 255, 255); margin-top: 18px; width: 800px; cursor: pointer; padding-top: 10px; padding-bottom: 10px;">

                        <h1 id="pater_title" style="cursor: pointer;text-align: center">
                            <input type="text" style="border:0;font-size: 50px;text-align: center" readonly
                                   name="voteName" value="${votetitle}">
                        </h1>
                        <input type="hidden" name="user.userName" value="${sessionScope.user.userName}"> <br>
                        <div id="pater_desc" class="surveydescription" style="cursor: pointer;">
                            <div id="outter">
                                <div id="inner">
                                    <div id="content">
                                        <div id="vote">
                                            <div id="voteinfo">
                                                <span id="infotitle"
                                                      style="font-size: 25px;font-family: 方正舒体;color: red;">投票说明:</span>
                                                <textarea rows="3" cols="35"
                                                          name="description">通过设置下面的内容，来显示该投票信息</textarea>
                                            </div>
                                            <div style="float: left;">
                                                类型 <select name="voteType.typeId">
                                                <c:forEach items="${voteTypes}" var="i">
                                                    <option value="${i.typeId}">${i.typeName}</option>
                                                </c:forEach>
                                            </select>
                                            </div>
                                            <div>
                                                截至日期： <input type="text" name="time" size="5" id="time"> <span>天</span>
                                                <br>
                                                </select>
                                            </div>
                                            <ul>
                                                <li class="votetitle">
                                                    <span class="votetitleright"><input name="voteChange" value="1"
                                                                                        type="checkbox">多选模式</span>
                                                </li>
                                                <li class="votechoice">
                                                    <input name="A" type="text"><span class="votedel"
                                                                                      title="删除"></span>选项1
                                                </li>
                                                <li class="votechoice"><input name="A" type="text"><span
                                                        class="votedel" title="删除"></span>选项2
                                                </li>
                                                <li class="addchoice">
                                                    <span id="addchoice" title="增加一个"
                                                          style="font-size: 20px">+增加一个</span><span id="complete">
                                                    <input type="submit" value="发布" style="font-size: 20px;"
                                                           onclick="equal()">
                                                        </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
