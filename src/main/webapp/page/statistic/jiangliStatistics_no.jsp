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
                            <span class="left" style="margin-left: 40%;font-size: 14px;">奖励分析</span>
                            <i class="layui-icon layui-icon-triangle-d right"></i>
                        </div>
                        <div class="select-content">
                            <ul id="selectContent" style="height: auto;">
                                <li>
                                    <a href="javascript:;">
                                        <span class="left opt" style="margin-left: 40%;">编制分析</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="'page/statistic/jiegouStatistics_no.jsp?edit=true">
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

                <div class="layui-form-item button-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry">查询</button>
                    </div>
                </div>
            </div>

            <div class="gray"></div>

            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin: 0;">
                <ul class="layui-tab-title">
                    <li onclick="loadAwardLevel()" class="layui-this">奖励数量</li>
                    <li onclick="loadPublish()">出版著作数量</li>
                    <li onclick="loadYearCheck()">年度考核</li>
                </ul>
            </div>

            <div class="gray"></div>

            <div class="chart chart1" style="opacity: 1;">
                <div class="layui-row">
                    <div class="layui-col-md6 tab-item">
                        <div class="tit clear">
                            <span class="left">奖励层次分布饼状图</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart1"></div>
                    </div>
                    <div class="layui-col-md6 tab-item">
                        <div class="tit clear">
                            <span class="left">奖励层次分布柱状图</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart2"></div>
                    </div>
                </div>
            </div>
            <div class="chart chart2" style="opacity: 0;">
                <div class="layui-row">
                    <div class="layui-col-md6 tab-item">
                        <div class="tit clear">
                            <span class="left">出版著作数量饼状图</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart3"></div>
                        <div class="legend">
                            <ul>
                                <li><span></span>著作</li>
                                <li><span></span>译著</li>
                                <li><span></span>编著</li>
                                <li><span></span>独著</li>
                                <li><span></span>其他</li>
                            </ul>
                        </div>
                    </div>
                    <div class="layui-col-md6 tab-item">
                        <div class="tit clear">
                            <span class="left">出版著作数量分布线图</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart4" style="height: 300px;"></div>
                    </div>
                </div>
            </div>
            <div class="chart chart3" style="opacity: 0;">
                <div class="layui-row">
                    <div class="layui-col-md6 tab-item">
                        <div class="tit clear">
                            <span class="left">年度考核饼状图</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart5"></div>
                    </div>
                    <div class="layui-col-md6 tab-item">
                        <div class="tit clear">
                            <span class="left">年度考核柱状图</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart6"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
    <script>

        //系统录入所有人员数量
        var allUserCount;
        //系统录入所有科技奖数量
        var allTechAwardCount;
        $(function() {
            //加载样式
            loadStatisLayui();
            //获取系统录入所有人员数量
            getAllUserCount();
            //获取系统录入所有科技奖数量
            getAllTechAwardsCount();
            //加载奖励层次图表
            loadAwardLevel();
            // tab点击事件
            $(".layui-tab-title li").click(function() {
                $(".layui-tab-title li").removeClass("layui-this");
                $(this).addClass("layui-this");
                var index = $(this).index() + 1;
                var name = "chart" + index;
                $(".chart").css("opacity", "0");
                document.getElementsByClassName(name)[0].style.opacity = "1";

            })
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
        /**
         * 选择部门,仅部门
         * @param idInp 回填id的输入框id
         * @param nameInp 回填name的输入框id
         * @param bMore 是否允许多选,默认单选
         */
        function selectDept(idInp, nameInp, bMore){
            jo.selectTree('{URL_UMS}ums/tree/getDeptTree.action',jo.getDefVal(idInp, 'PARENT_ID'),jo.getDefVal(nameInp, 'PARENT_NAME'),'ID','NAME', 'PARENT_ID', bMore);
        }
        //获取查询条件内容
        function getQueryData() {
            var obj = new Object();
            //todo
            return obj;
        }
        //加载奖励层次数据
        function loadAwardLevel(){
            //获取查询条件信息
            var selectObj = getQueryData();
            jo.postAjax("pms/statistic/getAwardLevel",{data:selectObj}, function(json){
                if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    //国家级
                    awardLevel = info["attr1"];
                    //省部级
                    awardLeve2 = info["attr2"];
                    //厅级及以下
                    awardLeve3 = info["attr3"];

                    //尚无资料
                    noInfo = allTechAwardCount - awardLevel - awardLeve2 - awardLeve3;
                    if(noInfo<0){
                        noInfo = 0;
                    }
                    var obj = new Object();
                    obj.awardL1 = awardLevel;
                    obj.awardL2 = awardLeve2;
                    obj.awardL3 = awardLeve3;
                    obj.awardL4 = noInfo;
                    chart1(obj);//生成奖励层次饼图
                    chart2(obj);//生成奖励层次柱状图
                }
            });
        }
        //奖励层次饼图
        function chart1(data) {
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
                    data: ['国家级', '省部级', '厅级及以下', '尚未填写'],
                    itemGap: 10,

                },

                calculable: true,
                color: ["#FB497C", "#FECA34", "#7ED321", "#4FCCFF"],
                series: [{
                    name: '奖励层次分布饼状图',
                    type: 'pie',
                    radius: [30, 100],
                    center: ['50%', '50%'],
                    roseType: 'area',
                    itemStyle: {
                        normal: {
                            label: {
                                show: true,
                                formatter: "{b} : {c} ({d}%)",
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
                    },
                    data: [{
                        value: data.awardL1,
                        name: '国家级'
                    }, {
                        value: data.awardL2,
                        name: '省部级'
                    }, {
                        value: data.awardL3,
                        name: '厅级及以下'
                    }, {
                        value: data.awardL4,
                        name: '尚未填写'
                    }]
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //奖励层次柱状图
        function chart2(data) {
            var dom = document.getElementById("chart2");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;

            var labelOption = {
                normal: {
                    show: true,
                    formatter: '{c}',
                    fontSize: 12,
                    rich: {
                        name: {
                            textBorderColor: '#fff'
                        }
                    }
                }
            };

            option = {
                color: ["#FB497C", "#FECA34", "#7ED321", "#4FCCFF"],
                grid: {
                    left: 100,
                    top: 50
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    icon: 'circle',
                    x: 'center',
                    y: 'bottom',
                    data: ['国家级', '省部级', '厅级及以下', '尚未填写'],
                    itemGap: 40,
                },

                calculable: true,
                xAxis: [{
                    type: 'category',
                    axisTick: {
                        show: false
                    },
                    data: ['', '', '','']
                }],
                yAxis: [{
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#c7c7cd',
                            width: 0
                        }
                    },
                    min: 0,
                    max: 400,
                    splitNumber: 5

                }],
                series: [{
                    name: '国家级',
                    type: 'bar',
                    barGap: 0,
                    label: labelOption,
                    data: [data.awardL1, '', '','']
                }, {
                    name: '省部级',
                    type: 'bar',
                    label: labelOption,
                    data: ['', data.awardL2,'','']
                }, {
                    name: '厅级及以下',
                    type: 'bar',
                    label: labelOption,
                    data: ['','', data.awardL3,'']
                }, {
                    name: '尚未填写',
                    type: 'bar',
                    label: labelOption,
                    data: ['','','',data.awardL4]
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //加载出版著作数据
        function loadPublish(){
            //这个后台数据需要开发
            // 获取查询条件信息
            var selectObj = getQueryData();
            jo.postAjax("pms/statistic/getAwardLevel",{data:selectObj}, function(json){
                if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    //国家级
                    awardLevel = info["attr1"];
                    //省部级
                    awardLeve2 = info["attr2"];
                    //厅级及以下
                    awardLeve3 = info["attr3"];

                    //尚无资料
                    noInfo = allTechAwardCount - awardLevel - awardLeve2 - awardLeve3;
                    if(noInfo<0){
                        noInfo = 0;
                    }

                    var obj = new Object();
                    //85, 90, 90, 95, 95, 50
                    //'著作', '编著', '译著', '独著', '合著', '其他'
                    obj.publish1 = 85;//'著作'
                    obj.publish2 = 90;// '编著'
                    obj.publish3 = 90;//'译著'
                    obj.publish4 = 95;//'独著'
                    obj.publish5 = 95;//'合著'
                    obj.publish6 = 50;//'其他'
                    obj.max = obj.publish4+5;//max是6个数值最大的+5
                    chart3(obj);//生成出版著作数量饼图
                    chart4(obj);//生成出版著作数量分布线图
                }
            });
        }
        //出版著作数量饼图
        function chart3(data) {
            var dom = document.getElementById("chart3");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;
            var labelOption = {
                normal: {
                    show: true,
                    formatter: '{c}',
                    fontSize: 12,
                    rich: {
                        name: {
                            textBorderColor: '#fff'
                        }
                    }
                }
            };
            option = {
                tooltip: {},
                radar: {
                    name: {
                        textStyle: {
                            color: '#333',
                            borderRadius: 3,
                            padding: [3, 5]
                        }
                    },
                    radius: '60%',
                    center: ['50%', '44%'],
                    indicator: [{
                        text: '著作',
                        max: data.max
                    }, {
                        text: '编著',
                        max: data.max
                    }, {
                        text: '译著',
                        max: data.max
                    }, {
                        text: '独著',
                        max: data.max
                    }, {
                        text: '合著',
                        max: data.max
                    }, {
                        text: '其他',
                        max: data.max
                    }],
                    splitArea: {

                        show: true,

                        areaStyle: {

                            color: ["#fff"] // 图表背景网格的颜色

                        }

                    }
                },
                series: [{
                    name: '出版著作',
                    type: 'radar',
                    areaStyle: {
                        normal: {
                            color: "#ffb2c2",
                        }
                    },
                    data: [{
                        value: [data.publish1, data.publish2, data.publish3, data.publish4, data.publish5, data.publish6],
                        name: '出版著作数量'
                    }]
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //出版著作数量分布线图
        function chart4(data) {
            var dom = document.getElementById("chart4");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;

            var labelOption = {
                normal: {
                    show: true,
                    formatter: '{c}',
                    fontSize: 12,
                    rich: {
                        name: {
                            textBorderColor: '#fff'
                        }
                    }
                }
            };

            option = {
                color: ['#3398DB'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    data: ['著作', '编著', '译著', '独著', '合著', '其他'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '数量',
                    type: 'bar',
                    barWidth: '40%',
                    data: [data.publish1, data.publish2, data.publish3, data.publish4, data.publish5, data.publish6],
                    label: labelOption,
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //加载年度考核数据
        function loadYearCheck(){
            //这个后台数据需要开发
            // 获取查询条件信息
            var selectObj = getQueryData();
            jo.postAjax("pms/statistic/getAwardLevel",{data:selectObj}, function(json){
                if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    //国家级
                    awardLevel = info["attr1"];
                    //省部级
                    awardLeve2 = info["attr2"];
                    //厅级及以下
                    awardLeve3 = info["attr3"];

                    //尚无资料
                    noInfo = allTechAwardCount - awardLevel - awardLeve2 - awardLeve3;
                    if(noInfo<0){
                        noInfo = 0;
                    }

                    var obj = new Object();
                    //'年度考核等级', '第一季度等级', '第二季度等级', '第三季度等级', '第四季度等级'
                    //248, 201, 145, 74, 26
                    obj.yearCheck1 = 248;//'年度考核等级'
                    obj.yearCheck2 = 201;//'第一季度等级'
                    obj.yearCheck3 = 145;//'第二季度等级'
                    obj.yearCheck4 = 74;// '第三季度等级'
                    obj.yearCheck5 = 26;//'第四季度等级'
                    chart5(obj);//生成年度考核饼图
                    chart6(obj);//生成年度考核柱状图
                }
            });
        }
        //年度考核饼图
        function chart5(data) {
            var dom = document.getElementById("chart5");
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
                    data: ['年度考核等级', '第一季度等级', '第二季度等级', '第三季度等级', '第四季度等级'],
                    itemGap: 10,
                },
                calculable: true,
                color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3"],
                series: [{
                    name: '',
                    type: 'pie',
                    radius: [20, 70],
                    center: ['50%', '50%'],
                    roseType: 'radius',
                    data: [{
                        value: data.yearCheck1,
                        name: '年度考核等级'
                    }, {
                        value: data.yearCheck2,
                        name: '第一季度等级'
                    }, {
                        value: data.yearCheck3,
                        name: '第二季度等级'
                    }, {
                        value: data.yearCheck4,
                        name: '第三季度等级'
                    }, {
                        value: data.yearCheck5,
                        name: '第四季度等级'
                    }],
                    itemStyle: {
                        normal: {
                            label: {
                                show: true,
                                formatter: "{b} : {c} ({d}%)",
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
        //年度考核柱状图
        function chart6(data) {
            var dom = document.getElementById("chart6");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;

            var labelOption = {
                normal: {
                    show: true,
                    formatter: '{c}',
                    fontSize: 12,
                    rich: {
                        name: {
                            textBorderColor: '#fff'
                        }
                    }
                }
            };

            option = {
                color: ['#3398DB'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    data: ['年度考核', '第一季度', '第二季度', '第三季度', '第四季度'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '数量',
                    type: 'bar',
                    barWidth: '40%',
                    data: [data.yearCheck1, data.yearCheck2, data.yearCheck3, data.yearCheck4, data.yearCheck5],
                    label: labelOption,
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //查询系统内所有用户数量
        function getAllUserCount(){
            jo.postAjax("pms/statistic/getAllUserCount",{}, function(json){
                if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    allUserCount = info["attr1"];
                }
            });
        }
        //查询系统内所有科技奖数量
        function getAllTechAwardsCount(){
            jo.postAjax("pms/statistic/getAllTechAwardsCount",{}, function(json){
                if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    allTechAwardCount = info["attr1"];
                }
            });
        }
    </script>
</body>

</html>
