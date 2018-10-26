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
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/common.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>字段审核设置</title>
    <style>
        .person-tit .title {
            padding: 0;
        }

        .person-tit {
            padding: 18px;
        }

        .content {
            padding: 20px;
            padding-top: 4px;
        }

        .content .layui-row {
            border-bottom: 1px solid #dadada;
            padding: 16px;
        }

        .content .layui-col-md10 .layui-col-md3 {
            margin-bottom: 8px;
        }

        .layui-form-radioed>i,
        .layui-form-radio>i:hover {
            color: #3693FF;
        }

        .btn-box {
            display: flex;
            justify-content: center;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="layui-row">
        <form class="layui-form layui-form-box layui-col-md12 person">
            <div class="person-tit clear">
                <span class="left title">字段审核</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="layui-row">
                    <div class="layui-col-md2 layui-col-sm2">
                        <span>基本信息</span>
                    </div>
                    <div class="layui-col-md10 layui-col-sm10">
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="userName" title="人员姓名" lay-skin="primary">
                            <input type="hidden" name="userName_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="oldName" title="曾用名" lay-skin="primary">
                            <input type="hidden" name="oldName_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="placeOfOrigin" title="籍贯" lay-skin="primary">
                            <input type="hidden" name="placeOfOrigin_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="deptIds" title="所在部门" lay-skin="primary">
                            <input type="hidden" name="deptIds_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="sex" title="性别" lay-skin="primary">
                            <input type="hidden" name="sex_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="birth" title="出生日期" lay-skin="primary">
                            <input type="hidden" name="birth_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="nation" title="民族" lay-skin="primary">
                            <input type="hidden" name="nation_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="idCard" title="身份证号" lay-skin="primary">
                            <input type="hidden" name="idCard_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="placeOfBirth" title="出生地" lay-skin="primary">
                            <input type="hidden" name="placeOfBirth_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="workStartTime" title="参加工作时间" lay-skin="primary">
                            <input type="hidden" name="workStartTime_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="politicalOutlook" title="政治面貌" lay-skin="primary">
                            <input type="hidden" name="politicalOutlook_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="joinPartyTime" title="加入时间" lay-skin="primary">
                            <input type="hidden" name="joinPartyTime_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="station" title="岗位" lay-skin="primary">
                            <input type="hidden" name="station_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="toThereTime" title="来院时间" lay-skin="primary">
                            <input type="hidden" name="toThereTime_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="takeWork" title="承担的工作" lay-skin="primary">
                            <input type="hidden" name="takeWork_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="maritalStatus" title="婚姻状况" lay-skin="primary">
                            <input type="hidden" name="maritalStatus_id">
                        </div>

                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md2 layui-col-sm2">
                        <span>工作信息</span>
                    </div>
                    <div class="layui-col-md10 layui-col-sm10">
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="technicalPosition" title="专业技术职务" lay-skin="primary">
                            <input type="hidden" name="technicalPosition_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="getTime" title="取得时间" lay-skin="primary">
                            <input type="hidden" name="getTime_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="technicalLevel" title="专业技术等级" lay-skin="primary">
                            <input type="hidden" name="technicalLevel_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="appointmentTime" title="聘任时间" lay-skin="primary">
                            <input type="hidden" name="appointmentTime_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="administrativeDuty" title="行政职务" lay-skin="primary">
                            <input type="hidden" name="administrativeDuty_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="tenureTime" title="任职时间" lay-skin="primary">
                            <input type="hidden" name="tenureTime_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="administrativeLevel" title="行政级别" lay-skin="primary">
                            <input type="hidden" name="administrativeLevel_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="researchField" title="研究领域" lay-skin="primary">
                            <input type="hidden" name="researchField_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="researchFieldDetail" title="研究领域细分" lay-skin="primary">
                            <input type="hidden" name="researchFieldDetail_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="tempWorkExperience" title="是否有挂职经历" lay-skin="primary">
                            <input type="hidden" name="tempWorkExperience_id">
                        </div>

                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md2 layui-col-sm2">
                        <span>学历信息</span>
                    </div>
                    <div class="layui-col-md10 layui-col-sm10">
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="highestEducation" title="全日制学历" lay-skin="primary">
                            <input type="hidden" name="highestEducation_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="highestDegree" title="全日制学位" lay-skin="primary">
                            <input type="hidden" name="highestDegree_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="jobEducation" title="在职学历" lay-skin="primary">
                            <input type="hidden" name="jobEducation_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="jobDegree" title="在职学位" lay-skin="primary">
                            <input type="hidden" name="jobDegree_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="specialty" title="从事专业" lay-skin="primary">
                            <input type="hidden" name="specialty_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="overseasStudyExperience" title="国外一年以上留学经历" lay-skin="primary">
                            <input type="hidden" name="overseasStudyExperience_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="englishLevel" title="熟悉何种外语及水平" lay-skin="primary">
                            <input type="hidden" name="englishLevel_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="remark" title="备注" lay-skin="primary">
                            <input type="hidden" name="remark_id">
                        </div>

                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md2 layui-col-sm2">
                        <span>个人通讯信息</span>
                    </div>
                    <div class="layui-col-md10 layui-col-sm10">
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="officePhone" title="办公电话" lay-skin="primary">
                            <input type="hidden" name="officePhone_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="mobilePhone" title="手机号" lay-skin="primary">
                            <input type="hidden" name="mobilePhone_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="faxNumber" title="传真号" lay-skin="primary">
                            <input type="hidden" name="faxNumber_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="emailAddress" title="邮箱地址" lay-skin="primary">
                            <input type="hidden" name="emailAddress_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="postalAddress" title="通讯地址" lay-skin="primary">
                            <input type="hidden" name="postalAddress_id">
                        </div>

                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md2 layui-col-sm2">
                        <span>紧急联系人1</span>
                    </div>
                    <div class="layui-col-md10 layui-col-sm10">
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="relationshipOne" title="关系" lay-skin="primary">
                            <input type="hidden" name="relationshipOne_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="nameOne" title="姓名" lay-skin="primary">
                            <input type="hidden" name="nameOne_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="emergencyContactOne" title="手机号" lay-skin="primary">
                            <input type="hidden" name="emergencyContactOne_id">
                        </div>

                    </div>
                </div>
                <div class="layui-row">
                    <div class="layui-col-md2 layui-col-sm2">
                        <span>紧急联系人2</span>
                    </div>
                    <div class="layui-col-md10 layui-col-sm10">
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="relationshipTwo" title="关系" lay-skin="primary">
                            <input type="hidden" name="relationshipTwo_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="nameTwo" title="姓名" lay-skin="primary">
                            <input type="hidden" name="nameTwo_id">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="checkbox" name="emergencyContactTwo" title="手机号" lay-skin="primary">
                            <input type="hidden" name="emergencyContactTwo_id">
                        </div>
                    </div>
                </div>

                <div class="content-bottom">
                    <div class="layui-row">
                        <div class="layui-col-md12 layui-col-sm12">
                            <input type="checkbox" name="all" lay-skin="primary" lay-filter="allChoose" title="选择所有">
                        </div>
                        <div class="layui-col-md3 layui-col-sm3">
                            <input type="radio" name="shenhe" checked="checked" disabled value="勾选复选框设置不需要审核的字段" title="勾选复选框设置不需要审核的字段">
                        </div>
                    </div>
                    <div class="layui-row btn-box">
                        <button type="button" class="layui-btn layui-btn-normal" onclick="updateAll()">确定</button>
                        <button type="button" class="layui-btn layui-btn-primary">取消</button>
                    </div>
                </div>


            </div>
        </form>
    </div>
</div>
    <script>
        $(function() {
            layui.use(['layer', 'form', 'laydate'], function() {
                var form = layui.form;
                var layer = layui.layer;
                var laydate = layui.laydate;
                loadAuditFieldSet();
                //全选
                form.on('checkbox(allChoose)', function(data) {
                    var child = $(data.elem).parents('.content').find('.layui-col-md3 input[type="checkbox"]');
                    child.each(function(index, item) {
                        item.checked = data.elem.checked;
                    });
                    form.render('checkbox');
                });
                form.render();
            });
        })
        function loadAuditFieldSet(){
            var sUrl = 'pms/auditFieldSet/getList.action';
            jo.postAjax(sUrl, {}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        var inp = $("input[type='checkbox']");
                        var list = json.data;
                        for(var i=0;i<inp.length;i++){
                            var element = $(inp[i]);
                            var key = element.attr("name");
                            for(var j =0;j<list.length;j++){
                                var id = list[j].ID;
                                var fieldName = list[j].FIELD_NAME;
                                var status = list[j].STATUS;
                                if(key == fieldName){
                                    element.val(status);
                                    element.next().val(id);
                                    if(status == 1){
                                        element.checked = true;
                                    }
                                }
                            }
                        }
                    }
                    form.render('checkbox');
                }else{
                    layer.msg("加载审核字段数据失败！");
                }
            }, true);
        }
        //提交
        function updateAll(){
            var inp = $("input[type='checkbox']");
            var list = [];
            for(var i=0;i<inp.length;i++){
                var elem = $(inp[i]);
                var obj = {};
                //把全选按钮的checkbox去掉
                if(elem.name != "all"){
                    var id = jo.getDefVal(elem.next().value,'');
                    var fieldName = elem.name;
                    var status = 1;//默认需要审核
                    //选中的为不需要审核
                    if(elem.checked){
                        status = 2;
                    }
                    obj = {id:id,fieldName:fieldName,status:status};
                    list.push(obj);
                }
            }
            if(list.length > 0){
                var sUrl = 'pms/auditFieldSet/update.action';
                jo.postAjax(sUrl, {}, function(json){
                    if(json && json.code == "0"){
                        layer.msg("审核字段设置成功！");
                        window.location.reload();
                    }else{
                        layer.msg("审核字段设置失败！");
                    }
                }, true);
            }
        }
    </script>
</body>

</html>
