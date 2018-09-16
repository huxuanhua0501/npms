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
                        listline += '<input type=\"checkbox\" name=\"workType\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
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
                <input type="text" id="bookName" name="bookName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">出版社</label>
            <div class="layui-input-inline">
                <input type="text" id="press" name="press" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">著作类型</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;" id="work">
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
            <input type="text"  id="startYears"  name="startYears" required lay-verify="required"  placeholder="2018-08" ErrBirthBad4 autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" id="endYears" name="endYears" required lay-verify="required" placeholder="2018-10" ErrBirthBad4 autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
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



                $(".save").click(function () {


                    obj = document.getElementsByName("workType");
                    var check_val=new Array();
                    for(k in obj){
                        if(obj[k].checked)
                            check_val.push(obj[k].value);
                    }


                    var bookName = $('#bookName').val();
                    var press = $('#press').val();
                    // var workType = $('#workType').val();
                    var startYears = $('#startYears').val();
                    var endYears = $('#endYears').val();
                    parent.$('#bookName').val(bookName);
                    parent.$('#press').val(press);
                    parent.$('#workType').val(check_val);
                    parent.$('#startYears').val(startYears);
                    parent.$('#endYears').val(endYears);
                    var shouji;
                    var yidong;
                    var email;
                    var xingming;
                    var jieshunianyue;

                    if (bookName !== '') {
                        shouji = "&nbsp;&nbsp;&nbsp;"+"书名"+"&nbsp;"+bookName;

                    }else{
                        shouji=" ";
                    }
                    if (press!=='') {
                        yidong = "&nbsp;&nbsp;&nbsp;"+"出版社 "+"&nbsp;"+press;

                    }else{
                        yidong=" ";
                    }
                    if (check_val!=='') {
                        email =  "&nbsp;&nbsp;&nbsp;"+"著作类型 "+"&nbsp;"+check_val;

                    }else{
                        email=" ";
                    }
                    if (startYears!=='') {
                        xingming =  "&nbsp;&nbsp;&nbsp;"+"起始时间 "+"&nbsp;"+startYears;

                    }else{
                        xingming=" ";
                    }
                    if (endYears!=='') {
                        jieshunianyue =  "&nbsp;&nbsp;&nbsp;"+"终止时间  "+"&nbsp;"+endYears;

                    }else{
                        jieshunianyue=" ";
                    }
                    if (shouji!==" "||yidong!==" "||email!==" "||xingming!==" "||jieshunianyue!=" ") {
                        parent.$('#zhuzuo').html("出版著作/译著"+"&nbsp;"+shouji+yidong+email+xingming+jieshunianyue);

                    }


                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭


                })

            });


        })
    </script>
</body>

</html>