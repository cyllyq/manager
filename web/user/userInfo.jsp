<%--
  Created by IntelliJ IDEA.
  User: Ling
  Date: 2020/12/12
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="com.my.pojo.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/manager/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/manager/js/jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });
            $(".tiptop a").click()(function () {
                $(".tip").fadeOut(200);
            });
            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });
            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });
        });
    </script>

</head>
<body>
<div class="place">
    <span>位置:</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">个人信息</a></li>
        <li><a href="#">查看个人信息</a></li>
    </ul>
    <div class="rightinfo">
        <table class="tablelist">
            <thead>
            <tr>
                <th>用户ID<i class="sort"><img src="/manager/images/px.gif"/></i></th>
                <th>用户名</th>
                <th>密码</th>
                <th>性别</th>
                <th>年龄</th>
                <th>出生年月</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><%=((User) session.getAttribute("user")).getUid()%>
                </td>
                <td><%=((User) session.getAttribute("user")).getUname()%>
                </td>
                <td><%=((User) session.getAttribute("user")).getPwd()%>
                </td>
                <%
                    String sex = ((User) session.getAttribute("user")).getSex();
                    if ("1".equals(sex)) {
                %>
                <td>男</td>
                <%} else {%>
                <td>女</td>
                <%} %>
                <td><%=((User) session.getAttribute("user")).getAge()%>
                </td>
                <td><%=((User) session.getAttribute("user")).getBirth()%>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="tip">
            <div class="tiptop"><span>提示信息</span><a></a></div>
            <div class="tipinfo">
                <span><img src="/manager/images/ticon.png"/></span>
                <div class="tipright">
                    <p>是否确认对信息的修改？</p>
                    <cite>如果是请点击确定按钮，否则点击取消</cite>
                </div>
            </div>
            <div class="tipbtn">
                <input name="" type="button" class="sure" value="确定"/>&nbsp;
                <input name="" type="button" class="cancel" value="取消"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
