package com.yy.young.pms.model;

import com.yy.young.common.core.excel.ExcelColumn;

import java.util.Date;

/**
 * @author mark
 * @ClassName: AuditFieldSet
 * @Description: 审核设置表bean
 * @date 2018-09-11 19:05
 * @versoin 1.0
 **/
public class AuditFieldSet {
    @ExcelColumn(value = "编号，主键，无意义", order = 1)
    private String id;//编号，主键，无意义

    @ExcelColumn(value = "字段名称", order = 2)
    private String fieldName;//字段名称

    @ExcelColumn(value = "状态：1需要审核  2不需要审核", order = 4)
    private Integer status;//状态：1需要审核  2不需要审核

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
