package com.yy.young.pms.model;

import com.yy.young.common.core.excel.ExcelColumn;
import com.yy.young.interfaces.model.User;
import com.yy.young.pms.util.PmsConstants;

import java.util.List;
import java.util.Set;

/**
 * 用户基础信息实体类
 * Created by rookie on 2018-03-27.
 */
public class PmsUser {


    @ExcelColumn(value = "编号，主键，无意义", order = 1)
    private String id;//编号，主键,与tb_ums_user中的id对应

    @ExcelColumn(value = "用户编号", order = 2)
    private String userId;//用户登录用的账号,与tb_ums_user表中的account对应

    @ExcelColumn(value = "用户姓名", order = 3)
    private String userName;//用户姓名

    @ExcelColumn(value = "曾用名", order = 4)
    private String oldName;//曾用名


    @ExcelColumn(value = "出生年月", order = 6)
    private String birth;//出生年月


    @ExcelColumn(value = "籍贯", order = 8)
    private String placeOfOrigin;//籍贯

    @ExcelColumn(value = "出生地", order = 9)
    private String placeOfBirth;//出生地

    @ExcelColumn(value = "参加工作时间", order = 10)
    private String workStartTime;//参加工作时间



    @ExcelColumn(value = "入党时间", order = 12)
    private String joinPartyTime;//入党时间



    @ExcelColumn(value = "取得时间", order = 14)
    private String getTime;//取得时间

    @ExcelColumn(value = "聘任时间", order = 15)
    private String appointmentTime;//聘任时间




    @ExcelColumn(value = "任职时间", order = 18)
    private String tenureTime;//任职时间



    @ExcelColumn(value = "研究领域", order = 20)
    private String researchField;//研究领域

    @ExcelColumn(value = "专业特长", order = 21)
    private String specialty;//专业特长








    @ExcelColumn(value = "外语水平", order = 26)
    private String englishLevel;//外语水平

    @ExcelColumn(value = "照片地址", order = 27)
    private String photoAddress;//照片地址

    @ExcelColumn(value = "备注", order = 28)
    private String remark;//备注

    @ExcelColumn(value = "第一学历", order = 29)
    private String firstEducation;//第一学历



    @ExcelColumn(value = "人员类型", order = 31)
    private String personType;//人员类型

    @ExcelColumn(value = "显示顺序", order = 32)
    private Integer num;//显示顺序
    private String trashFlag;//作废标识,1标识已作废,180503新加字段

    private String firstDegree;//第一学位
    private String takeWork;//承担的工作

    private List<UserDept> deptList;//部门列表

    private String deptIds;//部门编号,人员新增的时候使用,按部门查询时使用
    private String deptNames;//部门名称,人员查询时展示所属部门使用

    private String orderBy;//排序字段
    private String orderType;//排序类型,asc或desc



    private String toThereTime;//来院时间
    private String remarkModifyTime;
    private String state;
    private String dicName;

    /*教育开始*/
    private String startEducation;//教育起始时间
    private String endEducation;//教育结束时间
    private String educationContent;//教育内容
    /*教育结束*/
    /*出版著作开始*/
    private String bookName;//书名
    private String press;//出版社
    private String workType;//著作类型
    private String startYears;//出版开始Y时间
    private String endYears;//出版结束时间
    /*出版著作结束*/
    /*添加获奖情况搜索条件开始*/
    private String awardWinProjectName;//获奖项目名称
    private String awardType;//奖励类别
    private String awardWinProjectLevel;//获奖等级
    private String awardLevel;//奖励层次
    private String awardsStartYears;//奖励开始时间
    private String awardsEndYears;//奖励结束时间

    /*添加获奖情况搜索条件结束*/
    /*论文开始*/
    private String periodicalTitle;//题目
    private String periodicalName;//期刊名称
    private String periodicalType;//期刊类型
    private String periodicalStartYears;//论文开始时间
    private String periodicalEndYears;//论文结束时间

