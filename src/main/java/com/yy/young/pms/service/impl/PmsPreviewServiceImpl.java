package com.yy.young.pms.service.impl;

import com.yy.young.common.util.StringUtils;
import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.Communication;
import com.yy.young.pms.model.PmsCollectWork;
import com.yy.young.pms.model.PmsUser;
import com.yy.young.pms.service.IPmsPreviewService;
import com.yy.young.pms.util.PmsConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

/**
 * @author hu_xuanhua_hua
 * @ClassName: PmsPreviewServiceImpl
 * @Description: TODO
 * @date 2018-09-19 19:21
 * @versoin 1.0
 **/
@Service("pmsPreviewService")
public class PmsPreviewServiceImpl implements IPmsPreviewService {
    @Resource(name = "dataAccessService")
    IDataAccessService dataAccessService;//数据层服务
    @Override
    public PmsUser getPmsUserById(String id) throws Exception {

        return (PmsUser)dataAccessService.getObject(PmsConstants.MAPPER.PMS_USER + ".getPmsUserById", id);
    }

    @Override
    public List<Map<String, Object>> getNoDeptUser( Map<String, Object> parameter,Page page) throws Exception {
        return  dataAccessService.getList(PmsConstants.MAPPER.PMS_USER + ".getNoDeptUser",parameter,page);
    }

    @Override
    public Communication getCommunicationById(String id) throws Exception {
        return (Communication)dataAccessService.getObject(PmsConstants.MAPPER.PMS_COMMUNICATION + ".getCommunicationById", id);
    }

    @Override
    public Map<String,Object> getWorksCollection(String id) throws Exception {
        return (Map<String, Object>) dataAccessService.getObject(PmsConstants.MAPPER.PMS_WORK + ".getWorksCollection", id);
    }

    @Override
    public Map<String, Object> EducationnCollectionMap(String id) throws Exception {
        return (Map<String, Object>) dataAccessService.getObject(PmsConstants.MAPPER.PMS_WORK + ".EducationnCollectionMap", id);
    }
}
