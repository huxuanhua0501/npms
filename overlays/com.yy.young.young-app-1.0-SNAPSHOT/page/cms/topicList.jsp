<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--常量--%>
    <%@ include file="/common/constHead.jsp"%>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp"%>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp"%>
    <%--bootstrap和字体--%>
    <%@ include file="/common/bootstrapHead.jsp"%>
    <%--layer--%>
    <%@ include file="/common/layerHead.jsp"%>
    <%--zTree树--%>
    <%@ include file="/common/zTreeHead.jsp"%>
    <%--公共--%>
    <%@ include file="/common/commonHead.jsp"%>
    <title>主题视图</title>
    <script type="text/javascript">
        $(function(){
            joView.init({grid:$("#mainList"),PKName:"id"});//初始化页面
        });
        //行处理
        joView.handleItem = function(oItem,iIndex){

        };
    </script>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-lg-12 col-md-12 col-sm-12">
            <%--检索栏--%>
            <form class="form-inline search-bar" id="pageForm">
                <div class="form-group">
                    <label class="control-label">主题编号：&nbsp;</label>
                    <input type="text" name="id" class="form-control input-sm" value="">
                </div>
                <div class="form-group">
                    <label class="control-label">标　　题：&nbsp;</label>
                    <input type="text" name="title" class="form-control input-sm" value="">
                </div>
                <div class="form-group">
                    <label class="control-label">分　　类：&nbsp;</label>
                    <input type="text" name="category" class="form-control input-sm" value="">
                </div>
                <div class="form-group">
                    <label class="control-label">作　　者：&nbsp;</label>
                    <input type="text" name="authorName" class="form-control input-sm" value="">
                </div>
                <div class="form-group">
                    <label class="control-label">应用编号：&nbsp;</label>
                    <input type="text" name="appId" class="form-control input-sm" value="">
                </div>
                <div class="form-group">
                    <label class="control-label">原始编号：&nbsp;</label>
                    <input type="text" name="sourceId" class="form-control input-sm" value="">
                </div>
                <button type="button" class="btn btn-primary btn-sm" onclick="joView.select()"> <i class="fa fa-search" aria-hidden="true"></i>&nbsp;查询</button>
            </form>
            <%--/检索栏--%>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-lg-12 col-md-12 col-sm-12">
            <%--按钮栏--%>
            <div class="form-group button-bar">
                <button isShow="" type="button" class="btn btn-sm btn-outline btn-default" onclick="joView.add()">
                    <i class="fa fa-plus" aria-hidden="true"></i>&nbsp;新增
                </button>
                <button type="button" class="btn btn-sm btn-outline btn-default" onclick="joView.del()">
                    <i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;删除
                </button>
                <button type="button" class="btn btn-sm btn-outline btn-default" onclick="window.location.reload()">
                    <i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;刷新
                </button>
            </div>
            <%--/按钮栏--%>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-lg-12 col-md-12 col-sm-12">
            <%--grid--%>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped table-condensed" id="mainList" dataUrl="cms/topic/getPage.action" deleteUrl="cms/topic/delete.action" formUrl="page/cms/topicForm.jsp">
                    <col field="title" title="标题" width="35%" align="left" event="click"/>
                    <col field="authorName" title="作者" width="15%" align=""/>
                    <col field="[=jo.formatTime({updateTime})]" title="修改时间" width="15%" align=""/>
                    <col field="category" title="分类/频道" width="15%" align=""/>
                    <col field="appId" title="应用编号" width="15%" align=""/>
                </table>
            </div>
            <%--/grid--%>

            <%--分页条--%>
            <div class="page-bar" gridId="mainList">

            </div>
            <%--/分页条--%>
        </div>
    </div>
</div>

<script src="<%=URL_STATIC%>static/plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    jo.formatUI();//格式化jo组件
</script>
</body>
</html>