    /*论文结束*/
    /*工作开始*/
    private String workContent;//工作内容
    private String work_StartTime;//工作开始时间
    private String workStopTime;//工作结束时间

    /*工作结束*/
    /*通讯开始*/
    private String officePhone;//办公司电话
    private String mobilePhone;//移动电话
    private String emailAddress;//邮箱地址

    //联系人，就是userName
    /*通讯结束*/
    /*基本信息开始*/
    @ExcelColumn(value = "性别", order = 5)
    private String sex;//性别
    @ExcelColumn(value = "民族", order = 7)
    private String nation;//民族
    @ExcelColumn(value = "政治面貌", order = 11)
    private String politicalOutlook;//政治面貌
    @ExcelColumn(value = "专业技术职务", order = 13)
    private String technicalPosition;//专业技术职务
    @ExcelColumn(value = "专业技术等级", order = 16)
    private String technicalLevel;//专业技术等级
    @ExcelColumn(value = "行政级别", order = 19)
    private String administrativeLevel;//行政级别
    private String researchFieldDetail;//研究领域细分
    @ExcelColumn(value = "最高学历", order = 22)
    private String highestEducation;//最高学历
    @ExcelColumn(value = "最高学位", order = 23)
    private String highestDegree;//最高学位
    @ExcelColumn(value = "在职学历", order = 30)
    private String jobEducation;//在职学历
    private String jobDegree;//在职学位
    private String tempWorkExperience;//是否有挂职经历
    @ExcelColumn(value = "国外1年以上留学经历", order = 25)
    private String overseasStudyExperience;//国外1年以上留学经历
    @ExcelColumn(value = "身份证号", order = 24)
    private String idCard;//身份证号
    private String station;//岗位
    @ExcelColumn(value = "行政职务", order = 17)
    private String administrativeDuty;//行政职务
    private String startBirth;//出生开始日期
    private String endBirth;//出生结束日期
    private String startWorkTime;//工作开始时间
    private String endWorkTime;//工作结束时间
    private String startTenureTime;//任职开始时间
    private String endTenureTime;//任职结束时间
    private String startTechnicalGetTime;//技术职务取得开始时间
    private String endTechnicalGetTime;//技术职务取得结束时间
    private String startAppointmentTime;//技术等级聘任开始时间
    private String endAppointmentTime;//技术等级聘任结束时间



    /*基本信息结束*/

    /*拼装list*/
    private  List<String>periodical_typeList;


    /*拼装返回id*/
    private Set<String> set;



    public String getRemarkModifyTime() {
        return remarkModifyTime;
    }

    public void setRemarkModifyTime(String remarkModifyTime) {
        this.remarkModifyTime = remarkModifyTime;
    }

