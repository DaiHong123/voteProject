<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: daihong
  Date: 2018/7/30
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function stop() {
            var voteTime = document.getElementById("voteTime");
            var login = document.getElementById("login");
            var voted = document.getElementById("voted");
            var optionIds = document.getElementsByName("optionId");
            var flag = false;
            if (voteTime.value == '0') {
                alert("已截止")
                return false;
            } else {
                if (login.value == '') {
                    alert("请登录")
                    return false;
                } else {
                    if(voted.value==1){
                        alert("已经投过票了")
                        return false;
                    }else {
                        for(var i=0; i<optionIds.length; i++){
                            if(optionIds[i].checked == true){
                                flag = true;
                                break;
                            }
                        }
                        if(flag == false){
                            alert("请选择你想选的");
                            return false;
                        }else {
                            return true;
                        }
                    }
                }
            }
        }

    </script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/voting.css" media="all">

</head>
<body>

<div id="main-content" class="content" style="height: 100%;width: 680px">
    <div id="newvote">
        <c:choose>
            <c:when test="${vote==null}">
                    <img src="<%=application.getContextPath()%>/images/1.jpg" />
            </c:when>
            <c:otherwise>
            <form onsubmit="return stop()" action="/voting/voteStart" method="post" target="_parent" >
                <input type="hidden" id="voted" name="voted" value="${voted}" />
                <input type="hidden" name="auto" value="${auto}" />
                <input type="hidden" id="login" name="userName" value="${sessionScope.user}">
                <input type="hidden" id="voteTime" name="state" value="${vote.state}">
                <article class="loop-container clearfix">
                    <header class="entry-header">
                        <div class="clearfix">

                            <h1 class="entry-title"><a href="#" title="${vote.voteName}"
                            >${vote.voteName}</a></h1>
                        </div>
                        <p class="entry-meta"><i class="fa fa-clock-o"></i><span class="updated">${voteTime}</span> <i
                                class="fa fa-eye"></i><span class="entry-category">${vote.voteTurnout}</span>
                            <i class="fa fa-user"></i><span>${vote.user.userName}</span></p>
                    </header>
                    <div style="margin-left: 42px;font-size: 20px">
                        <p>${vote.description}</p>
                    </div>
                    <div style="margin-top: 3px;margin-left: 42px">
                        <c:if test="${vote.state==0}">
                            <span style="color: red;font-size: 17px;">已截至</span>
                        </c:if>
                        <c:if test="${vote.voteChange==1}">
                        <span style="color: red;font-size: 17px;margin-right:15px;" id="stop">可以多选</span>
                    </div>
                    <div class="entry-content content-margin clearfix">
                        <div class="entry-excerpt" style="width: 100%">
                            <p></p>

                            <c:if test="${voteLogLists.size()>0}">
                                <c:forEach items="${voteOptions}" var="voteOption">
                                    <c:forEach items="${voteLogLists}" var="voteLog">
                                        <div style="float:left;width:50%">
                                            <c:if test="${voteOption.optionId eq voteLog}">
                                                <input type="checkbox" name="optionId" value="${voteOption.optionId}"
                                                       class="auto-hidden"
                                                       checked>${voteOption.optionName} 已投：${voteOption.optionNumber}票
                                                <br>
                                            </c:if>
                                        </div>
                                    </c:forEach>

                                </c:forEach>
                                <c:forEach items="${voteLogLists1}" var="voteLog">
                                    <div style="float:left;width:50%">
                                        <input type="checkbox" name="optionId" value="${voteLog.optionId}"
                                               class="auto-hidden"
                                        >${voteLog.optionName} 已投：${voteLog.optionNumber}票
                                        <br>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${voteLogLists.size()==0}">

                                <c:forEach items="${voteOptions}" var="voteOption">
                                    <div style="float:left;width:50%">
                                        <input type="checkbox" name="optionId" value="${voteOption.optionId}"
                                               class="auto-hidden">${voteOption.optionName} 已投：${voteOption.optionNumber}票
                                        <br></div>
                                </c:forEach>

                            </c:if>


                        </div>
                    </div>
                    </c:if>
                    <c:if test="${vote.voteChange==0}">
    </div>
    <div class="entry-content content-margin clearfix">
        <div class="entry-excerpt" style="width: 100%">
            <p></p>
            <c:forEach items="${voteOptions}" var="voteOption">
                <div style="float:left;width:50%">
                    <c:if test="${voteOption.optionId==voteLogList}">
                        <input type="radio" name="optionId" value="${voteOption.optionId}"
                               class="auto-hidden" checked>${voteOption.optionName}已投：${voteOption.optionNumber}人
                        <br>
                    </c:if>
                    <c:if test="${voteOption.optionId!=voteLogList}">
                        <input type="radio" name="optionId" value="${voteOption.optionId}"
                               class="auto-hidden">${voteOption.optionName}已投：${voteOption.optionNumber}人
                        <br>
                    </c:if>

                </div>
            </c:forEach>
        </div>
    </div>
    </c:if>
    <input type="hidden" name="voteId" value="${vote.voteId}" />
    <div style="margin-left: 40%"><input type="submit" class="more-link"
                                         value="参与投票"  ></div>

    </article>
    </form>
            </c:otherwise>
        </c:choose>

</div>
</div>
</body>
</html>
