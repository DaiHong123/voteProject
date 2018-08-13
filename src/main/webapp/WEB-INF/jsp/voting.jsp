<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: daihong
  Date: 2018/7/26
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        投票网
    </title>

    <script src="${pageContext.request.contextPath}/js/analytics.js" async="" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/modernizr-2.8.3.js"></script>
    <script type="text/javascript" src="<%=application.getContextPath()%>/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
      function run() {
          var auto = document.getElementById("auto");
          if(auto.value=="1"){
              document.getElementById("a1").click();
          }if(auto.value=='2'){
              document.getElementById("a2").click();
          }if(auto.value=='3'){
              document.getElementById("a3").click();
          }
          auto.value = "";
      }

        function timestampToTime(timestamp) {
            var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
            D = date.getDate() + ' ';
            h = date.getHours() + ':';
            m = date.getMinutes() + ':';
            s = date.getSeconds();
            return Y + M + D;//时分秒可以根据自己的需求加上
        }

        function votes(pageIndex) {
            $.ajax({
                type: 'get',
                url: '<%=application.getContextPath()%>/voting/vote1',
                data: {pageIndex: pageIndex},
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    if (data.list[0] != null) {
                        var str = ""
                        var str2 = ""
                        str += "名称：" + data.list[0].voteName + "<br>";
                        str += "创建人姓名：" + data.list[0].user.userName + "<br>";
                        str += "投票数：" + data.list[0].voteTurnout + "<br>";
                        str2 += "截至时间：" + timestampToTime(data.list[0].endTime);
                        str += "<a href='<%=application.getContextPath()%>/voting/voteOption?voteId=" + data.list[0].voteId + "&auto=1' target='midden'>";
                        str+="<span id='a1'>了解更多</span></a>"
                        $("#first").html(str);
                        $("#firstTime").html(str2);
                    } else {
                        var str = ""
                        var str2 = ""
                        $("#first").html(str);
                        $("#firstTime").html(str2);
                    }
                    if (data.list[1] != null) {
                        var str = ""
                        var str2 = ""
                        str += "名称：" + data.list[1].voteName + "<br>";
                        str += "创建人姓名：" + data.list[1].user.userName + "<br>";
                        str += "投票数：" + data.list[1].voteTurnout + "<br>";
                        str2 += "截至时间：" + timestampToTime(data.list[1].endTime);
                        str += "<a href='<%=application.getContextPath()%>/voting/voteOption?voteId=" + data.list[1].voteId + "&auto=2' target='midden'>";
                        str+="<span id='a2'>了解更多</span></a>"
                        $("#second").html(str);
                        $("#secondTime").html(str2);
                    } else {
                        var str = ""
                        var str2 = ""
                        $("#second").html(str);
                        $("#secondTime").html(str2);
                    }

                    if (data.list[2] != null) {
                        var str = ""
                        var str2 = ""
                        str += "名称：" + data.list[2].voteName + "<br>";
                        str += "创建人姓名：" + data.list[2].user.userName + "<br>";
                        str += "投票数：" + data.list[2].voteTurnout + "<br>";
                        str2 += "截至时间：" + timestampToTime(data.list[2].endTime);
                        str += "<a href='<%=application.getContextPath()%>/voting/voteOption?voteId=" + data.list[2].voteId + "&auto=3' target='midden'>";
                        str+="<span id='a3'>了解更多</span></a>"
                        $("#third").html(str);
                        $("#thirdTime").html(str2);
                    } else {
                        var str = ""
                        var str2 = ""
                        $("#third").html(str);
                        $("#thirdTime").html(str2);
                    }
                    str = "";
                    if(data.pageNum>1){
                        str+="<span style=\"cursor: pointer\" onclick=\"votes("+(data.pageNum-1)+")\">上一页</span>";
                    }else{
                        str+="<span style=\"cursor: pointer\" onclick=\"votes("+data.pageNum+")\">上一页</span>";
                    }
                    for(var i=1; i<=data.pages; i++){
                        str+= "<span style='cursor: pointer;margin-left: 10px' onclick='votes("+i+")' >"+i+"</span>";
                    }
                    if(data.pageNum<data.total){
                        str+="<span style=\"cursor: pointer\" onclick=\"votes("+(data.pageNum+1)+")\">下一页</span>";
                    }else{
                        str+="<span style=\"cursor: pointer\" onclick=\"votes("+data.pageNum+")\">下一页</span>";
                    }
                    str+="<span style='margin-left: 20px'>总页数"+data.pages+"</span>";
                    str+="<span style='margin-left: 20px'>当前页数"+data.pageNum+"</span>"
                    $("#page").html(str);
                }

            });
        }


    </script>


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/voting.css" media="all">
</head>
<body class="right-sb" onload="run()">
<input type="hidden" name="auto" value="${auto}" id="auto"/>

