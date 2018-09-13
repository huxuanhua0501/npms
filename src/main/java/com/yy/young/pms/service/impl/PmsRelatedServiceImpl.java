package com.yy.young.pms.service.impl;

import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.pms.model.PmsUser;
import com.yy.young.pms.service.IPmsRelatedService;
import com.yy.young.pms.util.PmsConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: PmsRelatedServiceImpl
 * @Description: TODO
 * @date 2018-09-13 16:29
 * @versoin 1.0
 **/
@Service("pmsRelatedService")
public class PmsRelatedServiceImpl implements IPmsRelatedService{
    @Resource(name = "dataAccessService")
    IDataAccessService dataAccessService;//数据层服务
    @Override
    public List<String> getEducation(PmsUser obj) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_Related+".selectEducation",obj);
    }

    @Override
    public List selectWork(PmsUser obj) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_Related+".selectWork",obj);
    }

    @Override
    public List selectCommunication(PmsUser obj) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_Related+".selectCommunication",obj);
    }

    @Override
    public List selectPaper(PmsUser obj) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_Related+".selectPaper",obj);
    }

    @Override
    public List selectPublish(PmsUser obj) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_Related+".selectPublish",obj);
    }

    @Override
    public List selectAward(PmsUser obj) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_Related+".selectAward",obj);
    }
}
