<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>信息预览</title>
    <%@ include file="/common/constHead.jsp" %>

    <script src="<%=URL_STATIC%>static/prototype/js/layui.js"></script>
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/layui.css">
    <script src="<%=URL_STATIC%>static/final/js/jquery.min.js"></script>
    <script src="<%=URL_STATIC%>static/prototype/js/jquery.PrintArea.js"></script>

    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/font/font2/iconfont.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/common.css">
    <link rel="stylesheet" href="<%=URL_STATIC%>static/prototype/css/person-document.css">
    <script src="<%=URL_STATIC%>static/newjs/final_jo.js"></script>
    <script src="<%=URL_STATIC%>static/newjs/final_jo-adapt.js"></script>
    <style>
        .person-content .tit {
            width: 100px;
        }

        .line {
            left: 120px;
        }

        .dayin {
            color: #fff;
            letter-spacing: 0;
            background: #1AAD19;
            border: 1px solid #1AAD19;
        }

        .back {
            color: #fff;
            border: 1px solid #62abff;
            background: #62abff;
        }

        .person-content input {
            text-align: left;
        }

        .person-content .row-two .col-item {
            padding: 10px 20px 10px;
        }

        .layui-input,
        .layui-textarea {
            width: 100%;
            order: none;
        }

        button.dayin:hover,
        button.back:hover {
            color: #fff !important;
            opacity: 0.8;
        }
    </style>

</head>

