<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>资助项目编辑</title>
    <%--常量--%>
    <%@ include file="/common/constHead.jsp"%>
    <link rel="shortcut icon" href="<%=URL_STATIC%>static/images/favicon.ico">

    <script src="<%=URL_STATIC%>static/final/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/final/css/layui.css">
    <script src="<%=URL_STATIC%>static/final/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/final/font/font2/iconfont.css">
    <!-- <link rel="stylesheet" href="css/person-document.css"> -->
    <script src="<%=URL_STATIC%>static/final/js/lock-common.js"></script>

    <script src="<%=URL_STATIC%>static/newjs/final_jo.js"></script>
    <script src="<%=URL_STATIC%>static/newjs/final_jo-adapt.js"></script>
    <script src="<%=URL_STATIC%>static/js/common.js"></script>
    <script src="<%=URL_STATIC%>static/js/common_biz.js"></script>
    <script src="<%=URL_STATIC%>static/newjs/final_normal_form.js"></script>
    <script>
        $(function(){
            var jParams = {
                "PKName" : "id",//主键属性名
                "auditPKName" : "id",//用于获取审核库数据时用到的主键字段类是userID获取到的是list，必须写
                "saveAfter" : "",//保存之后是关闭还是继续编辑toEdit默认close
                "addUrl" : "pms/auditPmsSupportProject/auditInsert.action",//新增
                "deleteUrl" : "pms/auditPmsSupportProject/delete.action",//删除
                "updateUrl" : "pms/auditPmsSupportProject/update.action",//修改
                "formDataUrl" : "pms/pmsSupportProject/get.action",	//正式库信息
                "auditDataUrl" : "pms/auditPmsSupportProject/get.action"//审核库中的信息,列表类此参数其实没用到
            };

            var sf = jo.getDefVal(jo.getUrlParam("sf"),"");
            // if (jo.isValid(sf)) {
                jParams["addUrl"] = "pms/auditPmsSupportProject/auditInsert.action?sf=rs";
                jParams["updateUrl"] = "pms/auditPmsSupportProject/update.action?sf=rs";
            // }

            joForm.initFormPage(jParams);//初始化
        });
        joForm.spliceStatus = function(formAuditData){
            console.log("JSP打印参数；" + JSON.stringify(formAuditData));
            console.log("JSP打印参数条目是否锁定1：" + (formAuditData.lockStatus));
            // if (loginUser.roleName == "普通员工") {
            if (loginUser.roleId == "72b51c53a39744fe9d8b380910c77e63") {
                if (formAuditData.lockStatus == 1 || formAuditData.lockStatus == "") {
                    $("input[type!='hidden']").attr("disabled", "disabled");
                    $("input").attr("background", "#FFF");
                    $("input").css("border", "none");
                    $("select").attr("disabled", "disabled");
                }
            }
        }

        joForm.initFormValueAfter = function(){
        };
        //新增页面的初始化,当传入userId时,对userId参数进行赋值处理
        joForm.initFormPageOfAdd = function(){
            userIdHandleInAddForm();//userId字段处理
        }
    </script>
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
            bottom: -70px;
            left: 35%;
        }

        .lang input,
        .layui-input-inline.lang {
            width: 506px;
        }

        .layui-form-label {
            width: 90px;
        }
    </style>
</head>

<body>
<form id="pageForm" class="layui-form layui-row" action="">
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">计划项目名称</label>
        <div class="layui-input-inline lang">
            <input type="text" name="planProjectName" ErrEmpty placeholder="" autocomplete="off" class="layui-input">
            <input type="hidden" id="userId" name="userId" />
            <input type="hidden" id="id" name="id"/>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">人才层次</label>
        <div class="layui-input-inline lang">
            <input type="text" name="personnelLevel" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">年　　月</label>
        <div class="layui-input-inline lang">
            <input type="text" name="years" ErrBirthBad4 placeholder="" autocomplete="off" class="layui-input" id="time">
        </div>
    </div>

    <button type="button" class="layui-btn layui-btn-primary save" isShow="joForm.isAdd" onclick="joForm.save()">保存</button>
    <button type="button" class="layui-btn layui-btn-primary save" isShow="!joForm.isAdd" onclick="joForm.update()">修改</button>
</form>



<script>
    $(function() {
        layui.use(['form', 'laydate'], function() {
            var form = layui.form;
            var laydate = layui.laydate;
/*            laydate.render({
                elem: '#time'
                ,type: 'month'//new
            });*/
        });
    })
</script>
<script type="text/javascript">
    jo.formatUI();//格式化jo组件
</script>
</body>

</html>
