package com.yy.young.pms.service.impl.audit;

import com.yy.young.common.util.CommonUtil;
import com.yy.young.common.util.StringUtils;
import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.AuditField;
import com.yy.young.pms.model.AuditFieldSet;
import com.yy.young.pms.model.PmsAnnouncement;
import com.yy.young.pms.service.IAuditFieldSetService;
import com.yy.young.pms.service.IPmsAnnouncementService;
import com.yy.young.pms.util.PmsConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mark
 * @ClassName: AuditFieldSetServiceImpl
 * @Description: TODO
 * @date 2018-09-11 22:17
 * @versoin 1.0
 **/
@Service("auditFieldSetService")
public class AuditFieldSetServiceImpl implements IAuditFieldSetService {
    @Resource(name = "auditDataAccessService")
    IDataAccessService dataAccessService;//数据层服务

    @Override
    public List<AuditFieldSet> getList(AuditFieldSet auditFieldSet) throws Exception{
        return dataAccessService.getList(PmsConstants.MAPPER.AUDIT_FIELD_SET + ".getList", auditFieldSet);
    }
    @Override
    public int batchInsert(List<AuditFieldSet> list) throws Exception {
        int i = 0;
        for (AuditFieldSet auditFieldSet : list) {
            if(StringUtils.isNotBlank(auditFieldSet.getId())){
                i += this.update(auditFieldSet);
            }else{
                i += this.insert(auditFieldSet);
            }
        }
        return i;
    }
    public int update(AuditFieldSet auditFieldSet) throws Exception {
        return dataAccessService.update(PmsConstants.MAPPER.AUDIT_FIELD_SET + ".update", auditFieldSet);
    }

    public int insert(AuditFieldSet auditFieldSet) throws Exception {
        auditFieldSet.setId(CommonUtil.getUUID());
        int result = dataAccessService.insert(PmsConstants.MAPPER.AUDIT_FIELD_SET + ".insert", auditFieldSet);
        return result;
    }

    public AuditFieldSet get(AuditFieldSet auditFieldSet) throws Exception {
        return (AuditFieldSet) dataAccessService.getObject(PmsConstants.MAPPER.AUDIT_FIELD_SET + ".get", auditFieldSet);
    }

}
