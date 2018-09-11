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
            box-sizing: border-box;
        }
    </style>
</head>

<body>
    <form class="layui-form layui-row" action="">
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">题目</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">期刊名称</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!-- <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">期刊类型</label>
            <div class="layui-input-inline">
                <select name="" lay-verify="">
                            <option value=""></option>
                            <option value="SCI" selected>SCI</option>
                            <option value="EI">EI</option>
                            <option value="中文核心">中文核心</option>
                            <option value="其他">其他</option>
                        </select>
            </div>
        </div> -->
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">期刊类型</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="SCI" title="SCI">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="EI" title="EI">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="中文核心" title="中文核心">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="其他" title="其他">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">年　　月</label>
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
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
                //     type: 'month'
                // });

                $(".save").click(function() {
                    parent.document.getElementsByClassName("the-situation")[0].className += " active";
                    //当你在iframe页面关闭自身时
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭 

                })
            });


        })
    </script>
</body>

</html>