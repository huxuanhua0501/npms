package com.yy.young.pms.service;

import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.PmsAnnouncement;
import com.yy.young.pms.model.PmsWebsite;

import java.util.List;

/**
 * @author mark
 * @ClassName: IPmsAnnouncementService
 * @Description: 公告service
 * @date 2018-09-11 19:16
 * @versoin 1.0
 **/
public interface IPmsAnnouncementService {
    public List<PmsAnnouncement> getList(PmsAnnouncement pmsAnnouncement) throws Exception;

    public List<PmsAnnouncement> getPage(PmsAnnouncement pmsAnnouncement, Page page)throws Exception;

    public PmsAnnouncement get(String  id) throws Exception;
    public PmsAnnouncement getMaxNum() throws Exception;

    public int update(PmsAnnouncement pmsAnnouncement)throws Exception;

    public int delete(String s)throws Exception;

    public int delete(String[] strings) throws Exception;

    public int insert(PmsAnnouncement pmsAnnouncement) throws Exception;

    public int batchInsert(List<PmsAnnouncement> list) throws Exception;
}
