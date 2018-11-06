<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>员工花名册</title>
    <%--常量--%>
    <%@ include file="/common/constHead.jsp" %>
    <script src="<%=URL_STATIC%>static/final/js/jquery.min.js"></script>
    <%--jQuery--%>
    <%--<%@ include file="/common/jqueryHead.jsp" %>--%>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp" %>
    <%--bootstrap和字体--%>
    <%--
        <%@ include file="/common/bootstrapHead.jsp"%>
    --%>
    <%--layer--%>
    <%--
        <%@ include file="/common/layerHead.jsp"%>
    --%>
    <%--zTree树--%>
    <%--
        <%@ include file="/common/zTreeHead.jsp"%>
    --%>
    <%--公共--%>

    <%@ include file="/common/commonHead.jsp" %>

    <link rel="shortcut icon" href="<%=URL_STATIC%>static/images/favicon.ico">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">

    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <%--<link rel="stylesheet" href="<%=URL_STATIC%>static/final/css/layui.css">--%>
    <%--<link rel="stylesheet" href="<%=URL_STATIC%>static/final/font/font2/iconfont.css">--%>
    <!-- <link rel="stylesheet" href="css/announcement-list.css"> -->
    <%--<link rel="stylesheet" href="<%=URL_STATIC%>static/final/css/common.css">--%>
    <%--<link rel="stylesheet" href="<%=URL_STATIC%>static/final/css/person-document.css">--%>
    <script src="<%=URL_STATIC%>static/final/js/common.js"></script>

    <script src="<%=URL_STATIC%>static/newjs/final_jo.js"></script>
    <script src="<%=URL_STATIC%>static/newjs/final_jo-adapt.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/final_grid_personnel_no.js"></script>
    <script src="<%=URL_STATIC%>static/js/common.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/common_biz_no.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/common.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/employee.css">
    <script src="<%=URL_STATIC%>static/prototype/js/common_no.js"></script>
    <script type="text/javascript">
        $(function () {

            loadAjax();
        });
        function loadAjax() {
            jo.postAjax("pms/pmsDictionary/getListByDictionary/PERSON_TYPE", {}, function(obj){
                var list = "", listline = "";
                listline += '<input type=\"checkbox\" name=\"remarkxxx\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                for (var i = 0; i < obj.data.length; i++) {
                    listline += '<input type=\"checkbox\" name=\"remarkxxx\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                }
                $("#checkbox_0").append("");
                $("#checkbox_0").append(listline);

            }, false);
            sfSet();//在初始化表格之前
            joViewInitAboutDoc();//joView初始化处理
        }
        joView.handleItem = function (oItem, iIndex) {

            oItem._cvm = (oItem.trashFlag == 1 ? "禁用" : "启用");
            oItem._cvm += (oItem.dicName =='' ? "" :  "/"+oItem.dicName);

            oItem._opt = '<span  onclick="lookUserDoc(\'' + oItem.id + '\')"> &nbsp;查看</span>';
        };
    </script>
    <script type="text/javascript">


        /**
         * 查看用户简历
         * @param uid
         */
        function lookUserDoc(uid){
            if(uid){
                top.jo.showWin("page/personal/information-preview.jsp?id="+(uid), "90%", "90%", "员工档案", "WIN_USER_DOC");
            }
        }


        var userId = jo.getDefVal(jo.getUrlParam("userId"), loginUser.id);
        var sf = jo.getDefVal(jo.getUrlParam("sf"), "");
        var _edit = jo.getDefVal(jo.getUrlParam("edit"), "");
        $(function () {
            goto();
        });

        function goto() {
            if (jo.isValid(sf)) {
                $("ul a").each(function () {
                    $(this).attr("lay-href", $(this).attr("lay-href") + userId + "&sf=rs");
                });
            } else {
                $("ul a").each(function () {
                    $(this).attr("lay-href", $(this).attr("lay-href") + userId);
                });
            }
            if (jo.isValid(_edit)) {
                $("ul a").each(function () {
                    $(this).attr("lay-href", $(this).attr("lay-href") + "&edit=true");
                });
            }

        }
        function sfSet() {
            console.log("打印表格属性sf：" + sf);
            if (jo.isValid(sf)) {
                $("#mainList").attr("formUrl", $("#mainList").attr("formUrl") + "?sf=rs");
                console.log("打印表格属性：" + $("#mainList").attr("formUrl"));
            }
        }
    </script>
    <style>
        .layui-table a.look {
            margin: 0;
        }

        .shaixuanBtn .layui-form-checkbox {
            margin-bottom: 4px;
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

        .shaixuanBtn .layui-btn+.layui-btn,
        .shaixuanBtn a {
            margin-right: 10px;
            margin-left: 0;
            margin-bottom: 10px;
        }

        .now-item-box .now-item {
            display: block;
        }

        .now-item .info {
            padding: 5px 15px;
            width: calc(100% - 200px);
            float: left;
        }

        .now-item .layui-form-label {
            position: relative;
            float: left;
            display: block;
            width: 120px;
            font-weight: 400;
            line-height: 20px;
            text-align: left;
        }
        /*分页条start*/
        .page-bar {
            width: 100%;
        }

        .page-bar::after { /*将分页条拉回文档流*/
            content: '';
            display: block;
            clear: both;
        }

        .page-bar-float { /*分页条悬浮在窗口下方*/
            position: fixed;
            bottom: 0px;
            left: 52px;
            width: 100%;
            padding: 5px 15px 3px 15px;
            background-color: white;
            clear: both;
            border-top: #DDDDDD solid 1px;
        }

        .pagination li {
            display: inline-block;
        }

        .pagination > li > a, .pagination > li > span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        .layui-form-select {
            height: 28px;
            width: 80px;
            display: inline-block;
        }

        .pull-right {
            text-align: right;
        }

        .page-bar {
            margin-left: -30px;
            width: 92%;
        }

        button.close {
            background: #fff;
            color: #378CEF;
            border-color: #378CEF;
        }

        button.close:hover {
            border-color: #378CEF;
            color: #378CEF;
        }

        /*分页条样式end*/
    </style>
</head>

<body>
<div class="container">
    <div class="layui-row">
        <form id="pageForm" class="layui-form layui-form-box layui-col-md12 person">
            <div class="person-tit clear">
                <span class="left title">员工花名册</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                    </div>
                </div>
            </div>

            <div class="form-content">

                <div class="layui-form-item" style="line-height: 200%">
                    <label class="layui-form-label"> <i
                            class="layui-icon layui-icon-search"></i>&nbsp;&nbsp;基本搜索</label>
                    <div class="layui-input-inline">
                        <input type="text" id="userName" name="userName" placeholder="请输入姓名" autocomplete="off"
                               class="layui-input list-input" ErrBirthBad4>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry"
                                onclick="xxselect()">查询
                        </button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry"
                                onclick="window.location.reload(true)">刷新</button>

                    </div>
                </div>
                <div class="w-line"></div>
                <div class="shaixuanBtn">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i class="iconfont icon-shaixuan"></i>&nbsp;&nbsp;高级筛选</label>
                            <a class="layui-btn layui-btn-radius layui-btn-primary primary">基本信息</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary message">通讯信息</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary education">教育经历</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary work">工作经历</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary the-situation">论文情况</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary publishing">出版著作/译著</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary awards">获奖情况</a>
                            <a class="layui-btn layui-btn-radius layui-btn-primary annual-check">年度考核</a>
                        </div>

                        <div class="edit-item layui-col-md12 layui-col-xs12">
                            <label class="layui-form-label">工作性质及状态</label>
                            <div class="layui-col-md10 layui-col-xs10" style="padding: 10px 15px;" id="checkbox_0">
                            </div>
                        </div>
                        <div class="edit-item layui-row">
                            <label class="layui-form-label">当前状态</label>
                            <div class="layui-col-md10 layui-col-xs10" style="padding: 10px 15px;">
                                <input type="checkbox" name="trashFlagxxx"  class="col-item " lay-skin="primary" value="3" title="所有">
                                <input type="checkbox" name="trashFlagxxx" class="col-item" lay-skin="primary" value="0"
                                       title="启用" >
                                <input type="checkbox" name="trashFlagxxx" class="col-item" lay-skin="primary" value="1"
                                       title="禁用">
                            </div>
                        </div>
                     <%--   <div class="layui-form-item" style="line-height: 200%">
                            <label class="layui-form-label">时间段</label>
                            <input type="text" name="start_time" required lay-verify="required" placeholder="2018-08"
                                   autocomplete="off"
                                   class="layui-input list-input" id="startY" style="width: 100px;display: inline-block;">至
                            <input type="text" name="end_time" required lay-verify="required"placeholder="2018-10"
                                   autocomplete="off"
                                   class="layui-input list-input" id="endY" style="width: 100px;display: inline-block;">
                        </div>--%>

                        <div class="edit-item">
                            <label class="layui-form-label">所属部门</label>
                            <div class="layui-input-inline">
                                <input type="hidden" id="deptIds" name="deptIds" class="form-control input-sm" value="">
                                <input type="text" id="names" name="names" required lay-verify="required" placeholder=""
                                       autocomplete="off" class="layui-input list-input"
                                       style="width: 100px;display: inline-block;">
                                <span class="input-group-btn" style=" display: inline-block;">
                                        <button class="layui-btn layui-btn-primary choose-btn" type="button"
                                                onclick="choiceDept('deptIds','names',true)">
                                            <i class="iconfont icon-menu" aria-hidden="true"></i>&nbsp;选择
                                        </button>
                                    </span>
                            </div>
                        </div>

                    </div>
                    <div class="layui-form-item inquiry-item">
                        <div class="layui-input-inline button-inline">
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry"    onclick="xxselect()">查询</button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-primary export"
                                    style="color: rgb(255, 102, 0);border-color: rgb(255, 102, 0);height: 28px;line-height: 28px;">
                                导出Excel
                            </button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="resetSelect()">重置</button>
                        </div>
                    </div>
                </div>
                <div id="selectHidden">
                    <%-- 教育--%>
                    <input id="startEducation" name="startEducation" type="hidden"/>
                    <input id="endEducation" name="endEducation" type="hidden"/>
                    <input id="educationContent" name="educationContent" type="hidden"/>

                <%-- 著作--%>

                    <input id="bookName" name="bookName" type="hidden"/>
                    <input id="press" name="press" type="hidden"/>
                    <input id="workType" name="workType" type="hidden"/>
                    <input id="startYears" name="startYears" type="hidden"/>
                    <input id="endYears" name="endYears" type="hidden"/>

                <%-- 获奖--%>
                    <input id="awardWinProjectName" name="awardWinProjectName" type="hidden"/>
                    <input id="awardType" name="awardType" type="hidden"/>
                    <input id="awardWinProjectLevel" name="awardWinProjectLevel" type="hidden"/>
                    <input id="awardLevel" name="awardLevel" type="hidden"/>
                    <input id="awardsStartYears" name="awardsStartYears" type="hidden"/>
                    <input id="awardsEndYears" name="awardsEndYears" type="hidden"/>
                <%-- 论文--%>
                    <input id="periodicalTitle" name="periodicalTitle" type="hidden"/>
                    <input id="periodicalName" name="periodicalName" type="hidden"/>
                    <input id="periodicalType" name="periodicalType" type="hidden"/>
                    <input id="periodicalStartYears" name="periodicalStartYears" type="hidden"/>
                    <input id="periodicalEndYears" name="periodicalEndYears" type="hidden"/>
                <%-- 工作--%>
                    <input id="workContent" name="workContent" type="hidden"/>
                    <input id="work_StartTime" name="work_StartTime" type="hidden"/>
                    <input id="workStopTime" name="workStopTime" type="hidden"/>
                <%-- 通讯--%>
                    <input id="officePhone" name="officePhone" type="hidden"/>
                    <input id="mobilePhone" name="mobilePhone" type="hidden"/>
                    <input id="emailAddress" name="emailAddress" type="hidden"/>
                <%-- 年度考核--%>
                    <input id="checkYears" name="checkYears" type="hidden"/>
                    <input id="checkScore" name="checkScore" type="hidden"/>
                    <input id="quarterOne" name="quarterOne" type="hidden"/>
                    <input id="quarterTwo" name="quarterTwo" type="hidden"/>
                    <input id="quarterThree" name="quarterThree" type="hidden"/>
                    <input id="quarterFour" name="quarterFour" type="hidden"/>
                <%-- 基本信息--%>
                    <input id="sex" name="sex" type="hidden"/>
                    <input id="nation" name="nation" type="hidden"/>
                    <input id="politicalOutlook" name="politicalOutlook" type="hidden"/>
                    <input id="technicalPosition" name="technicalPosition" type="hidden"/>
                    <input id="technicalLevel" name="technicalLevel" type="hidden"/>
                    <input id="administrativeLevel" name="administrativeLevel" type="hidden"/>
                    <input id="researchField" name="researchField" type="hidden"/>
                    <input id="highestEducation" name="highestEducation" type="hidden"/>
                    <input id="highestDegree" name="highestDegree" type="hidden"/>
                    <input id="jobEducation" name="jobEducation" type="hidden"/>
                    <input id="jobDegree" name="jobDegree" type="hidden"/>
                    <input id="tempWorkExperience" name="tempWorkExperience" type="hidden"/>
                    <input id="overseasStudyExperience" name="overseasStudyExperience" type="hidden"/>
                    <input id="idCard" name="idCard" type="hidden"/>
                    <input id="station" name="station" type="hidden"/>
                    <input id="administrativeDuty" name="administrativeDuty" type="hidden"/>
                    <input id="maritalStatus" name="maritalStatus" type="hidden"/>
                    <input id="startBirth" name="startBirth" type="hidden"/>
                    <input id="endBirth" name="endBirth" type="hidden"/>
                    <input id="startWorkTime" name="startWorkTime" type="hidden"/>
                    <input id="endWorkTime" name="endWorkTime" type="hidden"/>
                    <input id="startTenureTime" name="startTenureTime" type="hidden"/>
                    <input id="endTenureTime" name="endTenureTime" type="hidden"/>
                    <input id="startTechnicalGetTime" name="startTechnicalGetTime" type="hidden"/>
                    <input id="endTechnicalGetTime" name="endTechnicalGetTime" type="hidden"/>
                    <input id="startAppointmentTime" name="startAppointmentTime" type="hidden"/>
                    <input id="endAppointmentTime" name="endAppointmentTime" type="hidden"/>
                    <input id="trashFlag" name="trashFlag" type="hidden"/>
                    <input id="remark" name="remark" type="hidden"/>
                </div>
                <div class="item clear">
                    <label class="layui-form-label" style="width: 100px;">当前筛选条件</label>
                    <div id="currentSelect" class="now-item-box" style="width:calc(100% - 160px);float:left;max-height: 150px;overflow: auto;margin-left: 20px;">
                    </div>
                </div>
                <div class="person-list-content">
                    <table class="layui-table layui-form" id="mainList" dataUrl="pms/auditShowUser/getPage.action?userId=${loginUser.id}"
                           deleteUrl="" formUrl="page/pms/auditUserDoc.jsp">
                        <col field="userName" title="姓名" width="15%" align="" event="" order="user_Name"/>
                        <col field="sex" title="性别" width="15%" align="" order="sex"/>
                        <col field="deptNames" title="部门" width="20%" align="left"/>
                        <col field="technicalPosition" title="职称" width="15%" align="" order="technical_Level"/>
                        <col field="administrativeDuty" title="行政职务" width="15%" align="" order="administrative_Duty"/>
                        <col field="_cvm" title="当前状态" width="20%"/>
                        <col field="_opt" title="操作" width="18%" align=""/>
                    </table>
                    <div class="page-bar page-bar-float layui-row" gridid="mainList">

                    </div>
                    <%--/分页条--%>
                </div>
        </form>

    </div>
</div>

<script>
    $(function () {
        layui.use(['layer', 'form', 'laydate'], function () {
            var form = layui.form;
            var layer = layui.layer;
            var laydate = layui.laydate;
            //全选
            form.on('checkbox', function (data) {
                var obj = data.elem;
                if(obj.name === 'all'){
                    var child =  $("input:checkbox[name=id]");
                    child.each(function(index,item){
                        item.checked = obj.checked;index
                    });
                }
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
            form.on('select(choicePageSize)', function (data) {
                var iNum = $(data.elem).val();
                joView.choicePageSize(iNum);
            });

            //添加通讯信息搜索条件
            $(".message").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加通讯信息搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['650px', '290px'],
                    content: 'page/personal/message-info-search.jsp',
                });
            })
            //添加基本信息搜索条件
            $(".primary").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加基本信息搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['80%', '90%'],
                    content: ['page/personal/primary-info-search.jsp'],
                });
            })
            //教育经历
            $(".education").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加教育经历搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['650px', '290px'],
                    // content: ['/education-info-search.jsp'],
                    content: 'page/personal/education-info-search.jsp',


                });
            })
            //添加工作经历搜索条件
            $(".work").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加工作经历搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['650px', '350px'],
                    content: 'page/personal/work-info-search.jsp',
                });
            })
            //添加论文情况搜索条件
            $(".the-situation").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加论文情况搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['650px', '340px'],
                    content: ['page/personal/the-situation-info-search.jsp'],
                });
            })
            //添加出版著作/译著搜索条件
            $(".publishing").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加出版著作/译著搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['690px', '380px'],
                    content: ['page/personal/publishing-search.jsp'],
                });
            })
            // 添加获奖情况搜索条件
            $(".awards").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加获奖情况搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['660px', '420px'],
                    content: 'page/personal/awards-search.jsp',
                });
            })
            //添加年度考核搜索条件
            $(".annual-check").click(function () {
                layer.open({
                    /*弹出框*/
                    type: 2,
                    title: '添加年度考核搜索条件',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['650px', '350px'],
                    content: 'page/personal/annual-check-search.jsp',
                });
            })

            $(".close").click(function () {
                history.back(-1);
            })

        });
    })
