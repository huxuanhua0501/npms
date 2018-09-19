<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--常量--%>
    <%@ include file="/common/constHead.jsp"%>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp"%>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp"%>
    <%--公共--%>
    <%@ include file="/common/commonHead_no.jsp"%>
    <script src="<%=URL_STATIC%>static/prototype/js/echarts.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/numerical-statement.css">
    <title>统计报表</title>
    <style>
        .chart .tab-item {
            width: 100%;
            margin-bottom: 20px;
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

        .button-item {
            position: absolute;
            right: 100px;
            top: 35%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="layui-row">
        <form class="layui-form layui-form-box layui-col-md12 person">
            <div class="person-tit clear">
                <span class="left title">统计报表</span>
                <div class="layui-form right">
                    <div class="layui-inline">
                        <div class="select clear">
                            <span class="left" style="margin-left: 40%;font-size: 14px;">编制分析</span>
                            <i class="layui-icon layui-icon-triangle-d right"></i>
                        </div>
                        <div class="select-content">
                            <ul id="selectContent" style="height: auto;">
                                <li>
                                    <a href="page/statistic/bianzhiStatistics_no.jsp?edit=true">
                                        <span class="left opt" style="margin-left: 40%;">编制分析</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="page/statistic/jiegouStatistics_no.jsp?edit=true">
                                        <span class="left opt" style="margin-left: 40%;">结构统计</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="page/statistic/jiangliStatistics_no.jsp?edit=true">
                                        <span class="left opt" style="margin-left: 40%;">奖励分析</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-content layui-row">
                <i class="iconfont icon-shaixuan" style="top: 30px;left: 37px;"></i>
                <div class="layui-form-item layui-col-md12">
                    <label class="layui-form-label">所属部门</label>
                    <div class="layui-input-inline big">
                        <input type="text" id="branch" name="PARENT_NAME" class="layui-input">
                        <span class="input-group-btn">
                            <button class="layui-btn layui-btn-primary choose-btn" type="button">
                                <i class="iconfont icon-menu" aria-hidden="true"></i>&nbsp;选择
                            </button>
                         </span>
                    </div>
                </div>
                <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">时间段</label>
                    <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="startY" style="width: 100px;display: inline-block;">至
                    <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="endY" style="width: 100px;display: inline-block;">
                </div>
                <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">行政级别</label>
                    <div style="padding: 9px 15px;" id="statis_administrativeLevel">
                    </div>
                </div>
                <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">专业技术职务</label>
                    <div style="padding: 9px 15px;" id="statis_technicalPosition">
                    </div>
                </div>

                <div class="layui-form-item button-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry">查询</button>
                    </div>
                </div>
            </div>

            <div class="gray"></div>

            <div class="chart">
                <div class="layui-row">
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">编制比例分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart1"></div>
                        <div class="txt">
                            <h2>编制比例结构</h2>
                            <p>在编: 500 人 （64.1%）</p>
                            <p>院聘: 35 人 （4.49%）</p>
                            <p>劳务派遣：35 人 （4.49%）</p>
                            <p>劳务协议：35 人 （4.49%）</p>
                            <p>离职：35 人 （4.49%）</p>
                            <p>退休：35 人 （4.49%）</p>
                            <p>离休：35 人 （4.49%）</p>
                            <p>博士后：35 人 （4.48%）</p>
                            <p>其他：35 人 （4.48%）</p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
    <script>
        $(function() {
            //加载样式
            loadStatisLayui();
            //加载查询条件
            loadStatisQuery();

            chart1();
            // chart2();

            function chart1() {
                var dom = document.getElementById("chart1");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        icon: 'circle',
                        x: 'center',
                        y: 'bottom',
                        data: ['在编', '院聘', '劳务派遣', '劳务协议', '离职', '退休', '离休', '博士后', '其他'],
                        itemGap: 10,
                    },
                    calculable: true,
                    // color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3"],
                    color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3", "orange", "green", "pink", "yellow"],
                    series: [{
                        name: '',
                        type: 'pie',
                        radius: [30, 100],
                        center: ['62%', '50%'],
                        roseType: 'radius',
                        data: [{
                            value: 500,
                            name: '在编'
                        }, {
                            value: 35,
                            name: '院聘'
                        }, {
                            value: 35,
                            name: '劳务派遣'
                        }, {
                            value: 35,
                            name: '劳务协议'
                        }, {
                            value: 35,
                            name: '离职'
                        }, {
                            value: 35,
                            name: '退休'
                        }, {
                            value: 35,
                            name: '离休'
                        }, {
                            value: 35,
                            name: '博士后'
                        }, {
                            value: 35,
                            name: '其他'
                        }],
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    formatter: "{b} : {c}人 ({d}%)",
                                    color: "#4a4a4a"

                                },
                                labelLine: {
                                    show: true
                                }
                            },
                            emphasis: {
                                label: {
                                    show: true
                                },
                                labelLine: {
                                    show: true
                                }
                            }
                        }
                    }]
                };
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }
        });
        function loadStatisLayui(){
            layui.use(['layer', 'form', 'laydate'], function() {
                var form = layui.form;
                var layer = layui.layer;
                var laydate = layui.laydate;

                //全选
                form.on('checkbox(allChoose)', function(data) {
                    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                    child.each(function(index, item) {
                        item.checked = data.elem.checked;
                    });
                    form.render('checkbox');
                })
            });
            var newpsw;
            $(".choose-btn").click(function() {
               /*var indext = layer.open({ /!*弹出框*!/
                    type: 2,
                    title: '选择',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['550px', '260px'],
                    content: 'branch.html',
                    success: function(index) {
                        newpsw = window[index.find('iframe')[0]['name']];
                    },
                    end: function() {
                        var value = newpsw.getChoseId();
                        $("#branch").val(value);
                    }
                })*/
                selectDept('deptIds','names',true);
            });
        }
        function loadStatisQuery(){
            //专业技术等级
            jo.postAjax("pms/pmsDictionary/getListByDictionary/ADMINISTRATIVE_LEVEL", {}, function(json){
                if(json) {
                    var obj = json;
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#statis_administrativeLevel").append(listline);
                }
            });

            //专业技术职务
            jo.postAjax("pms/pmsDictionary/getListByDictionary/TECHNICAL_POSITION", {}, function(json){
                if(json) {
                    var obj = json;
                    var listline = "";
                    listline += '<input type=\"checkbox\" name=\"technicalPosition\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                    for (var i = 0; i < obj.data.length; i++) {
                        listline += '<input type=\"checkbox\" name=\"technicalPosition\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                    }
                    $("#statis_technicalPosition").append(listline);
                }
            });
        }
        /**
         * 选择部门,仅部门
         * @param idInp 回填id的输入框id
         * @param nameInp 回填name的输入框id
         * @param bMore 是否允许多选,默认单选
         */
        function selectDept(idInp, nameInp, bMore){
            jo.selectTree('{URL_UMS}ums/tree/getDeptTree.action',jo.getDefVal(idInp, 'PARENT_ID'),jo.getDefVal(nameInp, 'PARENT_NAME'),'ID','NAME', 'PARENT_ID', bMore);
        }
    </script>
</body>

</html>
