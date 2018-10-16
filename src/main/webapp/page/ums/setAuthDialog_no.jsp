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
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <title>角色授权</title>
    <style>
        .layui-input-inline {
            width: 180px;
        }

        .layui-input-inline input {
            height: 32px;
            background: #FCFCFC;
            border: 1px solid #DDDDDD;
            border-radius: 4px;
        }

        .layui-form {
            padding-top: 10px;
            padding-bottom: 30px;
            padding-right: 60px;
            padding-left: 40px;
            position: relative;
        }

        .edit-item {
            margin-bottom: 10px;
        }

        button.layui-btn-primary.save {
            width: 240px;
            height: 42px;
            background: #1AAD19;
            color: #fff;
            position: fixed;
            bottom: 20px;
            left: 32%;
        }

        .lang input {
            width: 490px;
        }

        .line {
            width: 1px;
            height: 160px;
            background: #E9E9E9;
            position: absolute;
            left: 50%;
        }

        #classtree {
            height: 320px;
            overflow-y: auto;
        }
    </style>
</head>

<body>
<form class="layui-form layui-row" action="">
    <ul id="classtree" class="layui-col-md8 layui-col-xs8 layui-col-md-offset3 layui-col-xs-offset3"></ul>

    <button type="button" class="layui-btn layui-btn-primary save" onclick="giveRole()">确认授权</button>
</form>



<script>
    var form,tree,allNodes,
    id = '<%=request.getParameter("roleId")%>';
    $(function() {
        layui.use(['form', 'laydate', 'tree'], function() {
            form = layui.form;
            var laydate = layui.laydate;
            tree = layui.tree;
            //创建树
            createTree(tree);
        });
    })
    //确认授权
    function giveRole(){
        var ids = [];
        $(".layui-form-checked").each(function(){
            ids.push($(this).prev().val());
        });
        if(ids.length == 0){
            layer.msg("请勾选要授权的功能");
        }else{
            jo.postAjax('ums/role/batchInsertNavigate2Role.action', {roleId:id,navigateId:ids.join(",")}, function(json){
                if(json && json.code==0){
                    jo.showMsg("授权成功!");
                }else{
                    jo.showMsg(jo.getDefVal(json.info,"授权失败!"));
                }
            }, true);
        }
    }
    function createTree(){
        $("#classtree").html('');
        var xtree1 = new layuiXtree({
            elem: 'classtree', //(必填) 放置xtree的容器，样式参照 .xtree_contianer
            isopen: true,
            form: form ,//(必填) layui 的 from
            data: loadNavigateTree() ,//(必填) json数据
            click: function(data) { //节点选中状态改变事件监听，全选框有自己的监听事件
               /* console.log(data.elem); //得到checkbox原始DOM对象
                console.log(data.elem.checked); //开关是否开启，true或者false
                console.log(data.value); //开关value值，也可以通过data.elem.value得到
                console.log(data.othis);*/ //得到美化后的DOM对象
            }
        });
        if(allNodes){
            for(var i in allNodes){
                if(allNodes[i].chceked){
                    var val = allNodes[i].value;
                    $("input[value='"+val+"']").next().addClass("layui-form-checked");
                }
            }
        }
    }
    function loadNavigateTree() {
        var treeNodes = [];
        var sUrl = 'ums/navigate/getNavigateByRole.action';
        jo.postAjax(sUrl, {roleId:id}, function(json){
            if(json && json.code == "0"){
                if(json.data && json.data[0]){
                    var list = json.data;
                    for(var i in list){
                        var ID = list[i].ID;
                        var NAME = list[i].NAME;
                        var PARENT_ID = list[i].PARENT_ID;
                        var checked = list[i].checked;
                        var NAV_LEVEL = list[i].NAV_LEVEL;
                        if(PARENT_ID == 'ROOT' && NAV_LEVEL == 1){
                            PARENT_ID = 0;
                        }
                        var node = {title:NAME,value:ID,parentId:PARENT_ID,chceked:checked,data:[]};
                        treeNodes.push(node);
                    }
                    allNodes = treeNodes;
                    //递归遍历树
                    for(var i in treeNodes){
                        var parentId = treeNodes[i].parentId;
                        if(parentId === 0){//根
                        }else{
                            for(var j in treeNodes){
                                if(treeNodes[j].value == parentId){
                                    var child = treeNodes[j].data;
                                    if(!child){
                                        child = [];
                                    }
                                    child.push(treeNodes[i]);
                                    treeNodes[j].data = child;
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
</script>
</body>
</html>
