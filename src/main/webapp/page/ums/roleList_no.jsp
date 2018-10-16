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
    <script src="<%=URL_STATIC%>static/prototype/js/common.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link href="<%=URL_STATIC%>static/prototype/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>角色管理</title>
    <style>
        .layui-table a.edit,
        .layui-table a.on,
        .layui-table a.off {
            margin-right: 10px;
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
            <div class="person-tit clear">
                <span class="left title">角色管理</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary add" onclick="addRole()">新增</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary del">删除</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary reset" onclick="window.location.reload()"><i class="layui-icon layui-icon-refresh"></i> 刷新</button>
                    </div>
                    <div class="layui-inline">
                        <div class="select clear">
                            <span class="left" style="margin-left: 40%;">角色管理</span>
                            <i class="layui-icon layui-icon-triangle-d right"></i>
                        </div>
                        <div class="select-content">
                            <ul id="selectContent" style="height: auto;">
                                <li>
                                    <a href="javascript:;">
                                        <span class="left opt" style="margin-left: 40%;">角色管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="page/ums/roleUser_no.jsp">
                                        <span class="left opt" style="margin-left: 40%;">角色用户</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-content">
                <i class="iconfont icon-shaixuan"></i>
                <div class="layui-form-item">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="NAME" name="NAME" placeholder="" autocomplete="off" class="layui-input list-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">角色类型</label>
                    <div class="layui-input-inline">
                        <select lay-verify="" id="TYPE" name="TYPE">
                            <option value=""></option>
                            <option value="ADMIN">管理员角色</option>
                            <option value="NORMAL">普通角色</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="refreshData()">查询</button>
                    </div>
                </div>
            </div>
            <div class="person-list-content layui-row" style="padding: 0;">
                <ul id="classtree" class="layui-col-md4" style="width: calc(30% - 10px);"></ul>
                <table class="layui-table layui-form layui-col-md8" style="width: 70%;float: right; margin-right: 10px">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="all" lay-skin="primary" lay-filter="allChoose"></th>
                        <th>角色名称</th>
                        <th>管理范围</th>
                        <th>备注</th>
                        <th>类型</th>
                        <th>所属单位</th>
                        <th>排序</th>
                        <th style="width: 30px;">操作</th>
                    </tr>
                    </thead>
                    <tbody id="role_list">
                    </tbody>
                </table>
                <div id="pages" style="width: calc(70% - 10px);padding-right: 20px;">
                    <div class="prompt">共<span id="role_total"></span>条记录</div>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="role_page('last')">尾页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="role_page('next')">下一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="role_page('prev')">上一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="role_page('first')">首页</button>
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
                layer = layui.layer;
                var laydate = layui.laydate;
                tree = layui.tree;
                //加载角色树
                createTree(tree);
                //全选
                form.on('checkbox(allChoose)', function(data) {
                    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                    child.each(function(index, item) {
                        item.checked = data.elem.checked;
                    });
                    form.render('checkbox');
                })
                //加载角色列表
                loadRoleList(1,lastDeptId);
                $(".del").click(function() {
                    delRole();
                })
            });
        })
        //创建树
        function createTree(tree){
            $("#classtree").html('');
            tree({
                elem: "#classtree",
                nodes: loadCompanyTree() ,
                click: function(node) {
                    var $select = $($(this)[0].elem).parents(".layui-form-select");
                    $select.removeClass("layui-form-selected").find(".layui-select-title span").html(node.name).end().find("input:hidden[name='selectID']").val(node.id);
                    lastDeptId = node.id;
                }
            });
        }
        //加载公司树
        function loadCompanyTree(){
            var treeNodes = [];
            var sUrl = 'ums/tree/getCompanyTree.action';
            jo.postAjax(sUrl, {}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        var list = json.data;
                        console.log(list);
                        for(var i in list){
                            var deptId = list[i].ID;
                            var deptName = list[i].NAME;
                            var parentId = list[i].PARENT_ID;
                            var spread = false;
                            if(i == 0){
                                parentId = 0;
                                lastDeptId = deptId;
                            }
                            if(deptId == 'ROOT'){
                                spread = true;
                            }
                            var node = {name:deptName,id:deptId,parentId:parentId,spread: spread,href: "javascript:loadRoleList(1,'"+deptId+"');",children:[]};
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
        //加载角色列表
        function loadRoleList(gotoPage,companyId) {
            if(!gotoPage)
                gotoPage =1;
            var roleName = jo.getDefVal($("#NAME").val(),"");
            var type = jo.getDefVal($("#TYPE").val(),"");
            var sUrl = 'ums/role/getRolePage.action';
            jo.postAjax(sUrl, {pageNumber:gotoPage,pageSize:25,COMPANY_ID:companyId,NAME:roleName,TYPE:type}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        page = json;
                        var list = json.data;
                        var liHtml ='';
                        for(var i =0;i<list.length;i++){
                            var roleId = list[i].ID;
                            var NAME = list[i].NAME;
                            var RANGE_ID = jo.getDefVal(list[i].RANGE_ID,'');
                            var NUM = jo.getDefVal(list[i].NUM,'');
                            var REMARK = jo.getDefVal(list[i].REMARK,'');
                            var TYPE = jo.getDefVal(list[i].TYPE,'');
                            var RANGE_NAME = jo.getDefVal(list[i].RANGE_NAME,'');
                            var COMPANY_ID = jo.getDefVal(list[i].COMPANY_ID,'');
                            var COMPANY_NAME = jo.getDefVal(list[i].COMPANY_NAME,'');
                            var typeName;
                            if(TYPE){
                                typeName = TYPE == 'ADMIN' ? '管理员角色':'普通角色';
                            }
                            liHtml += '<tr>\n' +
                                '      <td><input type="checkbox" name="roleCheck" value="'+roleId+'" lay-skin="primary"></td>\n' +
                                '      <td>' +
                                '           <a href="javascript:editRole(\''+roleId+'\');" class="edit">'+NAME+'</a>\n'+
                                '      </td>\n' +
                                '      <td>'+RANGE_NAME+'</td>\n' +
                                '      <td>'+REMARK+'</td>\n' +
                                '      <td>'+typeName+'</td>\n' +
                                '      <td>'+COMPANY_NAME+'</td>\n' +
                                '      <td class="sort">\n' +
                                '           <input type="text" class="layui-input" value="'+NUM+'" onblur="changeRoleNum(this.value,\''+roleId+'\')">\n' +
                                '      </td>\n' +
                                '      <td>\n' +
                                '           <a href="javascript:giveAuth2Role(\''+roleId+'\');" class="give">授权</a>\n' +
                                '      </td>\n' +
                                '      </tr>';
                        }
                        $("#role_total").html(page.total);
                        $("#role_list").html(liHtml);
                    }else{
                        $("#role_total").html('0');
                        $("#role_list").html('');
                        page = null;
                    }
                    form.render('checkbox');
                }
            }, true);
        }
        //分页跳转
        function role_page(type){
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
                loadRoleList(gotoPage,lastDeptId);
            }else{
                loadRoleList(1,lastDeptId);
            }
        }
        //当角色排序文本框失去焦点时，更新排序并刷新
        function changeRoleNum(num,roleId) {
            if(num){
                var t = /(^[1-9]\d*$)/;
                if(!t.test(num)){
                    layer.msg("排序必须为数字");
                    return false;
                }
            }else{
                layer.msg("排序不可以为空");
                return false;
            }
            var sUrl = 'ums/role/updateRole.action';
            jo.postAjax(sUrl, {ID:roleId,NUM:num}, function(json){
                if(json && json.code == "0"){
                    refreshData();//刷新页面
                    layer.msg(json.info);

                }else{
                    layer.msg(json.info);
                }
            }, true);
        }
        //重新刷新页面
        function refreshData() {
            loadRoleList(page.pageNumber,lastDeptId);
        }
        //新增角色
        function addRole() {
            layer.open({ /*弹出框*/
                type: 2,
                title: '编辑角色',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['650px', '280px'],
                content: 'page/ums/roleForm_noo.jsp',
                end:function () {
                    refreshData();
                }
            });
        }
        //编辑角色
        function editRole(roleId){
            layer.open({ /*弹出框*/
                type: 2,
                title: '编辑角色',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['650px', '280px'],
                content: 'page/ums/roleForm_noo.jsp?ID='+roleId,
                end:function () {
                    refreshData();
                }
            });
        }
        //批量删除角色
        function delRole() {
            layer.confirm('确定要删除勾选的条目吗？', {
                btn: ['再考虑一下', '确认删除'],
                skin: 'more-del',
                area: ['650px', '180px'],
                success: function(index) {
                    $(document.body).find(".layui-layer-content").css("textAlign", "center");
                }
            }, function(index, layero) {
                //按钮【按钮一】的回调
                layer.close(index);
            }, function(index) {
                //按钮【按钮二】的回调
                var ids = [];
                $('input[name="roleCheck"]:checked').each(function(){
                    ids.push($(this).val());
                });
                if(ids.length == 0){
                    layer.msg("请勾选要删除的角色");
                }else{
                    jo.postAjax('ums/role/deleteRole.action', {ids:ids.join(",")}, function(json){
                        if(json && json.code == "0"){
                            layer.msg(json.info);
                            refreshData();//重新加载父页面
                        }else{
                            layer.msg(json.info);
                        }
                    }, true);
                }
            });
        }
        //角色授权
        function giveAuth2Role(roleId){
            // jo.showWin("page/ums/setAuthDialog.jsp?roleId="+roleId, "530px", "425px", "角色授权");
            layer.open({ /*弹出框*/
                type: 2,
                title: '角色授权',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['650px', '450px'],
                content: 'page/ums/setAuthDialog_no.jsp?roleId='+roleId
            });
        }
    </script>
</body>
</html>
