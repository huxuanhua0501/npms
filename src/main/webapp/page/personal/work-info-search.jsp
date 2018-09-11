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
        <!-- <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">院校名称</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">专业名称</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div> -->
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">起始时间</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="start">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">终止时间</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-inline lang">
                <input type="text" name="" required lay-verify="required" placeholder="公司名称/技术等级/技术职务" autocomplete="off" class="layui-input" id="start">
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
        $(function() {
            layui.use(['form', 'laydate'], function() {
                var form = layui.form;
                var laydate = layui.laydate;
                // laydate.render({
                //     elem: '#time',
                // });

                //设置开始时间
                // var startDate = laydate.render({
                //     elem: '#start', //开始时间选择控件id
                //     // min: '2018 - 6 - 1',
                //     type: 'date',
                //     format: 'yyyy-MM-dd', //可任意组合
                //     done: function(value, date) {
                //         if (value !== '') {
                //             endDate.config.min.year = date.year;
                //             endDate.config.min.month = date.month - 1;
                //             endDate.config.min.date = date.date;
                //             endDate.config.min.hours = date.hours;
                //             endDate.config.min.minutes = date.minutes;

                //         } else {
                //             endDate.config.min.year = '';
                //             endDate.config.min.month = '';
                //             endDate.config.min.date = '';
                //             endDate.config.min.hours = '';
                //             endDate.config.min.minutes = '';
                //         }
                //     }
                // });

                //设置结束时间
                // var endDate = laydate.render({
                //     elem: '#end', //结束时间选择控件id
                //     type: 'date',
                //     format: 'yyyy-MM-dd', //可任意组合
                //     done: function(value, date) {
                //         if (value !== '') {
                //             startDate.config.max.year = date.year;
                //             startDate.config.max.month = date.month - 1;
                //             startDate.config.max.date = date.date;
                //             startDate.config.max.hours = date.date;
                //             startDate.config.max.minutes = date.date;
                //         } else {
                //             startDate.config.max.year = '';
                //             startDate.config.max.month = '';
                //             startDate.config.max.date = '';
                //             startDate.config.max.hours = '';
                //             startDate.config.max.minutes = '';
                //         }
                //     }
                // });

                $(".save").click(function() {
                    parent.document.getElementsByClassName("work")[0].className += " active";
                    //当你在iframe页面关闭自身时
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭 

                })
            });


        })
    </script>
</body>

</html>