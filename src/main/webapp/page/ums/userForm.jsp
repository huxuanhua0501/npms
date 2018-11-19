<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--常量--%>
    <%@ include file="/common/constHead.jsp" %>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp" %>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp" %>
    <%--bootstrap和字体--%>
    <%@ include file="/common/bootstrapHead.jsp" %>
    <%--layer--%>
    <%@ include file="/common/layerHead.jsp" %>
    <%--日期头--%>
    <%@ include file="/common/dateHead.jsp" %>
    <%--公共--%>
    <%@ include file="/common/commonHead.jsp" %>


    <title>用户表单</title>
    <script type="text/javascript">
        $(function () {
            var jParams = {
                "PKName": "ID",//主键
                "saveAfter": "toEdit",
                "addUrl": "pms/pmsUser/adinsert.action",//新增old
                // "addUrl" : "pms/pmsUser/adinsert.action",//新增
                "deleteUrl": "ums/user/deleteUser.action",//删除
                // "updateUrl" : "ums/user/updateUser.action",//修改pms/pmsUser/updateUser.action
                "updateUrl": "pms/pmsUser/updateUser.action",//修改
                "formDataUrl": "ums/user/getUserList.action"	//查询
            };
            joForm.initFormPage(jParams);//初始化

        });
        //表单页初始化后置处理
        joForm.initFormValueAfter = function () {

        }
    </script>
</head>
<body class="padding-15">
<%--按钮栏--%>
<div class="form-group button-bar">
    <button type="button" isShow="joForm.isAdd" class="btn btn-sm btn-outline btn-default" onclick="joForm.save()">
        <i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp;新增
    </button>
    <button type="button" isShow="!joForm.isAdd" class="btn btn-sm btn-outline btn-default" onclick="joForm.update()">
        <i class="fa fa-pencil-square" aria-hidden="true"></i>&nbsp;修改
    </button>
    <button type="button" isShow="!joForm.isAdd" class="btn btn-sm btn-outline btn-default" onclick="joForm.del()">
        <i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除
    </button>
</div>
<%--按钮栏--%>

<form id="pageForm" name="pageForm" action="" method="post">
    <table class="table table-bordered table-condensed dataTables-example dataTable no-footer">
        <tr>
            <td width="15%" class="active" align="">编　　号</td>
            <td>
                <%--<input type="text" name="ID" class="readonly-edit" ErrLength="32"/>--%>
                <input type="text" name="ID" class="form-control input-sm readonly-edit" ErrLength="32">
            </td>

            <td width="15%" class="active">姓　　名</td>
            <td>
                <%--<input type="text" name="NAME" ErrEmpty="姓名不允许为空"/>--%>
                <input type="text" name="NAME" class="form-control input-sm" ErrEmpty="姓名不允许为空">
            </td>
        </tr>
        <tr>
            <td class="active">账　　号</td>
            <td>
                <input type="text" name="ACCOUNT" class="form-control input-sm">
                <%-- <input type="text" name="ACCOUNT"/>--%>
            </td>
            <td class="active">出生日期</td>
            <td>
                <input type="text" name="BIRTHDAY" onclick="laydate()" class="form-control input-sm">
                <%--<input type="text" name="BIRTHDAY" onclick="laydate()" />--%>
            </td>
        </tr>
        <tr>
            <td class="active">性　　别</td>
            <td>
                <div class="radio" style="margin: 0px;">
                    <label>
                        <input type="radio" name="SEX" value="1" checked="checked">男
                    </label>
                    <label>
                        <input type="radio" name="SEX" value="0">女
                    </label>
                </div>
                <%--<input type="radio" name="SEX" value="1" checked="checked">男
                <input type="radio" name="SEX" value="0">女--%>
            </td>

            <td class="active">电　　话</td>
            <td>
                <input type="text" name="TEL" ErrLength="11" ErrNumber="电话必须是数字类型" class="form-control input-sm">
                <%--<input type="text" name="TEL" ErrLength="11" ErrNumber="电话必须是数字类型"/>--%>
            </td>
        </tr>
        <tr>
            <td class="active">邮　　箱</td>
            <td>
                <input type="text" name="EMAIL" class="form-control input-sm">
                <%--<input type="text" name="EMAIL"/>--%>
            </td>

            <td class="active">状　　态</td>
            <td>
                <div class="radio" style="margin: 0px;">
                    <label>
                        <input type="radio" name="STATE" value="1" checked="checked">启用
                    </label>
                    <label>
                        <input type="radio" name="STATE" value="0">禁用
                    </label>
                </div>
                <%--<input type="radio" name="STATE" value="1" checked="checked">启用
                <input type="radio" name="STATE" value="0">禁用--%>
            </td>
        </tr>

        <tr>
            <td class="active">排　　序</td>
            <td>
                <input type="text" name="NUM" value="99" class="form-control input-sm">
                <%-- <input type="text" name="NUM" value="99"/>--%>
            </td>
            <td class="active">备　　注</td>
            <td colspan="">
                <input type="text" name="REMARK" class="form-control input-sm">
                <%--<input type="text" name="REMARK" value=""/>--%>
            </td>

        </tr>
        <tr>
            <td class="active must">所属单位</td>
            <td>
                <div class="input-group">
                    <input type="hidden" id="COMPANY_ID" name="COMPANY_ID" class="form-control input-sm"
                           ErrEmpty="所属单位不可以为空">
                    <input type="text" id="COMPANY_NAME" name="COMPANY_NAME" class="form-control input-sm">
                    <span class="input-group-btn">
                            <button class="btn btn-default btn-sm" type="button"
                                    onclick="choiceCompany('COMPANY_ID','COMPANY_NAME')">
                                <i class="fa fa-bars" aria-hidden="true"></i>&nbsp;选择
                            </button>
                        </span>
                </div>
            </td>
            <td class="active must" hidden>所属部门</td>
            <td hidden>
                <div class="input-group">
                    <input type="hidden" id="deptIds" name="deptIds" class="form-control input-sm" ErrEmpty="所属单位不可以为空">
                    <input type="text" id="names" name="names" class="form-control input-sm">
                    <span class="input-group-btn">
                            <button class="btn btn-default btn-sm" type="button"
                                    onclick="choiceDept('deptIds','names',true)">
                                <i class="fa fa-bars" aria-hidden="true"></i>&nbsp;选择
                            </button>
                        </span>
                </div>
            </td>
        </tr>
    </table>
