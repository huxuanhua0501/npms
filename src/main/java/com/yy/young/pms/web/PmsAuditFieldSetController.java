package com.yy.young.pms.web;

import com.yy.young.cms.service.ICmsDBService;
import com.yy.young.common.service.ICommonService;
import com.yy.young.common.util.*;
import com.yy.young.dal.util.Page;
import com.yy.young.interfaces.log.annotation.Log;
import com.yy.young.interfaces.model.User;
import com.yy.young.pms.model.AuditFieldSet;
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
 * @ClassName: PmsAuditFieldSetController
 * @Description: TODO
 * @date 2018-09-11 22:02
 * @versoin 1.0
 **/
@RestController
@RequestMapping("/pms/auditFieldSet")
public class PmsAuditFieldSetController {

    @Resource(name="auditFieldSetService")
    IAuditFieldSetService auditFieldSetService;

    @RequestMapping("/update")
    public Object update(String list, HttpServletRequest request) throws Exception {
        Result rs = new Result();
        if(StringUtils.isBlank(list)){
            rs.setInfo("设置失败");
            rs.setCode(-1);
            return  rs;
        }
        List<AuditFieldSet> auditFieldSets = CommonJsonUtil.jsonStrArrToBeanList(list,AuditFieldSet.class);
        auditFieldSetService.batchInsert(auditFieldSets);
        return rs;
    }
    /**
     * 查询审核设置表
     * @param request
     * @return
     * @throws Exception
     */
    @Log("获取全部审核设置信息")
    @RequestMapping("/getList")
    @ResponseBody
    public Object getList(HttpServletRequest request) throws Exception{

        List<AuditFieldSet> list = auditFieldSetService.getList(new AuditFieldSet());

        return new Result(list);
    }

}
