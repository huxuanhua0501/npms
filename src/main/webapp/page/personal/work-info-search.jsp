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
            <input type="text" id="workStartTime" name="workStartTime" required lay-verify="required" placeholder="2018-08"
                   autocomplete="off" class="layui-input" ErrBirthBad4>
        </div>
    </div>
    <div class="edit-item layui-col-md6 layui-col-xs6">
        <label class="layui-form-label">终止时间</label>
        <div class="layui-input-inline">
            <input type="text" id="workStopTime" name="workStopTime" required lay-verify="required" placeholder="2018-10"
                   autocomplete="off" class="layui-input" ErrBirthBad4>
        </div>
    </div>
    <div class="edit-item layui-col-md12 layui-col-xs12">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-inline lang">
            <input type="text" id="workContent" name="workContent" required lay-verify="required"
                   placeholder="公司名称/技术等级/技术职务" autocomplete="off" class="layui-input">
        </div>
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

            $(".reset").click(function () {
                window.location.reload();
            });
            $(".save").click(function () {
                var workContent = $('#workContent').val();
                var work_StartTime = $('#workStartTime').val();
                var workStopTime = $('#workStopTime').val();

                parent.$('#workContent').val(workContent);
                parent.$('#work_StartTime').val(work_StartTime);
                parent.$('#workStopTime').val(workStopTime);
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引

                //清除父页面当前搜索条件中对应的数据
                var parentCurrentSelect = window.parent.$("#currentSelect");
                var tmpClass = 'gzjl_class',
                    model = '：';
                parentCurrentSelect.find("."+tmpClass).remove();

                if (work_StartTime) {
                    var name = '工作起始时间'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+work_StartTime+'</div>\n' +
                        '</div>'
                    );
                }
                if (workStopTime) {
                    var name = '工作截止时间'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+workStopTime+'</div>\n' +
                        '</div>'
                    );
                }
                if (workContent) {
                    var name = '工作内容'+model;
                    parentCurrentSelect.append(
                        '<div class="now-item clear '+tmpClass+'" >\n' +
                        '<label class="layui-form-label">'+name+'</label>\n' +
                        '<div class="info">'+workContent+'</div>\n' +
                        '</div>'
                    );
                }
                parent.layer.close(index); //再执行关闭
            })

        });


    })
</script>
</body>

</html>