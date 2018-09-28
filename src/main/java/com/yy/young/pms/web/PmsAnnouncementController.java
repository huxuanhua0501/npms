package com.yy.young.pms.web;

import com.yy.young.cms.service.ICmsDBService;
import com.yy.young.common.service.ICommonService;
import com.yy.young.common.util.CommonUtil;
import com.yy.young.common.util.DateUtil;
import com.yy.young.common.util.Result;
import com.yy.young.common.util.StringUtils;
import com.yy.young.dal.util.Page;
import com.yy.young.interfaces.log.annotation.Log;
import com.yy.young.interfaces.model.User;
import com.yy.young.pms.model.PmsAnnouncement;
import com.yy.young.pms.model.PmsUser;
import com.yy.young.pms.service.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author mark
 * @ClassName: PmsAnnouncementController
 * @Description: TODO
 * @date 2018-09-11 22:02
 * @versoin 1.0
 **/
@RestController
@RequestMapping("/pms/announcement")
public class PmsAnnouncementController {


    @Resource(name = "pmsUserService")
    ICommonService<PmsUser> pmsUserService;

    @Resource(name="auditFieldService")
    IAuditFieldService auditFieldService;

    @Resource(name="auditShowUserService")
    IAuditShowUserService auditShowUserService;

    @Resource(name="auditPmsCommunicationService")
    IAuditPmsCommunicationService auditPmsCommunicationService;



    @Resource(name="auditPmsEducationService")
    IAuditPmsEducationService auditPmsEducationService;

    @Resource(name="auditPmsHonorTitleService")
    IAuditPmsHonorTitleService auditPmsHonorTitleService;

    @Resource(name="auditPmsJoinProjectService")
    IAuditPmsJoinProjectService auditPmsJoinProjectService;

    @Resource(name="auditPmsLeaderEvaluationService")
    IAuditPmsLeaderEvaluationService auditPmsLeaderEvaluationService;

    @Resource(name="auditPmsMainTechGroupService")
    IAuditPmsMainTechGroupService auditPmsMainTechGroupService;

    @Resource(name="auditPmsPaperService")
    IAuditPmsPaperService auditPmsPaperService;

    @Resource(name="auditPmsPatentService")
    IAuditPmsPatentService auditPmsPatentService;

    @Resource(name="auditPmsPublishService")
    IAuditPmsPublishService auditPmsPublishService;

    @Resource(name="auditPmsRelationsService")
    IAuditPmsRelationsService auditPmsRelationsService;

    @Resource(name="auditPmsSelfEvaluationService")
    IAuditPmsSelfEvaluationService auditPmsSelfEvaluationService;

    @Resource(name="auditPmsSupportProjectService")
    IAuditPmsSupportProjectService auditPmsSupportProjectService;

    @Resource(name="auditPmsTechAwardsService")
    IAuditPmsTechAwardsService auditPmsTechAwardsService;

    @Resource(name="auditPmsTechnologyBraceService")
    IAuditPmsTechnologyBraceService auditPmsTechnologyBraceService;

    @Resource(name="auditPmsWorkService")
    IAuditPmsWorkService auditPmsWorkService;

    @Resource(name="auditPmsYearCheckService")
    IAuditPmsYearCheckService auditPmsYearCheckService;

    @Resource(name = "cmsDBService")
    ICmsDBService cmsDBService;

    @Resource(name="auditFieldCommuService")
    IAuditFieldCommuService auditFieldCommuService;

    @Resource(name="auditFieldBaseService")
    IAuditFieldBaseService auditFieldBaseService;

    @Resource(name="auditRecordCommunicationService")
    IAuditRecordCommunicationService auditRecordCommunicationService;

    @Resource(name="auditRecordBaseinfoService")
    IAuditRecordBaseinfoService auditRecordBaseinfoService;
    @Resource(name = "pmsAnnouncementService")
    IPmsAnnouncementService service;
   /* @Resource(name = "pmsWebsiteService")
    ICommonService<PmsWebsite> pmsWebsiteService;*/

