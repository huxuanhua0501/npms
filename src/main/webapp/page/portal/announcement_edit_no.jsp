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
    <%--公共--%>
    <%@ include file="/common/commonHead_no.jsp"%>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/eWebEditor/ueditor.config.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/eWebEditor/ueditor.all.min.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <title>编辑公告</title>
    <style>
        .layui-input-inline {
            width: 180px;
        }

        .layui-input-inline input {
            height: 32px;
            background: #FCFCFC;
            border: 1px solid #DDDDDD;
            border-radius: 4px;
        }

        .layui-form {
            padding-top: 30px;
            padding-bottom: 30px;
            padding-right: 30px;
            position: relative;
        }

        .edit-item {
            margin-bottom: 10px;
        }

        button.layui-btn-primary.save {
            width: 240px;
            height: 42px;
            background: #62abff;
            color: #fff;
            position: absolute;
            bottom: -30px;
            left: 35%;
        }

        .lang input {
            width: 482px;
        }

        .layui-form-label {
            width: 90px;
        }
    </style>
</head>
<body>
<form class="layui-form layui-row" action="">
    <input type="text" name="id" id="id" style="display: none;" value=""/>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">添加人</label>
        <div class="layui-input-inline">
            <input type="text" id="createName" name="createName"  placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">添加时间</label>
        <div class="layui-input-inline">
            <input type="text" id="createTime" name="createTime" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">摘要</label>
        <div class="layui-input-inline">
            <input type="text" id="point" name="point" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-inline">
            <input type="text" id="serialNumber" name="serialNumber" ErrEmpty="公告排序"  placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline lang">
            <input type="text" id="title" name="title" ErrEmpty="公告标题" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">内容</label>
        <input type="text" name="content" id="content" style="display: none;" value=""/>
        <div class="layui-input-inline" style="width: 79%;">
            <%--<script id="editor" type="text/plain" style="width:100%;height:200px;" ></script>--%>
        </div>
    </div>
    <button type="button" class="layui-btn layui-btn-primary save">保存</button>
</form>



<script>
    var ue;
    $(function() {
        var opt = '<%=request.getParameter("opt")%>';
        layui.use(['form', 'laydate'], function() {
            var form = layui.form;
            var laydate = layui.laydate;
        });
        ue = UE.getEditor('editor');

        //上面点击保存编辑
        $("button.save").click(function() {
            var formValidate = validateEmpty();
            if(formValidate){
                $("#content").val(ue.getContent());
                //自动获取form表单数据序列化成数组
                var params = $('form').serializeArray();
                var values = {};
                for(var arr in params){
                    values[params[arr].name] = params[arr].value;
                }
                //var postData = JSON.stringify(values);
                var sUrl;
                if(opt == 'edit'){
                    sUrl = 'pms/announcement/update.action';
                }else if(opt == 'add'){
                    sUrl = 'pms/announcement/insert.action';
                }
                jo.postAjax(sUrl, values, function(json){
                    if(json && json.code == "0"){
                        refreshData();//刷新页面
                        layer.msg(json.info);

                    }else{
                        layer.msg(json.info);
                        var key = json.data_id;
                        $("#"+key).focus();
                    }
                }, true);
            }
        })

        if(opt == 'edit'){
            var announId = '<%=request.getParameter("announId")%>';
            //获取公告详情信息
            getAnnounInfo(announId);
        }else if(opt == 'add'){
            getMaxNum();//获取最大排序序号
        }

    });
    //获取公告详情
    function getAnnounInfo(id){
        jo.postAjax('pms/announcement/get.action', {id:id}, function(json){
            if(json && json.code == "0"){
                if(json.data && json.data[0]){
                    var announ = json.data[0];
                    for(var key in announ){
                        $('form [name='+key+']').val(announ[key]);
                    }
                    var content = announ.content;
                    ue.ready(function(){
                        ue.setContent(content);
                    });
                }else{
                    $('form')[0].reset();
                }
            }
        }, true);
    }
    //新增时获取最大排序序号
    function getMaxNum(){
        jo.postAjax('pms/announcement/getMax.action', {}, function(json){
            if(json && json.code == "0"){
                if(json.data && json.data[0]){
                    var announ = json.data[0];
                    var defNum =parseInt(announ.serialNumber)+1;
                    $("#serialNumber").val(defNum);
                }
            }
        }, true);
    }
    //表单提交的非空判断
    function validateEmpty(){
        var formValidate = true;
        //表单校验
        var emptys = $('form [ErrEmpty]');
        for(var i=0;i<emptys.length;i++){
            if(emptys[i].value){}else{
                formValidate = false;
                layer.msg('该项不可为空');
                $(emptys[i]).focus();
                return;
            }
        }
        var content = ue.getContent();
        if(content){}else{
            formValidate = false;
            layer.msg('公告内容不可为空');
        }
        return formValidate;
    }
    function refreshData(){
        window.parent.refreshAnnoun();//重新加载父页面
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }
</script>
</body>

</html>