    /**
     * PmsUser对象转换为User对象
     *
     * @return User ums用户对象
     */
    public User toUser() {
        User user = new User();
        user.setId(this.id);
        user.setAccount(this.userId);
        user.setName(this.userName);

        user.setCompanyId(PmsConstants.HKY_COMPANY_ID);
        user.setNum(99);
        //user.setState("1");//用户状态
        if ("男".equals(this.sex)) {
            user.setSex("1");
        } else if ("女".equals(this.sex)) {
            user.setSex("0");
        }
        user.setBirthday(this.birth);
        return user;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPlaceOfOrigin() {
        return placeOfOrigin;
    }

    public void setPlaceOfOrigin(String placeOfOrigin) {
        this.placeOfOrigin = placeOfOrigin;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getWorkStartTime() {
        return workStartTime;
    }

    public void setWorkStartTime(String workStartTime) {
        this.workStartTime = workStartTime;
    }

    public String getPoliticalOutlook() {
        return politicalOutlook;
    }

    public void setPoliticalOutlook(String politicalOutlook) {
        this.politicalOutlook = politicalOutlook;
    }

    public String getJoinPartyTime() {
        return joinPartyTime;
    }

    public void setJoinPartyTime(String joinPartyTime) {
        this.joinPartyTime = joinPartyTime;
    }

    public String getTechnicalPosition() {
        return technicalPosition;
    }

    public void setTechnicalPosition(String technicalPosition) {
        this.technicalPosition = technicalPosition;
    }

    public String getGetTime() {
        return getTime;
    }

    public void setGetTime(String getTime) {
        this.getTime = getTime;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getTechnicalLevel() {
        return technicalLevel;
    }

    public void setTechnicalLevel(String technicalLevel) {
        this.technicalLevel = technicalLevel;
    }

    public String getAdministrativeDuty() {
        return administrativeDuty;
    }

    public void setAdministrativeDuty(String administrativeDuty) {
        this.administrativeDuty = administrativeDuty;
    }

    public String getTenureTime() {
        return tenureTime;
    }

    public void setTenureTime(String tenureTime) {
        this.tenureTime = tenureTime;
    }

    public String getAdministrativeLevel() {
        return administrativeLevel;
    }

    public void setAdministrativeLevel(String administrativeLevel) {
        this.administrativeLevel = administrativeLevel;
    }

    public String getResearchField() {
        return researchField;
    }

    public void setResearchField(String researchField) {
        this.researchField = researchField;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getHighestEducation() {
        return highestEducation;
    }

    public void setHighestEducation(String highestEducation) {
        this.highestEducation = highestEducation;
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getOverseasStudyExperience() {
        return overseasStudyExperience;
    }

    public void setOverseasStudyExperience(String overseasStudyExperience) {
        this.overseasStudyExperience = overseasStudyExperience;
    }

    public String getEnglishLevel() {
        return englishLevel;
    }

    public void setEnglishLevel(String englishLevel) {
        this.englishLevel = englishLevel;
    }

    public String getPhotoAddress() {
        return photoAddress;
    }

    public void setPhotoAddress(String photoAddress) {
        this.photoAddress = photoAddress;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getFirstEducation() {
        return firstEducation;
    }

    public void setFirstEducation(String firstEducation) {
        this.firstEducation = firstEducation;
    }

    public String getJobEducation() {
        return jobEducation;
    }

    public void setJobEducation(String jobEducation) {
        this.jobEducation = jobEducation;
    }

    public String getPersonType() {
        return personType;
    }

    public void setPersonType(String personType) {
        this.personType = personType;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public List<UserDept> getDeptList() {
        return deptList;
    }

    public void setDeptList(List<UserDept> deptList) {
        this.deptList = deptList;
    }

    public String getDeptIds() {
        return deptIds;
    }

    public void setDeptIds(String deptIds) {
        this.deptIds = deptIds;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getDeptNames() {
        return deptNames;
    }

    public void setDeptNames(String deptNames) {
        this.deptNames = deptNames;
    }

    public String getTrashFlag() {
        return trashFlag;
    }

    public void setTrashFlag(String trashFlag) {
        this.trashFlag = trashFlag;
    }

    public String getFirstDegree() {
        return firstDegree;
    }

    public void setFirstDegree(String firstDegree) {
        this.firstDegree = firstDegree;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public String getTakeWork() {
        return takeWork;
    }

    public void setTakeWork(String takeWork) {
        this.takeWork = takeWork;
    }

    public String getResearchFieldDetail() {
        return researchFieldDetail;
    }

    public void setResearchFieldDetail(String researchFieldDetail) {
        this.researchFieldDetail = researchFieldDetail;
    }

    public String getJobDegree() {
        return jobDegree;
    }

    public void setJobDegree(String jobDegree) {
        this.jobDegree = jobDegree;
    }

    public String getTempWorkExperience() {
        return tempWorkExperience;
    }

    public void setTempWorkExperience(String tempWorkExperience) {
        this.tempWorkExperience = tempWorkExperience;
    }

    public String getToThereTime() {
        return toThereTime;
    }

    public void setToThereTime(String toThereTime) {
        this.toThereTime = toThereTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }


    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }


    public String getStartYears() {
        return startYears;
    }

    public void setStartYears(String startYears) {
        this.startYears = startYears;
    }

    public String getEndYears() {
        return endYears;
    }

    public void setEndYears(String endYears) {
        this.endYears = endYears;
    }

    public String getAwardWinProjectName() {
        return awardWinProjectName;
    }

    public void setAwardWinProjectName(String awardWinProjectName) {
        this.awardWinProjectName = awardWinProjectName;
    }

    public String getAwardType() {
        return awardType;
    }

    public void setAwardType(String awardType) {
        this.awardType = awardType;
    }

    public String getAwardWinProjectLevel() {
        return awardWinProjectLevel;
    }

    public void setAwardWinProjectLevel(String awardWinProjectLevel) {
        this.awardWinProjectLevel = awardWinProjectLevel;
    }

    public String getAwardLevel() {
        return awardLevel;
    }

    public void setAwardLevel(String awardLevel) {
        this.awardLevel = awardLevel;
    }

    public String getAwardsStartYears() {
        return awardsStartYears;
    }

    public void setAwardsStartYears(String awardsStartYears) {
        this.awardsStartYears = awardsStartYears;
    }

    public String getAwardsEndYears() {
        return awardsEndYears;
    }

    public void setAwardsEndYears(String awardsEndYears) {
        this.awardsEndYears = awardsEndYears;
    }

    public String getPeriodicalTitle() {
        return periodicalTitle;
    }

    public void setPeriodicalTitle(String periodicalTitle) {
        this.periodicalTitle = periodicalTitle;
    }

    public String getPeriodicalName() {
        return periodicalName;
    }

    public void setPeriodicalName(String periodicalName) {
        this.periodicalName = periodicalName;
    }

    public String getPeriodicalType() {
        return periodicalType;
    }

    public void setPeriodicalType(String periodicalType) {
        this.periodicalType = periodicalType;
    }

    public String getPeriodicalStartYears() {
        return periodicalStartYears;
    }

    public void setPeriodicalStartYears(String periodicalStartYears) {
        this.periodicalStartYears = periodicalStartYears;
    }

    public String getPeriodicalEndYears() {
        return periodicalEndYears;
    }

    public void setPeriodicalEndYears(String periodicalEndYears) {
        this.periodicalEndYears = periodicalEndYears;
    }

    public String getWorkContent() {
        return workContent;
    }

    public void setWorkContent(String workContent) {
        this.workContent = workContent;
    }

    public String getWork_StartTime() {
        return work_StartTime;
    }

    public void setWork_StartTime(String work_StartTime) {
        this.work_StartTime = work_StartTime;
    }

    public String getWorkStopTime() {
        return workStopTime;
    }

    public void setWorkStopTime(String workStopTime) {
        this.workStopTime = workStopTime;
    }

    public String getStartEducation() {
        return startEducation;
    }

    public void setStartEducation(String startEducation) {
        this.startEducation = startEducation;
    }

    public String getEndEducation() {
        return endEducation;
    }

    public void setEndEducation(String endEducation) {
        this.endEducation = endEducation;
    }

    public String getEducationContent() {
        return educationContent;
    }

    public void setEducationContent(String educationContent) {
        this.educationContent = educationContent;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getStartBirth() {
        return startBirth;
    }

    public void setStartBirth(String startBirth) {
        this.startBirth = startBirth;
    }

    public String getEndBirth() {
        return endBirth;
    }

    public void setEndBirth(String endBirth) {
        this.endBirth = endBirth;
    }

    public String getStartWorkTime() {
        return startWorkTime;
    }

    public void setStartWorkTime(String startWorkTime) {
        this.startWorkTime = startWorkTime;
    }

    public String getEndWorkTime() {
        return endWorkTime;
    }

    public void setEndWorkTime(String endWorkTime) {
        this.endWorkTime = endWorkTime;
    }

    public String getStartTenureTime() {
        return startTenureTime;
    }

    public void setStartTenureTime(String startTenureTime) {
        this.startTenureTime = startTenureTime;
    }

    public String getEndTenureTime() {
        return endTenureTime;
    }

    public void setEndTenureTime(String endTenureTime) {
        this.endTenureTime = endTenureTime;
    }

    public String getStartTechnicalGetTime() {
        return startTechnicalGetTime;
    }

    public void setStartTechnicalGetTime(String startTechnicalGetTime) {
        this.startTechnicalGetTime = startTechnicalGetTime;
    }

    public String getEndTechnicalGetTime() {
        return endTechnicalGetTime;
    }

    public void setEndTechnicalGetTime(String endTechnicalGetTime) {
        this.endTechnicalGetTime = endTechnicalGetTime;
    }

    public String getStartAppointmentTime() {
        return startAppointmentTime;
    }

    public void setStartAppointmentTime(String startAppointmentTime) {
        this.startAppointmentTime = startAppointmentTime;
    }

    public String getEndAppointmentTime() {
        return endAppointmentTime;
    }

    public void setEndAppointmentTime(String endAppointmentTime) {
        this.endAppointmentTime = endAppointmentTime;
    }

    public List<String> getPeriodical_typeList() {
        return periodical_typeList;
    }

    public void setPeriodical_typeList(List<String> periodical_typeList) {
        this.periodical_typeList = periodical_typeList;
    }

    public Set<String> getSet() {
        return set;
    }

    public void setSet(Set<String> set) {
        this.set = set;
    }

    public AuditPmsUser toAnother() {
        //此类应该没有用到，使用了record表，此处暂且没有增加挂职经历等新增字段
        AuditPmsUser obj = new AuditPmsUser();
        obj.setId(this.id);
        obj.setUserId(this.userId);
        obj.setUserName(this.userName);
        obj.setOldName(this.oldName);
        obj.setSex(this.sex);
        obj.setBirth(this.birth);
        obj.setNation(this.nation);
        obj.setPlaceOfOrigin(this.placeOfOrigin);
        obj.setPlaceOfBirth(this.placeOfBirth);
        obj.setWorkStartTime(this.workStartTime);
        obj.setPoliticalOutlook(this.politicalOutlook);
        obj.setJoinPartyTime(this.joinPartyTime);
        obj.setTechnicalPosition(this.technicalPosition);
        obj.setGetTime(this.getTime);
        obj.setAppointmentTime(this.appointmentTime);
        obj.setTechnicalLevel(this.technicalLevel);
        obj.setAdministrativeDuty(this.administrativeDuty);
        obj.setTenureTime(this.tenureTime);
        obj.setAdministrativeLevel(this.administrativeLevel);
        obj.setResearchField(this.researchField);
        obj.setSpecialty(this.specialty);
        obj.setHighestEducation(this.highestEducation);
        obj.setHighestDegree(this.highestDegree);
        obj.setIdCard(this.idCard);
        obj.setOverseasStudyExperience(this.overseasStudyExperience);
        obj.setEnglishLevel(this.englishLevel);
        obj.setPhotoAddress(this.photoAddress);
        obj.setRemark(this.remark);
        obj.setFirstEducation(this.firstEducation);
        obj.setJobEducation(this.jobEducation);
        obj.setPersonType(this.personType);
        obj.setNum(this.num);
        obj.setTrashFlag(this.trashFlag);
        obj.setFirstDegree(this.firstDegree);
        obj.setStation(this.station);
        obj.setTakeWork(this.takeWork);
        obj.setResearchFieldDetail(this.researchFieldDetail);
        obj.setJobDegree(this.jobDegree);
        return obj;
    }
}