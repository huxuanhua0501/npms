package com.yy.young.pms.service;

import com.yy.young.pms.model.Communication;
import com.yy.young.pms.model.PmsUser;

/**
 * @author hu_xuanhua_hua
 * @ClassName: IPmsPreviewService
 * @Description: TODO
 * @date 2018-09-19 19:19
 * @versoin 1.0
 **/
public interface IPmsPreviewService {
    public PmsUser getPmsUserById(String id) throws Exception;
    public Communication getCommunicationById(String id) throws Exception;
}
