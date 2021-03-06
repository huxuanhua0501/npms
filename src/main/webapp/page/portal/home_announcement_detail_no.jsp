<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <%--常量--%>
    <%@ include file="/common/constHead.jsp"%>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp"%>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp"%>
    <%--公共--%>
    <%@ include file="/common/commonHead.jsp"%>
     <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/announcement-list.css">
   <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script type="text/javascript">
        var announcementId = "<%=request.getParameter("announId")%>";
        var type = "<%=request.getParameter("orgType")%>";
        $(function () {
            if(announcementId) {
                var sUrl = 'pms/announcement/get.action?id=' + announcementId;
                jo.postAjax(sUrl, {}, function(json){
                    if(json && json.code == "0"){
                        if(json.data && json.data[0]){
                            var annoumcement = json.data[0];
                            var inHtml = '<h2>'+annoumcement.title+'</h2>\n' +
                                '                <p class="sm-tit">创建者：<span class="person">'+annoumcement.createName+'</span> <span class="date">'+annoumcement.createTime+'</span></p>\n' +
                                '                <p>'+annoumcement.content+'</p>';
                            $("#announcement_detail").html(inHtml);
                        }
                    }
                }, true);
            }
        });
        function goBack(){
            if(type == "layerOpen"){//公告查看
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            }else{
                history.back(-1);
            }
        }
    </script>
</head>

<body>
<div class="container">
    <div class="layui-row">
        <div class="layui-col-md12 announcement">
            <div class="announcement-tit clear">
                <span class="left">详情</span>
                <button class="layui-btn layui-btn-radius layui-btn-normal right" onclick="goBack()">返回</button>
            </div>
            <div class="announcement-content" id="announcement_detail">

            </div>
        </div>
    </div>
</div>



<script>
</script>
</body>

</html>