package com.yy.young.pms.service;

import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.Communication;
import com.yy.young.pms.model.PmsCollectWork;
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
      PmsUser getPmsUserById(String id) throws Exception;
      List<Map<String, Object>> getNoDeptUser(Map<String, Object> parameter,Page page) throws Exception;
      Communication getCommunicationById(String id) throws Exception;
    Map<String,Object> getWorksCollection(String id) throws Exception;
    Map<String,Object> EducationnCollectionMap(String id) throws Exception;
}
