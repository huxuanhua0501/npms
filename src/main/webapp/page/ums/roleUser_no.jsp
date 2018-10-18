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
    <script src="<%=URL_STATIC%>static/prototype/js/common.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link href="<%=URL_STATIC%>static/prototype/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>角色用户</title>
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
            <div class="person-tit clear">
                <span class="left title">角色用户</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary add" onclick="addRoleUser()">添加人员</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary del" onclick="delRoleUser()">删除</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary reset" onclick="window.location.reload()"><i class="layui-icon layui-icon-refresh"></i> 刷新</button>
                    </div>

                    <div class="layui-inline">
                        <div class="select clear">
                            <span class="left" style="margin-left: 40%;">角色用户</span>
                            <i class="layui-icon layui-icon-triangle-d right"></i>
                        </div>
                        <div class="select-content">
                            <ul id="selectContent" style="height: auto;">
                                <li>
                                    <a href="page/ums/roleList_no.jsp">
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
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="searchRoleUser()">查询</button>
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
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>状态</th>
                        <th>部门名称</th>
                        <th>操作</th>
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
        var lastRoleId,lastRoleType;//常量用于重载数据
        $(function() {
            layui.use(['layer', 'form', 'laydate', 'tree'], function() {
                form = layui.form;
                var layer = layui.layer;
                var laydate = layui.laydate;
                tree = layui.tree;
                createTree(tree);
                //加载列表数据
                loadRoleUserList(1,lastRoleId);
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
                nodes: loadRoleTree() ,
                click: function(node) {
                    lastRoleId = node.id;
                    lastRoleType = node.nodeType;
                    var $select = $($(this)[0].elem).parents(".layui-form-select");
                    $select.removeClass("layui-form-selected").find(".layui-select-title span").html(node.name).end().find("input:hidden[name='selectID']").val(node.id);
                }
            });
        }
        //加载角色树数据
        function loadRoleTree() {
            var treeNodes = [];
            var sUrl = 'ums/tree/getRoleTree.action';
            jo.postAjax(sUrl, {}, function(json){
                if(json && json.code == "0"){
                    /*if(json && json.data && json.data[0] && json.data[0].ID == "ROOT"){
                        json.data[0].open = true;
                    }*/
                    var list = json.data;
                    for(var i in list){
                        var n = list[i];

                        if(i==0){
                            n.PARENT_ID = 0;
                            lastRoleId = n.ID;
                            lastRoleType = n.nodeType;
                        }
                        if(n.nodeType != 'COMPANY' ){
                            n.NAME = "[角色] " + n.NAME;
                        }
                        var node = {name:n.NAME,id:n.ID,nodeType:n.nodeType,parentId:n.PARENT_ID,spread: true,href: "javascript:loadRoleUserList(1,'"+n.ID+"');",children:[]};
                        if(jo.isValid(n.children) && n.children.length > 0){
                            for(var j in n.children){
                                var n2 = n.children[j];
                                if(n2.nodeType!= "COMPANY"){
                                    n2.NAME = "[角色] " + n2.NAME;
                                }
                                var node2 = {name:n2.NAME,id:n2.ID,nodeType:n2.nodeType,parentId:n2.PARENT_ID,spread: true,href: "javascript:loadRoleUserList(1,'"+n2.ID+"');",children:[]};
                                node.children.push(node2);
                            }

                        }
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
        function loadRoleUserList(gotoPage,roleId){
            if(!gotoPage)
                gotoPage =1;
            roleId = jo.getDefVal(roleId,'');
            lastRoleId = roleId;
            var USER_NAME = jo.getDefVal($("#USER_NAME").val());
            var SEX = jo.getDefVal($("#SEX").val());
            var STATE = jo.getDefVal($("#STATE").val());
            var sUrl = 'ums/roleUser/getRoleUserPage.action';
            jo.postAjax(sUrl, {pageNumber:gotoPage,pageSize:25,USER_NAME:USER_NAME,ROLE_ID:roleId,SEX:SEX,STATE:STATE}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        page = json;
                        var list = json.data;
                        var liHtml ='';
                        for(var i in list){
                            var ID = list[i].ID;
                            var ROLE_ID = list[i].ROLE_ID;
                            var USER_ID = list[i].USER_ID;
                            var USER_NAME = jo.getDefVal(list[i].USER_NAME,'');
                            var BIRTHDAY = jo.getDefVal(list[i].BIRTHDAY,'');
                            var SEX = jo.getDefVal(list[i].SEX,'');
                            var TEL = jo.getDefVal(list[i].TEL,'');
                            var EMAIL = jo.getDefVal(list[i].EMAIL,'');
                            var STATE = jo.getDefVal(list[i].STATE,'');
                            var REMARK = jo.getDefVal(list[i].REMARK,'');
                            var COMPANY_NAME = jo.getDefVal(list[i].COMPANY_NAME,'');
                            var DEPT_TYPE = jo.getDefVal(list[i].DEPT_TYPE,'');
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
                                '      <td><input type="checkbox" name="roleUserCheck" value="'+ID+'" lay-skin="primary"></td>\n' +
                                '      <td onclick="lookUser(\''+USER_ID+'\')"><a href="javascript:;" class="edit">'+USER_NAME+'</a></td>\n' +
                                '      <td>'+BIRTHDAY+'</td>\n' +
                                '      <td>'+SEX+'</td>\n' +
                                '      <td>'+TEL+'</td>\n' +
                                '      <td>'+EMAIL+'</td>\n' +
                                '      <td>'+stateName+'</td>\n' +
                                '      <td>'+COMPANY_NAME+'</td>\n' +
                                '      <td>\n' +
                                '           <a href="javascript:changeState('+STATE+',\''+USER_ID+'\',\''+noStateName+'\');" class="'+noStateClass+'">'+noStateName+'</a>\n' +
                                '      </td>\n' +
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
                loadRoleUserList(gotoPage,lastRoleId);
            }else{
                loadRoleUserList(1,lastRoleId);
            }
        }
        //检索
        function searchRoleUser() {
            loadRoleUserList(1,lastRoleId);
        }
        //切换状态
        function changeState(oldState, id,name){
            var state = oldState == 1 ? 0 : 1;
            jo.postAjax("ums/user/updateUser.action", {STATE:state,ID:id}, function(json){
                if(json && json.code == 0){
                    jo.showMsg(name+"成功!");
                    loadRoleUserList(page.pageNumber,lastRoleId);
                }else{
                    jo.showMsg(jo.getDefVal(json.info, name+"失败"));
                }
            });
        }
        function lookUser(userId){
            layer.open({ /*弹出框*/
                type: 2,
                title: '员工查看',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['85%', '85%'],
                content: 'page/personal/myDoc.jsp?id='+userId+'&_t='+(new Date()).getTime()
            });
        }
        //为角色添加员工
        function addRoleUser() {
            if(lastRoleId && lastRoleType !="COMPANY"){//当选中角色节点时
                jo.showWin({title:"关联用户",content:"page/ums/choiceUserDialog_no.jsp",area:['90%', '80%'],btn:["确定", "取消"],yes:function(idx){
                        var ifm = jo.getLayerIframe(idx);
                        var ids = ifm.getCheckUser();
                        if(ids){
                            jo.postAjax("ums/role/batchInsertUser2Role.action", {"roleId":lastRoleId,"userId":ids}, function(json){
                                if(json && json.code == "0"){
                                    jo.showMsg("关联成功!");
                                    loadRoleUserList(page.pageNumber,lastRoleId);
                                }else{
                                    jo.showMsg(jo.getDefVal(json.info, "操作失败!"));
                                }
                                jo.close(idx);//关闭弹窗
                            });
                        }else{
                            jo.showMsg("请勾选待关联用户!");
                        }
                    }});
            }else{
                jo.showMsg("请选择待添加人员的角色节点!");
            }
        }
        //批量删除角色用户
        function delRoleUser(){
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
                $('input[name="roleUserCheck"]:checked').each(function(){
                    ids.push($(this).val());
                });
                if(ids.length == 0){
                    layer.msg("请勾选要移除该角色的用户");
                }else{
                    jo.postAjax('ums/roleUser/delete.action', {ids:ids.join(",")}, function(json){
                        if(json && json.code == "0"){
                            layer.msg(json.info);
                            loadRoleUserList(page.pageNumber,lastRoleId);//重新加载父页面
                        }else{
                            layer.msg(json.info);
                        }
                    }, true);
                }
            });
        }
    </script>
</body>
</html>
