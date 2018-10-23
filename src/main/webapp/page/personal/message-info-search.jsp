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
            <label class="layui-form-label">办公电话</label>
            <div class="layui-input-inline">
                <input type="text" id="officePhone" name="officePhone" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="number" id="mobilePhone" name="mobilePhone" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">邮箱地址</label>
            <div class="layui-input-inline">
                <input type="text" id="emailAddress" name="emailAddress" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">联系人姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="userName" name="userName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-layer-btn layui-layer-btn- layui-col-md12 layui-col-xs12" style="text-align: center;">
            <button type="button" class="layui-btn layui-btn-primary reset">重置</button>
            <button type="button" class="layui-btn layui-btn-primary save">确认添加</button>
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
                $(".reset").click(function () {
                    window.location.reload();
                });
                $(".save").click(function () {

                    var officePhone = $('#officePhone').val();
                    var mobilePhone = $('#mobilePhone').val();
                    var emailAddress = $('#emailAddress').val();
                    var userName = $('#userName').val();
                    parent.$('#officePhone').val(officePhone);
                    parent.$('#mobilePhone').val(mobilePhone);
                    parent.$('#emailAddress').val(emailAddress);
                    parent.$('#userName').val(userName);
                    //清除父页面当前搜索条件中对应的数据
                    var parentCurrentSelect = window.parent.$("#currentSelect");
                    var tmpClass = 'txxx_class',
                        model = '：';
                    parentCurrentSelect.find("."+tmpClass).remove();

                    if (officePhone) {
                        var name = '办公电话'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+officePhone+'</div>\n' +
                            '</div>'
                        );
                    }
                    if (mobilePhone) {
                        var name = '手机号'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+mobilePhone+'</div>\n' +
                            '</div>'
                        );
                    }
                    if (emailAddress) {
                        var name = '邮箱地址'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+emailAddress+'</div>\n' +
                            '</div>'
                        );
                    }
                    if (userName) {
                        var name = '联系人姓名'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+userName+'</div>\n' +
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