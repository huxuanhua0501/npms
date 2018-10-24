<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%@ include file="/common/constHead.jsp" %>

    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <script src="<%=URL_STATIC%>static/final/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <script type="text/javascript">
        $(function () {
            //民族
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/NATION",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"nation\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"nation\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#nation").append(listline);
                }

            });
            //政治面貌
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/POLITICAL_OUTLOOK",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"politicalOutlook\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"politicalOutlook\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#politicalOutlook").append(listline);
                }

            });
            //专业技术职务
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/TECHNICAL_POSITION",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"technicalPosition\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"technicalPosition\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#technicalPosition").append(listline);
                }

            });
            //专业技术等级
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/TECHNICAL_LEVEL",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"technicalLevel\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"technicalLevel\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#technicalLevel").append(listline);
                }

            });
            //专业技术等级
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/ADMINISTRATIVE_LEVEL",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#administrativeLevel").append(listline);
                }

            });
            //研究领域
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/RESEARCH_FIELD",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"researchField\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"researchField\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#researchField").append(listline);
                }

            });
            //全日制学历
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/HIGHEST_EDUCATION",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"highestEducation\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"highestEducation\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#highestEducation").append(listline);
                }

            });
            //全日制学位
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/HIGHEST_DEGREE",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"highestDegree\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"highestDegree\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#highestDegree").append(listline);
                }

            });
            //在职学历
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/HIGHEST_EDUCATION",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"jobEducation\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"jobEducation\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#jobEducation").append(listline);
                }

            });
            //全日制学位
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/HIGHEST_DEGREE",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"jobDegree\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"jobDegree\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#jobDegree").append(listline);
                }

            });
        });
    </script>
    <style>
        .layui-input-inline {
            width: 200px;
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

        button.layui-btn-primary.save,
        button.layui-btn-primary.reset {
            /* width: 20px;
            height: 42px; */
            border-color: #1E9FFF;
            background-color: #1E9FFF;
            color: #fff;
            margin-top: 30px;
            /* margin-right: 50px; */
        }

        .lang input {
            width: 506px;
        }

        .layui-form-label {
            width: 120px;
            box-sizing: border-box;
        }

        .layui-form {
            padding-top: 30px;
            padding-bottom: 30px;
            position: relative;
            padding-right: 30px;
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
            bottom: 0;
        }

        .layui-form-checkbox {
            margin-bottom: 4px;
        }
    </style>
</head>

<body>
<form class="layui-form layui-row" action="">
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <select id="sex" name="sex" lay-verify="">
                <option value=""></option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
    </div>

    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">民族</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="nation">
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label  layui-col-md3 layui-col-xs3">政治面貌</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="politicalOutlook">
          <%--  <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="团员" title="团员">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="党员" title="党员">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">专业技术职务</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="technicalPosition">
           <%-- <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="研究员" title="研究员">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="教授" title="教授">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">专业技术等级</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="technicalLevel">
           <%-- <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="专业技术一级" title="专业技术一级">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="专业技术二级" title="专业技术二级">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">行政级别</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="administrativeLevel">
          <%--  <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="正局级" title="正局级">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="副局级" title="副局级">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">研究领域</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="researchField">
         <%--   <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="大气环境研究" title="大气环境研究">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="水环境研究" title="水环境研究">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">全日制学历</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="highestEducation">
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="中专/高中" title="中专/高中">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="大学" title="大学">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">全日制学位</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="highestDegree">
         <%--   <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="学士" title="学士">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="硕士" title="硕士">
            <input type="checkbox" name="" class="col-item" lay-skin="primary" value="博士" title="博士">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">在职学历</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="jobEducation">
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">--%>
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="中专/高中" title="中专/高中">--%>
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="大学" title="大学">--%>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label layui-col-md3 layui-col-xs3">在职学位</label>
        <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="jobDegree">
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">--%>
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="学士" title="学士">--%>
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="硕士" title="硕士">--%>
            <%--<input type="checkbox" name="" class="col-item" lay-skin="primary" value="博士" title="博士">--%>
        </div>
    </div>

    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">是否有挂职经历</label>
        <div class="layui-input-inline">
            <select name="tempWorkExperience" lay-verify="" id="tempWorkExperience">
                <option value=""></option>
                <option value="是">是</option>
                <option value="否">否</option>
            </select>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">国外一年以上留学经历</label>
        <div class="layui-input-inline">
            <select name="overseasStudyExperience" lay-verify="" id="overseasStudyExperience">
                <option value=""></option>
                <option value="有">是</option>
                <option value="无">否</option>
            </select>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-inline">
            <input type="text" id="idCard" name="idCard" required lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">岗位</label>
        <div class="layui-input-inline">
            <input type="text" id="station" name="station" required lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">行政职务</label>
        <div class="layui-input-inline">
            <input type="text" id="administrativeDuty" name="administrativeDuty" required lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">婚姻状况</label>
        <div class="layui-input-inline">
            <input type="text" id="maritalStatus" name="maritalStatus" required lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input">
        </div>
    </div>

    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">出生日期</label>
        <input type="text" id="startBirth" name="startBirth" required lay-verify="required" placeholder="2018-08-01" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">--
        <input type="text" id="endBirth" name="endBirth" required lay-verify="required" placeholder="2018-10-01" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">参加工作时间</label>
        <input type="text"  id="startWorkTime" name="startWorkTime" required lay-verify="required" placeholder="2018-08" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">--
        <input type="text" id="endWorkTime" name="endWorkTime" required lay-verify="required" placeholder="2018-10" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">来院时间</label>
        <input type="text" id="startTenureTime" name="startTenureTime" required lay-verify="required" placeholder="2018-08" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">--
        <input type="text" id="endTenureTime" name="endTenureTime" required lay-verify="required" placeholder="2018-10" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">技术职务取得时间</label>
        <input type="text" id="startTechnicalGetTime" name="startTechnicalGetTime" required lay-verify="required" placeholder="2018-08" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">--
        <input type="text" id="endTechnicalGetTime" name="endTechnicalGetTime" required lay-verify="required" placeholder="2018-10" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">技术等级聘任时间</label>
        <input type="text" id="startAppointmentTime" name="startAppointmentTime" required lay-verify="required" placeholder="2018-08" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">--
        <input type="text" id="endAppointmentTime" name="endAppointmentTime" required lay-verify="required" placeholder="2018-10" autocomplete="off" class="layui-input"
               style="width: 100px;display: inline-block;">
    </div>

    <!-- <button class="layui-btn layui-btn-primary reset">重置</button>
    <button class="layui-btn layui-btn-primary save">确认添加</button> -->
    <div class="layui-layer-btn layui-layer-btn- layui-col-md12 layui-col-xs12" style="text-align: center;">
        <button type="button" class="layui-btn layui-btn-primary reset">重置</button>
        <button type="button" class="layui-btn layui-btn-primary save">确认添加</button>
    </div>
</form>


<script>
    $(function () {
        layui.use(['form', 'laydate'], function () {
            var form = layui.form;
            var laydate = layui.laydate;
            //全选
            form.on('checkbox', function (data) {
                var obj = data.elem;
                if(obj.title == '所有'){
                    var child = $(obj).parent('div').find('input[type="checkbox"]');
                    child.each(function(index,item){
                        item.checked = obj.checked;
                    });
                }else{
                    var allChecked = true;
                    $(obj).parent('div').find('input[type="checkbox"][title != "所有"]').each(function(index,item){
                        if(!item.checked){
                            allChecked = false;
                        };
                    });
                    $(obj).parent('div').find('input[type="checkbox"][title = "所有"]').prop("checked",allChecked);
                }
                form.render('checkbox');
            });
            $(".reset").click(function () {
                window.location.reload();
            });
            $(".save").click(function () {
                var sex = $("#sex option:selected").val();
                var overseasStudyExperience = $("#overseasStudyExperience option:selected").val();

                var nation=[];
                $('input[name="nation"]:checked').each(function(){
                    nation.push($(this).val());
                });

                var politicalOutlook=[];
                $('input[name="politicalOutlook"]:checked').each(function(){
                    politicalOutlook.push($(this).val());
                });
                var technicalPosition= [];
                $('input[name="technicalPosition"]:checked').each(function(){
                    technicalPosition.push($(this).val());
                });
                var technicalLevel= [];
                $('input[name="technicalLevel"]:checked').each(function(){
                    technicalLevel.push($(this).val());
                });
                var administrativeLevel= [];
                $('input[name="administrativeLevel"]:checked').each(function(){
                    administrativeLevel.push($(this).val());
                });

                var researchField= [];
                $('input[name="researchField"]:checked').each(function(){
                    researchField.push($(this).val());
                });
                var highestEducation= [];
                $('input[name="highestEducation"]:checked').each(function(){
                    highestEducation.push($(this).val());
                });
                var highestDegree= [];
                $('input[name="highestDegree"]:checked').each(function(){
                    highestDegree.push($(this).val());
                });
                var jobEducation= [];
                $('input[name="jobEducation"]:checked').each(function(){
                    jobEducation.push($(this).val());
                });

                var jobDegree= [];
                $('input[name="jobDegree"]:checked').each(function(){
                    jobDegree.push($(this).val());
                });
                var tempWorkExperience = $("#tempWorkExperience option:selected").val();

                var idCard = $('#idCard').val();
                var station = $('#station').val();
                var administrativeDuty = $('#administrativeDuty').val();
                var maritalStatus = $('#maritalStatus').val();
                var startBirth = $('#startBirth').val();
                var endBirth = $('#endBirth').val();
                var startWorkTime = $('#startWorkTime').val();
                var endWorkTime = $('#endWorkTime').val();
                var startTenureTime = $('#startTenureTime').val();
                var endTenureTime = $('#endTenureTime').val();
                var startTechnicalGetTime = $('#startTechnicalGetTime').val();
                var endTechnicalGetTime = $('#endTechnicalGetTime').val();
                var startAppointmentTime = $('#startAppointmentTime').val();
                var endAppointmentTime = $('#endAppointmentTime').val();

                parent.$('#sex').val(sex);
                parent.$('#nation').val(nation);
                parent.$('#politicalOutlook').val(politicalOutlook);
                parent.$('#technicalPosition').val(technicalPosition);
                parent.$('#technicalLevel').val(technicalLevel);
                parent.$('#administrativeLevel').val(administrativeLevel);
                parent.$('#researchField').val(researchField);
                parent.$('#highestEducation').val(highestEducation);
                parent.$('#highestDegree').val(highestDegree);
                parent.$('#jobEducation').val(jobEducation);
                parent.$('#jobDegree').val(jobDegree);
                parent.$('#tempWorkExperience').val(tempWorkExperience);
                parent.$('#overseasStudyExperience').val(overseasStudyExperience);
                parent.$('#idCard').val(idCard);
                parent.$('#station').val(station);
                parent.$('#administrativeDuty').val(administrativeDuty);
                parent.$('#maritalStatus').val(maritalStatus);
                parent.$('#startBirth').val(startBirth);
                parent.$('#endBirth').val(endBirth);
                parent.$('#startWorkTime').val(startWorkTime);
                parent.$('#endWorkTime').val(endWorkTime);
                parent.$('#startTenureTime').val(startTenureTime);
                parent.$('#endTenureTime').val(endTenureTime);
                parent.$('#startTechnicalGetTime').val(startTechnicalGetTime);
                parent.$('#endTechnicalGetTime').val(endTechnicalGetTime);
                parent.$('#startAppointmentTime').val(startAppointmentTime);
                parent.$('#endAppointmentTime').val(endAppointmentTime);

                //清除父页面当前搜索条件中对应的数据
                var parentCurrentSelect = window.parent.$("#currentSelect");
                var tmpClass = 'jcxx_class',
                    model = '：';
                parentCurrentSelect.find("."+tmpClass).remove();

                if (sex) {
                    var name = '性别'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+sex+'</div>\n' +
                        '</div>'
                    );
                }
                if (nation && nation.length > 0) {
                    var name = '民族'+model;
                    var checkStr = nation.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (politicalOutlook && politicalOutlook.length > 0) {
                    var name = '政治面貌'+model;
                    var checkStr = politicalOutlook.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (technicalPosition && technicalPosition.length > 0) {
                    var name = '专业技术职务'+model;
                    var checkStr = technicalPosition.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (technicalLevel && technicalLevel.length > 0) {
                    var name = '专业技术等级'+model;
                    var checkStr = technicalLevel.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (administrativeLevel && administrativeLevel.length > 0) {
                    var name = '行政级别'+model;
                    var checkStr = administrativeLevel.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (researchField && researchField.length > 0) {
                    var name = '研究领域'+model;
                    var checkStr = researchField.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (highestEducation && highestEducation.length > 0) {
                    var name = '全日制学历'+model;
                    var checkStr = highestEducation.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (highestDegree && highestDegree.length > 0) {
                    var name = '全日制学位'+model;
                    var checkStr = highestDegree.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (jobEducation && jobEducation.length > 0) {
                    var name = '在职学历'+model;
                    var checkStr = jobEducation.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (jobDegree && jobDegree.length > 0) {
                    var name = '在职学位'+model;
                    var checkStr = jobDegree.join("、");
                    if(checkStr.indexOf('所有') != -1){
                        checkStr = '所有';
                    }
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+checkStr+'</div>\n' +
                        '</div>'
                    );
                }
                if (tempWorkExperience) {
                    var name = '是否有挂职经历'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+tempWorkExperience+'</div>\n' +
                        '</div>'
                    );
                }
                if (overseasStudyExperience) {
                    var name = '国外一年以上留学经历'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+overseasStudyExperience+'</div>\n' +
                        '</div>'
                    );
                }
                if (idCard) {
                    var name = '身份证号'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+idCard+'</div>\n' +
                        '</div>'
                    );
                }
                if (station) {
                    var name = '岗位'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+station+'</div>\n' +
                        '</div>'
                    );
                }
                if (administrativeDuty) {
                    var name = '行政职务'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+administrativeDuty+'</div>\n' +
                        '</div>'
                    );
                }
                if (maritalStatus) {
                    var name = '婚姻状况'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+maritalStatus+'</div>\n' +
                        '</div>'
                    );
                }
                if (startBirth ||endBirth) {
                    var dy = startBirth+"--"+endBirth;
                    var name = '出生日期'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+dy+'</div>\n' +
                        '</div>'
                    );
                }
                if (startWorkTime || endWorkTime) {
                    var dy = startWorkTime+"--"+endWorkTime;
                    var name = '参加工作时间'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+dy+'</div>\n' +
                        '</div>'
                    );
                }
                if (startTenureTime || endTenureTime) {
                    var dy = startTenureTime+"--"+endTenureTime;
                    var name = '来院时间'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+dy+'</div>\n' +
                        '</div>'
                    );
                }
                if (startTechnicalGetTime || endTechnicalGetTime) {
                    var dy = startTechnicalGetTime+"--"+endTechnicalGetTime;
                    var name = '技术职务取得时间'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+dy+'</div>\n' +
                        '</div>'
                    );
                }
                if (startAppointmentTime || endAppointmentTime) {
                    var dy = startAppointmentTime+"--"+endAppointmentTime;
                    var name = '技术等级聘任时间'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+dy+'</div>\n' +
                        '</div>'
                    );
                }
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            })
        });


    })
</script>
</body>

</html>