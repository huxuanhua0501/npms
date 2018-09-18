package com.yy.young.pms.service.impl.audit;

import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.pms.service.IExamineService;
import com.yy.young.pms.util.PmsConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: ExamineServiceImpl
 * @Description: TODO
 * @date 2018-09-18 16:28
 * @versoin 1.0
 **/
@Service("examineService")
public class ExamineServiceImpl implements IExamineService {
    @Resource(name = "auditDataAccessService")
    IDataAccessService dataAccessService;//数据层服务

    @Override
    public List<String> getBashinfoUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getBashinfoUserIdList", state);
    }

    @Override
    public List<String> getCommunicationoUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getCommunicationoUserIdList", state);
    }

    @Override
    public List<String> getRelationshipUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getRelationshipUserIdList", state);
    }

    @Override
    public List<String> getEducationUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getEducationUserIdList", state);
    }

    @Override
    public List<String> getWorkUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getWorkUserIdList", state);
    }

    @Override
    public List<String> getAssociationkUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getAssociationkUserIdList", state);
    }

    @Override
    public List<String> getHonorUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getHonorUserIdList", state);
    }

    @Override
    public List<String> getAwardUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getAwardUserIdList", state);
    }

    @Override
    public List<String> getPaperUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getPaperUserIdList", state);
    }

    @Override
    public List<String> getPublishUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getPublishUserIdList", state);
    }

    @Override
    public List<String> getPatentUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getPatentUserIdList", state);
    }

    @Override
    public List<String> getProjectUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getProjectUserIdList", state);
    }

    @Override
    public List<String> getTechnologyUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getTechnologyUserIdList", state);
    }

    @Override
    public List<String> getPersonnelUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getPersonnelUserIdList", state);
    }

    @Override
    public List<String> getAssessmentUserIdList(String state) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_EXAMINE + ".getAssessmentUserIdList", state);
    }
}
