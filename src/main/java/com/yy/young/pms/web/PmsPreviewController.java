package com.yy.young.pms.web;

import com.yy.young.common.util.CommonUtil;
import com.yy.young.common.util.Result;
import com.yy.young.dal.util.Page;
import com.yy.young.interfaces.log.annotation.Log;
import com.yy.young.interfaces.model.User;
import com.yy.young.pms.model.*;
import com.yy.young.pms.service.IAuditPmsPreviewService;
import com.yy.young.pms.service.IPmsPreviewService;
import com.yy.young.pms.util.ExportExcelUtil;
import com.yy.young.ums.service.IUmsDeptUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * @author hu_xuanhua_hua
 * @ClassName: PreviewController
 * @Description: TODO
 * @date 2018-09-19 19:17
 * @versoin 1.0
 **/
@Controller
@RequestMapping("/pms/pmspreview")
public class PmsPreviewController {
    @Resource(name = "pmsPreviewService")
    IPmsPreviewService pmsPreviewService;//数据层服务
    @Resource(name = "auditPmsPreviewService")
    IAuditPmsPreviewService auditPmsPreviewService;//数据层服务
    @Resource(
            name = "umsDeptUserService"
    )
    IUmsDeptUserService umsDeptUserService;

    @Log("分页查询部门用户信息")
    @RequestMapping({"/getDeptUserPage"})
    @ResponseBody
    public Object getDeptUserPage(HttpServletRequest request) throws Exception {
        Map<String, Object> parameter = CommonUtil.getParameterFromRequest(request);
        Page page = CommonUtil.getPageFromRequest(request);
        List<Map<String, Object>> list = null;
        if ("2".equals(parameter.get("noDeptUser"))) {
            list = pmsPreviewService.getNoDeptUser(parameter,page);

        }else{
        list  = this.umsDeptUserService.getDeptUserPage(parameter, page);
        }
        page.setData(list);
        return page;
    }

