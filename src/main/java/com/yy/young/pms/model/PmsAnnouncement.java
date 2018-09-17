package com.yy.young.pms.model;

import com.yy.young.common.core.excel.ExcelColumn;

import java.util.Date;

/**
 * @author mark
 * @ClassName: Announcement
 * @Description: 公告bean
 * @date 2018-09-11 19:05
 * @versoin 1.0
 **/
public class PmsAnnouncement {
    @ExcelColumn(value = "编号，主键，无意义", order = 1)
    private String id;//编号，主键，无意义

    @ExcelColumn(value = "排序编号", order = 2)
    private Integer serialNumber;//排序编号

    @ExcelColumn(value = "公告摘要", order = 3)
    private String point;//公告摘要

    @ExcelColumn(value = "公告标题", order = 4)
    private String title;

    @ExcelColumn(value = "公告内容", order = 5)
    private String content;

    @ExcelColumn(value = "添加时间", order = 6)
    private String createTime;

    @ExcelColumn(value = "添加人", order = 7)
    private String createName;

    @ExcelColumn(value = "操作人（自动记录）", order = 8)
    private String userId;

    @ExcelColumn(value = "系统记录创建时间）", order = 9)
    private Date systemTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getSystemTime() {
        return systemTime;
    }

    public void setSystemTime(Date systemTime) {
        this.systemTime = systemTime;
    }
}
