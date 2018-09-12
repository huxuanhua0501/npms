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
    <!-- <link rel="stylesheet" href="css/person-document.css"> -->
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
            width: 90px;
        }
    </style>
</head>

<body>
<form class="layui-form layui-row" action="">
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">起始时间</label>
        <div class="layui-input-inline">
            <input type="text" id="startEducation" name="startEducation" required lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input"  >
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">终止时间</label>
        <div class="layui-input-inline">
            <input type="text" name="endEducation" required lay-verify="required" placeholder="" autocomplete="off"
                   class="layui-input" id="endEducation">
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-inline lang">
            <input type="text"  name="educationContent" required lay-verify="required" placeholder="院校名称/专业名称/学历/学位" autocomplete="off"
                   class="layui-input" id="educationContent">
        </div>
    </div>

    <!-- <button class="layui-btn layui-btn-primary reset">重置</button>
    <button class="layui-btn layui-btn-primary save">确认添加</button> -->
    <div class="layui-layer-btn layui-layer-btn- layui-col-md12 layui-col-xs12" style="text-align: center;">
        <button class="layui-btn layui-btn-primary reset">重置</button>
        <button class="layui-btn layui-btn-primary save">确认添加</button>
    </div>
</form>


<script>
    $(function () {
        layui.use(['form', 'laydate'], function () {
            var form = layui.form;
            var laydate = layui.laydate;
            $(".save").click(function () {
                var startEducation = $('#startEducation').val();
                var endEducation = $('#endEducation').val();
                var educationContent = $('#educationContent').val();
                parent.$('#startEducation').val(startEducation);
                parent.$('#endEducation').val(endEducation);
                parent.$('#educationContent').val(educationContent);
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭


            })

        });


    })
</script>
</body>

</html>