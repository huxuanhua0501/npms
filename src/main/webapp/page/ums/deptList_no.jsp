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
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link href="<%=URL_STATIC%>static/prototype/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>机构管理</title>
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

        .person-tit .title {
            padding: 0;
        }

        .person-tit {
            padding: 18px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="layui-row">
        <form class="layui-form layui-form-box layui-col-md12 person">
            <div class="person-tit clear">
                <span class="left title">机构管理</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary add" onclick="deptAdd()">新增</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary del" onclick="deptDel()">删除</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary reset" onclick="window.location.reload()"><i class="layui-icon layui-icon-refresh"></i> 刷新</button>
                    </div>
                </div>
            </div>
            <div class="form-content">
                <i class="iconfont icon-shaixuan"></i>
                <div class="layui-form-item">
                    <!-- <label class="layui-form-label">姓名</label> -->
                    <div class="layui-input-inline" style="padding-left: 30px;">
                        <input type="text" id="searchName" name="name" placeholder="请输入部门名称" autocomplete="off" class="layui-input list-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="searchDept()">搜索</button>
                    </div>
                </div>
            </div>
            <div class="person-list-content layui-row" style="padding: 0;">
                <ul id="classtree" class="layui-col-md2"></ul>
                <div class="layui-form layui-col-md10">
                    <table class="layui-table" style="width: 80%;float: right; margin-right: 10px" lay-odd lay-skin="line row nob">
                        <thead>
                        <tr style="background: #fff;">
                            <th><input type="checkbox" name="all" lay-skin="primary" lay-filter="allChoose"></th>
                            <th>部门名称</th>
                            <th>上级部门</th>
                            <th>部门层级</th>
                            <th>部门类型</th>
                            <th>创建时间</th>
                            <th>排序<i class="iconfont icon-jiantou-down"></i><i class="iconfont icon-jiantou-up"></i></th>
                        </tr>
                        </thead>
                        <tbody id="dept_list">
                        </tbody>
                    </table>
                    <div id="pages" style="width: calc(80% - 10px);padding-right: 20px;">
                        <div class="prompt">共<span id="dept_total"></span>条记录</div>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('last')">尾页</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('next')">下一页</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('prev')">上一页</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="dept_page('first')">首页</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
    <script>
        var page;
        var tree;
        var form;
        var lastParentId;//常量用于重载数据
        $(function() {
            layui.use(['element', 'tree', 'layer', 'form', 'upload'], function() {
                tree = layui.tree,
                form = layui.form;
                createTree(tree);
                //全选
                form.on('checkbox(allChoose)', function(data) {
                    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                    child.each(function(index, item) {
                        item.checked = data.elem.checked;
                    });
                    form.render('checkbox');
                });

                //点击出现下面
                $(".downpanel").on("click", ".layui-select-title", function(e) {
                    $(".layui-form-select").not($(this).parents(".layui-form-select")).removeClass("layui-form-selected");
                    $(this).parents(".downpanel").toggleClass("layui-form-selected");
                    layui.stope(e);
                }).on("click", "dl i", function(e) {
                    layui.stope(e);
                });
                $(document).on("click", function(e) {
                    $(".layui-form-select").removeClass("layui-form-selected");
                });


                //加载部门列表
                loadOrgList(1,'');
            });
        });
        //重新加载页面
        function refreshDeptList(){
            createTree(tree);
            if(page)
                loadOrgList(page.pageNumber,lastParentId);
        }
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
            var searchVal = $("#searchName").val();
            if(searchVal){}else{
                searchVal = '';
            }
            var treeNodes = [];
            var sUrl = 'ums/tree/getOrgTree.action';
            jo.postAjax(sUrl, {NAME:searchVal}, function(json){
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
                            var node = {name:deptName,id:deptId,parentId:parentId,spread: true,href: "javascript:loadOrgList(1,'"+deptId+"');",children:[]};
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
        //加载部门列表
        function loadOrgList(gotoPage,deptParentId){
            if(!gotoPage)
                gotoPage =1;
            var searchVal = $("#searchName").val();
            if(searchVal){}else{
                searchVal = '';
            }
            if(deptParentId){}else{
                deptParentId=loginUser.companyId;
            }
            lastParentId =deptParentId;
            var sUrl = 'ums/dept/getDeptPage.action';
            jo.postAjax(sUrl, {pageNumber:gotoPage,pageSize:25,NAME:searchVal,PARENT_ID:deptParentId}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        page = json;
                        var list = json.data;
                        var liHtml ='';
                        for(var i =0;i<list.length;i++){
                            var deptId = list[i].ID;
                            var name = list[i].NAME;
                            var parentId = list[i].PARENT_ID;
                            var deptLevel = list[i].DEPT_LEVEL;
                            var num = list[i].NUM;
                            var wholeId = list[i].WHOLE_ID;
                            var wholeName = list[i].WHOLE_NAME;
                            var type = list[i].TYPE;
                            var createTime = list[i].CREATE_TIME;
                            var parentName = list[i].PARENT_NAME;
                            liHtml += '<tr>\n' +
                                '      <td><input type="checkbox" name="deptCheck" value="'+deptId+'" lay-skin="primary"></td>\n' +
                                '      <td onclick="deptEdit(\''+deptId+'\')"><a href="javascript:;">'+name+'</a></td>\n' +
                                '      <td>'+parentName+'</td>\n' +
                                '      <td>'+deptLevel+'</td>\n' +
                                '      <td>'+type+'</td>\n' +
                                '      <td>'+createTime+'</td>\n' +
                                /*'      <td class="sort">\n' +
                                '           <input type="text" class="layui-input" value="'+num+'">\n' +
                                '      </td>\n' +*/
                                '      <td>'+num+'</td>\n' +
                                '      </tr>';
                        }
                        $("#dept_total").html(page.total);
                        $("#dept_list").html(liHtml);
                    }else{
                        $("#dept_total").html('0');
                        $("#dept_list").html('');
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
                loadOrgList(gotoPage);
            }else{
                loadOrgList(1);
            }
        }
        //搜索
        function searchDept(){
            loadOrgList(1,'');
        }
        //编辑部门
        function deptEdit(deptId){
            layer.open({ /*弹出框*/
                type: 2,
                title: '编辑机构',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['650px', '390px'],
                content: 'page/ums/deptForm_no.jsp?ID='+deptId+'&t='+(new Date()).getTime()
            });
        }
        //新增部门
        function deptAdd(){
            if(lastParentId){
                layer.open({ /*弹出框*/
                    type: 2,
                    title: '新增机构',
                    // maxmin: true,//大小窗口切换
                    shadeClose: true, //点击遮罩关闭层
                    area: ['650px', '390px'],
                    content: 'page/ums/deptForm_no.jsp?t='+(new Date()).getTime()
                });
            }
        }
        //删除部门
        function deptDel(){
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
                $('input[name="deptCheck"]:checked').each(function(){
                    ids.push($(this).val());
                });
                if(ids.length == 0){
                    layer.msg("请勾选要删除的部门");
                }else{
                    jo.postAjax('ums/dept/deleteDept.action', {ids:ids.join(",")}, function(json){
                        if(json && json.code == "0"){
                            layer.msg(json.info);
                            loadOrgList(1,lastParentId);//重新加载父页面
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