<div class="container">


    <!-- Start Header -->
    <header class="header-wrap clearfix">
        <div class="logo" role="banner">
            <a href="/index.jsp" title="投票网" rel="home">
                <div class="logo-text">
                    <h1 class="logo-name">投票网</h1>
                </div>
            </a>
        </div>
        <nav class="main-nav clearfix">
            <div class="menu-navigation-container">
                <ul id="menu-navigation" class="menu">
                    <c:if test="${sessionScope.user==null}">
                        <li><a id="registerLink" href="/Login/register">注册</a></li>
                        <li><a id="loginLink" href="/Login/login">登录</a></li>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <li><a id="loginName" href="#">${sessionScope.user.userName}</a></li>
                        <li><a href="/voting/vote?tag=exit">注销</a></li>
                    </c:if>
                </ul>

            </div>
        </nav>
    </header>
    <!-- End Header -->


    <div class="content-section clearfix">

        <div class="list-carousel clearfix">

            <div <%--class="owl-carousel owl-theme owl-loaded"--%>>
                <div class="owl-stage-outer">
                    <div style="height: 150px; width: 3840px;" class="owl-stage">
                        <div style="width: 290px; margin-right: 30px;float: left;" class="owl-item">
                            <div class="entry-margin">
                                <i class="fa" id="firstTime">
                                    截至时间： ${dateString.get(0)}
                                </i>
                                <div id="first">
                                    名称：${voteList.get(0).voteName} <br>
                                    创建人姓名：${voteList.get(0).user.userName} <br>
                                    投票数：${voteList.get(0).voteTurnout} <br>
                                    <a href="<%=application.getContextPath()%>/voting/voteOption?voteId=${voteList.get(0).voteId}&auto=1"
                                       target="midden" ><span id="a1">了解更多</span></a>
                                </div>
                            </div>
                        </div>
                        <div style="width: 290px; margin-right: 30px;float: left;" class="owl-item">
                            <div class="entry-margin">
                                <i class="fa" id="secondTime">
                                    截至时间： ${dateString.get(1)}
                                </i>
                                <div id="second">
                                    名称：${voteList.get(1).voteName} <br>
                                    创建人姓名：${voteList.get(1).user.userName} <br>
                                    投票数：${voteList.get(1).voteTurnout} <br>
                                    <a href="<%=application.getContextPath()%>/voting/voteOption?voteId=${voteList.get(1).voteId}&auto=2"
                                       target="midden"><span id="a2">了解更多</span></a>
                                </div>
                            </div>
                        </div>
                        <div style="width: 290px; margin-right: 30px;float: left;" class="owl-item">
                            <div class="entry-margin">
                                <i class="fa" id="thirdTime">
                                    截至时间：${dateString.get(2)}
                                </i>
                                <div id="third">
                                    名称：${voteList.get(2).voteName} <br>
                                    创建人姓名：${voteList.get(2).user.userName} <br>
                                    投票数：${voteList.get(2).voteTurnout} <br>
                                    <a href="<%=application.getContextPath()%>/voting/voteOption?voteId=${voteList.get(2).voteId}&auto=3"
                                       target="midden"><span id="a3">了解更多</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="clear:both;text-align: center" id="page" >
                    <span onclick="votes(${info.pageNum>1?info.pageNum-1:1})"  style="cursor: pointer">上一页</span>
                    <c:forEach begin="1" end="${info.pages}" var="i">
                        <span onclick="votes(${i})" style="cursor: pointer">${i}</span>
                    </c:forEach>
                    <span onclick="votes(${info.pageNum<info.pages?info.pageNum+1:info.pages})"  style="cursor: pointer">下一页</span>
                    <span style="margin-left: 20px">共${info.pages}页</span>
                    <span style="margin-left: 20px">当前页数1</span>
                </div>
                <div class="owl-dots disabled"></div>
            </div>

        </div>

        <div id="main-content" class="content">

            <div id="newvote" style="width: 680px;height: 380px">

                <iframe class="loop-container clearfix" style="width: 100%;height: 100%" scrolling="no" frameborder="0"
                        name="midden" src="/voting/voteStart">

                </iframe>

            </div>


        </div>


        <aside id="main-sidebar" class="sidebar">

            <div class="sb-widget">
                <div class="widget-content">
                    <ul>
                        <li> <img src="<%=application.getContextPath()%>/images/timg.gif"></li>
                        <li> <img src="<%=application.getContextPath()%>/images/2.jpg"></li>
                    </ul>

                </div>
            </div>

        </aside>
    </div>


    <footer id="footer" class="footer clearfix">
        <nav class="social-nav clearfix">
            <div class="menu-social-container">
            </div>
        </nav>
        <div class="copyright-wrap">
            <p class="copyright"><a target="_top"
                                    href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=50010302000149">渝公网安备50010302000149号.</a>
                渝ICP备12000198号. <a href="https://www.toutoupiao.com/Terms">服务条款</a> <a
                        href="https://www.toutoupiao.com/SiteMap">站点地图</a> <a href="https://www.toutoupiao.com/Contact">联系我们</a>
            </p>
        </div>
    </footer>

</div>
    </article>


</body>
</html>
