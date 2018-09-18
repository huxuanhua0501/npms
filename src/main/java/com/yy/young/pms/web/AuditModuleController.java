package com.yy.young.pms.web;

import com.yy.young.common.util.CommonUtil;
import com.yy.young.dal.util.Page;
import com.yy.young.interfaces.log.annotation.Log;
import com.yy.young.pms.model.AuditPmsUser;
import com.yy.young.pms.model.PmsUser;
import com.yy.young.pms.service.IAuditModuleService;
import com.yy.young.pms.service.IExamineService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: AuditModuleController
 * @Description: TODO
 * @date 2018-09-18 13:45
 * @versoin 1.0
 **/
@Controller
@RequestMapping("/pms/auditModule")
public class AuditModuleController {
    @Resource(name = "auditModuleService")
    IAuditModuleService service;
    @Resource(name = "examineService")
    IExamineService examineService;

    /**
     * 获取分页数据
     *
     * @param obj
     * @param request
     * @return
     * @throws Exception
     */
    @Log("分页查询xxx列表")
    @RequestMapping("/getPage")
    @ResponseBody
    public Object getPage(PmsUser obj, HttpServletRequest request) throws Exception {
        Page page = CommonUtil.getPageFromRequest(request);
        List<String>userIdList = null;
        if (obj.getState()!=""&&obj.getState().equals("bashinfo")) {
            userIdList = examineService.getBashinfoUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("communication")) {
            userIdList = examineService.getCommunicationoUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("relationship")) {
            userIdList = examineService.getRelationshipUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("education")) {
            userIdList = examineService.getEducationUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("work")) {
            userIdList = examineService.getWorkUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("association")) {
            userIdList = examineService.getAssociationkUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("honor")) {
            userIdList = examineService.getHonorUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("award")) {
            userIdList = examineService.getAwardUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("paper")) {
            userIdList = examineService.getPaperUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("publish")) {
            userIdList = examineService.getPublishUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("patent")) {
            userIdList = examineService.getPatentUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("project")) {
            userIdList = examineService.getProjectUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("technology")) {
            userIdList = examineService.getTechnologyUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("personnel")) {
            userIdList = examineService.getPersonnelUserIdList(obj.getState());
        }
        if (obj.getState()!=""&&obj.getState().equals("assessment")) {
            userIdList = examineService.getAssessmentUserIdList(obj.getState());
        }
        obj.setRemarkList(userIdList);
        List<PmsUser> list = service.getPage(obj, page);
        page.setData(list);
        return page;
    }

}
