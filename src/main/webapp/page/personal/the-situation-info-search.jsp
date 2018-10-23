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
    <script>
        $(function() {
            //调取出版著作/译著数据
            $.ajax({
                type: "get",
                url: "pms/pmsDictionary/getListByDictionary/PERIODICAL_TYPE",
                dataType: "text",
                async: false,
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"periodicalType\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"periodicalType\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#periodical").append(listline);
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
            box-sizing: border-box;
        }
    </style>
</head>

<body>
    <form class="layui-form layui-row" action="">
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">题目</label>
            <div class="layui-input-inline">
                <input type="text" id="periodicalTitle" name="periodicalTitle" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">期刊名称</label>
            <div class="layui-input-inline">
                <input type="text" id="periodicalName" name="periodicalName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
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
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="periodical">
                <%--input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="SCI" title="SCI">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="EI" title="EI">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="中文核心" title="中文核心">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="其他" title="其他">--%>
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">年　　月</label>
            <input type="text" id="periodicalStartYears" name="periodicalStartYears" required lay-verify="required" placeholder="2018-08" autocomplete="off" class="layui-input"  style="width: 100px;display: inline-block;">--
            <input type="text" id="periodicalEndYears" name="periodicalEndYears" required lay-verify="required" placeholder="2018-10" autocomplete="off" class="layui-input"  style="width: 100px;display: inline-block;">
        </div>

        <!-- <button class="layui-btn layui-btn-primary reset">重置</button>
        <button class="layui-btn layui-btn-primary save">确认添加</button> -->
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
                //     type: 'month'
                // });
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
                    obj = document.getElementsByName("periodicalType");
                    var check_val=new Array();
                    for(k in obj){
                        if(obj[k].checked)
                            check_val.push(obj[k].value);
                    }
                    var periodicalTitle = $('#periodicalTitle').val();
                    var periodicalName = $('#periodicalName').val();
                    var periodicalStartYears = $('#periodicalStartYears').val();
                    var periodicalEndYears = $('#periodicalEndYears').val();
                    parent.$('#periodicalTitle').val(periodicalTitle);
                    parent.$('#periodicalName').val(periodicalName);
                    parent.$('#periodicalType').val(check_val);
                    parent.$('#periodicalStartYears').val(periodicalStartYears);
                    parent.$('#periodicalEndYears').val(periodicalEndYears);

                    //清除父页面当前搜索条件中对应的数据
                    var parentCurrentSelect = window.parent.$("#currentSelect");
                    var tmpClass = 'lwqk_class',
                        model = '：';
                    parentCurrentSelect.find("."+tmpClass).remove();

                    if (periodicalTitle) {
                        var name = '论文题目'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+periodicalTitle+'</div>\n' +
                            '</div>'
                        );
                    }
                    if (periodicalName) {
                        var name = '期刊名称'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+periodicalName+'</div>\n' +
                            '</div>'
                        );
                    }
                    if (check_val && check_val.length > 0) {
                        var name = '期刊类型'+model;
                        var checkStr = check_val.join("、");
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
                    if (periodicalStartYears) {
                        var name = '论文起始时间'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+periodicalStartYears+'</div>\n' +
                            '</div>'
                        );
                    }
                    if (periodicalEndYears) {
                        var name = '论文终止时间'+model;
                        parentCurrentSelect.append(
                            '<div class="now-item clear '+tmpClass+'" >\n' +
                            '<label class="layui-form-label">'+name+'</label>\n' +
                            '<div class="info">'+periodicalEndYears+'</div>\n' +
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