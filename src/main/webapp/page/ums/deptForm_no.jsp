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
    <%--公共--%>
    <%@ include file="/common/commonHead.jsp"%>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <title>部门表单</title>
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
            width: 506px;
        }

        .layui-form-label {
            width: 90px;
        }

        .choose-btn {
            height: 32px;
            background: #fff;
            border: 1px solid #ccc !important;
            font-size: 12px;
            padding: 0 10px;
            line-height: 32px;
        }

        .input-group-btn {
            position: absolute;
            right: 0;
            top: 0;
        }
    </style>
</head>
<body>
<form id="pageForm" name="pageForm" action="" method="post" class="layui-form layui-row">
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-inline">
            <input type="text" id="ID" name="ID" placeholder="编号为空时将使用系统默认值" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <input type="text" name="NAME" autocomplete="off" class="layui-input" ErrEmpty onchange="setShortName(this.value)">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-inline">
            <select name="TYPE" lay-verify="">
                <option value=""></option>
                <option value="DEPT" selected>部门</option>
                <option value="COMPANY">单位</option>
                <option value="OTHER">其他</option>
            </select>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" id="CREATE_TIME" name="CREATE_TIME" autocomplete="off" class="layui-input" readonly >
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">部门简称</label>
        <div class="layui-input-inline">
            <input type="text" id="SHORT_NAME" name="SHORT_NAME" autocomplete="off" class="layui-input" ErrEmpty>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">上级部门</label>
        <div class="layui-input-inline">
            <input type="hidden" id="PARENT_ID" name="PARENT_ID" class="form-control input-sm" ErrEmpty="上级部门不可以为空">
            <input type="text" id="PARENT_NAME" name="PARENT_NAME"  class="layui-input">
            <span class="input-group-btn">
                <button class="layui-btn layui-btn-primary choose-btn" type="button" onclick="choiceOrg()">
                    <i class="iconfont icon-menu" aria-hidden="true"></i>&nbsp;选择
                </button>
            </span>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">部门层级</label>
        <div class="layui-input-inline">
            <input type="text" id="DEPT_LEVEL" name="DEPT_LEVEL"  autocomplete="off" class="layui-input" ErrEmpty>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-inline">
            <input type="text" id="NUM" name="NUM" value="99" autocomplete="off" class="layui-input" ErrEmpty>
        </div>
    </div>
    <input type="text" name="WHOLE_ID"  style="display: none;">
    <input type="text" name="WHOLE_NAME"  style="display: none;">
    <button type="button" class="layui-btn layui-btn-primary save" onclick="deptSave()">保存</button>
</form>
<script type="text/javascript">
    var id = '<%=request.getParameter("ID")==null?"":request.getParameter("ID")%>';
    var layer,form;
    $(function(){
        if(id){}else{
            $("#ID").removeAttr("readonly");
            $("#CREATE_TIME").removeAttr("readonly");
        }
        layui.use(['layer','form'], function() {
            layer = layui.layer,form = layui.form;
            var jParams = {
                "PKName" : "ID",//主键
                "saveAfter" : "toEdit",
                "addUrl" : "ums/dept/insertDept.action",//新增
                "deleteUrl" : "ums/dept/deleteDept.action",//删除
                "updateUrl" : "ums/dept/updateDept.action",//修改
                "formDataUrl" : "ums/dept/getDeptList.action"	//查询
            };
            joForm.initFormPage(jParams);//初始化
            //初始化新增页
            joForm.initFormPageOfAdd = function(){
                $("#PARENT_ID").val(jo.getUrlParam("deptId"));
                $("#PARENT_NAME").val(jo.getUrlParam("deptName"));
                if(jo.isValid(jo.getUrlParam("deptLevel"))){
                    $("#DEPT_LEVEL").val(parseInt(jo.getUrlParam("deptLevel"))+1);
                }
            };
        });
        dealTime();
    });

    //部门名称发生变化时设置部门简称
    function setShortName(str){
        $("#SHORT_NAME").val(jo.getDefVal(str, ""));
    }
    //新增、编辑保存
    function deptSave(){
        var createTime = $("#CREATE_TIME").val();
        var num = $("#NUM").val();
        if(createTime){
            var t = /^(\d{4})-(\d{2})-(\d{2})$/;
            if (!t.test(createTime)) {
                layer.msg("创建时间格式不正确");
                $("#CREATE_TIME").focus();
                return false;
            }
        }
        if(num){
            var t = /(^[1-9]\d*$)/;
            if(!t.test(num)){
                layer.msg("排序必须为数字");
                $("#NUM").focus();
                return false;
            }
        }
        if(id){//编辑
            joForm.update();
        }else{//新增
            joForm.save();
        }
        window.parent.refreshDeptList();
    }
    //处理添加时间
    function dealTime(){
        var time = $("#CREATE_TIME").val();
        if(!time){
            var date = new Date();
            var seperator1 = "-";
            // var seperator2 = ":";
            var month = date.getMonth() + 1;
             var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            // var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            //     + " " + date.getHours() + seperator2 + date.getMinutes()
            //     + seperator2 + date.getSeconds();
            var current = date.getFullYear()+seperator1+month+seperator1+strDate;
            $("#CREATE_TIME").val(current);
        }
    }
</script>
</body>
</html>
