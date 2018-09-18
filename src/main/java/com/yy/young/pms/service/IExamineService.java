package com.yy.young.pms.service;

import java.util.List;

/**
 * @author hu_xuanhua_hua
 * @ClassName: IExamineService
 * @Description: TODO
 * @date 2018-09-18 16:27
 * @versoin 1.0
 **/
public interface IExamineService {
    List<String> getBashinfoUserIdList(String state) throws Exception;//基本
    List<String> getCommunicationoUserIdList(String state) throws Exception;//通讯
    List<String> getRelationshipUserIdList(String state) throws Exception;//关系
    List<String> getEducationUserIdList(String state) throws Exception;//教育
    List<String> getWorkUserIdList(String state) throws Exception;//工作
    List<String> getAssociationkUserIdList(String state) throws Exception;//社团
    List<String> getHonorUserIdList(String state) throws Exception;//荣誉
    List<String> getAwardUserIdList(String state) throws Exception;//获奖
    List<String> getPaperUserIdList(String state) throws Exception;//论文
    List<String> getPublishUserIdList(String state) throws Exception;//出版
    List<String> getPatentUserIdList(String state) throws Exception;//专利
    List<String> getProjectUserIdList(String state) throws Exception;//项目
    List<String> getTechnologyUserIdList(String state) throws Exception;//专利
    List<String> getPersonnelUserIdList(String state) throws Exception;//人力培养
    List<String> getAssessmentUserIdList(String state) throws Exception;//考核

}
