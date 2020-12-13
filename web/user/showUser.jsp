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
            $(".tiptop a").click(function () {
                $(".tip").fadeIn(200);
            });
            $(".cancel").click(function () {
                $(".tip").fadeIn(200);
            });
        });
    </script>
</head>
<body>
<div class="place">
    <span>位置:</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">管理信息</a></li>
        <li><a href="#">查看用户信息</a></li>
    </ul>
</div>

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
        <%
            List<User> lu = (ArrayList<User>) request.getAttribute("lu");
            for (User u : lu) {
        %>
        <tr>
            <td><%=u.getUid() %>
            </td>
            <td><%=u.getUname() %>
            </td>
            <td><%=u.getPwd() %>
            </td>
            <%
                if ("1".equals(u.getSex())) {
            %>
            <td>男</td>
            <%} else { %>
            <td>女</td>
            <%} %>
            <td><%=u.getAge()%>
            </td>
            <td><%=u.getBirth()%>
            </td>
        </tr>
        <%} %>
        </tbody>
    </table>

    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
            <span><img src="/manager/images/ticon.png"/></span>
            <div class="tipright">
                <p>是否确认对信息的修改</p>
                <cite>如果是请点击确定按钮，否则点击取消</cite>
            </div>
        </div>
        <div class="tipbtn">
            <input name="" type="button" class="sure" value="确定"/>$nbsp;
            <input name="" type="button" class="cancel" value="取消"/>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".tablelist tbody tr:odd").addClass('odd');
</script>
</body>
</html>