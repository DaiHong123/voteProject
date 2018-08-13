<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>在线投票系统</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/helpers.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
    <div class="container">
        <a class="navbar-brand" href="#">投票</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
            <span><i class="ion-navicon"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="#" style="font-size: 15px;">主页</a></li>
                <li class="nav-item "><a class="nav-link" href="/voting/vote" style="font-size: 15px;">投票</a></li>
                <li class="nav-item"><a class="nav-link" href="/vote/voteIndex" style="font-size: 15px;">创建投票</a></li>
                <c:if test="${sessionScope.user==null}">
                    <li class="nav-item"><a class="nav-link" href="/Login/login" style="font-size: 15px;">登陆</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Login/register" style="font-size: 15px;">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <li class="nav-item"><a class="nav-link" href="/Login/register" style="font-size: 15px;">${sessionScope.user.userName}</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Login/login?tag=exit" style="font-size: 15px;">注销</a> </li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href="" style="font-size: 15px;">关于我们</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->


<section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('${pageContext.request.contextPath}/images/img1.jpg');width: 100%;height: 500px;"  data-stellar-background-ratio="0.5"  id="section-home">


</section>
<!-- END section -->
<div class="chs">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>


<section class="probootstrap_section" id="section-feature-testimonial">
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-12 text-center mb-5 probootstrap-animate">
                <h2 class="display-4 border-bottom probootstrap-section-heading">投票系统功能</h2>
                <blockquote class="">
                    <p class="lead mb-4"><em>
                        1、可以同时开启无数的投票活动，互不挂钩、互不影响<br>
                        2、想要参加就注册并且登陆，回复报名按要求回复就可报名参加，报名后后台要审核才
                        会在前台显示。<br>
                        3、后台可导出选手投票数据。</em></p>
                    <p class="probootstrap-author">
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/assets/images/person_1.jpg" alt="Free Template by ProBootstrap.com" class="rounded-circle">
                            <span class="probootstrap-name">James Smith</span>
                            <span class="probootstrap-title">Chief Executive Officer</span>
                        </a>
                    </p>
                </blockquote>

            </div>
        </div>

    </div>
</section>
<!-- END section -->


<section class="probootstrap_section">
    <div class="container">
        <div class="row text-center mb-5 probootstrap-animate">
            <div class="col-md-12">
                <h2 class="display-4 border-bottom probootstrap-section-heading">功能</h2>
            </div>
        </div>
    </div>
</section>


<section class="probootstrap-section-half d-md-flex" id="section-about">
    <div class="probootstrap-image probootstrap-animate" data-animate-effect="fadeIn" style="background-image: url(${pageContext.request.contextPath}/assets/images/img_2.jpg)"></div>
    <div class="probootstrap-text">
        <div class="probootstrap-inner probootstrap-animate" data-animate-effect="fadeInRight">
            <h2 class="heading mb-4">Customer Service</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
            <p><a href="/vote/voteIndex" class="btn btn-primary">创建投票</a></p>
        </div>
    </div>
</section>


<section class="probootstrap-section-half d-md-flex">
    <div class="probootstrap-image order-2 probootstrap-animate" data-animate-effect="fadeIn" style="background-image: url(${pageContext.request.contextPath}/assets/images/img_3.jpg)"></div>
    <div class="probootstrap-text order-1">
        <div class="probootstrap-inner probootstrap-animate" data-animate-effect="fadeInLeft">
            <h2 class="heading mb-4">Payment Options</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
            <p><a href="/voting/vote" class="btn btn-primary">投票</a></p>
        </div>
    </div>
</section>
<!-- END section -->







<footer class="probootstrap_section probootstrap-border-top">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-3">
                <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
                <ul class="list-unstyled">
                    <li><a href="#" target="_blank">Home</a></li>
                    <li><a href="#" target="_blank">About</a></li>
                    <li><a href="#" target="_blank">Services</a></li>
                    <li><a href="#" target="_blank">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
                <ul class="list-unstyled">
                    <li><a href="#" target="_blank">Home</a></li>
                    <li><a href="#" target="_blank">About</a></li>
                    <li><a href="#" target="_blank">Services</a></li>
                    <li><a href="#" target="_blank">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
                <ul class="list-unstyled">
                    <li><a href="#" target="_blank">Home</a></li>
                    <li><a href="#" target="_blank">About</a></li>
                    <li><a href="#" target="_blank">Services</a></li>
                    <li><a href="#" target="_blank">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
                <ul class="list-unstyled">
                    <li><a href="#" target="_blank">Home</a></li>
                    <li><a href="#" target="_blank">About</a></li>
                    <li><a href="#" target="_blank">Services</a></li>
                    <li><a href="#" target="_blank">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
