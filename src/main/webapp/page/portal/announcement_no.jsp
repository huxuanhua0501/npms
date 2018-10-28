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
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <title>公告设置</title>
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
                <span class="left title">公告设置</span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary add">新增</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary del">删除</button>
                        <!-- <button type="button" class="layui-btn layui-btn-radius layui-btn-primary reset"><i class="layui-icon layui-icon-refresh"></i> 刷新</button> -->
                    </div>
                </div>
            </div>

            <div class="form-content">
                <i class="iconfont icon-shaixuan"></i>
                <div class="layui-form-item">
                    <!-- <label class="layui-form-label">姓名</label> -->
                    <div class="layui-input-inline" style="padding-left: 30px;">
                        <input type="text" id="searchKeyword" name="name" placeholder="请输入关键字" autocomplete="off" class="layui-input list-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-inline button-inline">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary inquiry" onclick="loadAnnouncementList(1)">搜索</button>
                    </div>
                </div>
            </div>

            <div class="person-list-content">
                <table class="layui-table layui-form">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="all" lay-skin="primary" lay-filter="allChoose"></th>
                        <th>排序</th>
                        <th>标题</th>
                        <th>摘要</th>
                        <th>添加人</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="announcement_list">
                    </tbody>
                </table>
                <div id="pages">
                    <div class="prompt">共<span id="announcement_total">2</span>条记录</div>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('last')">尾页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('next')">下一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('prev')">上一页</button>
                    <button type="button" class="layui-btn layui-btn-primary" onclick="announcement_page('first')">首页</button>
                </div>
            </div>
        </form>
    </div>
