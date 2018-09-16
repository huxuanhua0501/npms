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
    <script src="<%=URL_STATIC%>static/prototype/js/lock-common.js"></script>
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
        
        .lang input,
        .layui-input-inline.lang {
            width: 490px;
        }
        
        .layui-form-label {
            width: 90px;
        }
        
        .layui-form-select {
            width: 490px;
        }
    </style>
</head>

<body>
    <form class="layui-form layui-row" action="">
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">年　　份</label>
            <div class="layui-input-inline lang">
                <input type="text" name="checkYears" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="checkYears">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">年度考核等级</label>
            <div class="layui-input-inline lang">
                <input type="text" id="checkScore" name="checkScore" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">第一季度等级</label>
            <div class="layui-input-inline lang">
                <input type="text" id="quarterOne" name="quarterOne" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">第二季度等级</label>
            <div class="layui-input-inline lang">
                <input type="text" id="quarterTwo" name="quarterTwo" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">第三季度等级</label>
            <div class="layui-input-inline lang">
                <input type="text"  id="quarterThree" name="quarterThree" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label">第四季度等级</label>
            <div class="layui-input-inline lang">
                <input type="text" id="quarterFour" name="quarterFour" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
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
                $(".save").click(function () {





                    var checkYears = $('#checkYears').val();
                    var checkScore = $('#checkScore').val();
                    var quarterOne = $('#quarterOne').val();
                    var quarterTwo = $('#quarterTwo').val();
                    var quarterThree = $('#quarterThree').val();
                    var quarterFour = $('#quarterFour').val();


                    parent.$('#checkYears').val(checkYears);
                    parent.$('#checkScore').val(checkScore);
                    parent.$('#quarterOne').val(quarterOne);
                    parent.$('#quarterTwo').val(quarterTwo);
                    parent.$('#quarterThree').val(quarterThree);
                    parent.$('#quarterFour').val(quarterFour);
                    var yi;
                    var er;
                    var san;
                    var si;
                    var wu;
                    var liu;

                    if (checkYears !== '') {
                        yi = "&nbsp;&nbsp;&nbsp;"+"年　　份"+"&nbsp;"+checkYears;

                    }else{
                        yi=" ";
                    }
                    if (checkScore!=='') {
                        er = "&nbsp;&nbsp;&nbsp;"+"年度考核等级 "+"&nbsp;"+checkScore;

                    }else{
                        er=" ";
                    }
                    if (quarterOne!=='') {
                        san =  "&nbsp;&nbsp;&nbsp;"+"第一季度等级 "+"&nbsp;"+quarterOne;

                    }else{
                        san=" ";
                    }
                    if (quarterTwo!=='') {
                        si =  "&nbsp;&nbsp;&nbsp;"+"第二季度等级 "+"&nbsp;"+quarterTwo;

                    }else{
                        si=" ";
                    }
                    if (quarterThree!=='') {
                        wu =  "&nbsp;&nbsp;&nbsp;"+"第三季度等级  "+"&nbsp;"+quarterThree;

                    }else{
                        wu=" ";
                    }
                    if (quarterFour!=='') {
                        liu =  "&nbsp;&nbsp;&nbsp;"+"第四季度等级  "+"&nbsp;"+quarterFour;

                    }else{
                        liu=" ";
                    }
                    if (yi!==" "||er!==" "||san!==" "||si!==" "||wu!=" "||liu!=" ") {
                        parent.$('#niandukaohe').html("年度考核"+"&nbsp;"+yi+er+san+si+wu+liu);

                    }


                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭


                })

            });


        })
    </script>
</body>

</html>