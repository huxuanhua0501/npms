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
                url: "pms/pmsDictionary/getListByDictionary/AWARD_LEVEL",
                dataType: "text",
                success: function (jsonStr) {
                    var obj = JSON.parse(jsonStr);
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"awardLevel\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"awardLevel\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#award").append(listline);
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
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline lang">
                <input type="text"  id="awardWinProjectName" name="awardWinProjectName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">类别</label>
            <div class="layui-input-inline">
                <input type="text" id="awardType" name="awardType" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">等级</label>
            <div class="layui-input-inline">
                <input type="text" id="awardWinProjectLevel" name="awardWinProjectLevel" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">奖励层次</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="award">

            </div>
        </div>

        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">时间段</label>
            <input type="text" id="awardsStartYears" name="awardsStartYears" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  style="width: 100px;display: inline-block;">--
            <input type="text" id="awardsEndYears" name="awardsEndYears" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  style="width: 100px;display: inline-block;">
        </div>


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

                $(".save").click(function () {


                    obj = document.getElementsByName("awardLevel");
                    var check_val=new Array();
                    for(k in obj){
                        if(obj[k].checked)
                            check_val.push(obj[k].value);
                    }


                    var awardWinProjectName = $('#awardWinProjectName').val();
                    var awardType = $('#awardType').val();
                    var awardWinProjectLevel = $('#awardWinProjectLevel').val();
                    var awardsStartYears = $('#awardsStartYears').val();
                    var awardsEndYears = $('#awardsEndYears').val();
                    parent.$('#awardWinProjectName').val(awardWinProjectName);
                    parent.$('#awardType').val(awardType);
                    parent.$('#awardWinProjectLevel').val(awardWinProjectLevel);
                    parent.$('#awardLevel').val(check_val);
                    parent.$('#awardsStartYears').val(awardsStartYears);
                    parent.$('#awardsEndYears').val(awardsEndYears);
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭


                })




            });


        })
    </script>
</body>

</html>