    @RequestMapping("/insert")
    public Object insert(PmsAnnouncement pmsAnnouncement, HttpServletRequest request) throws Exception {
        Result rs = new Result();
        if(pmsAnnouncement == null){
            rs.setInfo("参数不正确！");
            rs.setCode(-1);
            rs.setData_id("createName");
            return rs;
        }
        User user = CommonUtil.getLoginUser(request);
        pmsAnnouncement.setUserId(user.getId());
        pmsAnnouncement.setSystemTime(new Date());
        String createName = pmsAnnouncement.getCreateName();
        String createTime = pmsAnnouncement.getCreateTime();
        if(StringUtils.isBlank(createName)){
            pmsAnnouncement.setCreateName(user.getName());
        }
        if(StringUtils.isBlank(createTime)){
            pmsAnnouncement.setCreateTime(DateUtil.getCurrentTime());
        }else{
            Date tmp = DateUtil.toDate(createTime,"yyyy-MM-dd HH:mm:ss");
            Date tmp1 = DateUtil.toDate(createTime,"yyyy-MM-dd");
            if(tmp == null && tmp1 == null){
                rs.setInfo("时间格式不正确！正确格式：2018-09-09");
                rs.setCode(-1);
                rs.setData_id("createTime");
                return rs;
            }
        }
        service.insert(pmsAnnouncement);
        return new Result();
    }
    @RequestMapping("/update")
    public Object update(PmsAnnouncement pmsAnnouncement, HttpServletRequest request) throws Exception {
        Result rs = new Result();
        if(pmsAnnouncement == null){
            rs.setInfo("参数不正确！");
            rs.setCode(-1);
            rs.setData_id("createName");
            return rs;
        }
        User user = CommonUtil.getLoginUser(request);
        pmsAnnouncement.setUserId(user.getId());
        pmsAnnouncement.setSystemTime(new Date());
        String createName = pmsAnnouncement.getCreateName();
        String createTime = pmsAnnouncement.getCreateTime();
        if(StringUtils.isBlank(createName)){
            pmsAnnouncement.setCreateName(user.getName());
        }
        if(StringUtils.isBlank(createTime)){
            pmsAnnouncement.setCreateTime(DateUtil.getCurrentTime());
        }else{
            Date tmp = DateUtil.toDate(createTime,"yyyy-MM-dd HH:mm:ss");
            Date tmp1 = DateUtil.toDate(createTime,"yyyy-MM-dd");
            if(tmp == null && tmp1 == null){
                rs.setInfo("时间格式不正确！正确格式：2018-09-09");
                rs.setCode(-1);
                rs.setData_id("createTime");
                return rs;
            }
        }
        service.update(pmsAnnouncement);
        return rs;
    }
    @RequestMapping("/delete")
    public Object delete(String ids, String id, HttpServletRequest request) throws Exception {
        Result result = new Result();
        if(StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            service.delete(idArr);
        }else if(StringUtils.isNotBlank(id)){
            service.delete(id);
        }else{
            result.setCode(-1);
            result.setInfo("删除失败:待删除编号无效!");
        }
        return result;
    }
   @RequestMapping("/get")
    public Object get(String   id, HttpServletRequest request) throws Exception {
//        obj.setId(obj.getId().replaceAll(",",""));
        PmsAnnouncement obj =  service.get(id);
        return new Result(obj);
    }
    @RequestMapping("/getMax")
    public Object getMaxNum(HttpServletRequest request) throws  Exception{

            PmsAnnouncement obj = service.getMaxNum();
            return new Result(obj);
    }
    /**
     * 获取分页数据
     * @param obj
     * @param request
     * @return
     * @throws Exception
     */
    @Log("分页查询xxx列表")
    @RequestMapping("/getPage")
    @ResponseBody
    public Object getPage(PmsAnnouncement obj, HttpServletRequest request) throws Exception{
        Page page = CommonUtil.getPageFromRequest(request);
        //关键字搜索
        String content = request.getParameter("content");
        if(StringUtils.isNotBlank(content)){
            obj = new PmsAnnouncement();
            obj.setContent(content);
        }
        List<PmsAnnouncement> list = service.getPage(obj, page);
        page.setData(list);
        return page;
    }

}
