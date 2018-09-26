package com.yy.young.pms.service;

import com.yy.young.pms.model.*;

import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: IAuditPmsPreviewService
 * @Description: TODO
 * @date 2018-09-25 10:35
 * @versoin 1.0
 **/
public interface IAuditPmsPreviewService {
    List<AuditRecordBaseinfo> getBashinfoList(AuditRecordBaseinfo obj)throws Exception;
    List<AuditRecordCommunication> getCommunicationList(AuditRecordCommunication obj) throws Exception;
    List<AuditPmsRelations> getRelationsList(AuditPmsRelations obj) throws Exception;
    List<AuditPmsEducation> getEducationList(AuditPmsEducation obj) throws Exception;
    List<AuditPmsWork> getWorksList(AuditPmsWork obj) throws Exception;
    List<AuditPmsMainTechGroup> getMainTechGroupList(AuditPmsMainTechGroup obj) throws Exception;
    List<AuditPmsHonorTitle> getHonorTitleList(AuditPmsHonorTitle obj) throws Exception;
    List<AuditPmsTechAwards> getTechAwardsList(AuditPmsTechAwards obj) throws Exception;
    List<AuditPmsPaper> getPaperList(AuditPmsPaper obj) throws Exception;
    List<AuditPmsPublish> getPublishList(AuditPmsPublish obj) throws Exception;
    List<AuditPmsPatent> getPatentList(AuditPmsPatent obj) throws Exception;
    List<AuditPmsJoinProject> getJoinProjectList(AuditPmsJoinProject obj) throws Exception;
    List<AuditPmsTechnologyBrace> getTechnologyBraceList(AuditPmsTechnologyBrace obj) throws Exception;
    List<AuditPmsSupportProject> getSupportProjectList(AuditPmsSupportProject obj) throws Exception;
    List<AuditPmsYearCheck> getYearCheckList(AuditPmsYearCheck obj) throws Exception;

}
