<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            order:none;
        }
        
        button.dayin:hover,
        button.back:hover {
            color: #fff !important;
            opacity: 0.8;
        }
    </style>
   <%-- <script>
        $(function () {
            var userId = jo.getDefVal(jo.getUrlParam("id"), loginUser.id);
            var auditData = jo.postAjax("/pms/pmspreview/getPmsUserById",{"userId":userId});


        });

    </script>--%>
</head>

<body>
    <div class="container">
        <div class="layui-row">
            <div class="layui-col-md12 person">
                <div class="person-tit clear" style="padding: 0 0 18px 0;">
                    <span class="left title" style="padding: 0;"></span>
                    <div class="layui-form right">
                        <div class="layui-inline button-group">
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-primary export">导出Excel</button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-primary dayin">打印</button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-primary back">返回</button>
                        </div>
                    </div>
                </div>
                <form action="" class="person-content layui-form layui-form-box">
                    <div class="clear">
                        <div class="left image">
                            <img src="../images/person.jpg" alt="">
                        </div>
                        <div class="layui-row left row-one">
                            <div class="layui-col-md6">
                                <div class="label">
                                    人员姓名
                                </div>
                                <input type="text" name="userName" id="userName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="layui-col-md6">
                                <div class="label">
                                    籍贯
                                </div>
                                <input type="text" id="placeOfOrigin" name="placeOfOrigin" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="layui-col-md6">
                                <div class="label">
                                    曾用名
                                </div>
                                <input type="text" id="oldName" name="oldName" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="layui-col-md6">
                                <div class="label">
                                    所在部门
                                </div>
                                <input type="text" id="deptNames" name="deptNames" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
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
                                <input type="text" id="sex" name="sex" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="男">
                            </div>
                            <div class="col-item edit">
                                <select name="minzu" lay-verify="">
                                            <option value=""></option>
                                            <option value="汉族1" selected>汉族1</option>
                                            <option value="汉族2">汉族2</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="nation" name="nation" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="汉族1">
                            </div>
                            <div class="col-item">
                                <input type="text" id="placeOfBirth" name="placeOfBirth" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="河北省张家口市">
                            </div>
                            <div class="col-item edit">
                                <select name="zhengzhimianmao" lay-verify="">
                                            <option value=""></option>
                                            <option value="中共党员1" selected>中共党员1</option>
                                            <option value="中共党员2">中共党员2</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="politicalOutlook" name="politicalOutlook" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="中共党员">
                            </div>
                            <div class="col-item">
                                <input type="text" id="station" name="station" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="中国环境科学研究院人事部部长">
                            </div>
                            <div class="col-item lang">
                                <input type="text" id="takeWork" name="takeWork" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="主要从事人事部工作">
                            </div>
                            <div class="col-item">
                                <input type="text" id="maritalStatus" name="maritalStatus" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="未婚">
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
                                <input type="text" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item save">
                                <input type="text"   id="birth" name="birth"required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item">
                                <input type="text"  id="idCard" name="idCard"   required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item edit">
                                <input type="text"  required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   >
                            </div>
                            <div class="col-item save">
                                <input type="text"id="workStartTime" name="workStartTime"required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item edit">
                                <input type="text"   required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   >
                            </div>
                            <div class="col-item save">
                                <input type="text"  id="joinPartyTime" name="joinPartyTime" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item edit">
                                <input type="text"  required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item save">
                                <input type="text"  id="toThereTime" name="toThereTime" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
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
                                <div class="label">研究领域细分</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" id="technicalPosition" name="technicalPosition" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="专业技术一级1" selected>专业技术一级1</option>
                                                <option value="专业技术一级2">专业技术一级2</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="technicalLevel" name="technicalLevel" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="正局级1" selected>正局级1</option>
                                            <option value="正局级2">正局级2</option>
                                        </select>
                            </div>
                            <div class="col-item">
                                <input type="text"id="administrativeDuty" name="administrativeDuty" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="">
                            </div>
                            <div class="col-item save">
                                <input type="text" id="administrativeLevel" name="administrativeLevel" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="col-item lang">
                                <input type="text" id="researchFieldDetail" name="researchFieldDetail" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
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
                                <div class="label">研究领域</div>
                            </div>
                            <div>
                                <div class="label">是否有挂职经历</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"    >
                            </div>
                            <div class="col-item save">
                                <input type="text" id="getTime" name="getTime" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item save">
                                <input type="text" id="appointmentTime" name="appointmentTime" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   >
                            </div>
                            <div class="col-item save">
                                <input type="text" id="tenureTime" name="tenureTime" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="大气环境研究1">大气环境研究1</option>
                                            <option value="大气环境研究2">大气环境研究2</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="researchField" name="researchField" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="是">是</option>
                                                <option value="否">否</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="tempWorkExperience" name="tempWorkExperience" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
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
                                <input type="text" id="highestEducationList" name="highestEducationList" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="学士1" selected>学士1</option>
                                            <option value="学士2">学士2</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="jobEducationList" name="jobEducationList" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                            <div class="col-item">
                                <input type="text" id="specialty" name="specialty" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="无">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="英语四级" selected>英语四级</option>
                                            <option value="英语六级">英语六级</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="englishLevel" name="englishLevel" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="英语四级">
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
                                <input type="text"id="highestDegree" name="highestDegree" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                    <option value=""></option>
                                    <option value="学士1" selected>学士1</option>
                                    <option value="学士2">学士2</option>
                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="jobDegree" name="jobDegree" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                    <option value=""></option>
                                    <option value="有" selected>有</option>
                                    <option value="无">无</option>
                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" id="overseasStudyExperience" name="overseasStudyExperience" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="有">
                            </div>
                            <div class="col-item">
                                <input type="text" id="remark" name="remark" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="硕士学历">
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
                                <input type="text"id="officePhone" name="officePhone" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="col-item">
                                <input type="text" id="faxNumber" name="faxNumber" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                            <div class="col-item lang">
                                <input type="text"  id="postalAddress" name="postalAddress" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
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
                                <input type="number"  id="mobilePhone" name="mobilePhone" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item">
                                <input type="email" id="emailAddress" name="emailAddress" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
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
                                <input type="text" id="relationshipOne" name=relationshipOne"" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item">
                                <input type="text" id="emergencyContactOne" name="emergencyContactOne" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">姓名</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item ">
                                <input type="text" id="nameOne" name="nameOne" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
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
                                <input type="text" id="relationshipTwo" name="relationshipTwo" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                            <div class="col-item">
                                <input type="text" id="emergencyContactTwo" name="emergencyContactTwo" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">姓名</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item ">
                                <input type="text" id="nameTwo" name="nameTwo" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  >
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit">
                            家庭/社会关系
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-left: 30px;">
                            <div>
                                <div class="label">姓名</div>
                            </div>
                            <div>
                                <div class="label">性别</div>
                            </div>
                            <div>
                                <div class="label">出生年月</div>
                            </div>
                            <div>
                                <div class="label">工作单位</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="李XX">
                            </div>

                            <div class="col-item edit">
                                <select name="sex" lay-verify="">
                                    <option value=""></option>
                                    <option value="男" selected>男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="男">
                            </div>

                            <div class="col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>

                            <div class="col-item lang">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="中国环境科学研究院">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">联系电话</div>
                            </div>
                            <div>
                                <div class="label">关系类型</div>
                            </div>
                            <div>
                                <div class="label">关系</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="number" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="15321212387">
                            </div>

                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="家庭成员">家庭成员</option>
                                            <option value="社会关系" selected>社会关系</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="社会关系">
                            </div>

                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="同事">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit">
                            <!-- 家庭/社会关系 -->
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-left: 30px;">
                            <div>
                                <div class="label">姓名</div>
                            </div>
                            <div>
                                <div class="label">性别</div>
                            </div>
                            <div>
                                <div class="label">出生年月</div>
                            </div>
                            <div>
                                <div class="label">工作单位</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="李XX">
                            </div>

                            <div class="col-item edit">
                                <select name="sex" lay-verify="">
                                        <option value=""></option>
                                        <option value="男" selected>男</option>
                                        <option value="女">女</option>
                                    </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="男">
                            </div>

                            <div class="col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>

                            <div class="col-item lang">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="中国环境科学研究院">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">联系电话</div>
                            </div>
                            <div>
                                <div class="label">关系类型</div>
                            </div>
                            <div>
                                <div class="label">关系</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="number" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="15321212387">
                            </div>

                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="家庭成员">家庭成员</option>
                                                <option value="社会关系" selected>社会关系</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="社会关系">
                            </div>

                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="同事">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <span class="typeName">教育经历</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-left: 30px;">
                            <div>
                                <div class="label">院校</div>
                            </div>
                            <div>
                                <div class="label">专业</div>
                            </div>
                            <div>
                                <div class="label">培养方式</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="北京大学">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="计算机">
                            </div>
                            <div class="col-item lang">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXXX">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">学历</div>
                            </div>
                            <div>
                                <div class="label">学位</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                            <option value=""></option>
                                            <option value="学士" selected>学士</option>
                                            <option value="博士">博士</option>
                                            <option value="硕士">硕士</option>
                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="学士" selected>学士</option>
                                                <option value="博士">博士</option>
                                                <option value="硕士">硕士</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-left: 30px;">
                            <div>
                                <div class="label">院校</div>
                            </div>
                            <div>
                                <div class="label">专业</div>
                            </div>
                            <div>
                                <div class="label">培养方式</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="北京大学">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="计算机">
                            </div>
                            <div class="col-item lang">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXXX">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">学历</div>
                            </div>
                            <div>
                                <div class="label">学位</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="学士" selected>学士</option>
                                                <option value="博士">博士</option>
                                                <option value="硕士">硕士</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="学士" selected>学士</option>
                                                    <option value="博士">博士</option>
                                                    <option value="硕士">硕士</option>
                                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="学士">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <span class="typeName">工作经历</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-left: 30px;">
                            <div>
                                <div class="label">工作单位</div>
                            </div>
                            <div>
                                <div class="label">工作部门</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="中国环境科学研究院">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="人事部">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">职务职称</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="人事部">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-left: 30px;">
                            <div>
                                <div class="label">工作单位</div>
                            </div>
                            <div>
                                <div class="label">工作部门</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="中国环境科学研究院">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="人事部">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">职务职称</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="人事部">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <span class="typeName">社团兼职</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">团队/机构名称</div>
                            </div>
                            <div>
                                <div class="label">协会职务</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="红十字">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="校红十字">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">团队/机构名称</div>
                            </div>
                            <div>
                                <div class="label">协会职务</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="红十字">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="校红十字">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <span class="typeName">荣誉称号</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">荣誉称号</div>
                            </div>
                            <div>
                                <div class="label">颁发单位</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">称号级别</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">荣誉称号</div>
                            </div>
                            <div>
                                <div class="label">颁发单位</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">称号级别</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <span class="typeName">获奖情况</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">项目名称</div>
                            </div>
                            <div>
                                <div class="label">获奖等级</div>
                            </div>
                            <div>
                                <div class="label">奖励层次</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="一等奖">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                        <option value=""></option>
                                                        <option value="国家级" selected>国家级</option>
                                                        <option value="省级">省级</option>
                                                    </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="国家级">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">排名</div>
                            </div>
                            <div>
                                <div class="label">奖励类别</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="第四">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="表彰">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">项目名称</div>
                            </div>
                            <div>
                                <div class="label">获奖等级</div>
                            </div>
                            <div>
                                <div class="label">奖励层次</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="XXX">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="一等奖">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                            <option value=""></option>
                                                            <option value="国家级" selected>国家级</option>
                                                            <option value="省级">省级</option>
                                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="国家级">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">排名</div>
                            </div>
                            <div>
                                <div class="label">奖励类别</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="第四">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="表彰">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <span class="typeName">出版著</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">书名</div>
                            </div>
                            <div>
                                <div class="label">出版社</div>
                            </div>
                            <div>
                                <div class="label">排名</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="《后台管理系统》">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="清华大学出版社">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="23">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">著作类型</div>
                            </div>
                            <div>
                                <div class="label">撰写章节</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                        <option value=""></option>
                                                        <option value="著作" selected>著作</option>
                                                        <option value="编著">编著</option>
                                                        <option value="译著">译著</option>
                                                        <option value="独著">独著</option>
                                                        <option value="合著">合著</option>
                                                        <option value="其他">其他</option>
                                                    </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="著作">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="第三章">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">书名</div>
                            </div>
                            <div>
                                <div class="label">出版社</div>
                            </div>
                            <div>
                                <div class="label">排名</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="《后台管理系统》">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="清华大学出版社">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="23">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">著作类型</div>
                            </div>
                            <div>
                                <div class="label">撰写章节</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                            <option value=""></option>
                                                            <option value="著作" selected>著作</option>
                                                            <option value="编著">编著</option>
                                                            <option value="译著">译著</option>
                                                            <option value="独著">独著</option>
                                                            <option value="合著">合著</option>
                                                            <option value="其他">其他</option>
                                                        </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="著作">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="第三章">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <span class="typeName">专利</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">专利名称</div>
                            </div>
                            <div>
                                <div class="label">专利号</div>
                            </div>
                            <div>
                                <div class="label">排名</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="专利A">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="BA123fsf113">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="第四名">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">专利类型</div>
                            </div>
                            <div>
                                <div class="label">是否转让</div>
                            </div>
                            <div>
                                <div class="label">转让金额</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="发明专利" selected>发明专利</option>
                                                <option value="使用新型专利">使用新型专利</option>
                                                <option value="外观设计专利">外观设计专利</option>
                                                <option value="国际专利">国际专利</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="发明专利">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="是" selected>是</option>
                                                <option value="否">否</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="是">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="234元">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">专利名称</div>
                            </div>
                            <div>
                                <div class="label">专利号</div>
                            </div>
                            <div>
                                <div class="label">排名</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="专利A">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="BA123fsf113">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="第四名">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">专利类型</div>
                            </div>
                            <div>
                                <div class="label">是否转让</div>
                            </div>
                            <div>
                                <div class="label">转让金额</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="发明专利" selected>发明专利</option>
                                                    <option value="使用新型专利">使用新型专利</option>
                                                    <option value="外观设计专利">外观设计专利</option>
                                                    <option value="国际专利">国际专利</option>
                                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="发明专利">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="是" selected>是</option>
                                                    <option value="否">否</option>
                                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="是">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="234元">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <span class="typeName">项目经历</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">项目名称</div>
                            </div>
                            <div>
                                <div class="label">课题/专项类别</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="项目A">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="一类" selected>一类</option>
                                                <option value="二类">二类</option>
                                                <option value="三类">三类</option>
                                                <option value="四类">四类</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="一类">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">经费</div>
                            </div>
                            <div>
                                <div class="label">担任角色</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="234元">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="开发人员">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                            <div style="text-align: center;">至</div>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">项目名称</div>
                            </div>
                            <div>
                                <div class="label">课题/专项类别</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="项目A">
                            </div>
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="一类" selected>一类</option>
                                                    <option value="二类">二类</option>
                                                    <option value="三类">三类</option>
                                                    <option value="四类">四类</option>
                                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="一类">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">经费</div>
                            </div>
                            <div>
                                <div class="label">担任角色</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="234元">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="开发人员">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <span class="typeName">技术变革</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">成果名称</div>
                            </div>
                            <div>
                                <div class="label">发布/采纳部门</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="专利A">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="BA123fsf113">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">发布/采纳形式</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                <option value=""></option>
                                                <option value="国家标准" selected>国家标准</option>
                                                <option value="行业标准">行业标准</option>
                                                <option value="技术规范与指南">技术规范与指南</option>
                                                <option value="技术政策">技术政策</option>
                                                <option value="部委公告" selected>部委公告</option>
                                                <option value="行业年报">行业年报</option>
                                                <option value="其他">其他</option>
                                            </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="国家标准">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">成果名称</div>
                            </div>
                            <div>
                                <div class="label">发布/采纳部门</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="专利A">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="BA123fsf113">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">发布/采纳形式</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item edit">
                                <select name="" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="国家标准" selected>国家标准</option>
                                                    <option value="行业标准">行业标准</option>
                                                    <option value="技术规范与指南">技术规范与指南</option>
                                                    <option value="技术政策">技术政策</option>
                                                    <option value="部委公告" selected>部委公告</option>
                                                    <option value="行业年报">行业年报</option>
                                                    <option value="其他">其他</option>
                                                </select>
                            </div>
                            <div class="col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="国家标准">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <span class="typeName">人才培养计划</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">计划名称</div>
                            </div>
                            <div>
                                <div class="label">人才层次</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="人事管理系统">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="三层">
                            </div>
                        </div>

                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;width: 140px;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018-06">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018-06">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">计划名称</div>
                            </div>
                            <div>
                                <div class="label">人才层次</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="人事管理系统">
                            </div>
                            <div class="col-item">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="三层">
                            </div>
                        </div>

                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <span class="typeName">年度考核</span>
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">考核年度</div>
                            </div>
                            <div>
                                <div class="label">第一季度等级</div>
                            </div>
                            <div>
                                <div class="label">第三季度等级</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                <option value=""></option>
                                                <option value="优" selected>优</option>
                                                <option value="良">良</option>
                                                <option value="合格">合格</option>
                                                <option value="不合格">不合格</option>
                                            </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                <option value=""></option>
                                                <option value="优" selected>优</option>
                                                <option value="良">良</option>
                                                <option value="合格">合格</option>
                                                <option value="不合格">不合格</option>
                                            </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">年度考核等级</div>
                            </div>
                            <div>
                                <div class="label">第二季度等级</div>
                            </div>
                            <div>
                                <div class="label">第四季度等级</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                                <option value=""></option>
                                                                <option value="优" selected>优</option>
                                                                <option value="良">良</option>
                                                                <option value="合格">合格</option>
                                                                <option value="不合格">不合格</option>
                                                            </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                        <option value=""></option>
                                                        <option value="优" selected>优</option>
                                                        <option value="良">良</option>
                                                        <option value="合格">合格</option>
                                                        <option value="不合格">不合格</option>
                                                    </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                        <option value=""></option>
                                                        <option value="优" selected>优</option>
                                                        <option value="良">良</option>
                                                        <option value="合格">合格</option>
                                                        <option value="不合格">不合格</option>
                                                    </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                        </div>
                    </div>

                    <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"  value="2018">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018">
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md1" style="margin-right: 20px;margin-left: 30px;">
                            <div>
                                <div class="label">考核年度</div>
                            </div>
                            <div>
                                <div class="label">第一季度等级</div>
                            </div>
                            <div>
                                <div class="label">第三季度等级</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-input-inline col-item edit">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input"   value="2018">
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="2018">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="优" selected>优</option>
                                                    <option value="良">良</option>
                                                    <option value="合格">合格</option>
                                                    <option value="不合格">不合格</option>
                                                </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                    <option value=""></option>
                                                    <option value="优" selected>优</option>
                                                    <option value="良">良</option>
                                                    <option value="合格">合格</option>
                                                    <option value="不合格">不合格</option>
                                                </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                        </div>
                        <div class="layui-col-md1" style="margin-right: 20px;">
                            <div>
                                <div class="label">年度考核等级</div>
                            </div>
                            <div>
                                <div class="label">第二季度等级</div>
                            </div>
                            <div>
                                <div class="label">第四季度等级</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                                    <option value=""></option>
                                                                    <option value="优" selected>优</option>
                                                                    <option value="良">良</option>
                                                                    <option value="合格">合格</option>
                                                                    <option value="不合格">不合格</option>
                                                                </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                            <option value=""></option>
                                                            <option value="优" selected>优</option>
                                                            <option value="良">良</option>
                                                            <option value="合格">合格</option>
                                                            <option value="不合格">不合格</option>
                                                        </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                            <div class="layui-input-inline col-item edit">
                                <select name="sex" lay-verify="">
                                                            <option value=""></option>
                                                            <option value="优" selected>优</option>
                                                            <option value="良">良</option>
                                                            <option value="合格">合格</option>
                                                            <option value="不合格">不合格</option>
                                                        </select>
                            </div>
                            <div class="layui-input-inline col-item save">
                                <input type="text" name="" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" value="优">
                            </div>
                        </div>
                    </div>

                    <!-- <div class="layui-row row-two">
                        <div class="layui-col-md1 tit" style="margin-top: 0;">
                            <span class="typeName">自我评价</span>
                        </div>
                        <div class="line"></div>
                        <div class="layui-col-md6" style="margin-left: 30px;">
                            <textarea style="width:100%;" class="layui-textarea readonly lay-col-md10" name="" id="" readonly>假大空剑荡四方理科生的房间开了</textarea>
                        </div>
                    </div> -->


                </form>
            </div>
        </div>

    </div>

        <script>
            $(function () {
                $(".layui-input").addClass("readonly");
                $(".layui-input").attr("readonly", "readonly");
                // $(".search-input").removeAttr("readonly");
                $(".list-input").removeAttr("readonly");
                $(".list-input").removeClass("readonly");
                layui.use(['form', 'laydate'], function () {
                    var form = layui.form;
                    var laydate = layui.laydate;
                    $(".back").click(function () {

                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭


                    })

                });
                var userId = jo.getDefVal(jo.getUrlParam("id"), loginUser.id);
                var auditData = jo.postAjax("pms/pmspreview/getPmsUserById",{"id":userId});
                // alert( auditData.data[0].id);
                $("#userName").val( auditData.data[0].userName);
                $("#oldName").val( auditData.data[0].oldName);
                $("#placeOfOrigin").val( auditData.data[0].placeOfOrigin);
                $("#deptNames").val( auditData.data[0].deptNames);
                $("#sex").val( auditData.data[0].sex);
                $("#nation").val( auditData.data[0].nation);
                $("#placeOfBirth").val( auditData.data[0].placeOfBirth);
                $("#politicalOutlook").val( auditData.data[0].politicalOutlook);
                $("#station").val( auditData.data[0].station);
                $("#takeWork").val( auditData.data[0].takeWork);
                $("#maritalStatus").val( auditData.data[0].maritalStatus);
                $("#birth").val( auditData.data[0].birth);
                $("#idCard").val( auditData.data[0].idCard);
                $("#workStartTime").val( auditData.data[0].workStartTime);
                $("#joinPartyTime").val( auditData.data[0].joinPartyTime);
                $("#toThereTime").val( auditData.data[0].toThereTime);
                //工作信息
                $("#technicalPosition").val( auditData.data[0].technicalPosition);
                $("#technicalLevel").val( auditData.data[0].technicalLevel);
                $("#administrativeDuty").val( auditData.data[0].administrativeDuty);
                $("#administrativeLevel").val( auditData.data[0].administrativeLevel);
                $("#researchFieldDetail").val( auditData.data[0].researchFieldDetail);
                $("#getTime").val( auditData.data[0].getTime);
                $("#appointmentTime").val( auditData.data[0].appointmentTime);
                $("#tenureTime").val( auditData.data[0].tenureTime);
                $("#researchField").val( auditData.data[0].researchField);
                $("#tempWorkExperience").val( auditData.data[0].tempWorkExperience);


                //学历信息
                $("#highestEducationList").val( auditData.data[0].highestEducationList);
                $("#jobEducationList").val( auditData.data[0].jobEducationList);
                $("#specialty").val( auditData.data[0].specialty);
                $("#englishLevel").val( auditData.data[0].englishLevel);
                $("#highestDegree").val( auditData.data[0].highestDegree);
                $("#jobDegree").val( auditData.data[0].jobDegree);
                $("#overseasStudyExperience").val( auditData.data[0].overseasStudyExperience);
                $("#remark").val( auditData.data[0].remark);

                //    个人通讯信息
                $("#officePhone").val( auditData.data[0].communication.officePhone);
                $("#faxNumber").val( auditData.data[0].communication.faxNumber);
                $("#postalAddress").val( auditData.data[0].communication.postalAddress);
                $("#mobilePhone").val( auditData.data[0].communication.mobilePhone);
                $("#emailAddress").val( auditData.data[0].communication.emailAddress);

            //紧急联系人1
                $("#relationshipOne").val( auditData.data[0].communication.relationshipOne);
                $("#nameOne").val( auditData.data[0].communication.nameOne);
                $("#emergencyContactOne").val( auditData.data[0].communication.nameOne);

            //紧急联系人2
                $("#relationshipTwo").val( auditData.data[0].communication.relationshipTwo);
                $("#nameTwo").val( auditData.data[0].communication.nameTwo);
                $("#emergencyContactTwo").val( auditData.data[0].communication.emergencyContactTwo);



            })
        </script>
</body>

</html>