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
    <style>
        .layui-input-inline {
            width: 200px;
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
            width: 120px;
            box-sizing: border-box;
        }
        
        .layui-form {
            padding-top: 30px;
            padding-bottom: 30px;
            position: relative;
            padding-right: 30px;
        }
        
        .choose-btn {
            height: 32px;
            background: #fff;
            border: 1px solid #ccc !important;
            font-size: 12px;
            padding: 0 10px;
            line-height: 32px;
        }
        
        .input-group-btn {
            position: absolute;
            right: 0;
            bottom: 0;
        }
        
        .layui-form-checkbox {
            margin-bottom: 4px;
        }
    </style>
</head>

<body>
    <form class="layui-form layui-row" action="">
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <select name="" lay-verify="">
                                    <option value=""></option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
            </div>
        </div>

        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">民族</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="汉族" title="汉族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="藏族" title="藏族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="白族" title="白族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="汉族" title="汉族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="藏族" title="藏族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="白族" title="白族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="汉族" title="汉族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="藏族" title="藏族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="白族" title="白族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="汉族" title="汉族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="藏族" title="藏族">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="白族" title="白族">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label  layui-col-md3 layui-col-xs3">政治面貌</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="团员" title="团员">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="党员" title="党员">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">专业技术职务</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="研究员" title="研究员">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="教授" title="教授">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">专业技术等级</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="专业技术一级" title="专业技术一级">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="专业技术二级" title="专业技术二级">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">行政级别</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="正局级" title="正局级">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="副局级" title="副局级">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">研究领域</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="大气环境研究" title="大气环境研究">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="水环境研究" title="水环境研究">
            </div>
        </div>
        <!-- <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">是否有挂职经历</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="是" title="是">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="否" title="否">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">国外一年以上留学经历</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="是" title="是">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="否" title="否">
            </div>
        </div> -->
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">全日制学历</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="中专/高中" title="中专/高中">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="大学" title="大学">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">全日制学位</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="学士" title="学士">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="硕士" title="硕士">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="博士" title="博士">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">在职学历</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="中专/高中" title="中专/高中">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="大学" title="大学">
            </div>
        </div>
        <div class="edit-item layui-col-md12 layui-col-xs12">
            <label class="layui-form-label layui-col-md3 layui-col-xs3">在职学位</label>
            <div class="layui-col-md9 layui-col-xs9" style="padding: 10px 15px;">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="所有" title="所有">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="学士" title="学士">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="硕士" title="硕士">
                <input type="checkbox" name="" class="col-item" lay-skin="primary" value="博士" title="博士">
            </div>
        </div>

        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">是否有挂职经历</label>
            <div class="layui-input-inline">
                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="是">是</option>
                                            <option value="否">否</option>
                                        </select>
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">国外一年以上留学经历</label>
            <div class="layui-input-inline">
                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="是">是</option>
                                                <option value="否">否</option>
                                            </select>
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">岗位</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">行政职务</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">婚姻状况</label>
            <div class="layui-input-inline">
                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">出生日期</label>
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">参加工作时间</label>
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">来院时间</label>
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">技术职务取得时间</label>
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">--
            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
        </div>
        <div class="edit-item layui-col-md6 layui-col-xs6">
            <label class="layui-form-label">技术等级聘任时间</label>
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
                //     elem: '#startM',
                //     type: 'month',
                // });
                // laydate.render({
                //     elem: '#endM',
                //     type: 'month',
                // });
                $(".save").click(function() {
                    parent.document.getElementsByClassName("primary")[0].className += " active";
                    //当你在iframe页面关闭自身时
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭 

                })

                // var newpsw;
                // $(".choose-btn").click(function() {
                //     var indext = layer.open({ /*弹出框*/
                //         type: 2,
                //         title: '选择',
                //         // maxmin: true,//大小窗口切换
                //         shadeClose: true, //点击遮罩关闭层
                //         area: ['550px', '260px'],
                //         content: 'branch.html',
                //         success: function(index) {
                //             newpsw = window[index.find('iframe')[0]['name']];
                //         },
                //         end: function() {
                //             var value = newpsw.getChoseId();
                //             $("#branch").val(value);
                //         }

                //     })
                // })

                //设置开始时间
                // var startDate = laydate.render({
                //     elem: '#startY', //开始时间选择控件id
                //     // min: '2018 - 6 - 1',
                //     type: 'month',
                //     format: 'yyyy-MM', //可任意组合
                //     done: function(value, date) {
                //         if (value !== '') {
                //             endDate.config.min.year = date.year;
                //             endDate.config.min.month = date.month - 1;
                //             // endDate.config.min.date = date.date;
                //             // endDate.config.min.hours = date.hours;
                //             // endDate.config.min.minutes = date.minutes;

                //         } else {
                //             endDate.config.min.year = '';
                //             endDate.config.min.month = '';
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
                //             startDate.config.max.month = date.month - 1;
                //             // startDate.config.max.date = date.date;
                //             // startDate.config.max.hours = date.date;
                //             // startDate.config.max.minutes = date.date;
                //         } else {
                //             startDate.config.max.year = '';
                //             startDate.config.max.month = '';
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