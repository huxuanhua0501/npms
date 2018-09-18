<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>家庭关系列表页</title>
    <%--常量--%>
    <%@ include file="/common/constHead.jsp" %>
    <%--jQuery--%>
    <%--
        <%@ include file="/common/jqueryHead.jsp"%>
    --%>
    <%--jo--%>
    <%--
        <%@ include file="/common/joHead.jsp"%>
    --%>
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

    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <%--<link rel="stylesheet" href="<%=URL_STATIC%>static/final/css/layui.css">--%>
    <script src="<%=URL_STATIC%>static/final/js/jquery.min.js"></script>
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

    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/common.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/employee.css">
    <script src="<%=URL_STATIC%>static/prototype/js/common_no.js"></script>


    <script type="text/javascript">
        $(function () {
            sfSet();//在初始化表格之前
            joViewInitAboutDoc();//joView初始化处理

            jo.postAjax("pms/pmsDictionary/getListByDictionary/PERSON_TYPE", {}, function(obj){
                var list = "", listline = "";
                listline += '<input type=\"checkbox\" name=\"remarkxxx\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
                for (var i = 0; i < obj.data.length; i++) {
                    listline += '<input type=\"checkbox\" name=\"remarkxxx\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
                }
                $("#checkbox_0").html("");
                $("#checkbox_0").html(listline);

            }, true);

            // $.ajax({
            //     type: "get",
            //     url: "pms/pmsDictionary/getListByDictionary/PERSON_TYPE",
            //     dataType: "text",
            //     success: function (jsonStr) {
            //         var obj = JSON.parse(jsonStr);
            //         var list = "", listline = "";
            //         listline += '<input type=\"checkbox\" name=\"remarkxxx\" class=\"col-item\" lay-skin=\"primary\" value= "所有" title="所有">';
            //         for (var i = 0; i < obj.data.length; i++) {
            //             listline += '<input type=\"checkbox\" name=\"remarkxxx\" class=\"col-item\" lay-skin=\"primary\" value=' + obj.data[i].dicValue + ' title=' + obj.data[i].dicValue + '>';
            //         }
            //         $("#checkbox_0").append(listline);
            //     }
            //
            // });
        });
        //行处理
        // joView.handleItem = function(oItem,iIndex){
        //
        // };

        joView.handleItem = function (oItem, iIndex) {

            oItem._cvm = (oItem.state == 1 ? "启用" : "禁用");
            oItem._cvm += (oItem.dicName =='' ? "" :  "/"+oItem.dicName);
            oItem._opt = (oItem.state == 0 ? '<span style="color:green ;cursor:pointer;"  onclick="changeState(\'' + oItem.state + '\',\'' + oItem.id + '\')">启用</span>' : '<span style="color:red ;cursor:pointer;" onclick="changeState(\'' + oItem.state + '\',\'' + oItem.id + '\')">禁用</span>');
            oItem._opt += '<span style="color: #62abff; cursor:pointer; "   onclick="lookUserDoc(\'' + oItem.id + '\')"> &nbsp;查看</span>';
            oItem._opt += '<span style="color: #62abff;  cursor:pointer;" onclick="joView.edit(\'' + oItem.id + '\')">&nbsp;审核</span>';
        };
    </script>
    <script type="text/javascript">
        var userId = jo.getDefVal(jo.getUrlParam("userId"), loginUser.id);
        var sf = jo.getDefVal(jo.getUrlParam("sf"), "");
        var _edit = jo.getDefVal(jo.getUrlParam("edit"), "");
        $(function () {
            goto();
        });

        function goto() {

            $("a").each(function(){
                $(this).attr("lay-href",$(this).attr("lay-href") + userId);
            });

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
                <span class="left title">按模块审核</span>
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
                        <input id="state" name="state" type="hidden">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry"
                                onclick="xxselect()">查询
                        </button>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry"
                                onclick="window.location.reload(true)">刷新</button>

                    </div>
                </div>
            </div>

                <div class="tabs">
                    <ul class="clear">
                        <li>
                            <div onclick="selectState('bashinfo');" style="cursor:pointer;" >
                                <a class="active">
                                <div>1.基本信息</div><span>待审核</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('communication');" style="cursor:pointer;" >

                            <a>
                                <div>2.通讯信息</div><span>待审核</span></a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('relationship');" style="cursor:pointer;" >

                            <a >
                                <div>3.家庭成员和社会关系</div><span>待审核</span></a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('education');" style="cursor:pointer;" >

                            <a>
                                <div>4.教育经历</div><span>待审核</span></a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('work');" style="cursor:pointer;" >

                            <a>
                                <div>5.工作经历</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('association');" style="cursor:pointer;" >

                            <a>
                                <div>6.社团兼职</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('honor');" style="cursor:pointer;" >

                            <a>
                                <div>7.荣誉称号</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('award');" style="cursor:pointer;" >

                            <a>
                                <div>8.获奖情况</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                    </ul>
                    <ul class="clear">
                        <li>
                            <div onclick="selectState('paper');" style="cursor:pointer;" >

                            <a>
                                <div>9.论文情况</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('publish');" style="cursor:pointer;" >

                            <a>
                                <div>10.出版著作译著</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('patent');" style="cursor:pointer;" >

                            <a>
                                <div>11.专利</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('project');" style="cursor:pointer;" >

                            <a>
                                <div>12.项目经历</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('technology');" style="cursor:pointer;" >

                            <a>
                                <div>13.技术变革</div><span>待审核</span>
                            </a>
                            </div>
                        </li>

                        <li>
                            <div onclick="selectState('personnel');" style="cursor:pointer;" >

                            <a>
                                <div>14.人力培养计划、资助项目</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                        <li>
                            <div onclick="selectState('assessment');" style="cursor:pointer;" >

                            <a>
                                <div>15.年度考核</div><span>待审核</span>
                            </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

                <div class="person-list-content">
                <table class="layui-table layui-form" id="mainList" dataUrl="pms/auditModule/getPage.action"
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
            form.on('checkbox(allChoose)', function (data) {
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function (index, item) {
                    item.checked = data.elem.checked;
                });
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
                    area: ['840px', '350px'],
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
                    area: ['650px', '290px'],
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
                    area: ['650px', '290px'],
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
                    area: ['650px', '350px'],
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
        $("#state").val("");

        trashFlagArray = document.getElementsByName("trashFlagxxx");
        var  trashFlag=new Array();
        for(b in trashFlagArray){
            if(trashFlagArray[b].checked)
                trashFlag.push(trashFlagArray[b].value);
        }
       $("#trashFlag").val(trashFlag);
        remarkArray = document.getElementsByName("remarkxxx");
        var  remark=new Array();
        for(b in remarkArray){
            if(remarkArray[b].checked)
                remark.push(remarkArray[b].value);
        }
        $("#remark").val(remark);
        joView.select();
    }

    function selectState(state) {
        $("#state").val(state);
        joView.select();


    }

</script>
</body>

</html>