<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>家庭成员编辑</title>
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
                "addUrl" : "pms/auditPmsRelations/auditInsert.action",//新增
                "deleteUrl" : "pms/relation/delete.action",//删除
                "updateUrl" : "pms/auditPmsRelations/update.action",//修改
                "formDataUrl" : "pms/relation/get.action",	//正式库信息
                "auditDataUrl" : "pms/auditPmsRelations/get.action"//审核库中的信息,列表类此参数其实没用到
            };

            var sf = jo.getDefVal(jo.getUrlParam("sf"),"");
            console.log("打印表单属性sf："  + sf);
            if (jo.isValid(sf)) {
                jParams["addUrl"] = "pms/auditPmsRelations/auditInsert.action?sf=rs";
                jParams["updateUrl"] = "pms/auditPmsRelations/update.action?sf=rs";
            }

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
            bottom: -30px;
            left: 35%;
        }

        .lang input {
            width: 506px;
        }
    </style>
</head>

<body>
<form id="pageForm" class="layui-form layui-row" action="">
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">姓　　名</label>
        <div class="layui-input-inline">
            <input type="text" name="name"  placeholder="" autocomplete="off" class="layui-input" ErrEmpty="姓名不允许为空">
            <input type="hidden" id="userId" name="userId" />
            <input type="hidden" id="id" name="id"/>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">关　　系</label>
        <div class="layui-input-inline">
            <input type="text" name="relation"  placeholder="例如: 父亲/妻子/儿子/朋友/同学等" autocomplete="off" class="layui-input" ErrEmpty="关系不允许为空" >
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label sex-label">性　　别</label>
        <div class="layui-input-inline sex-inline">
            <select name="sex" lay-verify="">
                <option value=""></option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-inline">
            <input type="text" name="birthday"  placeholder="格式：2018-08" autocomplete="off" class="layui-input" ErrBirthBad4>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-inline">
            <input type="number" name="tel"  placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label sex-label">工作单位及职务</label>
        <div class="layui-input-inline sex-inline">
            <input type="text" name="unit"  placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">关系类型</label>
        <div class="layui-input-inline">
            <select name="stype" lay-verify="">
                <option value=""></option>
                <option value="家庭成员">家庭成员</option>
                <option value="社会关系">社会关系</option>
            </select>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label sex-label">显示顺序</label>
        <div class="layui-input-inline sex-inline">
            <input type="text" name="num"  placeholder="" autocomplete="off" class="layui-input" value="10">
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
                elem: '#birthday'
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