    @Log("导出xxx")
    @RequestMapping("/exportExcel")
    public void exportExcel(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {

        //基本
        PmsUser pmsUser = pmsPreviewService.getPmsUserById(id);
        AuditRecordBaseinfo auditRecordBaseinfo = new AuditRecordBaseinfo();
        auditRecordBaseinfo.setUserId(id);
        List<AuditRecordBaseinfo> bashinfoList = auditPmsPreviewService.getBashinfoList(auditRecordBaseinfo);
        if (bashinfoList != null && bashinfoList.size() > 0) {
            for (AuditRecordBaseinfo info : bashinfoList) {
                pmsUser = info.toPmsUser(pmsUser);
            }
        }
        User user = CommonUtil.getLoginUser(request);
        if (!(user.getRoleId().equals("1") || user.getRoleId().equals("79a80080f55740f1a1b146af57dfcf27")
                || user.getRoleId().equals("HKY_ADMIN") || user.getRoleId().equals("ROLE_HKY_LEADER"))) {
            pmsUser.setRemark("");
        }
        //通讯
        Communication communication = pmsPreviewService.getCommunicationById(id);
        if (communication == null) {
            communication = new Communication();
        }
        AuditRecordCommunication auditRecordCommunication = new AuditRecordCommunication();
        auditRecordCommunication.setUserId(id);
        List<AuditRecordCommunication> recordCommunicationList = auditPmsPreviewService.getCommunicationList(auditRecordCommunication);
        if (recordCommunicationList != null && recordCommunicationList.size() > 0) {
            for (AuditRecordCommunication info : recordCommunicationList) {
                communication = info.toCommunication(communication);
            }
        }
        //家庭成员和社会关系
        AuditPmsRelations auditPmsRelations = new AuditPmsRelations();
        auditPmsRelations.setUserId(id);
        List<AuditPmsRelations> relationsList = auditPmsPreviewService.getRelationsList(auditPmsRelations);

        //教育经历
        AuditPmsEducation auditPmsEducation = new AuditPmsEducation();
        auditPmsEducation.setUserId(id);
        List<AuditPmsEducation> auditPmsEducationList = auditPmsPreviewService.getEducationList(auditPmsEducation);

        //工作经历
        AuditPmsWork auditPmsWork = new AuditPmsWork();
        auditPmsWork.setUserId(id);
        List<AuditPmsWork> auditPmsWorkList = auditPmsPreviewService.getWorksList(auditPmsWork);

        ExportExcelUtil export = new ExportExcelUtil();

		String srcFilePath = "E:/导出模板.xlsx";
		String fileName =  System.currentTimeMillis() + ".xlsx";
		String desFilePath =  fileName;

		export.exportExcel(srcFilePath,desFilePath,response,pmsUser,auditPmsEducationList,auditPmsWorkList,communication,relationsList);
    }




    @Log("查询单条")
    @RequestMapping({"/getPmsUserById"})
    @ResponseBody
    public Object getPmsUserById(String id, HttpServletRequest request) throws Exception {
        //基本
        PmsUser pmsUser = pmsPreviewService.getPmsUserById(id);
        AuditRecordBaseinfo auditRecordBaseinfo = new AuditRecordBaseinfo();
        auditRecordBaseinfo.setUserId(id);
        List<AuditRecordBaseinfo> bashinfoList = auditPmsPreviewService.getBashinfoList(auditRecordBaseinfo);
        if (bashinfoList != null && bashinfoList.size() > 0) {
            for (AuditRecordBaseinfo info : bashinfoList) {
                pmsUser = info.toPmsUser(pmsUser);
            }
        }
        User user = CommonUtil.getLoginUser(request);
        if (!(user.getRoleId().equals("1") || user.getRoleId().equals("79a80080f55740f1a1b146af57dfcf27")
                || user.getRoleId().equals("HKY_ADMIN") || user.getRoleId().equals("ROLE_HKY_LEADER"))) {
           pmsUser.setRemark("");
        }
        System.err.println(user);


        //通讯
        Communication communication = pmsPreviewService.getCommunicationById(id);
        if (communication == null) {
            communication = new Communication();
        }
        AuditRecordCommunication auditRecordCommunication = new AuditRecordCommunication();
        auditRecordCommunication.setUserId(id);
        List<AuditRecordCommunication> recordCommunicationList = auditPmsPreviewService.getCommunicationList(auditRecordCommunication);
        if (recordCommunicationList != null && recordCommunicationList.size() > 0) {
            for (AuditRecordCommunication info : recordCommunicationList) {
                communication = info.toCommunication(communication);
            }
        }
        //家庭成员和社会关系
        AuditPmsRelations auditPmsRelations = new AuditPmsRelations();
        auditPmsRelations.setUserId(id);
        List<AuditPmsRelations> relationsList = auditPmsPreviewService.getRelationsList(auditPmsRelations);


        //教育经历
        AuditPmsEducation auditPmsEducation = new AuditPmsEducation();
        auditPmsEducation.setUserId(id);
        List<AuditPmsEducation> auditPmsEducationList = auditPmsPreviewService.getEducationList(auditPmsEducation);
        Map<String,Object> EducationnCollectionMap=  pmsPreviewService.EducationnCollectionMap(id);

        //工作经历
        AuditPmsWork auditPmsWork = new AuditPmsWork();
        auditPmsWork.setUserId(id);
        List<AuditPmsWork> auditPmsWorkList = auditPmsPreviewService.getWorksList(auditPmsWork);
        Map<String,Object> worksCollectionMap=  pmsPreviewService.getWorksCollection(id);

        //社团兼职
        AuditPmsMainTechGroup auditPmsMainTechGroup = new AuditPmsMainTechGroup();
        auditPmsMainTechGroup.setUserId(id);
        List<AuditPmsMainTechGroup> mainTechGroupList = auditPmsPreviewService.getMainTechGroupList(auditPmsMainTechGroup);
        //荣誉称号
        AuditPmsHonorTitle auditPmsHonorTitle = new AuditPmsHonorTitle();
        auditPmsHonorTitle.setUserId(id);
        List<AuditPmsHonorTitle> auditPmsHonorTitleList = auditPmsPreviewService.getHonorTitleList(auditPmsHonorTitle);

        //获奖情况
        AuditPmsTechAwards auditPmsTechAwards = new AuditPmsTechAwards();
        auditPmsTechAwards.setUserId(id);
        List<AuditPmsTechAwards> auditPmsTechAwardsList = auditPmsPreviewService.getTechAwardsList(auditPmsTechAwards);
        //论文情况
        AuditPmsPaper auditPmsPaper = new AuditPmsPaper();
        auditPmsPaper.setUserId(id);
        List<AuditPmsPaper> auditPmsPaperList = auditPmsPreviewService.getPaperList(auditPmsPaper);
        //出版情况
        AuditPmsPublish auditPmsPublish = new AuditPmsPublish();
        auditPmsPublish.setUserId(id);
        List<AuditPmsPublish> auditPmsPublishList = auditPmsPreviewService.getPublishList(auditPmsPublish);
        //专利
        AuditPmsPatent auditPmsPatent = new AuditPmsPatent();
        auditPmsPatent.setUserId(id);
        List<AuditPmsPatent> auditPmsPatentList = auditPmsPreviewService.getPatentList(auditPmsPatent);
        //项目经历
        AuditPmsJoinProject auditPmsJoinProject = new AuditPmsJoinProject();
        auditPmsJoinProject.setUserId(id);
        List<AuditPmsJoinProject> auditPmsJoinProjectList = auditPmsPreviewService.getJoinProjectList(auditPmsJoinProject);
        //技术支撑
        AuditPmsTechnologyBrace auditPmsTechnologyBrace = new AuditPmsTechnologyBrace();
        auditPmsTechnologyBrace.setUserId(id);
        List<AuditPmsTechnologyBrace> auditPmsTechnologyBraceList = auditPmsPreviewService.getTechnologyBraceList(auditPmsTechnologyBrace);
        //人力培养计划/资助项目
        AuditPmsSupportProject auditPmsSupportProject = new AuditPmsSupportProject();
        auditPmsSupportProject.setUserId(id);
        List<AuditPmsSupportProject> auditPmsSupportProjectList = auditPmsPreviewService.getSupportProjectList(auditPmsSupportProject);
        //年度考核
        AuditPmsYearCheck auditPmsYearCheck = new AuditPmsYearCheck();
        auditPmsYearCheck.setUserId(id);
        List<AuditPmsYearCheck> auditPmsYearCheckList = auditPmsPreviewService.getYearCheckList(auditPmsYearCheck);
        pmsUser.setCommunication(communication);
        pmsUser.setRelationsList(relationsList);
        pmsUser.setAuditPmsEducationList(auditPmsEducationList);
        pmsUser.setAuditPmsEducationList(auditPmsEducationList);
        pmsUser.setAuditPmsWorkList(auditPmsWorkList);
        pmsUser.setMainTechGroupList(mainTechGroupList);
        pmsUser.setAuditPmsHonorTitleList(auditPmsHonorTitleList);
        pmsUser.setAuditPmsTechAwardsList(auditPmsTechAwardsList);
        pmsUser.setAuditPmsPaperList(auditPmsPaperList);
        pmsUser.setAuditPmsPublishList(auditPmsPublishList);
        pmsUser.setAuditPmsPatentList(auditPmsPatentList);
        pmsUser.setAuditPmsJoinProjectList(auditPmsJoinProjectList);
        pmsUser.setAuditPmsTechnologyBraceList(auditPmsTechnologyBraceList);
        pmsUser.setAuditPmsSupportProjectList(auditPmsSupportProjectList);
        pmsUser.setAuditPmsYearCheckList(auditPmsYearCheckList);
        if (worksCollectionMap != null&&worksCollectionMap.size()>0) {
            pmsUser.setWorkContent(worksCollectionMap.get("content").toString());
        }
        if (EducationnCollectionMap != null&&EducationnCollectionMap.size()>0) {
            pmsUser.setEducationContent(EducationnCollectionMap.get("content").toString());
        }
        return new Result(pmsUser);
    }
}
