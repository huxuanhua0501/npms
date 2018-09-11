<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
    <title>Document</title>
    <%@ include file="/common/constHead.jsp" %>

    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <script src="<%=URL_STATIC%>static/final/js/jquery.min.js"></script>
    <script>
        $(function() {
            //调取出版著作/译著数据
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/WORK_TYPE",
                dataType: "text",
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"remark\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#work").append(listline);
                }

            });
        });

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
            <label class="layui-form-label">书名</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">出版社</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">著作类型</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="work">
               <%-- <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="著作" title="著作">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="编著" title="编著">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="译著" title="译著">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="独著" title="独著">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="合著" title="合著">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="其他" title="其他">--%>
            </div>
        </div>
        <!-- <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">年　　月</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="time" value="2019-09">
            </div>
        </div> -->
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">时间段</label>
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
        </div>

        <!-- <button class="layui-btn layui-btn-primary reset">重置</button>
        <button class="layui-btn layui-btn-primary save">确认添加</button> -->
        <div class="layui-layer-btn layui-layer-btn- layui-col-md12 layui-col-xs12" style="text-align: center;margin-top: 30px;">
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
                //     type: 'month'
                // });

                $(".save").click(function() {
                    parent.document.getElementsByClassName("publishing")[0].className += " active";
                    //当你在iframe页面关闭自身时
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭 

                })

                //设置开始时间
                // var startDate = laydate.render({
                //     elem: '#startY', //开始时间选择控件id
                //     // min: '2018 - 6 - 1',
                //     type: 'month',
                //     format: 'yyyy-MM', //可任意组合
                //     done: function(value, date) {
                //         if (value !== '') {
                //             endDate.config.min.year = date.year;
                //             // endDate.config.min.month = date.month - 1;
                //             // endDate.config.min.date = date.date;
                //             // endDate.config.min.hours = date.hours;
                //             // endDate.config.min.minutes = date.minutes;

                //         } else {
                //             endDate.config.min.year = '';
                //             // endDate.config.min.month = '';
                //             // endDate.config.min.date = '';
                //             // endDate.config.min.hours = '';
                //             // endDate.config.min.minutes = '';
                //         }
                //     }
                // });


                //设置结束时间
                // var endDate = laydate.render({
                //     elem: '#endY', //结束时间选择控件id
                //     type: 'month',
                //     format: 'yyyy-MM', //可任意组合
                //     done: function(value, date) {
                //         if (value !== '') {
                //             startDate.config.max.year = date.year;
                //             // startDate.config.max.month = date.month - 1;
                //             // startDate.config.max.date = date.date;
                //             // startDate.config.max.hours = date.date;
                //             // startDate.config.max.minutes = date.date;
                //         } else {
                //             startDate.config.max.year = '';
                //             // startDate.config.max.month = '';
                //             // startDate.config.max.date = '';
                //             // startDate.config.max.hours = '';
                //             // startDate.config.max.minutes = '';
                //         }
                //     }
                // });
            });


        })
    </script>
</body>

</html>