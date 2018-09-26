package com.yy.young.pms.service.impl.audit;

import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.pms.model.*;
import com.yy.young.pms.service.IAuditPmsPreviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: AuditPmsPreviewServiceImpl
 * @Description: TODO
 * @date 2018-09-25 10:36
 * @versoin 1.0
 **/
@Service("auditPmsPreviewService")
public class AuditPmsPreviewServiceImpl implements IAuditPmsPreviewService {
    @Resource(name = "auditDataAccessService")
    IDataAccessService dataAccessService;//数据层服务
    private static final String MAPPER = "com.yy.young.pms.mapper.auditRecordBaseinfo";//mapper的namespace
    private static final String MAPPERCommunication = "com.yy.young.pms.mapper.auditRecordCommunication";//mapper的namespace
    private static final String MAPPERRelations = "com.yy.young.pms.mapper.auditPmsRelations";//mapper的namespace
    private static final String MAPPEREducation = "com.yy.young.pms.mapper.auditPmsEducation";//mapper的namespace
    private static final String MAPPERWork = "com.yy.young.pms.mapper.auditPmsWork";//mapper的namespace
    private static final String MAPPERMainTechGroup = "com.yy.young.pms.mapper.auditPmsMainTechGroup";//mapper的namespace
    private static final String MAPPERHonorTitle = "com.yy.young.pms.mapper.auditPmsHonorTitle";//mapper的namespace
    private static final String MAPPERTechAwards = "com.yy.young.pms.mapper.auditPmsTechAwards";//mapper的namespace
    private static final String MAPPERPaper = "com.yy.young.pms.mapper.auditPmsPaper";//mapper的namespace
    private static final String MAPPERPublish = "com.yy.young.pms.mapper.auditPmsPublish";//mapper的namespace
    private static final String MAPPERPatent = "com.yy.young.pms.mapper.auditPmsPatent";//mapper的namespace
    private static final String MAPPERJoinProject = "com.yy.young.pms.mapper.auditPmsJoinProject";//mapper的namespace
    private static final String MAPPERTechnologyBrace = "com.yy.young.pms.mapper.auditPmsTechnologyBrace";//mapper的namespace
    private static final String MAPPERSupportProject = "com.yy.young.pms.mapper.auditPmsSupportProject";//mapper的namespace
    private static final String MAPPERYearCheck = "com.yy.young.pms.mapper.auditPmsYearCheck";//mapper的namespace


    /**
     * 获取基本信息
     * @param obj
     * @return
     * @throws Exception
     */
    public List<AuditRecordBaseinfo> getBashinfoList(AuditRecordBaseinfo obj) throws Exception {
        List<AuditRecordBaseinfo> bashinfoList = dataAccessService.getList(MAPPER + ".getList", obj);
        if (bashinfoList.size() > 0) {
            obj.setItemId(bashinfoList.get(0).getItemId());
        }
        List<AuditRecordBaseinfo> resultBashinfoList = dataAccessService.getList(MAPPER + ".getList", obj);

        return resultBashinfoList;
    }

    /**
     * 获取通讯
     * @param obj
     * @return
     * @throws Exception
     */
    @Override
    public List<AuditRecordCommunication> getCommunicationList(AuditRecordCommunication obj) throws Exception {
        List<AuditRecordCommunication> auditCommunicationList = dataAccessService.getList(MAPPERCommunication + ".getList", obj);
        if (auditCommunicationList.size() > 0) {
            obj.setItemId(auditCommunicationList.get(0).getItemId());
        }
        List<AuditRecordCommunication> resultList = dataAccessService.getList(MAPPERCommunication + ".getList", obj);

        return resultList;
    }

    @Override
    public List<AuditPmsRelations> getRelationsList(AuditPmsRelations obj) throws Exception {
        return dataAccessService.getList(MAPPERRelations + ".getList", obj);
    }

    @Override
    public List<AuditPmsEducation> getEducationList(AuditPmsEducation obj) throws Exception {
        return dataAccessService.getList(MAPPEREducation + ".getList", obj);
    }

    @Override
    public List<AuditPmsWork> getWorksList(AuditPmsWork obj) throws Exception {
        return dataAccessService.getList(MAPPERWork + ".getList", obj);
    }

    @Override
    public List<AuditPmsMainTechGroup> getMainTechGroupList(AuditPmsMainTechGroup obj) throws Exception {
        return dataAccessService.getList(MAPPERMainTechGroup + ".getList", obj);
    }

    @Override
    public List<AuditPmsHonorTitle> getHonorTitleList(AuditPmsHonorTitle obj) throws Exception {
        return dataAccessService.getList(MAPPERHonorTitle + ".getList", obj);
    }

    @Override
    public List<AuditPmsTechAwards> getTechAwardsList(AuditPmsTechAwards obj) throws Exception {
        return dataAccessService.getList(MAPPERTechAwards + ".getList", obj);
    }

    @Override
    public List<AuditPmsPaper> getPaperList(AuditPmsPaper obj) throws Exception {
        return dataAccessService.getList(MAPPERPaper + ".getList", obj);
    }

    @Override
    public List<AuditPmsPublish> getPublishList(AuditPmsPublish obj) throws Exception {
        return dataAccessService.getList(MAPPERPublish + ".getList", obj);
    }

    @Override
    public List<AuditPmsPatent> getPatentList(AuditPmsPatent obj) throws Exception {

        return dataAccessService.getList(MAPPERPatent + ".getList", obj);
    }

    @Override
    public List<AuditPmsJoinProject> getJoinProjectList(AuditPmsJoinProject obj) throws Exception {
        return dataAccessService.getList(MAPPERJoinProject + ".getList", obj);
    }

    @Override
    public List<AuditPmsTechnologyBrace> getTechnologyBraceList(AuditPmsTechnologyBrace obj) throws Exception {
        return dataAccessService.getList(MAPPERTechnologyBrace + ".getList", obj);
    }

    @Override
    public List<AuditPmsSupportProject> getSupportProjectList(AuditPmsSupportProject obj) throws Exception {
        return dataAccessService.getList(MAPPERSupportProject + ".getList", obj);
    }

    @Override
    public List<AuditPmsYearCheck> getYearCheckList(AuditPmsYearCheck obj) throws Exception {
        return dataAccessService.getList(MAPPERYearCheck + ".getList", obj);
    }

}