<body>
<div class="container">
    <div class="layui-row">
        <div class="layui-col-md12 person">
            <div class="person-tit clear" style="padding: 0 0 18px 0;">
                <span class="left title" style="padding: 0;"></span>
                <div class="layui-form right">
                    <div class="layui-inline button-group">
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary export" onclick="exportExcel()">导出Excel
                        </button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary dayin"  id="btnPrint">打印</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-primary back">返回</button>
                    </div>
                </div>
            </div>
            <form action="" class="person-content layui-form layui-form-box" id="printContent">
                <div class="clear">
                    <div class="left image">
                        <%--<img src="../images/person.jpg" alt="">--%>
                        <img id="header"  src="<%=URL_STATIC%>static/images/def_head.jpg" alt="" width="128px" height="158px">

                    </div>
                    <div class="layui-row left row-one">
                        <div class="layui-col-md6">
                            <div class="label">
                                人员姓名
                            </div>
                            <input type="text" name="userName" id="userName" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-col-md6">
                            <div class="label">
                                籍贯
                            </div>
                            <input type="text" id="placeOfOrigin" name="placeOfOrigin" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-col-md6">
                            <div class="label">
                                曾用名
                            </div>
                            <input type="text" id="oldName" name="oldName" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-col-md6">
                            <div class="label">
                                所在部门
                            </div>
                            <input type="text" id="deptNames" name="deptNames" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-row row-two">
                    <div class="layui-col-md1 tit">
                        基本信息
                    </div>
                    <div class="line"></div>
                    <div class="layui-col-md1" style="margin-left: 30px;">
                        <div>
                            <div class="label">姓别</div>
                        </div>
                        <div>
                            <div class="label">民族</div>
                        </div>
                        <div>
                            <div class="label">出生地</div>
                        </div>
                        <div>
                            <div class="label">政治面貌</div>
                        </div>
                        <div>
                            <div class="label">岗位</div>
                        </div>
                        <div>
                            <div class="label">承担的工作</div>
                        </div>
                        <div>
                            <div class="label">婚姻状况</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item edit">
                            <select name="sex" lay-verify="required">
                                <option value=""></option>
                                <option value="男" selected>男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="sex" name="sex" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input" value="男">
                        </div>
                        <div class="col-item edit">
                            <select name="minzu" lay-verify="">
                                <option value=""></option>
                                <option value="汉族1" selected>汉族1</option>
                                <option value="汉族2">汉族2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="nation" name="nation" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input" value="汉族1">
                        </div>
                        <div class="col-item">
                            <input type="text" id="placeOfBirth" name="placeOfBirth" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="河北省张家口市">
                        </div>
                        <div class="col-item edit">
                            <select name="zhengzhimianmao" lay-verify="">
                                <option value=""></option>
                                <option value="中共党员1" selected>中共党员1</option>
                                <option value="中共党员2">中共党员2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="politicalOutlook" name="politicalOutlook" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input"
                                   value="中共党员">
                        </div>
                        <div class="col-item">
                            <input type="text" id="station" name="station" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input" value="中国环境科学研究院人事部部长">
                        </div>
                        <div class="col-item lang">
                            <input type="text" id="takeWork" name="takeWork" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="主要从事人事部工作">
                        </div>
                        <div class="col-item">
                            <input type="text" id="maritalStatus" name="maritalStatus" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="未婚">
                        </div>
                    </div>
                    <div class="layui-col-md1" style="margin-right: 20px;">
                        <div>
                            <div class="label">出生日期</div>
                        </div>
                        <div>
                            <div class="label">身份证号</div>
                        </div>
                        <div>
                            <div class="label">参加工作时间</div>
                        </div>
                        <div>
                            <div class="label">加入时间</div>
                        </div>
                        <div>
                            <div class="label">来院时间</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item edit">
                            <input type="text" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="birth" name="birth" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item">
                            <input type="text" id="idCard" name="idCard" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <input type="text" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="workStartTime" name="workStartTime" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <input type="text" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="joinPartyTime" name="joinPartyTime" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <input type="text" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="toThereTime" name="toThereTime" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-row row-two">
                    <div class="layui-col-md1 tit">
                        工作信息
                    </div>
                    <div class="line"></div>
                    <div class="layui-col-md1" style="margin-left: 30px;">
                        <div>
                            <div class="label">专业技术职务</div>
                        </div>
                        <div>
                            <div class="label">专业技术等级</div>
                        </div>
                        <div>
                            <div class="label">行政职务</div>
                        </div>
                        <div>
                            <div class="label">行政级别</div>
                        </div>
                        <div>
                            <div class="label">研究领域</div>
                        </div>
                        <div>
                            <div class="label">研究领域细分</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item">
                            <input type="text" id="technicalPosition" name="technicalPosition" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="专业技术一级1" selected>专业技术一级1</option>
                                <option value="专业技术一级2">专业技术一级2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="technicalLevel" name="technicalLevel" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="正局级1" selected>正局级1</option>
                                <option value="正局级2">正局级2</option>
                            </select>
                        </div>
                        <div class="col-item">
                            <input type="text" id="administrativeDuty" name="administrativeDuty" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="administrativeLevel" name="administrativeLevel" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item lang">
                            <input type="text" id="researchField" name="researchField" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item lang">
                            <input type="text" id="researchFieldDetail" name="researchFieldDetail" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-md1" style="margin-right: 20px;">
                        <div>
                            <div class="label">取得时间</div>
                        </div>
                        <div>
                            <div class="label">聘任时间</div>
                        </div>
                        <div>
                            <div class="label">任职时间</div>
                        </div>
                        <div>
                            <div class="label">任现级别时间</div>
                        </div>
                        <div>
                            <div class="label">是否有挂职经历</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item edit">
                            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="getTime" name="getTime" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="appointmentTime" name="appointmentTime" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="col-item save">
                            <input type="text" id="tenureTime" name="tenureTime" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="大气环境研究1">大气环境研究1</option>
                                <option value="大气环境研究2">大气环境研究2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="levelOfAppointment" name="levelOfAppointment" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="tempWorkExperience" name="tempWorkExperience" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-row row-two">
                    <div class="layui-col-md1 tit">
                        学历信息
                    </div>
                    <div class="line"></div>
                    <div class="layui-col-md1" style="margin-left: 30px;">
                        <div>
                            <div class="label">全日制学历</div>
                        </div>
                        <div>
                            <div class="label">在职学历</div>
                        </div>
                        <div>
                            <div class="label">从事专业</div>
                        </div>
                        <div>
                            <div class="label">熟悉何种外语及水平</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="学士1" selected>学士1</option>
                                <option value="学士2">学士2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="firstEducation" name="firstEducation" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input"
                                   value="学士">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="学士1" selected>学士1</option>
                                <option value="学士2">学士2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="jobEducation" name="jobEducation" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="学士">
                        </div>
                        <div class="col-item">
                            <input type="text" id="specialty" name="specialty" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="无">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="英语四级" selected>英语四级</option>
                                <option value="英语六级">英语六级</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="englishLevel" name="englishLevel" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="英语四级">
                        </div>
                    </div>
                    <div class="layui-col-md1" style="margin-right: 20px;width: 130px;">
                        <div>
                            <div class="label">全日制学位</div>
                        </div>
                        <div>
                            <div class="label">在职学位</div>
                        </div>
                        <div>
                            <div class="label">国外一年以上留学经历</div>
                        </div>
                        <div>
                            <div class="label">备注</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="学士1" selected>学士1</option>
                                <option value="学士2">学士2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="firstDegree" name="firstDegree" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="学士">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="学士1" selected>学士1</option>
                                <option value="学士2">学士2</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="jobDegree" name="jobDegree" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input" value="学士">
                        </div>
                        <div class="col-item edit">
                            <select name="" lay-verify="">
                                <option value=""></option>
                                <option value="有" selected>有</option>
                                <option value="无">无</option>
                            </select>
                        </div>
                        <div class="col-item save">
                            <input type="text" id="overseasStudyExperience" name="overseasStudyExperience" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input"
                                   value="有">
                        </div>
                        <div class="col-item">
                            <input type="text" id="remark" name="remark" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input" value="硕士学历">
                        </div>
                    </div>
                </div>

                <div class="layui-row row-two">
                    <div class="layui-col-md1 tit">
                        个人通讯信息
                    </div>
                    <div class="line"></div>
                    <div class="layui-col-md1" style="margin-left: 30px;">
                        <div>
                            <div class="label">办公电话</div>
                        </div>
                        <div>
                            <div class="label">传真号</div>
                        </div>
                        <div>
                            <div class="label">通讯地址</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item">
                            <input type="text" id="officePhone" name="officePhone" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item">
                            <input type="text" id="faxNumber" name="faxNumber" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item lang">
                            <input type="text" id="postalAddress" name="postalAddress" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-md1" style="margin-right: 20px;">
                        <div>
                            <div class="label">手机号</div>
                        </div>
                        <div>
                            <div class="label">邮箱地址</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item">
                            <input type="number" id="mobilePhone" name="mobilePhone" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item">
                            <input type="email" id="emailAddress" name="emailAddress" required lay-verify="required"
                                   placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-row row-two">
                    <div class="layui-col-md1 tit">
                        紧急联系人1
                    </div>
                    <div class="line"></div>
                    <div class="layui-col-md1" style="margin-left: 30px;">
                        <div>
                            <div class="label">关系</div>
                        </div>
                        <div>
                            <div class="label">手机号</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item">
                            <input type="text" id="relationshipOne" name=relationshipOne"" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item">
                            <input type="text" id="emergencyContactOne" name="emergencyContactOne" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-md1" style="margin-right: 20px;">
                        <div>
                            <div class="label">姓名</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item ">
                            <input type="text" id="nameOne" name="nameOne" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-row row-two" name="addDivName">
                    <div class="layui-col-md1 tit">
                        紧急联系人2
                    </div>
                    <div class="line"></div>
                    <div class="layui-col-md1" style="margin-left: 30px;">
                        <div>
                            <div class="label">关系</div>
                        </div>
                        <div>
                            <div class="label">手机号</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item">
                            <input type="text" id="relationshipTwo" name="relationshipTwo" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                        <div class="col-item">
                            <input type="text" id="emergencyContactTwo" name="emergencyContactTwo" required
                                   lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-col-md1" style="margin-right: 20px;">
                        <div>
                            <div class="label">姓名</div>
                        </div>
                    </div>
                    <div class="layui-col-md3">
                        <div class="col-item ">
                            <input type="text" id="nameTwo" name="nameTwo" required lay-verify="required" placeholder=""
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>






            </form>
        </div>
    </div>