</div>
    <script>
        var page;
        var form;
        var layer;
        $(function() {
            layui.use(['layer', 'form', 'laydate'], function() {
                form = layui.form;
                layer = layui.layer;
                var laydate = layui.laydate;

                //全选
                form.on('checkbox(allChoose)', function(data) {
                    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                    child.each(function(index, item) {
                        item.checked = data.elem.checked;
                    });
                    form.render('checkbox');
                })

                // 多选删除
                $(".del").click(function() {
                    layer.confirm('确定要删除勾选的条目吗？', {
                        skin: 'more-del',
                        title: '删除所选条目',
                        btn: ['再考虑一下', '确定删除'],
                        area: ['650px', '280px'],
                        success: function(layero, index) {
                            $(document.body).find(".layui-layer-content").css("textAlign", "center");
                            $(document.body).find(".layui-layer-content").css("lineHeight", "121px");
                        }
                    }, function(index, layero) {
                        layer.close(index);
                    }, function(index) {
                        //确定删除
                        var ids = [];
                        $('input[name="announCheck"]:checked').each(function(){
                            ids.push($(this).val());
                        });
                        if(ids.length == 0){
                            layer.msg("请勾选要删除的公告");
                        }else{
                            jo.postAjax('pms/announcement/delete.action', {ids:ids.join(",")}, function(json){
                                if(json && json.code == "0"){
                                    layer.msg(json.info);
                                    refreshAnnoun();//重新加载父页面
                                }else{
                                    layer.msg(json.info);
                                }
                            }, true);
                        }
                    });
                })
                $(".add").click(function() {
                    // layer.msg('Hello World');
                    layer.open({ /*弹出框*/
                        type: 2,
                        title: '新增公告',
                        // maxmin: true,//大小窗口切换
                        shadeClose: true, //点击遮罩关闭层
                        area: ['750px', '95%'],
                        content: 'page/portal/announcement_edit_no.jsp?edit=true&opt=add'
                    });
                })
            });
            var pageNumber = '<%=request.getParameter("pageNumber")%>';
            //加载公告List
            loadAnnouncementList(pageNumber);
        });
        //分页加载公告信息
        function loadAnnouncementList(gotoPage){
            if(!gotoPage)
                gotoPage =1;
            var searchVal = $("#searchKeyword").val();
            if(searchVal){}else{
                searchVal = '';
            }
            var sUrl = 'pms/announcement/getPage.action';
            jo.postAjax(sUrl, {pageNumber:gotoPage,content:searchVal}, function(json){
                if(json && json.code == "0"){
                    if(json.data && json.data[0]){
                        page = json;
                        var list = json.data;
                        var liHtml ='';
                        for(var i =0;i<list.length;i++){
                            var announId = list[i].id.toString();
                            var serNum = list[i].serialNumber;
                            var title = list[i].title;
                            var orgTitle = title;
                            var content = list[i].content;
                            var orgContent = content;
                            var point = list[i].point;
                            var orgPoint = point;
                            var createTime = list[i].createTime;
                            var createName = list[i].createName;
                            if(title && title.length > 7)
                                title = title.substr(0,7)+'…';
                            if(point && point.length > 30){
                                point = point.substr(0,30)+'…';
                            }
                            // if(content && content.length > 30){
                            //     content = content.substr(0,30)+'…';
                            // }
                            liHtml += '<tr>\n' +
                                '       <td><input type="checkbox" name="announCheck" value="'+announId+'" lay-skin="primary"></td>\n' +
                                '       <td>'+serNum+'</td>\n' +
                                '       <td title="'+orgTitle+'">'+title+'</td>\n' +
                                '       <td title="'+orgPoint+'">'+point+'</td>\n' +
                                '       <td>'+createName+'</td>\n' +
                                '       <td>'+createTime+'</td>\n' +
                                '       <td>\n' +
                                '       <a href="javascript:announLook(\''+announId+'\');" class="look">查看</a>\n' +
                                '       <a href="javascript:announEdit(\''+announId+'\');" class="edit">编辑</a>\n' +
                                '       <a href="javascript:announDelete(\''+announId+'\');" class="delete">删除</a>\n' +
                                '       </td>\n' +
                                '       </tr>';
                        }
                        $("#announcement_total").html(json.total);
                        $("#announcement_list").html(liHtml);
                    }else{
                        $("#announcement_total").html('0');
                        $("#announcement_list").html('');
                        page = null;
                    }
                    form.render();
                }
            }, true);
        }
        //分页跳转
        function announcement_page(type){
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
                loadAnnouncementList(gotoPage);
            }else{
                loadAnnouncementList(1);
            }

        }
        //单条查看
        function announLook(id){
            // layer.msg('Hello World');
            layer.open({ /*弹出框*/
                type: 2,
                title: '公告详情',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['80%', '85%'],
                content: 'page/portal/home_announcement_detail_no.jsp?orgType=layerOpen&announId='+id
                // content: 'page/portal/announcement_llook_no.jsp?announId='+id+'&opt=look'
            });
        }
        //单条编辑
        function announEdit(id){
            // layer.msg('Hello World');
            layer.open({ /*弹出框*/
                type: 2,
                title: '编辑',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['700px', '85%'],
                content: 'page/portal/announcement_edit_no.jsp?edit=true&announId='+id+'&opt=edit'
            });
        }
        //单挑删除
        function announDelete(id){
            /*layer.open({ /!*弹出框*!/
                type: 2,
                title: '删除此条',
                // maxmin: true,//大小窗口切换
                shadeClose: true, //点击遮罩关闭层
                area: ['650px', '430px'],
                content: 'page/portal/announcement_llook_no.jsp?announId='+id+'&opt=del'
            });*/
            layer.confirm('确定要删除该公告吗？', {
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
                jo.postAjax('pms/announcement/delete.action', {id:id}, function(json){
                    if(json && json.code == "0"){
                        layer.msg(json.info);
                        refreshAnnoun();//重新加载父页面
                    }else{
                        layer.msg(json.info);
                    }
                }, true);
            });
        }
        function refreshAnnoun(){
            if(page){
                //window.parent.openPageOnMain('page/portal/announcement_no.jsp?pageNumber='+page.pageNumber);
                loadAnnouncementList(page.pageNumber);
            }
        }
    </script>
</body>

</html>
