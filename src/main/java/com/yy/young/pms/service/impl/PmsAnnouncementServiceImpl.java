package com.yy.young.pms.service.impl;

import com.yy.young.common.util.CommonUtil;
import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.PmsAnnouncement;
import com.yy.young.pms.model.PmsWebsite;
import com.yy.young.pms.service.IPmsAnnouncementService;
import com.yy.young.pms.service.IPmsWebsiteService;
import com.yy.young.pms.util.PmsConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mark
 * @ClassName: pmsAnnouncementService
 * @Description: TODO
 * @date 2018-09-11 22:17
 * @versoin 1.0
 **/
@Service("pmsAnnouncementService")
public class PmsAnnouncementServiceImpl implements IPmsAnnouncementService {
    @Resource(name = "dataAccessService")
    IDataAccessService dataAccessService;//数据层服务

    @Override
    public List<PmsAnnouncement> getList(PmsAnnouncement pmsAnnouncement) throws Exception {
        return null;
    }

    @Override
    public List<PmsAnnouncement> getPage(PmsAnnouncement obj, Page page) throws Exception {
        return dataAccessService.getList(PmsConstants.MAPPER.PMS_ANNOUNCEMENT + ".getList", obj, page);
    }

    @Override
    public PmsAnnouncement get(String  obj) throws Exception {
        return (PmsAnnouncement)dataAccessService.getObject(PmsConstants.MAPPER.PMS_ANNOUNCEMENT + ".get", obj);
    }
    @Override
    public PmsAnnouncement getMaxNum() throws Exception {
        return (PmsAnnouncement)dataAccessService.getObject(PmsConstants.MAPPER.PMS_ANNOUNCEMENT + ".getMax", null);
    }

    @Override
    public int update(PmsAnnouncement pmsAnnouncement) throws Exception {
        return dataAccessService.update(PmsConstants.MAPPER.PMS_ANNOUNCEMENT + ".update", pmsAnnouncement);
    }

    @Override
    public int delete(String id)  throws Exception{
        return dataAccessService.delete(PmsConstants.MAPPER.PMS_ANNOUNCEMENT + ".delete", id);

    }

    //批量删除
    @Override
    public int delete(String[] idArr) throws Exception {
        int i = 0;
        for(String id : idArr){
            i += this.delete(id);
        }
        return i;
    }

    @Override
    public int insert(PmsAnnouncement pmsAnnouncement) throws Exception {
        pmsAnnouncement.setId(CommonUtil.getUUID());
        int result = dataAccessService.insert(PmsConstants.MAPPER.PMS_ANNOUNCEMENT + ".insert", pmsAnnouncement);
        return result;
    }

    @Override
    public int batchInsert(List<PmsAnnouncement> list) throws Exception {
        return 0;
    }
}
