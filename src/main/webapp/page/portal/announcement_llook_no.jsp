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
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
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

        button.layui-btn-primary.save,
        button.layui-btn-primary.edit {
            width: 240px;
            height: 42px;
            background: #62abff;
            color: #fff;
            position: absolute;
            bottom: -30px;
            left: 35%;
        }
        button.layui-btn-primary.wait,
        button.layui-btn-primary.delete {
             width: 220px;
             color: #62abff;
             border: 1px solid #62abff;
             margin-top: 20px;
         }

        button.layui-btn-primary.wait {
            margin-left: 20%;
        }

        button.layui-btn-primary.delete {
            background: #ff6600;
            border-color: #ff6600;
            color: #fff
        }

        button.layui-btn-primary.save {
            display: none;
        }

        .lang input {
            width: 490px;
        }

        .layui-input-inline input.readonly {
            border: none;
            background: #fff;
        }

        .layui-form-label {
            width: 90px;
        }

        .edit-item.edit {
            display: none;
        }
    </style>
</head>
<body>
<form class="layui-form layui-row" action="">
    <input type="text" name="id" id="id" style="display: none;" value=""/>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">添加人</label>
        <div class="layui-input-inline">
            <input type="text" id="createName" name="createName" placeholder="" autocomplete="off" value="" class="layui-input readonly " readonly>
        </div>
    </div>
    <%--<div class="edit-item layui-col-md6 layui-col-xs6 edit">
        <label class="layui-form-label">添加时间</label>
        <div class="layui-input-inline edit">
            <input type="text" id="createTime_edit" name="createTime" required lay-verify="required" placeholder="" autocomplete="off" value="" class="layui-input readonly " id="time" readonly>
        </div>
    </div>--%>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">添加时间</label>
        <div class="layui-input-inline">
            <input type="text" id="createTime" name="createTime" placeholder="" autocomplete="off" value="" class="layui-input readonly " readonly>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">摘要</label>
        <div class="layui-input-inline">
            <input type="text" id="point" name="point" placeholder="" autocomplete="off" value="" class="layui-input readonly " readonly>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-inline">
            <input type="text" id="serialNumber" name="serialNumber" ErrEmpty="请填写排序编号" placeholder="" autocomplete="off" value="" class="layui-input readonly " readonly>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline lang">
            <input type="text" id="title" name="title" ErrEmpty="请填写标题" placeholder="" autocomplete="off" value="" class="layui-input readonly " readonly>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-inline" style="width: 79%;">
            <textarea class="layui-textarea readonly " ErrEmpty="请填写内容" style="height: 100px;" name="content" id="content" cols="30" rows="10" readonly></textarea>
        </div>
    </div>
    <%
        String opt = request.getParameter("opt");
        if(opt.equals("look")){
    %>
    <button type="button" class="layui-btn layui-btn-primary edit">编辑</button>
    <button type="button" class="layui-btn layui-btn-primary save">保存</button>
    <%
        }
        if(opt.equals("del")){
    %>
    <button type="button" class="layui-btn layui-btn-primary wait" onclick="deleteClose()">再考虑一下</button>
    <button type="button" class="layui-btn layui-btn-primary delete">确定删除</button>
    <%    }
    %>
</form>



<script>
    $(function() {
        layui.use(['form', 'laydate'], function() {
            var form = layui.form;
            var laydate = layui.laydate;
            // laydate.render({
            //     elem: '#time',
            // });
        });

        $("button.edit").click(function() {
            $(this).hide();
            $("button.save").show();
            $(".layui-input").removeAttr("readonly");
            $(".layui-input").removeClass("readonly");
            $(".layui-textarea").removeAttr("readonly");
            $(".layui-textarea").removeClass("readonly");
            // $(".edit-item.save").hide();
            // $(".edit-item.edit").show();
        })

        //上面点击保存编辑
        $("button.save").click(function() {
            var formValidate = validateEmpty();
            if(formValidate){
                //自动获取form表单数据序列化成数组
                var params = $('form').serializeArray();
                var values = {};
                for(var arr in params){
                    values[params[arr].name] = params[arr].value;
                }
                //var postData = JSON.stringify(values);
                jo.postAjax('pms/announcement/update.action', values, function(json){
                    if(json && json.code == "0"){
                        layer.msg(json.info);
                        refreshData();//刷新页面

                    }else{
                        layer.msg(json.info);
                        var key = json.data_id;
                        $("#"+key).focus();
                    }
                }, true);
            }
        })
        //点击删除
        $("button.delete").click(function() {
            var id = $("#id").val();
            if(id){
                jo.postAjax('pms/announcement/delete.action', {id:id}, function(json){
                    if(json && json.code == "0"){
                        layer.msg(json.info);
                        window.parent.refreshAnnoun();//重新加载父页面
                        // deleteClose();
                    }else{
                        layer.msg(json.info);
                    }
                }, true);
            }

        })
        var announId = '<%=request.getParameter("announId")%>';
        //获取公告详情信息
        getAnnounInfo(announId);
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
                }else{
                    $('form')[0].reset();
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
                layer.msg('此项不可为空');
                $(emptys[i]).focus();
                return;
            }
        }
        return formValidate;
    }
    function refreshData(){
        window.parent.refreshAnnoun();//重新加载父页面
        // window.location.reload();
        window.parent.refreshAnnoun();//重新加载父页面
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }

    function deleteClose(){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }
</script>
</body>

</html>
