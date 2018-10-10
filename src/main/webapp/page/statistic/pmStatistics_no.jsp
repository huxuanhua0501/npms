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
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/personnel-management.css">
    <title>统计汇总</title>
</head>
<body>
<div class="container">
    <div class="tabs clear">
        <div class="tab-item on-job">
            <div class="tit clear">
                <span class="left">在职员工</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div class="item-box">
                <span class="big" id="onJobs"></span>人
            </div>
        </div>
        <div class="tab-item in-job">
            <div class="tit clear">
                <span class="left">当月入职</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div class="item-box">
                <span class="big" id="entryMonth"></span>人
            </div>
        </div>
        <div class="tab-item leaved-job">
            <div class="tit clear">
                <span class="left">当月离职</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div class="item-box">
                <span class="big gray" id="quitMonth"></span>人
            </div>
        </div>
        <div class="tab-item leaveing-job">
            <div class="tit clear">
                <span class="left">已离职</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div class="item-box">
                <span class="big" id="quited"></span>人
            </div>
        </div>
    </div>

    <div class="chart clear">
        <div class="tab-item">
            <div class="tit clear">
                <span class="left">员工统计</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div id="chart1">
            </div>
        </div>
        <div class="tab-item">
            <div class="tit clear">
                <span class="left">学历比例</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div id="chart2">
            </div>
        </div>
        <div class="tab-item">
            <div class="tit clear">
                <span class="left">婚姻比例</span>
                <i class="iconfont icon-smenu right"></i>
            </div>
            <div id="chart3">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //系统录入所有人员数量
    var allUserCount;
    $(function() {
        //加载样式
        loadPmsStatisticsLayui();
        //加载统计汇总数据
        loadPmsStatistics();
    });
    function loadPmsStatisticsLayui() {
        layui.use(['layer', 'form', 'laydate'], function() {
            var form = layui.form;
            var layer = layui.layer;
            var laydate = layui.laydate;
        });
    }
    //加载统计汇总数据
    function loadPmsStatistics(){
        //获取系统录入所有人员数量
        getAllUserCount();
        //加载员工当月在职、离职信息
        loadPersonStatis();
        //加载编制数据
        loadBianzhi();
        //加载学历分布数据
        loadEducation();
        //加载婚姻比例数据
        loadMarriage();
    }
    //查询系统内所有用户数量
    function getAllUserCount(){
        //这里需要权限
        jo.postAjax("pms/statistic/getAllUserCount",{}, function(json){
            if(json && json.code == 0){
                var data = json.data;
                var info = data[0];
                allUserCount = info["attr1"];
            }
        });
    }
    //加载员工当月在职、离职信息
    function loadPersonStatis(){
        //这个需要后台数据
        jo.postAjax("pms/statistic/getNumberOfPeople",{}, function(json){
            if(json && json.code == 0){
                //实现成动态数据

                var obj = new Object();
                //'在职员工', '当月入职', '当月离职', '已离职'
                //1376, 32, 0, 2
                obj.statis1 = 1376;//'在职员工'
                obj.statis2 = 111;//'当月入职'
                obj.statis3 = 0;//'当月离职'
                obj.statis4 = 2;// '已离职'
                $("#onJobs").html(obj.statis1);
                $("#entryMonth").html(obj.statis2);
                $("#quitMonth").html(obj.statis3);
                $("#quited").html(obj.statis4);
                var data = json.data;
                var info = data[0];
                $("#onJobs").html(info["attr1"]);
                $("#entryMonth").html(info["attr2"]);
                $("#quitMonth").html(info["attr3"]);
                $("#quited").html(info["attr4"]);
            }
        });
    }
    //加载编制数据
    function loadBianzhi() {
        //这个后台数据需要开发
        //这里需要做权限控制
        jo.postAjax("pms/statistic/getEmployeeStatistics",{}, function(json){
            if(json && json.code == 0){
                //实现成动态数据
                var data = json.data;
                var info = data[0];
                var obj = new Object();
                //'在编', '院聘', '劳务派遣', '劳务协议', '离职', '退休', '离休', '博士后', '其他'
                //500, 35, 35, 35, 35,35,35,35,35
                obj.bianzhi1 = info["attr1"];//'在编'
                obj.bianzhi2 = info["attr2"];//'院聘'
                obj.bianzhi3 = info["attr3"];//'劳务派遣'
                obj.bianzhi4 = info["attr4"];// '劳务协议'
                obj.bianzhi5 = info["attr5"];//'离职'
                obj.bianzhi6 = info["attr6"];//'退休'
                obj.bianzhi7 = info["attr7"];// '离休'
                obj.bianzhi8 = info["attr8"];//'博士后'
                obj.bianzhi9 = info["attr9"];//'其他'
                obj.total = obj.bianzhi1+ obj.bianzhi2+ obj.bianzhi3+ obj.bianzhi4+ obj.bianzhi5+ obj.bianzhi6+
                    obj.bianzhi7+ obj.bianzhi8+ obj.bianzhi9;
                chart1(obj);//生成编制比例饼图
            }
        });
    }
    //生成编制比例饼图
    function chart1(data) {
        var dom = document.getElementById("chart1");
        var charts = [];
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        app.title = '环形图';

        option = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                icon: 'circle',
                orient: 'horizontal',
                x: 'center',
                y: 'bottom',
                data: ['在编', '院聘', '劳务派遣', '劳务协议', '离职', '退休', '离休', '博士后', '其他'],
                itemWidth: 10,
                itemHeight: 10,
                itemGap: 10,
            },
            // color: ["#4a90e2", "#6fe621", "red", "yellow", "pink", "#fb497c", "purple", "orange", "green"],
            color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3", "orange", "green", "pink", "yellow"],
            series: [{
                name: '员工统计',
                type: 'pie',
                radius: [20, 60],
                center: ['50%', '50%'],
                data: [{
                    value: data.bianzhi1,
                    name: '在编'
                }, {
                    value: data.bianzhi2,
                    name: '院聘'
                }, {
                    value: data.bianzhi3,
                    name: '劳务派遣'
                }, {
                    value: data.bianzhi4,
                    name: '劳务协议'
                }, {
                    value: data.bianzhi5,
                    name: '离职'
                }, {
                    value: data.bianzhi6,
                    name: '退休'
                }, {
                    value: data.bianzhi7,
                    name: '离休'
                }, {
                    value: data.bianzhi8,
                    name: '博士后'
                }, {
                    value: data.bianzhi9,
                    name: '其他'
                }, ],
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            // formatter: "{b} : {c} ({d}%)",
                            formatter: "{c}人 ({d}%)",
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
    //加载学历分布数据
    function loadEducation(){
        //这个需要进行权限控制
        jo.postAjax("pms/statistic/getEducationSpread",{}, function(json){
            if(json && json.code == 0){
                var data = json.data;
                var info = data[0];
                //小学
                var educationSpread1 = info["attr1"];
                //初中
                var educationSpread2 = info["attr2"];
                //中专/高中
                var educationSpread3 = info["attr3"];
                //专科
                var educationSpread4 = info["attr4"];
                //专科/本科
                var educationSpread5 = info["attr5"];
                //硕士研究生
                var educationSpread6 = info["attr6"];
                //博士研究生
                var educationSpread7 = info["attr7"];

                //尚无填写
                var noInfo = allUserCount - educationSpread1 - educationSpread2 - educationSpread3 - educationSpread4 - educationSpread5 - educationSpread6 - educationSpread6;
                if(noInfo<0){
                    noInfo = 0;
                }
                var obj = new Object();
                obj.education1 = educationSpread1;
                obj.education2 = educationSpread2;
                obj.education3 = educationSpread3;
                obj.education4 = educationSpread4;
                obj.education5 = educationSpread5;
                obj.education6 = educationSpread6;
                obj.education7 = educationSpread7;
                obj.education8 = noInfo;
                obj.total = allUserCount;
                chart2(obj);//生成学历分布饼图
            }
        });
    }
    //生成学历分布饼图
    function chart2(data) {
        var dom = document.getElementById("chart2");
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
                data: ['小学', '初中', '中专/高中', '大专', '大学', '硕士研究生', '博士研究生', '其他'],
                itemGap: 10,
            },
            calculable: true,
            color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3", "orange", "green", "pink"],
            series: [{
                name: '学历比例',
                type: 'pie',
                radius: [20, 60],
                center: ['50%', '50%'],
                roseType: 'radius',

                data: [{
                    value: data.education1,
                    name: '小学'
                }, {
                    value: data.education2,
                    name: '初中'
                }, {
                    value: data.education3,
                    name: '中专/高中'
                }, {
                    value: data.education4,
                    name: '大专'
                }, {
                    value: data.education5,
                    name: '大学'
                }, {
                    value: data.education6,
                    name: '硕士研究生'
                }, {
                    value: data.education7,
                    name: '博士研究生'
                }, {
                    value: data.education8,
                    name: '其他'
                }, ],
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            // formatter: "{b} : {c} ({d}%)",
                            formatter: "{c}人 ({d}%)",
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
    //加载婚姻比例数据
    function loadMarriage(){
        //这个后台数据需要开发
        //这里需要做权限控制
        jo.postAjax("pms/statistic/getMaritalStatus",{}, function(json){
            if(json && json.code == 0){
                //实现成动态数据
                var data = json.data;
                var info = data[0];
                var obj = new Object();
                //'已婚', '未婚', '离异','尚未填写'
                //68, 80, 80,
                obj.marriage1 = info["attr1"];//'已婚'
                obj.marriage2 = allUserCount - obj.marriage1;//'已婚以外'
                obj.marriage3 = info["attr2"];//'未婚'
                obj.marriage4 = allUserCount - obj.marriage3;//'未婚以外'
                obj.marriage5 = info["attr3"];//'离异'
                obj.marriage6 = allUserCount - obj.marriage5;//'离异以外'
                chart3(obj);//生成婚姻比例饼图
            }
        });
    }
    //生成婚姻比例饼图
    function chart3(data) {
        var dom = document.getElementById("chart3");
        var myChart = echarts.init(dom);
        var app = {};
        var dataStyle = {
            normal: {
                label: {
                    show: true,
                    formatter: "{b} : {c}",
                    // color: "#4a4a4a"
                },
                labelLine: {
                    show: true
                }
            }
        };
        var placeHolderStyle = {
            normal: {
                color: 'rgba(0,0,0,0)',
                label: {
                    show: false
                },
                labelLine: {
                    show: false
                }
            },
            emphasis: {
                color: 'rgba(0,0,0,0)'
            }
        };
        option = {
            title: {
                text: '',
                subtext: '',
                sublink: '',
                x: 'center',
                y: 'bottom',
                itemGap: 20,
                textStyle: {
                    color: 'rgba(30,144,255,0.8)',
                    fontFamily: '微软雅黑',
                    fontSize: 35,
                    fontWeight: 'bolder'
                }
            },
            tooltip: {
                show: true,
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                icon: 'circle',
                orient: 'horizontal',
                x: "center",
                y: 'bottom',
                itemGap: 50,
                data: ['已婚', '未婚', '离异']
            },
            color: ["#fdc66a", "#0394ff", "#8bec22"],
            series: [{
                name: '已婚',
                type: 'pie',
                clockWise: true,
                radius: [55, 70],
                itemStyle: dataStyle,
                data: [{
                    value: data.marriage1,
                    name: '已婚'
                }, {
                    value: data.marriage2,
                    name: '已婚以外',
                    itemStyle: placeHolderStyle
                }]
            }, {
                name: '离异',
                type: 'pie',
                clockWise: true,
                radius: [25, 40],
                itemStyle: dataStyle,
                data: [{
                    value: data.marriage5,
                    name: '离异'
                }, {
                    value: data.marriage6,
                    name: '离异以外',
                    itemStyle: placeHolderStyle
                }]
            }, {
                name: '未婚',
                type: 'pie',
                clockWise: true,
                radius: [85, 100],
                itemStyle: dataStyle,
                data: [{
                    value: data.marriage3,
                    name: '未婚'
                }, {
                    value: data.marriage4,
                    name: '未婚以外',
                    itemStyle: placeHolderStyle
                }]
            }, ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    }
</script>
</body>
</html>
