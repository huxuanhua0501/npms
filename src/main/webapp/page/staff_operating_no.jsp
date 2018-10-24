<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--常量--%>
    <%@ include file="/common/constHead.jsp"%>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp"%>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp"%>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/common.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/help.css">
    <title>普通人员使用指南</title>
</head>
<body>
<div class="container">
    <div class="layui-row">
        <div class="layui-col-md12 help">
            <div class="help-tit clear">
                <span class="left title">普通人员使用指南</span>
            </div>

        </div>
    </div>

    <div class="help-content">
        <p>1. 查看今天日期，可<a lay-href="page/portal/home_no.jsp">进入首页</a>快速查看。</p>
        <p>2. 可以通过查看个人档案快速浏览个人信息点击<a lay-href="page/personal/myDoc.jsp">进行查看</a>。</p>
        <p>3. 个税/社保计算器<a lay-href="page/portal/home_no.jsp">首页查看</a>。</p>
        <p>4. 查看最近公告，请进入<a lay-href="page/portal/home_announcement_list_no.jsp">公告列表页</a>。</p>
        <p>5. 本系统为内部系统，用户登录账号信息由管理员设定开通，如果登陆信息遗忘，请联系<a href="javascript:;">**部 王某某， 电话 *** </a>。<br/>暂不支持自主注册用户，感谢您的支持和谅解。</p>
    </div>
</div>
<script>
    $(function() {
        layui.use(['layer', 'form', 'laydate'], function() {
            var form = layui.form;
            var layer = layui.layer;
            var laydate = layui.laydate;

        });

        $(".help-content a").click(function() {
            if ($(this).attr("lay-href")) {
                window.location.href = $(this).attr("lay-href");
            }
        })
    })
</script>
</body>
</html>
