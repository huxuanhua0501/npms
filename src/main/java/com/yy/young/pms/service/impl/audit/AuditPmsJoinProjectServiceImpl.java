package com.yy.young.pms.service.impl.audit;

import com.yy.young.base.exception.ParameterException;
import com.yy.young.common.service.ICommonService;
import com.yy.young.common.util.CommonUtil;
import com.yy.young.common.util.StringUtils;
import com.yy.young.dal.service.IDataAccessService;
import com.yy.young.dal.util.Page;
import com.yy.young.pms.model.AuditPmsJoinProject;
import com.yy.young.pms.model.AuditPmsRelations;
import com.yy.young.pms.model.JoinProject;
import com.yy.young.pms.service.IAuditPmsJoinProjectService;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.annotation.Resource;
import java.util.List;

/**
* xxx服务实现
* Created by rookie on 2018-04-03.
*/
@Service("auditPmsJoinProjectService")
public class AuditPmsJoinProjectServiceImpl implements IAuditPmsJoinProjectService {

    @Resource(name = "auditDataAccessService")
    IDataAccessService dataAccessService;//数据层服务

    @Resource(name = "joinProjectService")
    ICommonService<JoinProject> oldservice;//项目经历
    private static final Logger logger = LoggerFactory.getLogger(AuditPmsJoinProjectServiceImpl.class);

    private static final String MAPPER = "com.yy.young.pms.mapper.auditPmsJoinProject";//mapper的namespace

    //获取数据列表
    @Override
    public List<AuditPmsJoinProject> getList(AuditPmsJoinProject obj) throws Exception {
        return dataAccessService.getList(MAPPER + ".getList", obj);
    }

    //获取数据列表(分页)
    @Override
    public List<AuditPmsJoinProject> getPage(AuditPmsJoinProject obj, Page page) throws Exception {
        //新改：全部显示
/*        if(obj.getStatus() == null) {
            obj.setStatus(5);//1审核通过2审核不通过3不审核4删除5待审核
        }*/
        return dataAccessService.getList(MAPPER + ".getList", obj, page);
    }

    //查询单条
    @Override
    public AuditPmsJoinProject get(String id) throws Exception {
        return (AuditPmsJoinProject)dataAccessService.getObject(MAPPER + ".get", id);
    }

    //统计数量
    @Override
    public int count(AuditPmsJoinProject obj) throws Exception {
        return (Integer)dataAccessService.getObject(MAPPER + ".count", obj);
    }

    //修改
    @Override
    public int update(AuditPmsJoinProject obj) throws Exception {
        return dataAccessService.update(MAPPER + ".update", obj);
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

    //删除单条
    @Override
    public int delete(String id) throws Exception {
        return dataAccessService.delete(MAPPER + ".delete", id);
    }

    //插入
    @Override
    public int insert(AuditPmsJoinProject obj) throws Exception {
        logger.info("社会审核service插入：");
        if (StringUtils.isBlank(obj.getUserId())){
            throw new ParameterException("人员编号无效!");
        }
        if (StringUtils.isBlank(obj.getId())){
            obj.setId(CommonUtil.getUUID());
        }
        if (obj.getStatus() == null) {
            obj.setStatus(5);//1审核通过2审核不通过3不审核4删除5待审核
        }
        return dataAccessService.insert(MAPPER + ".insert", obj);
    }

    //批量插入
    @Override
    public int batchInsert(List<AuditPmsJoinProject> list) throws Exception {
        int i = 0;
        for(AuditPmsJoinProject item : list){
            i += this.insert(item);
        }
        return i;
    }
    //批量修改顺便插入到正式库
    @Override
    public int batchUpdate(List<AuditPmsJoinProject> list) throws Exception {
        int i = 0;
        for(AuditPmsJoinProject item : list){
            i += this.update(item);
            if (this.update(item) > 0) {
//                if (item.getStatus() == 1) {
                    if (oldservice.get(item.toAnother()) != null) {
                        oldservice.update(this.get(item.getId()).toAnother());
                    }else {
                        oldservice.insert(this.get(item.getId()).toAnother());
                    }
//                }
            }
        }
        return i;
    }
}