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
        .edit-item .layui-form-checkbox {
            margin-bottom: 6px;
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
                            <span class="left" style="margin-left: 40%;font-size: 14px;">结构统计</span>
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
                        <input id="showType" name="showType" type="hidden">
                        <input type="hidden" id="deptIds" name="deptIds" class="form-control input-sm" value="">
                        <input type="text" id="names" name="names" required lay-verify="required" placeholder=""
                               autocomplete="off" class="layui-input list-input"
                               style="width: 100px;display: inline-block;"> <span class="input-group-btn">
                             <button class="layui-btn layui-btn-primary choose-btn" type="button"
                                     onclick="choiceDept('deptIds','names',true)">
                                            <i class="iconfont icon-menu" aria-hidden="true"></i>&nbsp;选择
                                        </button>
                         </span>
                    </div>
                </div>
             <%--   <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">时间段</label>
                    <input type="text" idname="start_time" required lay-verify="required" placeholder="2018-08"
                           autocomplete="off"
                           class="layui-input list-input" id="start_time" style="width: 100px;display: inline-block;">至
                    <input type="text" name="end_time" required lay-verify="required" placeholder="2018-10"
                           autocomplete="off"
                           class="layui-input list-input" id="end_time" style="width: 100px;display: inline-block;">
                </div>--%>
                <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">行政级别</label>
                    <div style="padding: 9px 15px;width: calc(100% - 150px);float: left;" id="statis_administrativeLevel">
                    </div>
                </div>
                <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">专业技术职务</label>
                    <div style="padding: 9px 15px;width: calc(100% - 150px);float: left;" id="statis_technicalPosition">
                    </div>
                </div>

                <div class="layui-form-item button-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="loadBianzhi()">查询</button>
                    </div>
                </div>
            </div>

            <div class="gray"></div>

            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="margin: 0;">
                <ul class="layui-tab-title">
                    <li onclick="loadTalentEchelon()" class="layui-this">人才建设</li>
                    <li onclick="loadMenAndWomen()">男女比例</li>
                    <li onclick="loadEducation()">学历分布</li>
                    <li onclick="loadWorkYear()">工作年限</li>
                </ul>
            </div>

            <div class="gray"></div>

            <div class="chart chart1" style="opacity: 1;">
                <div class="layui-row">
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">人才建设柱状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart2"></div>
                    </div>
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">人才建设饼状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart1"></div>
                        <div class="txt" id="lalentEchelonHtml">
                        </div>
                    </div>
                </div>
            </div>
            <div class="chart chart2" style="opacity: 0;">
                <div class="layui-row">
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">男女比例柱状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart4"></div>
                    </div>
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">男女比例饼状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart3"></div>
                        <div class="txt" id="menAndWomenHtml">
                        </div>
                    </div>
                </div>
            </div>
            <div class="chart chart3" style="opacity: 0;">
                <div class="layui-row">
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">学历分布柱状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart6"></div>
                    </div>
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">学历分布饼状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart5"></div>
                        <div class="txt" id="educationHtml">
                        </div>
                    </div>
                </div>
            </div>
            <div class="chart chart4" style="opacity: 0;">
                <div class="layui-row">
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">工作年限柱状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart8"></div>
                    </div>
                    <div class="layui-col-md12 tab-item">
                        <div class="tit clear">
                            <span class="left">工作年限饼状图分析</span>
                            <i class="iconfont icon-smenu right"></i>
                        </div>
                        <div id="chart7"></div>
                        <div class="txt" id="workYearHtml">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
    <script>

        function loadBianzhi(){
            var num = $("#showType").val();
            if(num==="1") {
                loadTalentEchelon();

            }
            if(num==="2") {
                loadMenAndWomen();

            }
            if(num==="3") {
                loadEducation();

            }
            if(num==="4") {
                loadWorkYear();

            }
        }
        //系统录入所有人员数量
        var allUserCount;
        $(function() {
            //加载样式
            loadStatisLayui();
            //加载查询条件
            loadStatisQuery();
            //获取系统录入所有人员数量
            getAllUserCount();
            //加载人才建设数据
            loadTalentEchelon();

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
                // 全选
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
                //全选
                // form.on('checkbox(allChoose)', function(data) {
                //     var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                //     child.each(function(index, item) {
                //         item.checked = data.elem.checked;
                //     });
                //     form.render('checkbox');
                // })
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
                    listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value= "" title="所有">';
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
                    listline += '<input type=\"checkbox\" name=\"technicalPosition\" class=\"col-item\" lay-skin=\"primary\" value= "" title="所有">';
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
        //获取查询条件内容
        function getQueryData() {
            var obj = new Object();
            //todo
            return obj;
        }
        //加载人才建设数据
        function loadTalentEchelon(){
            $("#showType").val("1");
            var deptIds = $("#deptIds").val();
            var start_time = $("#start_time").val();
            var end_time = $("#end_time").val();
            trashFlagArray = document.getElementsByName("administrativeLevel");
            var  administrativeLevel=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    administrativeLevel.push(trashFlagArray[b].value);
            }
            trashFlagArray = document.getElementsByName("technicalPosition");
            var  technicalPosition=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    technicalPosition.push(trashFlagArray[b].value);
            }
            //获取查询条件信息
            var selectObj = getQueryData();
            jo.postAjax("pms/statistic/getTalentEchelon",{"deptIds":deptIds,"start_time":start_time,"end_time":end_time,"administrativeLevel":administrativeLevel,"technicalPosition":technicalPosition}, function(json){
                if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    //小于30岁
                    var age30 = info["attr1"];
                    //大于30岁，小于等于35岁
                    var age30_35 = info["attr2"];
                    //大于35岁，小于等于40岁
                    var age35_40 = info["attr3"];
                    //大于40岁，小于等于45岁
                    var age40_45 = info["attr4"];
                    //大于45岁，小于等于50岁
                    var age45_50 = info["attr5"];
                    //大于50岁
                    var age50 = info["attr6"];
                    //尚无填写

                    var noInfo =  info["attr7"] - age30 - age30_35 - age35_40 - age40_45 - age45_50 - age50;
                    if(noInfo<0){
                        noInfo = 0;
                    }
                    var obj = new Object();
                    obj.talentEchelon1 = age30;
                    obj.talentEchelon2 = age30_35;
                    obj.talentEchelon3 = age35_40;
                    obj.talentEchelon4 = age40_45;
                    obj.talentEchelon5 = age45_50;
                    obj.talentEchelon6 = age50;
                    obj.talentEchelon7 = noInfo;
                    obj.total = info["attr7"];
                    talentEchelonHtml(obj);//生成人才建设html
                    chart1(obj);//生成人才建设饼图
                    chart2(obj);//生成人才建设柱状图
                }
            });
        }
        //生成人才建设Html
        function talentEchelonHtml(data){
            var html = '<h2>年龄结构</h2>\n' +
                '        <p>&lt;30岁: '+data.talentEchelon1+' 人 （'+Number(data.talentEchelon1/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>30-35岁: '+data.talentEchelon2+' 人 （'+Number(data.talentEchelon2/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>35-40岁：'+data.talentEchelon3+' 人 （'+Number(data.talentEchelon3/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>40-45岁：'+data.talentEchelon4+' 人 （'+Number(data.talentEchelon4/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>45-50岁：'+data.talentEchelon5+' 人 （'+Number(data.talentEchelon5/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>50+岁：'+data.talentEchelon6+' 人 （'+Number(data.talentEchelon6/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>尚无填写：'+data.talentEchelon7+' 人 （'+Number(data.talentEchelon7/data.total*100).toFixed(2)+'%）</p>';
            $("#lalentEchelonHtml").html(html);
        }
        //生成人才建设饼图
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
                    data: ['<30岁', '30-35岁', '35-40岁', '40-45岁', '45-50岁', '50+岁', '尚无填写'],
                    itemGap: 10,
                },
                calculable: true,
                color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3", "orange", "green", ],
                series: [{
                    name: '',
                    type: 'pie',
                    radius: [30, 100],
                    center: ['62%', '50%'],
                    roseType: 'radius',
                    data: [{
                        value: data.talentEchelon1,
                        name: '<30岁'
                    }, {
                        value: data.talentEchelon2,
                        name: '30-35岁'
                    }, {
                        value: data.talentEchelon3,
                        name: '35-40岁'
                    }, {
                        value: data.talentEchelon4,
                        name: '40-45岁'
                    }, {
                        value: data.talentEchelon5,
                        name: '45-50岁'
                    }, {
                        value: data.talentEchelon6,
                        name: '50+岁'
                    }, {
                        value: data.talentEchelon7,
                        name: '尚无填写'
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
        //生成人才建设柱状图
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
                    data: ['<30岁', '30-35岁', '35-40岁', '40-45岁', '45-50岁', '50+岁', '尚无填写'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '人数',
                    type: 'bar',
                    barWidth: '50%',
                    data: [data.talentEchelon1, data.talentEchelon2, data.talentEchelon3, data.talentEchelon4,
                        data.talentEchelon5, data.talentEchelon6, data.talentEchelon7],
                    label: labelOption,
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //加载男女比例情况数据
        function loadMenAndWomen(){
            $("#showType").val("2");
            var deptIds = $("#deptIds").val();
            var start_time = $("#start_time").val();
            var end_time = $("#end_time").val();
            trashFlagArray = document.getElementsByName("administrativeLevel");
            var  administrativeLevel=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    administrativeLevel.push(trashFlagArray[b].value);
            }
            trashFlagArray = document.getElementsByName("technicalPosition");
            var  technicalPosition=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    technicalPosition.push(trashFlagArray[b].value);
            }
            //获取查询条件信息
            var selectObj = getQueryData();
                jo.postAjax("pms/statistic/getMenAndWomen",{"deptIds":deptIds,"start_time":start_time,"end_time":end_time,"administrativeLevel":administrativeLevel,"technicalPosition":technicalPosition}, function(json){
                    if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];
                    //男
                    var man = parseInt(info["attr1"]);
                    //女
                    var women = parseInt(info["attr2"]);
                    //尚无资料
                    var noInfo = info["attr3"] - man - women;
                    if(noInfo<0){
                        noInfo = 0;
                    }
                    var obj = new Object();
                    obj.menAndWomen1 = man;
                    obj.menAndWomen2 = women;
                    obj.menAndWomen3 = noInfo;
                    obj.total = info["attr3"];
                    menAndWomenHtml(obj);//生成男女比例html
                    chart3(obj);//生成男女比例饼图
                    chart4(obj);//生成男女比例柱状图
                }
            });
        }
        //生成男女比例html
        function menAndWomenHtml(data){
            var html = '<h2>男女比例结构</h2>\n' +
                '        <p>男: '+data.menAndWomen1+' 人 （'+Number(data.menAndWomen1/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>女: '+data.menAndWomen2+' 人 （'+Number(data.menAndWomen2/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>尚无填写：'+data.menAndWomen3+' 人 （'+Number(data.menAndWomen3/data.total*100).toFixed(2)+'%）</p>';
            $("#menAndWomenHtml").html(html);
        }
        //生成男女比例饼图
        function chart3(data) {
            var dom = document.getElementById("chart3");
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
                    data: ['男', '女', '尚无填写'],
                    itemGap: 10,
                },
                calculable: true,
                color: ["#ffc760", "#6fe621", "#4fccff"],
                series: [{
                    name: '',
                    type: 'pie',
                    radius: [30, 100],
                    center: ['62%', '50%'],
                    roseType: 'radius',
                    data: [{
                        value: data.menAndWomen1,
                        name: '男'
                    }, {
                        value: data.menAndWomen2,
                        name: '女'
                    }, {
                        value: data.menAndWomen3,
                        name: '尚无填写'
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
        //生成男女比例柱状图
        function chart4(data){
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
                    data: ['男', '女', '尚无填写'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '人数',
                    type: 'bar',
                    barWidth: '30%',
                    data: [data.menAndWomen1, data.menAndWomen2, data.menAndWomen3],
                    label: labelOption,
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //加载学历分布数据
        function loadEducation(){
            $("#showType").val("3");
            var deptIds = $("#deptIds").val();
            var start_time = $("#start_time").val();
            var end_time = $("#end_time").val();
            trashFlagArray = document.getElementsByName("administrativeLevel");
            var  administrativeLevel=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    administrativeLevel.push(trashFlagArray[b].value);
            }
            trashFlagArray = document.getElementsByName("technicalPosition");
            var  technicalPosition=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    technicalPosition.push(trashFlagArray[b].value);
            }
            //获取查询条件信息
            var selectObj = getQueryData();
                jo.postAjax("pms/statistic/getEducationSpread",{"deptIds":deptIds,"start_time":start_time,"end_time":end_time,"administrativeLevel":administrativeLevel,"technicalPosition":technicalPosition}, function(json){

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
                    var noInfo = info["attr8"] - educationSpread1 - educationSpread2 - educationSpread3 - educationSpread4 - educationSpread5 - educationSpread6 - educationSpread6;
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
                    obj.total = info["attr8"] ;
                    educationHtml(obj);//生成学历分布html
                    chart5(obj);//生成学历分布饼图
                    chart6(obj);//生成学历分布柱状图
                }
            });
        }
        //生成学历分布html
        function educationHtml(data){
            var html = '<h2>学历分布结构</h2>\n' +
                '        <p>小学: '+data.education1+' 人 （'+Number(data.education1/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>初中: '+data.education2+' 人 （'+Number(data.education2/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>中专/高中：'+data.education3+' 人 （'+Number(data.education3/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>大专：'+data.education4+' 人 （'+Number(data.education4/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>大学：'+data.education5+' 人 （'+Number(data.education5/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>硕士研究生：'+data.education6+' 人 （'+Number(data.education6/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>博士研究生：'+data.education7+' 人 （'+Number(data.education7/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>尚无填写：'+data.education8+' 人 （'+Number(data.education8/data.total*100).toFixed(2)+'%）</p>';
            $("#educationHtml").html(html);
        }
        //生成学历分布饼图
        function chart5(data){
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
                    data: ['小学', '初中', '中专/高中', '大专', '大学', '硕士研究生', '博士研究生', '尚未填写'],
                    itemGap: 10,
                },
                calculable: true,
                color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3", "orange", "green", "pink", ],
                series: [{
                    name: '',
                    type: 'pie',
                    radius: [20, 60],
                    center: ['62%', '50%'],
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
                        name: '尚未填写'
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
        //生成学历分布柱状图
        function chart6(data){
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
                    data: ['小学', '初中', '中专/高中', '大专', '大学', '硕士研究生', '博士研究生', '尚未填写'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '人数',
                    type: 'bar',
                    barWidth: '30%',
                    data: [data.education1, data.education2, data.education3, data.education4, data.education5,
                        data.education6, data.education7, data.education8],
                    label: labelOption,
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
        //加载工作年限数据
        function loadWorkYear(){
            $("#showType").val("4");
            var deptIds = $("#deptIds").val();
            var start_time = $("#start_time").val();
            var end_time = $("#end_time").val();
            trashFlagArray = document.getElementsByName("administrativeLevel");
            var  administrativeLevel=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    administrativeLevel.push(trashFlagArray[b].value);
            }
            trashFlagArray = document.getElementsByName("technicalPosition");
            var  technicalPosition=new Array();
            for(b in trashFlagArray){
                if(trashFlagArray[b].checked)
                    technicalPosition.push(trashFlagArray[b].value);
            }
            //获取查询条件信息
            var selectObj = getQueryData();
                jo.postAjax("pms/statistic/getWorkYear",{"deptIds":deptIds,"start_time":start_time,"end_time":end_time,"administrativeLevel":administrativeLevel,"technicalPosition":technicalPosition}, function(json){

                    if(json && json.code == 0){
                    var data = json.data;
                    var info = data[0];

                    //小于等于5年
                    var work_year_5 = info["attr1"];
                    //大于5年，小于等于10年
                    var work_year_5_10 = info["attr2"];
                    //大于10年，小于等于20年
                    var work_year_10_20 = info["attr3"];
                    //大于20年，小于等于30年
                    var work_year_20_30 = info["attr4"];
                    //大于30年，小于等于40年
                    var work_year_30_40 = info["attr5"];
                    //大于40年
                    var work_year_40 = info["attr6"];


                    //尚无填写
                    var noInfo = info["attr7"] - work_year_5 - work_year_5_10 - work_year_10_20 - work_year_20_30 - work_year_30_40 - work_year_40;
                    if(noInfo<0){
                        noInfo = 0;
                    }
                    var obj = new Object();
                    obj.workYear1 = work_year_5;
                    obj.workYear2 = work_year_5_10;
                    obj.workYear3 = work_year_10_20;
                    obj.workYear4 = work_year_20_30;
                    obj.workYear5 = work_year_30_40;
                    obj.workYear6 = work_year_40;
                    obj.workYear7 = noInfo;
                    obj.total = info["attr7"];
                    workYearHtml(obj);//生成工作年限html
                    chart7(obj);//生成工作年限饼图
                    chart8(obj);//生成工作年限柱状图
                }
            });
        }
        //生成工作年限html
        function workYearHtml(data){
            var html = '<h2>工作年限结构</h2>\n' +
                '        <p>&lt;5年: '+data.workYear1+' 人 （'+Number(data.workYear1/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>5-10年: '+data.workYear2+' 人 （'+Number(data.workYear2/data.total*100).toFixed(2)+'%）</p>\n' +
                '        <p>10-20年：'+data.workYear3+' 人 （'+Number(data.workYear3/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>20-30年：'+data.workYear4+' 人 （'+Number(data.workYear4/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>30-40年：'+data.workYear5+' 人 （'+Number(data.workYear5/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>40+年：'+data.workYear6+' 人 （'+Number(data.workYear6/data.total*100).toFixed(2)+'%）</p>\n'+
                '        <p>尚无填写：'+data.workYear7+' 人 （'+Number(data.workYear7/data.total*100).toFixed(2)+'%）</p>';
            $("#workYearHtml").html(html);
        }
        //生成工作年限饼图
        function chart7(data){
            var dom = document.getElementById("chart7");
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
                    data: ['<5年', '5-10年', '10-20年', '20-30年', '30-40年', '40+年', '尚未填写'],
                    itemGap: 10,
                },
                calculable: true,
                color: ["#ffc760", "#6fe621", "#4fccff", "#fb497c", "#4d7bf3", "orange", "green"],
                series: [{
                    name: '',
                    type: 'pie',
                    radius: [20, 60],
                    center: ['62%', '50%'],
                    roseType: 'radius',
                    data: [{
                        value: data.workYear1,
                        name: '<5年'
                    }, {
                        value: data.workYear2,
                        name: '5-10年'
                    }, {
                        value: data.workYear3,
                        name: '10-20年'
                    }, {
                        value: data.workYear4,
                        name: '20-30年'
                    }, {
                        value: data.workYear5,
                        name: '30-40年'
                    }, {
                        value: data.workYear6,
                        name: '40+年'
                    }, {
                        value: data.workYear7,
                        name: '尚未填写'
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
        //生成工作年限柱状图
        function chart8(data) {
            var dom = document.getElementById("chart8");
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
                    data: ['<5年', '5-10年', '10-20年', '20-30年', '30-40年', '40+年', '尚未填写'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '人数',
                    type: 'bar',
                    barWidth: '40%',
                    data: [data.workYear1, data.workYear2, data.workYear3, data.workYear4, data.workYear5,
                        data.workYear6, data.workYear7],
                    label: labelOption,
                }]
            };
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }
    </script>
</body>

</html>
