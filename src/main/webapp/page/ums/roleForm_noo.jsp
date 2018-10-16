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
    <%--公共--%>
    <%@ include file="/common/commonHead.jsp"%>
    <title>角色表单</title>
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
            bottom: 5px;
            left: 35%;
        }

        .lang input {
            width: 490px;
        }

        .layui-form-label {
            width: 90px;
        }
        .downpanel .layui-select-title span {
            line-height: 38px;
            min-width: 180px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            var jParams = {
                "PKName" : "ID",//主键
                "saveAfter" : "toEdit",
                "addUrl" : "ums/role/insertRole.action",//新增
                "deleteUrl" : "ums/role/deleteRole.action",//删除
                "updateUrl" : "ums/role/updateRole.action",//修改
                "formDataUrl" : "ums/role/getRoleList.action"	//查询
            };
            joForm.initFormPage(jParams);//初始化

        });
        //编辑页表单初始化结束后操作
        joForm.initFormValueAfter = function(){
            if($("#TYPE").val() == "ADMIN"){
                $("#rangeBtn").attr("disabled", false);
            }else{
                $("#rangeBtn").attr("disabled", true);
            }
        };
        //初始化新增页
        joForm.initFormPageOfAdd = function(){
            $("#COMPANY_ID").val(jo.getUrlParam("deptId"));
            $("#COMPANY_NAME").val(jo.getUrlParam("deptName"));
            $("#rangeBtn").attr("disabled", true);//禁用范围选择按钮
        };
        //角色类型改变事件
        function roleChange(role){
            if(role == "ADMIN"){
                $("#rangeBtn").attr("disabled", false);
            }else{
                $("#RANGE_ID").val("");
                $("#RANGE_NAME").val("");
                $("#rangeBtn").attr("disabled", true);//禁用范围选择按钮
            }
        }
        //
    </script>
</head>
<body class="padding-15">
<form id="pageForm" name="pageForm" action="" method="post" >
        <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
            <tr>
                <td width="15%" class="active" align="">编　　号</td>
                <td class="layui-input-inline">
                    <input type="text" name="ID" class="form-control input-sm" ErrLength="32">
                </td>

                <td width="15%" class="active must">角色名称</td>
                <td>
                    <%--<input type="text" name="NAME"/>--%>
                    <input type="text" name="NAME" class="form-control input-sm" ErrEmpty="角色名称不允许为空">
                </td>
            </tr>
            <tr>
                <td class="active">管理范围</td>
                <td>
                    <%--<input type="text" name="RANGE_ID" style="width:calc(100% - 65px);"/>
                    <input type="button" value="选择" onClick=""/>--%>
                    <div class="input-group">
                        <input type="hidden" id="RANGE_ID" name="RANGE_ID" class="form-control input-sm">
                        <input type="text" id="RANGE_NAME" name="RANGE_NAME" class="form-control input-sm">
                        <span class="input-group-btn">
                            <button id="rangeBtn" class="btn btn-default btn-sm" type="button" onclick="choiceOrg('RANGE_ID','RANGE_NAME')">
                                <i class="fa fa-bars" aria-hidden="true"></i>&nbsp;选择
                            </button>
                        </span>
                    </div>
                </td>
                <td class="active">角色类型</td>
                <td>
                   <select class="form-control input-sm" id="TYPE" name="TYPE" onchange="roleChange(this.value)">
                       <option value="NORMAL">普通角色</option>
                       <option value="ADMIN">管理员角色</option>

                   </select>
                </td>
            </tr>
            <tr>
                <td class="active must">所属单位</td>
                <td>
                    <div class="input-group">
                        <input type="hidden" id="COMPANY_ID" name="COMPANY_ID" class="form-control input-sm" ErrEmpty="所属单位不可以为空" onchange="">
                        <input type="text" id="COMPANY_NAME" name="COMPANY_NAME" class="form-control input-sm">
                        <span class="input-group-btn">
                            <button class="btn btn-default btn-sm" type="button" onclick="choiceCompany('COMPANY_ID','COMPANY_NAME')">
                                <i class="fa fa-bars" aria-hidden="true"></i>&nbsp;选择
                            </button>
                        </span>
                    </div>
                </td>
                <td class="active">排　　序</td>
                <td>
                    <%--<input type="text" name="NUM" value="99"/>--%>
                    <input type="text" name="NUM" value="99" class="form-control input-sm" ErrNumber>
                </td>
            </tr>
            <tr>
                <td class="active">备　　注</td>
                <td colspan="3">
                    <input type="text" name="REMARK" class="form-control input-sm">
                </td>

            </tr>
        </table>
    <div class="form-group button-bar">
        <button type="button" isShow="joForm.isAdd" class="layui-btn layui-btn-primary save" onclick="joForm.save()">
            <i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;保存
        </button>
        <button type="button" isShow="!joForm.isAdd" class="layui-btn layui-btn-primary save" onclick="joForm.update()">
            <i class="fa fa-pencil-square" aria-hidden="true"></i>&nbsp;保存
        </button>
    </div>
    </form>
</body>
</html>
