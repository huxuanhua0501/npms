<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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
    <%--公共--%>
    <%@ include file="/common/commonHead.jsp"%>
    <%--日期选择--%>
    <%@ include file="/common/dateHead.jsp"%>
    <%@ include file="/common/uploadHeadOfImg.jsp"%>
        <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
        <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
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
                bottom: -240px;
                left: 42%;
            }

            .lang input {
                width: 506px;
            }

            .layui-form-label {
                width: 90px;
            }
        </style>

        <title>人员新增</title>
    <script type="text/javascript">
        $(function(){

            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/PERSON_TYPE",
                dataType: "text",
                async:false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                      listline += '<select name=\"remark\" lay-verify=\"\">';
                      listline += '<option value=\"\"></option>';
                    for (var i = 0; i < obj.data.length; i++) {
                        // listline += '<input type=\"checkbox\" name=\"workType\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                          listline += '<option value=' + obj.data[i].dicValue + '>'+obj.data[i].dicValue+'</option>';

                    }
                    $("#selectGo").html(listline);

                }

            });




            var jParams = {
                "PKName" : "id",//主键属性名
                "saveAfter" : "close",
                "addUrl" : "pms/pmsUser/ninsert.action",//新增
                "deleteUrl" : "pms/pmsUser/delete.action",//删除
                "updateUrl" : "pms/pmsUser/update.action",//修改
                "formDataUrl" : "pms/pmsUser/get.action"	//查询
            };
            joForm.initFormPage(jParams);//初始化
        });
        //初始化表单值前处理
        joForm.initFormValueBefore = function(oJson){
        };
        //表单初始化值的后置处理,在此对formData进行判断,如果没有从后台查到结果(formData为{}),说明应该执行新增
        joForm.initFormValueAfter = function(){
            if(!joForm.formData.id){//新增表单,需要对joForm对象进行校正
                joFormUpdateToAdd(true);//修改表单转新增表单
            }else{
                $("#header").attr("src", "fs/file/image?id="+joForm.formData.photoAddress);
            }
        };
        //新增页面的初始化,当传入userId时,对userId参数进行赋值处理
        joForm.initFormPageOfAdd = function(){
            userIdHandleInAddForm();//userId字段处理
            if(jo.getUrlParam("id") && document.getElementsByName("id")[0]){
                document.getElementsByName("id")[0].value = jo.getUrlParam("id");//设置主键值
                $(document.getElementsByName("id")[0]).attr("readonly",true);
            }
        };
        //选择部门
        function choiceDept(idInp, nameInp, bMore){
            jo.selectTree('{URL_UMS}ums/tree/getDeptTree.action',jo.getDefVal(idInp, 'PARENT_ID'),jo.getDefVal(nameInp, 'PARENT_NAME'),'ID','NAME', 'PARENT_ID', bMore);
        }
    </script>
</head>
<body>
    <form id="pageForm" name="pageForm" action="" method="post" class="layui-form layui-row" >

    <div class="edit-item layui-col-md4 layui-col-xs4">
        <label class="layui-form-label sex-label">账号</label>
        <div class="layui-input-inline sex-inline">
            <input type="text" name="userId" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="">
        </div>
    </div>
    <div class="edit-item layui-col-md4 layui-col-xs4">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="userName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div  class="edit-item layui-col-md4 layui-col-xs4">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-inline" id="selectGo">
           <%-- <select name="remark" lay-verify="">
                <option value=""></option>
                <option value="在编">在编</option>
                <option value="院聘">院聘</option>
                <option value="劳务派遣">劳务派遣</option>
                <option value="劳务协议">劳务协议</option>
                <option value="博士后">博士后</option>
                <option value="学生">学生</option>
                <option value="实习学生">实习学生</option>
            </select>--%>
        </div>
    </div>
    <div class="edit-item layui-col-md4 layui-col-xs4">
        <label class="layui-form-label">所属单位</label>
        <div class="layui-input-inline">
            <input type="hidden" id="deptIds" name="deptIds" class="form-control input-sm" value="">
            <input type="text" id="names" name="deptNames" required lay-verify="required" placeholder=""
                   autocomplete="off" class="layui-input list-input"
                   style="width: 100px;display: inline-block;">
            <span class="input-group-btn" style=" display: inline-block;">
                                        <button class="layui-btn layui-btn-primary choose-btn" type="button"
                                                onclick="choiceDept('deptIds','names',true)">
                                            <i class="iconfont icon-menu" aria-hidden="true"></i>&nbsp;选择
                                        </button>
                                    </span>
        </div>

    </div>
    <div class="edit-item layui-col-md4 layui-col-xs4">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-inline">
            <input type="text" name="num" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>

    <button class="layui-btn layui-btn-primary save" onclick="joForm.save()"> 保存</button>
</form>



<script>
    $(function() {
        layui.use(['form', 'laydate'], function() {
            var form = layui.form;
            var laydate = layui.laydate;

        });
    })
</script>
</body>

</html>
