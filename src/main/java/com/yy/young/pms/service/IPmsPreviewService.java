package com.yy.young.pms.service;

import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.Communication;
import com.yy.young.pms.model.PmsUser;

import java.util.List;
import java.util.Map;

/**
 * @author hu_xuanhua_hua
 * @ClassName: IPmsPreviewService
 * @Description: TODO
 * @date 2018-09-19 19:19
 * @versoin 1.0
 **/
public interface IPmsPreviewService {
    public PmsUser getPmsUserById(String id) throws Exception;
    public List<Map<String, Object>> getNoDeptUser(Map<String, Object> parameter,Page page) throws Exception;
    public Communication getCommunicationById(String id) throws Exception;
}
