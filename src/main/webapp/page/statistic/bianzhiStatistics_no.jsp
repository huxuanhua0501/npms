<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%--常量--%>
    <%@ include file="/common/constHead.jsp" %>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp" %>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp" %>
    <%--公共--%>
    <%@ include file="/common/commonHead_no.jsp" %>
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
                <div class="edit-item layui-col-md12 layui-col-xs12">
                    <label class="layui-form-label">时间段</label>
                    <input type="text" idname="start_time" required lay-verify="required" placeholder="2018-08"
                           autocomplete="off"
                           class="layui-input list-input" id="start_time" style="width: 100px;display: inline-block;">至
                    <input type="text" name="end_time" required lay-verify="required" placeholder="2018-10"
                           autocomplete="off"
                           class="layui-input list-input" id="end_time" style="width: 100px;display: inline-block;">
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
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="loadBianzhi()">查询</button>
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
                        <div class="txt" id="chartHtml">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(function () {
        //加载样式
        loadStatisLayui();
        //加载查询条件
        loadStatisQuery();

        //加载编制分析数据
        loadBianzhi();


    });

    function loadStatisLayui() {
        layui.use(['layer', 'form', 'laydate'], function () {
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
            // form.on('checkbox(allChoose)', function (data) {
            //     var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            //     child.each(function (index, item) {
            //         item.checked = data.elem.checked;
            //     });
            //     form.render('checkbox');
            // })
        });
        var newpsw;
        $(".choose-btn").click(function () {
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
            selectDept('deptIds', 'names', true);
        });
    }

    function loadStatisQuery() {
        //专业技术等级
        jo.postAjax("pms/pmsDictionary/getListByDictionary/ADMINISTRATIVE_LEVEL", {}, function (json) {
            if (json) {
                var obj = json;
                var listline = "";
                listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value="" title="所有">';
                for (var i = 0; i < obj.data.length; i++) {
                    listline += '<input type=\"checkbox\" name=\"administrativeLevel\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                }
                $("#statis_administrativeLevel").append(listline);
            }
        });

        //专业技术职务
        jo.postAjax("pms/pmsDictionary/getListByDictionary/TECHNICAL_POSITION", {}, function (json) {
            if (json) {
                var obj = json;
                var listline = "";
                listline += '<input type=\"checkbox\" name=\"technicalPosition\" class=\"col-item\" lay-skin=\"primary\"  value=""  title="所有">';
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
    function selectDept(idInp, nameInp, bMore) {
        jo.selectTree('{URL_UMS}ums/tree/getDeptTree.action', jo.getDefVal(idInp, 'PARENT_ID'), jo.getDefVal(nameInp, 'PARENT_NAME'), 'ID', 'NAME', 'PARENT_ID', bMore);
    }

    //获取查询数据
    function getQueryData() {
        var obj = new Object();
        //todo
        return obj;
    }

    //加载编制信息
    function loadBianzhi() {
        //这个后台数据需要开发
        // 获取查询条件信息
        var selectObj = getQueryData();
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
         jo.postAjax("pms/statistic/getEmployeeStatistics",{"deptIds":deptIds,"start_time":start_time,"end_time":end_time,"administrativeLevel":administrativeLevel,"technicalPosition":technicalPosition}, function(json){
            if (json && json.code == 0) {
                //实现成动态数据
                var data = json.data;
                var info = data[0];
                var obj = new Object();
                //'在编', '院聘', '劳务派遣', '劳务协议', '离职', '退休', '离休', '博士后', '其他'
                //500, 35, 35, 35, 35,35,35,35,35
                obj.bianzhi1 = parseInt(info["attr1"]);//'在编'
                obj.bianzhi2 = parseInt(info["attr2"]);//'院聘'
                obj.bianzhi3 = parseInt(info["attr3"]);//'劳务派遣'
                obj.bianzhi4 = parseInt(info["attr4"]);// '劳务协议'
                obj.bianzhi5 = parseInt(info["attr5"]);//'离职'
                obj.bianzhi6 = parseInt(info["attr6"]);//'退休'
                obj.bianzhi7 = parseInt(info["attr7"]);// '离休'
                obj.bianzhi8 = parseInt(info["attr8"]);//'博士后'
                obj.bianzhi9 = parseInt(info["attr9"]);//'其他'
                obj.total = obj.bianzhi1 + obj.bianzhi2 + obj.bianzhi3 + obj.bianzhi4 + obj.bianzhi5 + obj.bianzhi6 +
                    obj.bianzhi7 + obj.bianzhi8 + obj.bianzhi9;
                chartHtml(obj);//生成编制比例结构HTML
                chart1(obj);//生成编制比例饼图
            }
        });
    }

    //生成编制比例结构HTML
    function chartHtml(data) {

        var html = '<h2>编制比例结构</h2>\n' +
            '        <p>在编: ' + data.bianzhi1 + ' 人 （' + Number(data.bianzhi1 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>院聘: ' + data.bianzhi2 + ' 人 （' + Number(data.bianzhi2 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>劳务派遣：' + data.bianzhi3 + ' 人 （' + Number(data.bianzhi3 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>劳务协议：' + data.bianzhi4 + ' 人 （' + Number(data.bianzhi4 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>离职：' + data.bianzhi5 + ' 人 （' + Number(data.bianzhi5 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>退休：' + data.bianzhi6 + ' 人 （' + Number(data.bianzhi6 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>离休：' + data.bianzhi7 + ' 人 （' + Number(data.bianzhi7 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>博士后：' + data.bianzhi8 + ' 人 （' + Number(data.bianzhi8 / data.total * 100).toFixed(2) + '%）</p>\n' +
            '        <p>其他：' + data.bianzhi9 + ' 人 （' + Number(data.bianzhi9 / data.total * 100).toFixed(2) + '%）</p>';
        $("#chartHtml").html(html);
    }

    //生成编制饼图
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
</script>
</body>

</html>
