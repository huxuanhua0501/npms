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
    <%@ include file="/common/commonHead_no.jsp"%>
     <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/announcement-list.css">
   <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script type="text/javascript">
        var page;
        $(function () {
            loadAnnouncementList(1);
        });
        function announcement_page(type){
            if(page){
                var currentPage = page.pageNumber;
                var total = page.total;
                var size = page.pageSize;
                var lastPage = Math.ceil(total/size);//尾页
                var gotoPage;
                if(type == 'first'){
                    gotoPage = 1;
                }else if (type == 'last'){
                    gotoPage = lastPage;
                }else  if(type == 'prev'){
                    gotoPage = currentPage -1;
                    if(gotoPage < 1)
                        gotoPage = 1;
                }else if(type == 'next'){
                    gotoPage = currentPage +1;
                    if(gotoPage > lastPage)
                        gotoPage = lastPage;
                }
                loadAnnouncementList(gotoPage);
            }else{
                loadAnnouncementList(1);
            }

        }
        function loadAnnouncementList(gotoPage) {
            if(!gotoPage)
                gotoPage =1;

            var sUrl = 'pms/announcement/getPage.action?pageNumber='+gotoPage;
            jo.postAjax(sUrl, {}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        page = json;
                        var list = json.data;
                        var liHtml ='';
                        for(var i =0;i<list.length;i++){
                            var title = list[i].title;
                            var createTime = list[i].createTime;
                            var id = list[i].id;
                            var content = list[i].content;
                            //if(content && content.length > 120){
                           //     content = content.substr(0,120)+'......';
                           // }
                            liHtml += '<li class="clear">\n' +
                                '                    <a href="<%=basePath%>page/portal/home_announcement_detail_no.jsp?announId='+id+'" class="left">\n' +
                                '                        <h2>'+title+'</h2>\n' +
                                '                        <p>'+content+'\n' +
                                '                        </p>\n' +
                                '                    </a>\n' +
                                '                    <span class="date right">'+createTime+'</span><br />\n' +
                                '                </li>';
                        }
                        $("#announcement_total").html(json.total);
                        $("#announcement_list").html(liHtml);
                    }else{
                        $("#announcement_total").html('0');
                        $("#announcement_list").html('');
                        page = null;
                    }
                }
            }, true);
        }
    </script>
</head>

<body>
<div class="container">
    <div class="layui-row">
        <div class="layui-col-md12 announcement">
            <div class="announcement-tit">
                公告列表
            </div>
            <div class="prompt">共<span id="announcement_total"></span>条记录</div>
            <ul id="announcement_list">
            </ul>
            <div id="pages" style="padding:30px;">
                <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('last')">尾页</button>
                <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('next')">下一页</button>
                <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('prev')">上一页</button>
                <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('first')">首页</button>
            </div>
        </div>
    </div>
</div>
</body>

</html>