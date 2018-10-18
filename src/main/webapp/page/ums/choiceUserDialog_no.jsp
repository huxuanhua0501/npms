<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--常量--%>
    <%@ include file="/common/constHead.jsp"%>
    <%--jQuery--%>
    <%@ include file="/common/jqueryHead.jsp"%>
    <%--jo--%>
    <%@ include file="/common/joHead.jsp"%>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui-xtree.js"></script>
    <%--<script src="<%=URL_STATIC%>static/prototype/js/common.js"></script>--%>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link href="<%=URL_STATIC%>static/prototype/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>选择用户</title>
    <style>
        .layui-table a.edit {
            margin: 0;
        }

        .layui-form-item.sm .layui-form-label {
            width: 50px;
        }

        .layui-table a {
            margin: 0 !important;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="layui-row">
        <form class="layui-form layui-form-box layui-col-md12 person">
            <div class="form-content">
                <i class="iconfont icon-shaixuan"></i>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" id="USER_NAME" name="USER_NAME" placeholder="" autocomplete="off" class="layui-input list-input">
                    </div>
                </div>
                <div class="layui-form-item sm">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-inline">
                        <select lay-verify="" id="SEX" name="SEX">
                            <option value=""></option>
                            <option value="1">男</option>
                            <option value="0">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item sm">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <select lay-verify="" id="STATE" name="STATE">
                            <option value=""></option>
                            <option value="1">启用</option>
                            <option value="0">禁用</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="searchUser()">查询</button>
                    </div>
                </div>
            </div>
            <div class="person-list-content layui-row" style="padding: 0;">
                <ul id="classtree" class="layui-col-md4" style="width: calc(30% - 10px);"></ul>
                <table class="layui-table layui-form" style="width: 70%;float: right; margin-right: 10px">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="all" lay-skin="primary" lay-filter="allChoose"></th>
                        <th>姓名</th>
                        <th>出生日期</th>
                        <th>性别</th>
                        <th>状态</th>
                        <th>单位名称</th>
                    </tr>
                    </thead>
                    <tbody id="roleUser_list">
                    </tbody>
                </table>
                <div id="pages" style="width: 62%;padding-right: 20px;">
                    <div class="prompt">共<span id="roleUser_total"></span>条记录</div>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="roleUser_page('last')">尾页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="roleUser_page('next')">下一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="roleUser_page('prev')">上一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="roleUser_page('first')">首页</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    var page,tree,form;
    var lastDeptId;//常量用于重载数据
    $(function() {
        layui.use(['layer', 'form', 'laydate', 'tree'], function() {
            form = layui.form;
            var layer = layui.layer;
            var laydate = layui.laydate;
            tree = layui.tree;
            createTree(tree);
            //加载列表数据
            loadUserList(1,lastDeptId);
            //全选
            form.on('checkbox(allChoose)', function(data) {
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function(index, item) {
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });
            //tree 鼠标选中样式切换
            $("body").on("mousedown",".layui-tree a",function(){
                // if(!$(this).siblings('ul').length){
                $(".layui-tree a").css('background-color','');
                $(this).css('background-color','#e5e5e5');
                // }
            });
        });
    })
    //创建角色树
    function createTree(tree) {
        $("#classtree").html('');
        tree({
            elem: "#classtree",
            nodes: loadTreeData() ,
            click: function(node) {
                lastDeptId = node.id;
                var $select = $($(this)[0].elem).parents(".layui-form-select");
                $select.removeClass("layui-form-selected").find(".layui-select-title span").html(node.name).end().find("input:hidden[name='selectID']").val(node.id);
            }
        });
    }
    //加载公司树
    function loadTreeData() {
        var treeNodes = [];
        var sUrl = 'ums/tree/getCompanyTree.action';
        jo.postAjax(sUrl, {}, function(json){
            if(json && json.code == "0"){
                /*if(json && json.data && json.data[0] && json.data[0].ID == "ROOT"){
                    json.data[0].open = true;
                }*/
                var list = json.data;
                console.log(list);
                for(var i in list){
                    var n = list[i];

                    if(i==0){
                        n.PARENT_ID = 0;
                        lastDeptId = n.ID;
                    }
                    var node = {name:n.NAME,id:n.ID,parentId:n.PARENT_ID,spread: true,href: "javascript:loadUserList(1,'"+n.ID+"');",children:[]};
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
            }
        }, false);
        return treeNodes;
    }
    //加载角色用户列表数据
    function loadUserList(gotoPage,deptId){
        if(!gotoPage)
            gotoPage =1;
        deptId = jo.getDefVal(deptId,'');
        var USER_NAME = jo.getDefVal($("#USER_NAME").val());
        var SEX = jo.getDefVal($("#SEX").val());
        var STATE = jo.getDefVal($("#STATE").val());
        var sUrl = 'ums/user/getUserPage.action';
        jo.postAjax(sUrl, {pageNumber:gotoPage,pageSize:25,NAME:USER_NAME,COMPANY_ID:deptId,SEX:SEX,STATE:STATE}, function(json){
            if(json && json.code == "0"){
                if(json.data && json.data[0]){
                    page = json;
                    var list = json.data;
                    var liHtml ='';
                    for(var i in list){
                        var ID = list[i].ID;
                        var NAME = jo.getDefVal(list[i].NAME,'');
                        var BIRTHDAY = jo.getDefVal(list[i].BIRTHDAY,'');
                        var SEX = jo.getDefVal(list[i].SEX,'');
                        var TEL = jo.getDefVal(list[i].TEL,'');
                        var EMAIL = jo.getDefVal(list[i].EMAIL,'');
                        var STATE = jo.getDefVal(list[i].STATE,'');
                        var REMARK = jo.getDefVal(list[i].REMARK,'');
                        var NUM = jo.getDefVal(list[i].NUM,'');
                        var HEADER = jo.getDefVal(list[i].HEADER,'');
                        var COMPANY_NAME = jo.getDefVal(list[i].COMPANY_NAME,'');
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
                            '      <td><input type="checkbox" name="userCheck" value="'+ID+'" lay-skin="primary"></td>\n' +
                            '      <td>'+NAME+'</td>\n' +
                            '      <td>'+BIRTHDAY+'</td>\n' +
                            '      <td>'+SEX+'</td>\n' +
                            '      <td>'+stateName+'</td>\n' +
                            '      <td>'+COMPANY_NAME+'</td>\n' +
                            '      </tr>';
                    }
                    $("#roleUser_total").html(page.total);
                    $("#roleUser_list").html(liHtml);
                }else{
                    $("#roleUser_total").html('0');
                    $("#roleUser_list").html('');
                    page = null;
                }
                form.render('checkbox');
            }
        }, true);
    }
    //分页跳转
    function roleUser_page(type){
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
            loadUserList(gotoPage,lastDeptId);
        }else{
            loadUserList(1,lastDeptId);
        }
    }
    //检索
    function searchUser() {
        loadUserList(1,lastDeptId);
    }
    //返回被选中用户的id
    function getCheckUser(){
        var ids = [];
        $('input[name="userCheck"]:checked').each(function(){
            ids.push($(this).val());
        });
        if(ids.length == 0){
            return '';
        }else{
            return  ids.join(",");
        }
    }
</script>
</body>
</html>
