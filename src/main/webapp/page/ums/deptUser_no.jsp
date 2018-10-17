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
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui-xtree.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link href="<%=URL_STATIC%>static/prototype/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>部门用户</title>
    <style>
        .icon-msnui-menu-down {
            transform: rotateZ(45deg);
            display: inline-block;
            color: #C7C7CD;
            margin-right: 10px;
            /* margin-top: 4px; */
            font-size: 12px;
        }

        .icon-msnui-menu-down.child {
            margin-left: 10px;
        }

        .icon-msnui-menu-down.childs {
            margin-left: 20px;
        }

        .downpanel .layui-select-title span {
            line-height: 38px;
            min-width: 200px;
        }
        /*继承父类颜色*/

        .downpanel dl dd:hover {
            background-color: inherit;
        }

        body {
            height: 100%;
            width: 100%;
            background-size: cover;
            margin: 0 auto;
        }

        td {
            font-size: 12px !important;
        }

        .layui-form-checkbox span {
            height: 30px;
        }

        .layui-field-title {
            border-top: 1px solid white;
        }

        table {
            width: 100% !important;
        }

        .layui-form-select,
        .layui-input.layui-unselect {
            width: 100%;
        }

        .button-form-item {
            right: 20%;
            bottom: 12px;
            position: absolute;
        }

        .layui-table a.look {
            margin: 0;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="layui-row">
        <form class="layui-form layui-form-box layui-col-md12 person">
            <div class="person-tit clear" style="padding: 14px;">
                <span class="left title" style="padding-top: 5px;">部门用户</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary reset" onclick="window.location.reload()"><i class="layui-icon layui-icon-refresh"></i> 刷新</button>
                    </div>
                </div>
            </div>

            <div class="form-content">
                <i class="iconfont icon-shaixuan"></i>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" id="USER_NAME" name="name" placeholder="" autocomplete="off" class="layui-input list-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label sex-label">性别</label>
                    <div class="layui-input-inline sex-inline">
                        <select id="SEX" name="" lay-verify="">
                            <option value=""></option>
                            <option value="1">男</option>
                            <option value="0">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline type-inline">
                        <select id="STATE" name="type" lay-verify="">
                            <option value=""></option>
                            <option value="0">禁用</option>
                            <option value="1">启用</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item" style="display:block;">
                    <label class="layui-form-label">部门</label>
                    <div class="layui-inline">
                        <div class="layui-unselect layui-form-select downpanel">
                            <div class="layui-select-title">
                                <span class="layui-input layui-unselect" id="treeclass">中国环境科学院</span>
                                <input type="hidden" id="selectDeptId" name="selectID" value="">
                                <i class="layui-edge"></i>
                            </div>
                            <dl class="layui-anim layui-anim-upbit">
                                <dd>
                                    <ul id="classtree" style="min-height: 40px;"></ul>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item button-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="loadDeptUser(1)">查询</button>
                    </div>
                </div>
            </div>
            <div class="person-list-content">
                <table class="layui-table layui-form">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="all" lay-skin="primary" lay-filter="allChoose"></th>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>出生日期</th>
                        <th>性别</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>状态</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="deptUser_list">
                    </tbody>
                </table>
                <div id="pages">
                    <div class="prompt">共<span id="deptUser_total">2</span>条记录</div>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('last')">尾页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('next')">下一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('prev')">上一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('first')">首页</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <script>
        var page;
        var tree;
        var form;
        var lastDeptId;//常量用于重载数据
        $(function() {
            layui.use(['element', 'tree', 'layer', 'form', 'upload'], function() {
                tree = layui.tree;
                form = layui.form;
                createTree(tree);
                //部门选择的值默认是顶级部门
                $("#selectDeptId").val(loginUser.companyId);
                //加载用户列表
                loadDeptUser(1);
                //全选
                form.on('checkbox(allChoose)', function(data) {
                    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                    child.each(function(index, item) {
                        item.checked = data.elem.checked;
                    });
                    form.render('checkbox');
                })
                //点击出现下面
                $(".downpanel").on("click", ".layui-select-title", function(e) {
                    $(".layui-form-select").not($(this).parents(".layui-form-select")).removeClass("layui-form-selected");
                    $(this).parents(".downpanel").toggleClass("layui-form-selected");
                    layui.stope(e);
                }).on("click", "dl i", function(e) {
                    layui.stope(e);
                });

                $(".layui-icon.layui-tree-check").append("<input type='checkbox'/>")

            });
        });
        //创建树
        function createTree(tree){
            $("#classtree").html('');
            tree({
                elem: "#classtree",
                nodes: loadOrgTree() ,
                click: function(node) {
                    var $select = $($(this)[0].elem).parents(".layui-form-select");
                    $select.removeClass("layui-form-selected").find(".layui-select-title span").html(node.name).end().find("input:hidden[name='selectID']").val(node.id);
                }
            });
        }
        //加载部门树
        function loadOrgTree(){
            var treeNodes = [];
            var sUrl = 'ums/tree/getOrgTree.action';
            jo.postAjax(sUrl, {}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        var list = json.data;
                        for(var i in list){
                            var deptId = list[i].ID;
                            var deptName = list[i].NAME;
                            var parentId = list[i].PARENT_ID;
                            var deptLevel = list[i].DEPT_LEVEL;
                            if(parentId == 'ROOT' && deptLevel == 1){
                                parentId = 0;
                            }
                            var node = {name:deptName,id:deptId,parentId:parentId,href: "javascript:;",children:[]};
                            treeNodes.push(node);
                        }
                        //递归遍历树
                        for(var i in treeNodes){
                            var parentId = treeNodes[i].parentId;
                            if(parentId === 0){//根
                            }else{
                                for(var j in treeNodes){
                                    if(treeNodes[j].id == parentId){
                                        var child = treeNodes[j].children;
                                        if(!child){
                                            child = [];
                                        }
                                        child.push(treeNodes[i]);
                                        treeNodes[j].children = child;
                                    }
                                }
                            }
                        }
                        //过滤重复的数据
                        treeNodes = treeNodes.filter(function (o) {
                            return o.parentId === 0;
                        });
                    }else{
                    }
                }
            }, false);
            return treeNodes;
        }
        //加载用户列表
        function loadDeptUser(gotoPage){
            if(!gotoPage)
                gotoPage =1;
            //查询条件
            var userName = jo.getDefVal($("#USER_NAME").val(),"");
            var sex = jo.getDefVal($("#SEX").val(),"");
            var state = jo.getDefVal($("#STATE").val(),"");
            var deptId = jo.getDefVal($("#selectDeptId").val(),"");
            var sUrl = 'ums/deptUser/getDeptUserPage.action';
            jo.postAjax(sUrl, {pageNumber:gotoPage,pageSize:25,USER_NAME:userName,DEPT_ID:deptId,
                STATE:state,SEX:sex,ALLUSER:true}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        page = json;
                        var list = json.data;
                        var liHtml ='';
                        for(var i =0;i<list.length;i++){
                            var id = list[i].ID;
                            var DEPT_ID = list[i].DEPT_ID;
                            var USER_ID = list[i].USER_ID;
                            var USER_NAME = jo.getDefVal(list[i].USER_NAME,'');
                            var BIRTHDAY = jo.getDefVal(list[i].BIRTHDAY,'');
                            var SEX = jo.getDefVal(list[i].SEX,'');
                            var TEL = jo.getDefVal(list[i].TEL,'');
                            var EMAIL = jo.getDefVal(list[i].EMAIL,'');
                            var STATE = jo.getDefVal(list[i].STATE,'');
                            var DEPT_NAME = jo.getDefVal(list[i].DEPT_NAME,'');
                            if(SEX){
                                SEX = SEX == 1 ? '男': '女';
                            }
                            var stateName,noStateName,stateClass,noStateClass;
                            if(STATE){
                                stateClass = STATE == 1 ? 'on' : 'off';
                                noStateClass = STATE == 1 ? 'off' : 'on';
                                noStateName = STATE == 1 ? '禁用' : '启用';
                                stateName = STATE == 1 ? '启用' : '禁用';
                            }
                            liHtml += '<tr class="'+stateClass+'">\n' +
                                '      <td><input type="checkbox" name="deptUserCheck" lay-skin="primary"></td>\n' +
                                '      <td>'+(i+1)+'</td>\n' +
                                '      <td onclick="userEdit(\''+USER_ID+'\')"><a href="javascript:;" class="edit">'+USER_NAME+'</a></td>\n' +
                                '      <td>'+BIRTHDAY+'</td>\n' +
                                '      <td>'+SEX+'</td>\n' +
                                '      <td>'+TEL+'</td>\n' +
                                '      <td>'+EMAIL+'</td>\n' +
                                '      <td>'+stateName+'</td>\n' +
                                '      <td>'+DEPT_NAME+'</td>\n' +
                                '      <td>\n' +
                                '      <a href="javascript:changeState('+STATE+',\''+USER_ID+'\',\''+noStateName+'\');" class="'+noStateClass+'">'+noStateName+'</a>\n' +
                                '      <a href="javascript:lookUserDoc(\''+USER_ID+'\');" class="look">查看</a>\n' +
                                '      </td>\n' +
                                '      </tr>';
                        }
                        $("#deptUser_total").html(page.total);
                        $("#deptUser_list").html(liHtml);
                    }else{
                        $("#deptUser_total").html('0');
                        $("#deptUser_list").html('');
                        page = null;
                    }
                    form.render('checkbox');
                }
            }, true);
        }
        //分页跳转
        function dept_page(type){
            if(page){
                var currentPage = page.pageNumber;
                var total = page.total;
                var size = page.pageSize;
                var lastPage = Math.ceil(total/size);//尾页
                var gotoPage;
                if(type == 'first'){
                    gotoPage = 1;
                }else if (type == 'last'){
                    gotoPage = lastPage;
                }else  if(type == 'prev'){
                    gotoPage = currentPage -1;
                    if(gotoPage < 1)
                        gotoPage = 1;
                }else if(type == 'next'){
                    gotoPage = currentPage +1;
                    if(gotoPage > lastPage)
                        gotoPage = lastPage;
                }
                loadDeptUser(gotoPage);
            }else{
                loadDeptUser(1);
            }
        }
        //切换状态
        function changeState(oldState, id,name){
            var state = oldState == 1 ? 0 : 1;
            jo.postAjax("ums/user/updateUser.action", {STATE:state,ID:id}, function(json){
                if(json && json.code == 0){
                    jo.showMsg(name+"成功!");
                    loadDeptUser(page.pageNumber);
                }else{
                    jo.showMsg(jo.getDefVal(json.info, name+"失败"));
                }
            });
        }
        //查看员工档案（宣化引用）
        function lookUserDoc(userId){
            layer.open({ /*弹出框*/
                type: 2,
                title: '员工查看',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['85%', '85%'],
                content: 'page/personal/myDoc.jsp?id='+userId+'&_t='+(new Date()).getTime()
            });

        }
        //编辑员工
        function userEdit(userId){
            layer.open({ /*弹出框*/
                type: 2,
                title: '员工编辑',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['85%', '85%'],
                content: 'page/personal/myDoc.jsp?edit=true&id='+userId+'&_t='+(new Date()).getTime(),
                end:function () {
                    loadDeptUser(page.pageNumber);
                }
            });
        }
    </script>
</body>
</html>
