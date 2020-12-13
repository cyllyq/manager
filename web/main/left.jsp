<%--
  Created by IntelliJ IDEA.
  User: Ling
  Date: 2020/12/12
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/manager/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="/manager/js/jquery.js"></script>

    <script type="text/javascript">
        $(function () {
            //导航切换
            $(".menuson .header").click(function () {
                var $parent = $(this).parent();
                $(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();

                $parent.addClass("active");
                if (!!$(this).next('.sub-menus').size()) {
                    if ($parent.hasClass("open")) {
                        $parent.removeClass("open").find('.sub-menus').hide();
                    } else {
                        $parent.addClass("open").find('.sub-menus').show();
                    }
                }
            });

            //三级菜单点击
            $('.sub-menus li').click(function (e) {
                $(".sub-menus li.active").removeClass("active");
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('.menuson').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('.menuson').slideUp();
                } else {
                    $(this).next('.menuson').slideDown();
                }
            });

        })
    </script>
</head>
<body style="background: #FFF3E1;">
<div class="lefttop">
    <span></span>通讯录
</div>
<dl>
    <dd>
        <div class="title">
            <span><img src="/manager/images/leftico01.png"/></span>个人信息
        </div>
        <ul class="menuson">
            <li>
                <cite></cite><a href="/manager/user/userInfo.jsp" target="rightFrame">查看个人信息</a><i></i>
            </li>
            <li>
                <cite></cite><a href="/manager/user/pwd.jsp" target="rightFrame">修改密码</a><i></i>
            </li>
        </ul>
    </dd>
    <dd>
        <div class="title">
            <span><img src="/manager/images/leftico01.png"/></span>管理信息
        </div>
        <ul class="menuson">
            <li>
                <cite></cite><a href="/manager/user?oper=show" target="rightFrame">查看用户信息</a><i></i>
            </li>
        </ul>
    </dd>
</dl>
</body>
</html>
