package com.yy.young.pms.service.impl;

import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.PmsUser;
import com.yy.young.pms.service.IAuditModuleService;
import com.yy.young.pms.util.PmsConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: AuditModuleServiceImpl
 * @Description: TODO
 * @date 2018-09-18 13:53
 * @versoin 1.0
 **/
@Service("auditModuleService")
public class AuditModuleServiceImpl implements IAuditModuleService{
    @Resource(name = "dataAccessService")
    IDataAccessService dataAccessService;//数据层服务

    @Override
    public List<PmsUser> getPage(PmsUser pmsUser, Page page) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_AUDITMODULE + ".getnewPmsUserList", pmsUser, page);
    }


}
