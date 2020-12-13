<%--
  Created by IntelliJ IDEA.
  User: Ling
  Date: 2020/12/12
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/manager/css/style.css" rel="stylesheet" type="text/css"/>
    <!--引入jQuery文件  -->
    <script type="text/javascript" src="/manager/js/jquery.js"></script>
    <!--声明jQuery代码域  -->
    <script type="text/javascript">
        $(function () {
            $("#fm").submit(function () {
                if ($("#newPwd").val() == "") {
                    alert("新密码不允许为空");
                    return false;
                } else if ($("#cfPwd").val() == "") {
                    alert("确认密码不允许为空");
                    return false;
                } else if ($("#newPwd").val() != $("#cfPwd").val()) {
                    alert($("#newPwd").val() + " " + $("#cfPwd").val())
                    alert("两次密码不一致");
                    return false;
                } else {
                    return true;
                }
            })
        })
    </script>
</head>
</head>
<body>
<div class="place">
    <span>位置:</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">个人信息</a></li>
        <li><a href="#">修改密码</a></li>
    </ul>

    <div class="formbody">
        <div class="formtitle"><span>修改密码信息</span></div>
        <form action="/manager/user" method="post" id="fm" target="_top">
            <input type="hidden" name="oper" value="pwd"/>
            <ul class="forminfo">
                <li><label>新密码</label><input name="newPwd" id="newPwd" type="text" value="" class="dfinput"/></li>
                <li><label>确认密码</label><input name="" id="cfPwd" type="text" value="" class="dfinput"/></li>
                <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
            </ul>
        </form>
    </div>
</div>
</body>
</html>
