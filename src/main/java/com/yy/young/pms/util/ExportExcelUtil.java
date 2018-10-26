package com.yy.young.pms.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yy.young.pms.model.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.omg.CORBA.OBJ_ADAPTER;

import javax.servlet.http.HttpServletResponse;

public class ExportExcelUtil {

//	public static void main(String[] args) throws Exception {
//
//		ExportExcelUtil export = new ExportExcelUtil();
//
//		String srcFilePath = "d:/人员信息模板.xlsx";
//		String fileName = "test_" + System.currentTimeMillis() + ".xlsx";
//		String desFilePath = "d:/" + fileName;
//
//		export.exportExcel(srcFilePath,desFilePath,export);
//	}

    //根据指定的excel模板导出数据
    public void exportExcel(String srcFilePath, String desFilePath, HttpServletResponse response, PmsUser pmsUser,
                            List<AuditPmsEducation> auditPmsEducationList, List<AuditPmsWork> auditPmsWorkList,
                            Communication communication, List<AuditPmsRelations> relationsList) throws Exception {
        // 告诉浏览器用什么软件可以打开此文件
        response.setHeader("content-Type", "application/vnd.ms-excel");
        // 下载文件的默认名称
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(desFilePath, "utf-8"));
        OutputStream out = response.getOutputStream();
        //创建Excel文件的输入流对象
        FileInputStream fis = new FileInputStream(srcFilePath);

        //根据模板创建excel工作簿
        XSSFWorkbook workBook = new XSSFWorkbook(fis);

        //获取创建的工作簿第一页
        XSSFSheet sheet = workBook.getSheetAt(0);


        XSSFRow row = sheet.getRow(1);
        XSSFCell cell = row.getCell(2);
        cell.setCellValue(pmsUser.getUserName());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getOldName());

        row = sheet.getRow(2);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getPlaceOfOrigin());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getDeptNames());

        row = sheet.getRow(3);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getSex());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getBirth());

        row = sheet.getRow(4);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getNation());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getIdCard());


        row = sheet.getRow(5);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getPlaceOfBirth());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getWorkStartTime());

        row = sheet.getRow(6);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getPoliticalOutlook());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getJoinPartyTime());

        row = sheet.getRow(7);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getStation());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getToThereTime());

        row = sheet.getRow(8);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getTakeWork());


        row = sheet.getRow(9);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getTechnicalPosition());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getGetTime());

        row = sheet.getRow(10);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getTechnicalLevel());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getAppointmentTime());

        row = sheet.getRow(11);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getAdministrativeDuty());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getTenureTime());

        row = sheet.getRow(12);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getAdministrativeLevel());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getLevelOfAppointment());

        row = sheet.getRow(13);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getResearchField());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getResearchFieldDetail());


        row = sheet.getRow(14);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getTempWorkExperience());

        row = sheet.getRow(15);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getHighestEducation());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getHighestDegree());


        row = sheet.getRow(16);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getJobEducation());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getJobDegree());

        row = sheet.getRow(17);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getSpecialty());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getOverseasStudyExperience());


        row = sheet.getRow(18);
        cell = row.getCell(2);
        cell.setCellValue(pmsUser.getEnglishLevel());
        cell = row.getCell(4);
        cell.setCellValue(pmsUser.getRemark());//这里是否需要加权限

        /*通讯*/
        row = sheet.getRow(19);
        cell = row.getCell(2);
        cell.setCellValue(communication.getOfficePhone());
        cell = row.getCell(4);
        cell.setCellValue(communication.getMobilePhone());


        row = sheet.getRow(20);
        cell = row.getCell(2);
        cell.setCellValue(communication.getFaxNumber());
        cell = row.getCell(4);
        cell.setCellValue(communication.getEmailAddress());


        row = sheet.getRow(21);
        cell = row.getCell(2);
        cell.setCellValue(communication.getPostalAddress());


        row = sheet.getRow(22);
        cell = row.getCell(2);
        cell.setCellValue(communication.getRelationshipOne());
        cell = row.getCell(4);
        cell.setCellValue(communication.getNameOne());
        row = sheet.getRow(23);
        cell = row.getCell(2);
        cell.setCellValue(communication.getEmergencyContactOne());


        row = sheet.getRow(24);
        cell = row.getCell(2);
        cell.setCellValue(communication.getRelationshipTwo());
        cell = row.getCell(4);
        cell.setCellValue(communication.getNameTwo());
        row = sheet.getRow(25);
        cell = row.getCell(2);
        cell.setCellValue(communication.getEmergencyContactTwo());

        /*家庭/社会关系*/
        if (relationsList != null && relationsList.size() >= 2) {
            //第一个人关系
            row = sheet.getRow(26);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getName());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(0).getTel());

            row = sheet.getRow(27);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getSex());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(0).getStype());

            row = sheet.getRow(28);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getBirthday());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(0).getRelation());

            row = sheet.getRow(29);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getUnit());
            //第二个关系
            row = sheet.getRow(30);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(1).getName());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(1).getTel());

            row = sheet.getRow(31);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(1).getSex());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(1).getStype());

            row = sheet.getRow(32);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(1).getBirthday());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(1).getRelation());

            row = sheet.getRow(33);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(1).getUnit());


        } else if (relationsList != null && relationsList.size() == 1) {
            row = sheet.getRow(26);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getName());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(0).getTel());

            row = sheet.getRow(27);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getSex());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(0).getStype());

            row = sheet.getRow(28);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getBirthday());
            cell = row.getCell(4);
            cell.setCellValue(relationsList.get(0).getRelation());

            row = sheet.getRow(29);
            cell = row.getCell(2);
            cell.setCellValue(relationsList.get(0).getUnit());

        }
        if (auditPmsEducationList != null && auditPmsEducationList.size() > 0) {
            int total = auditPmsEducationList.size();
            if (total > 10) {
                total = 10;
            }
            for (int i = 36 ;i<(total+36);i++){
                row = sheet.getRow(i);
                cell = row.getCell(0);
                cell.setCellValue(auditPmsEducationList.get(i-36).getStartTime());
                cell = row.getCell(1);
                cell.setCellValue(auditPmsEducationList.get(i-36).getStopTime());
                cell = row.getCell(2);
                cell.setCellValue(auditPmsEducationList.get(i-36).getUniversityName());

            }
        }

        if (auditPmsWorkList != null && auditPmsWorkList.size() > 0) {
            int total = auditPmsWorkList.size();
            if (total > 20) {
                total = 20;
            }
            for (int i = 48 ;i<(total+48);i++){
                row = sheet.getRow(i);
                cell = row.getCell(0);
                cell.setCellValue(auditPmsWorkList.get(i-48).getStartTime());
                cell = row.getCell(1);
                cell.setCellValue(auditPmsWorkList.get(i-48).getStopTime());
                cell = row.getCell(2);
                cell.setCellValue(auditPmsWorkList.get(i-48).getWorkCompany());

            }
        }
        workBook.write(out);
        out.close();


    }

}