</script>
<script type="text/javascript">
    $(function () {

        Color();
    });
        function  Color() {
        $("#mainList").find("tbody").find("tr").each(function () {
            $(this).children('td').each(function(j) {  // 遍历 tr 的各个 td
                if(j===6) {
                    var status = $(this).text();
                    if(status.indexOf('启用')>=0) {
                        // $(this).addClass('blueColor');
                        $(this).attr("style","color: #1AAD19");
                        $(this).siblings().attr("style","color: #1AAD19");
                        $(this).siblings().children('span').attr("style","color: #1AAD19;cursor:pointer;");
                        // $(this).children('span').siblings().attr("style","color: #1AAD19;cursor:pointer;");

                    }else{
                        // $(this).addClass('redColor');
                        $(this).attr("style","color: red");
                        $(this).siblings().attr("style","color: red");
                        $(this).siblings().children('span').attr("style","color: red;cursor:pointer;");
                        // $(this).children('span').siblings().attr("style","color: red;cursor:pointer;");
                    }
                }

            });
        })
    }
    jo.formatUI();//格式化jo组件
    function changeState(oldState, id) {
        var state = oldState == 1 ? 0 : 1;
        // jo.postAjax("{URL_UMS}ums/user/updateUser.action", {STATE:state,ID:id}, function(json){//old
        jo.postAjax("pms/pmsUser/updateUser.action", {STATE: state, ID: id}, function (json) {
            if (json && json.code == 0) {
                jo.showMsg("状态切换成功!");
                joView.reloadCurrentPage();
            } else {
                jo.showMsg(jo.getDefVal(json.info, "切换失败"));
            }
        });
    }
    function xxselect(){

        var  trashFlag= [];
        $('input[name="trashFlagxxx"]:checked').each(function(){
            trashFlag.push($(this).val());
        });

        $("#trashFlag").val(trashFlag);
        var  remark= [];
        $('input[name="remarkxxx"]:checked').each(function(){
            remark.push($(this).val());
        });
        $("#remark").val(remark);
        joView.select();
        Color();
    }
    //重置查询条件
    function resetSelect(){
        $("#currentSelect").html('');
        $("#selectHidden").find('input[type="hidden"]').val('');
    }
    joView.goPage = function(goPage){
        if (joView.params["shouldPage"] == "noPageSize") {
            joView.params["pageSize"] = 999;
        }

        joView.loadData(joView.params["url"], joView.params["formData"], goPage, joView.params["pageSize"]);
        Color();
    };
</script>
</body>

</html>