</div>

<script>


    function exportExcel(){
        var userId = jo.getDefVal(jo.getUrlParam("id"), loginUser.id);
       jo.newWindow("pms/pmspreview/exportExcel?id="+ userId);
        // jo.newWindow("pms/pmsUser/exportWord/"+(userId));

    }

    $(function () {
            $("#btnPrint").click(function(){
                $("#printContent").printArea();
            });
        layui.use(['form', 'laydate'], function () {
            var form = layui.form;
            var laydate = layui.laydate;
            $(".back").click(function () {

                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭


            })

        });
        var userId = jo.getDefVal(jo.getUrlParam("id"), loginUser.id);
        var auditData = jo.postAjax("pms/pmspreview/getPmsUserById", {"id": userId});
        // alert( auditData.data[0].id);
        $("#userName").val(auditData.data[0].userName);
        $("#oldName").val(auditData.data[0].oldName);
        $("#placeOfOrigin").val(auditData.data[0].placeOfOrigin);
        $("#deptNames").val(auditData.data[0].deptNames);
        $("#sex").val(auditData.data[0].sex);
        $("#nation").val(auditData.data[0].nation);
        $("#placeOfBirth").val(auditData.data[0].placeOfBirth);
        $("#politicalOutlook").val(auditData.data[0].politicalOutlook);
        $("#station").val(auditData.data[0].station);
        $("#takeWork").val(auditData.data[0].takeWork);
        $("#maritalStatus").val(auditData.data[0].maritalStatus);
        $("#birth").val(auditData.data[0].birth);
        $("#idCard").val(auditData.data[0].idCard);
        $("#workStartTime").val(auditData.data[0].workStartTime);
        $("#joinPartyTime").val(auditData.data[0].joinPartyTime);
        $("#toThereTime").val(auditData.data[0].toThereTime);
        var photoAddress = auditData.data[0].photoAddress;
        if (jo.isValid(photoAddress)) {
            $("#header").attr("src", URL_FS + "fs/file/image.action?id=" + photoAddress);//使用审核库中的信息
        }

        //工作信息
        $("#technicalPosition").val(auditData.data[0].technicalPosition);
        $("#technicalLevel").val(auditData.data[0].technicalLevel);
        $("#administrativeDuty").val(auditData.data[0].administrativeDuty);
        $("#administrativeLevel").val(auditData.data[0].administrativeLevel);
        $("#researchFieldDetail").val(auditData.data[0].researchFieldDetail);
        $("#getTime").val(auditData.data[0].getTime);
        $("#appointmentTime").val(auditData.data[0].appointmentTime);
        $("#tenureTime").val(auditData.data[0].tenureTime);
        $("#researchField").val(auditData.data[0].researchField);
        $("#tempWorkExperience").val(auditData.data[0].tempWorkExperience);
        $("#levelOfAppointment").val(auditData.data[0].levelOfAppointment);


        //学历信息
        $("#firstEducation").val(auditData.data[0].firstEducation);
        $("#firstDegree").val(auditData.data[0].firstDegree);
        $("#specialty").val(auditData.data[0].specialty);
        $("#englishLevel").val(auditData.data[0].englishLevel);
        $("#jobEducation").val(auditData.data[0].jobEducation);
        $("#jobDegree").val(auditData.data[0].jobDegree);
        $("#overseasStudyExperience").val(auditData.data[0].overseasStudyExperience);
        $("#remark").val(auditData.data[0].remark);

        //    个人通讯信息
        $("#officePhone").val(auditData.data[0].communication.officePhone);
        $("#faxNumber").val(auditData.data[0].communication.faxNumber);
        $("#postalAddress").val(auditData.data[0].communication.postalAddress);
        $("#mobilePhone").val(auditData.data[0].communication.mobilePhone);
        $("#emailAddress").val(auditData.data[0].communication.emailAddress);

        //紧急联系人1
        $("#relationshipOne").val(auditData.data[0].communication.relationshipOne);
        $("#nameOne").val(auditData.data[0].communication.nameOne);
        $("#emergencyContactOne").val(auditData.data[0].communication.emergencyContactOne);

        //紧急联系人2
        $("#relationshipTwo").val(auditData.data[0].communication.relationshipTwo);
        $("#nameTwo").val(auditData.data[0].communication.nameTwo);
        $("#emergencyContactTwo").val(auditData.data[0].communication.emergencyContactTwo);
        //社会成员和社会关系
        var listline = "";
        for (var i = 0; i < auditData.data[0].relationsList.length; i++) {
            if ((auditData.data[0].relationsList.length - 1) === i) {
                listline += '<div name=\"addDivName\" class=\"layui-row row-two\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\">';
            if (i === 0) {
                listline += '家庭/社会关系 ';

            }
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">姓名</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">性别</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">出生年月</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">工作单位</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].name + '>';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"sex\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"男\" selected>男</option>';
            listline += '<option value=\"女\" selected>女</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].sex + ' >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"  required lay-verify=\"required\" placeholder=\"\" >';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].birthday + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item lang\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].unit + ' >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">联系电话</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">关系类型</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">关系</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].tel + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"家庭成员\" selected>家庭成员</option>';
            listline += '<option value=\"社会关系\" selected>社会关系</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].stype + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].relationsList[i].relation + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addrelation").after("");
        $("div[name='addDivName']:last").after(listline);

        // $("#addrelation").after(listline);
        //教育经历
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsEducationList.length; i++) {
            if ((auditData.data[0].auditPmsEducationList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\" name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '教育经历';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].startTime + '  >';
            listline += '</div>';
            listline += ' <div style=\"text-align: center;\">至</div>';
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].stopTime + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">院校</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">专业</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">培养方式</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].universityName + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].professionalName + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item lang\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].cultureMode + '    >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">学历</div>';
            listline += '</div>'
            listline += '<div>';
            listline += '<div class=\"label\">学位</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].education + ' >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsEducationList[i].degree + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';

        }
        // $("#addeducation").after(listline);
        $("div[name='addDivName']:last").after(listline);

//工作经历
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsWorkList.length; i++) {
            if ((auditData.data[0].auditPmsWorkList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '工作经历';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsWorkList[i].startTime + '  >';
            listline += '</div>';
            listline += ' <div style=\"text-align: center;\">至</div>';
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsWorkList[i].stopTime + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">工作单位</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">工作部门</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsWorkList[i].workCompany + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsWorkList[i].workDept + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">职务职称</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsWorkList[i].post + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addwork").after(listline);

        $("div[name='addDivName']:last").after(listline);


        //社团兼职

        listline = "";
        for (var i = 0; i < auditData.data[0].mainTechGroupList.length; i++) {
            if ((auditData.data[0].mainTechGroupList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '社团兼职';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].mainTechGroupList[i].startTime + '  >';
            listline += '</div>';
            listline += ' <div style=\"text-align: center;\">至</div>';
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].mainTechGroupList[i].stopTime + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">团队/机构名称</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">协会职务</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].mainTechGroupList[i].groupName + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].mainTechGroupList[i].post + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addMainTechGroup").after(listline);
        $("div[name='addDivName']:last").after(listline);

//荣誉称号
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsHonorTitleList.length; i++) {
            if ((auditData.data[0].auditPmsHonorTitleList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '荣誉称号';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsHonorTitleList[i].years + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">荣誉称号</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">颁发单位</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsHonorTitleList[i].honorName + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsHonorTitleList[i].awardDept + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">称号级别</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsHonorTitleList[i].titleLevel + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addHonorTitle").after(listline);
        $("div[name='addDivName']:last").after(listline);


//获奖情况
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsTechAwardsList.length; i++) {
            if ((auditData.data[0].auditPmsTechAwardsList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '获奖情况';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechAwardsList[i].years + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">项目名称</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">获奖等级</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">奖励层次</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechAwardsList[i].awardWinProjectName + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechAwardsList[i].awardWinProjectLevel + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item lang\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechAwardsList[i].awardLevel + '    >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">排名</div>';
            listline += '</div>'
            listline += '<div>';
            listline += '<div class=\"label\">奖励类别</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechAwardsList[i].ranking + ' >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechAwardsList[i].awardType + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';

        }
        // $("#addTechAwards").after(listline);
        $("div[name='addDivName']:last").after(listline);


        //出版情况
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsPublishList.length; i++) {
            if ((auditData.data[0].auditPmsPublishList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '出版著';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPublishList[i].years + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">书名</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">出版社</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">排名</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPublishList[i].bookName + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPublishList[i].press + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item lang\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPublishList[i].ranking + '    >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">著作类型</div>';
            listline += '</div>'
            listline += '<div>';
            listline += '<div class=\"label\">撰写章节</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPublishList[i].workType + ' >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPublishList[i].writeChapter + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';

        }
        // $("#addPublish").after(listline);
        $("div[name='addDivName']:last").after(listline);

        //专利

        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsPatentList.length; i++) {
            if ((auditData.data[0].auditPmsPatentList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '专利';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].years + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">专利名称</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">专利号</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">排名</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].patentName + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].patentNumber + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item lang\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].ranking + '    >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">专利类型</div>';
            listline += '</div>'
            listline += '<div>';
            listline += '<div class=\"label\">是否转让</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">转让金额</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].patentType + ' >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].isAttorn + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsPatentList[i].attornMoney + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';

        }
        // $("#addPublish").after(listline);
        $("div[name='addDivName']:last").after(listline);


        //项目经历
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsJoinProjectList.length; i++) {
            if ((auditData.data[0].auditPmsJoinProjectList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '项目经历';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsJoinProjectList[i].startTime + '  >';
            listline += '</div>';
            listline += ' <div style=\"text-align: center;\">至</div>';
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsJoinProjectList[i].stopTime + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">项目名称</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">课题/专项类别</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsJoinProjectList[i].projectName + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsJoinProjectList[i].projectType + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">经费</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">担任角色</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsJoinProjectList[i].funds + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsJoinProjectList[i].role + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addwork").after(listline);

        $("div[name='addDivName']:last").after(listline);

//技术变革

        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsTechnologyBraceList.length; i++) {
            if ((auditData.data[0].auditPmsTechnologyBraceList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '技术变革';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechnologyBraceList[i].release + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">成果名称</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\"> 发布/采纳部门</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechnologyBraceList[i].achievementsName + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechnologyBraceList[i].releaseDept + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">发布/采纳形式</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsTechnologyBraceList[i].releaseName + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addHonorTitle").after(listline);
        $("div[name='addDivName']:last").after(listline);


        //人才培养计划
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsSupportProjectList.length; i++) {
            if ((auditData.data[0].auditPmsSupportProjectList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '人才培养计划';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsSupportProjectList[i].years + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">计划名称</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">人才层次</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsSupportProjectList[i].planProjectName + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsSupportProjectList[i].personnelLevel + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';
        }
        // $("#addMainTechGroup").after(listline);
        $("div[name='addDivName']:last").after(listline);


        //年度考核
        listline = "";
        for (var i = 0; i < auditData.data[0].auditPmsYearCheckList.length; i++) {
            if ((auditData.data[0].auditPmsYearCheckList.length - 1) === i) {
                listline += '<div  class=\"layui-row row-two\"  name=\"addDivName\">';
            } else {
                listline += '<div class=\"layui-row row-two\">';
            }
            listline += '<div class=\"layui-col-md1 tit\" style=\"margin-top: 0;width: 140px;\">';

            if (i === 0) {
                listline += '<span class=\"typeName\">';
                listline += '年度考核';
                listline += '</span>';

            }
            listline += '<div class=\"layui-input-inline col-item edit\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\"   >';
            listline += '</div>';
            listline += '<div class=\"layui-input-inline col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].years + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"line\"></div>';
            listline += '  <div class=\"layui-col-md1\" style=\"margin-left: 30px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">考核年度</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\"> 第一季度等级</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">第三季度等级</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].years + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].quarterOne + '   >';
            listline += '</div>';
            listline += '<div class=\"col-item lang\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].quarterThree + '    >';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md1\" style=\"margin-right: 20px;\">';
            listline += '<div>';
            listline += '<div class=\"label\">年度考核等级</div>';
            listline += '</div>'
            listline += '<div>';
            listline += '<div class=\"label\">第二季度等级</div>';
            listline += '</div>';
            listline += '<div>';
            listline += '<div class=\"label\">第四季度等级</div>';
            listline += '</div>';
            listline += '</div>';
            listline += '<div class=\"layui-col-md3\">';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].checkScore + ' >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].quarterTwo + '  >';
            listline += '</div>';
            listline += '<div class=\"col-item edit\">';
            listline += '<select name=\"\" lay-verify=\"\">';
            listline += '<option value=\"\"></option>';
            listline += '<option value=\"学士\" selected>学士</option>';
            listline += '<option value=\"博士\">博士</option>';
            listline += '<option value=\"硕士\">硕士</option>';
            listline += '</select>';
            listline += '</div>';
            listline += '<div class=\"col-item save\">';
            listline += '<input type=\"text\" class=\"layui-input\" autocomplete=\"off\" lay-skin=\"primary\" value=' + auditData.data[0].auditPmsYearCheckList[i].quarterFour + '  >';
            listline += '</div>';
            listline += '</div>';
            listline += '</div>';

        }
        // $("#addPublish").after(listline);
        $("div[name='addDivName']:last").after(listline);



        $(".layui-input").addClass("readonly");
        $(".layui-input").attr("readonly", "readonly");
        // $(".search-input").removeAttr("readonly");
        $(".list-input").removeAttr("readonly");
        $(".list-input").removeClass("readonly");
    })
</script>
</body>

</html>