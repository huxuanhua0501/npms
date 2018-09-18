package com.yy.young.pms.service;

import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.PmsUser;

import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: IAuditModuleService
 * @Description: TODO
 * @date 2018-09-18 13:52
 * @versoin 1.0
 **/
public interface IAuditModuleService {
    List<PmsUser> getPage(PmsUser pmsUser, Page page) throws Exception;
}
