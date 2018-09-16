package com.yy.young.pms.service;

import com.yy.young.pms.model.PmsUser;

import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: IPmsRelatedService
 * @Description: TODO
 * @date 2018-09-13 16:28
 * @versoin 1.0
 **/
public interface IPmsRelatedService {
    List getEducation(PmsUser obj) throws Exception;
    List selectWork(PmsUser obj) throws Exception;
    List selectCommunication(PmsUser obj) throws Exception;
    List selectPaper(PmsUser obj) throws Exception;
    List selectPublish(PmsUser obj) throws Exception;
    List selectAward(PmsUser obj) throws Exception;
    List selectAssessment(PmsUser obj) throws Exception;
}
