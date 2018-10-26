package com.yy.young.pms.service;

import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.AuditFieldSet;
import com.yy.young.pms.model.PmsAnnouncement;

import java.util.List;

/**
 * @author mark
 * @ClassName: IAuditFieldSetService
 * @Description: 审核设置service
 * @date 2018-09-11 19:16
 * @versoin 1.0
 **/
public interface IAuditFieldSetService {
    public List<AuditFieldSet> getList(AuditFieldSet auditFieldSet) throws Exception;

    public int batchInsert(List<AuditFieldSet> list) throws Exception;
}
