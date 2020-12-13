<%--
  Created by IntelliJ IDEA.
  User: Ling
  Date: 2020/12/12
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="com.my.pojo.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>无标题文档</title>
    <link href="/manager/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/manager/js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            //顶部导航切换
            $(".nav li a").click(function () {
                $(".nav li a.selected").removeClass("selected");
                $(this).addClass("selected");
            })
            //退出功能
            $("#out").click(function () {
                var flag = window.confirm("你真的要退出吗？");
                if (flag) {
                }
                window.top.location.href = "/manager/user?oper=out";
            })
        })
    </script>
</head>

<body style="background: url(/images/topbg.gif) repeat-x;">
<div class="topleft">
    <a href="main.html" target="_parent"><img src="/manager/images/logo.png" titile="系统首页"/></a>
</div>

<div class="topright">
    <ul>
        <li>
            <a href="javascript:void(0)" id="out">退出</a>
        </li>
    </ul>
    <div class="user">
        <span><%=((User) session.getAttribute("user")).getUname()%></span>
    </div>
</div>
</body>
</html>