</form>
</body>
<script>


    // function showDept() {
    //    var  names =  $("#COMPANY_NAME").val();
    //    alert(names);
    //    if (names.concat("ROOT")){
    //        alert(234);
    //    }
    //         $("td:hidden").each(function () {
    //             $(this).show();
    //         });
    //
    //
    //
    // }
    function choiceCompany(idInp, nameInp, bMore){

        jo.selectTree('{URL_UMS}ums/tree/getCompanyTree.action',jo.getDefVal(idInp, 'PARENT_ID'),jo.getDefVal(nameInp, 'PARENT_NAME'),'ID','NAME', 'PARENT_ID', bMore);
        // showDept();
    }
    jo.selectTree = function(sUrl,inpId,inpName,fieldId,fieldName,fieldPid,multiple,callback,zTreeParamOrCallBack,nodeCanChoiceCallBack,drawBeforeCallBack){
        //[Attr] 选择框参数
        jo.selectParams = {
            "url" : sUrl,
            "field_id" : jo.getDefVal(fieldId,"ID"),
            "field_text" : jo.getDefVal(fieldName,"NAME"),
            "field_pid" : jo.getDefVal(fieldPid,"PARENT_ID"),
            "id" : jo.getDefVal(inpId,""),
            "text" : jo.getDefVal(inpName,""),
            "multiple" : jo.getDefVal(multiple,false)
        };
        if(typeof(callback) == "function"){
            //[Func] 列表选择的回调函数,
            //参数[status]表示回调类型,true表示确定按钮的回调,false表示取消的回调
            //参数2[checkedIds]表示选中项ids,多个使用逗号间隔
            //参数3[checkedNames]表示选中项names,多个使用逗号间隔
            jo.selectListCall = callback;
        }

        //生成树回调
        if(typeof(zTreeParamOrCallBack) == "function"){//回调有2个参数,参数1为ajax返回的结果result,参数2为选择框window对象
            jo.selectTreeDrawTree = zTreeParamOrCallBack;
        }else{
            jo.selectParams["zTreeParam"] = zTreeParamOrCallBack;
        }

        //选择树的节点是否可选回调函数,参数为树节点对象
        if(typeof(nodeCanChoiceCallBack) == "function"){
            jo.selectTreeNodeCanChoice = nodeCanChoiceCallBack;
        }

        //生成树之前的处理回调
        if(typeof(drawBeforeCallBack) == "function"){
            jo.selectTreeDrawBefore = drawBeforeCallBack;
        }

        //弹出窗口
        return jo.showWin(contextPath+"common/choice_tree_no.jsp","400px","80%","选择");
    };

</script>
</html>
