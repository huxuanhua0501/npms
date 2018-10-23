# npms
1 添加表
网站功能
CREATE TABLE "public"."pms_website" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(32) COLLATE "pg_catalog"."default",
  "chinese_name" varchar(32) COLLATE "pg_catalog"."default",
  "website" varchar(1024) COLLATE "pg_catalog"."default",
  "add_time" varchar(1024) COLLATE "pg_catalog"."default",
  "sort" int4,
  CONSTRAINT "pms_website_id" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."pms_website" 
  OWNER TO "postgres";

COMMENT ON COLUMN "public"."pms_website"."id" IS '编号，主键，无意义';

COMMENT ON COLUMN "public"."pms_website"."user_id" IS '用户编号';

COMMENT ON COLUMN "public"."pms_website"."chinese_name" IS '中文名字';

COMMENT ON COLUMN "public"."pms_website"."website" IS '网址';

COMMENT ON COLUMN "public"."pms_website"."add_time" IS '添加时间';

COMMENT ON COLUMN "public"."pms_website"."sort" IS '排序';

COMMENT ON TABLE "public"."pms_website" IS '常用网站';


2：按照人员审核  <Br/>
   2.1用户管理--与按人员审核中查询出来的数据不太一致。（人员审核的数据较少，原因 ，审核的用户必须在这张表中存在audit_show_user）<Br/>
   2.2原先的人员审核，禁止用的人员是不显示的，现在做成显示了。<Br/>
   2.3按人员审核原先的界面openPageOnMain('page/pms/auditPersonnel.jsp')
   2.4按人员审核新界面 openPageOnMain('page/personal/personnel-review_no.jsp')
   2.5按照模块审核openPageOnMain('page/personal/information-audit_no.jsp')
3.
  3.1pms_user中添加字段，  "marital_status" varchar(32) COLLATE "pg_catalog"."default",----'婚姻状况';
  3.2pms_user中添加字段，  "level_of_appointment" varchar(32) COLLATE "pg_catalog"."default"----任现级别时间
4.目前按人员搜索，工作经历，教育经历按照2018-11（数据库是这种格式，修改数据库后，修改页面格式）
5.增加公告表
CREATE TABLE "public"."pms_announcement" (
"id" varchar(32) COLLATE "default" NOT NULL,
"serial_number" int4 NOT NULL,
"point" varchar(128) COLLATE "default",
"title" varchar(128) COLLATE "default" NOT NULL,
"content" text COLLATE "default" NOT NULL,
"create_time" varchar(128) COLLATE "default" NOT NULL,
"create_name" varchar(128) COLLATE "default" NOT NULL,
"user_id" varchar(32) COLLATE "default" NOT NULL,
"system_time" timestamp(6) NOT NULL,
CONSTRAINT "pms_pkey" PRIMARY KEY ("id")
)
WITH (OIDS=FALSE)
;
ALTER TABLE "public"."pms_announcement" OWNER TO "postgres";

COMMENT ON COLUMN "public"."pms_announcement"."id" IS '主键id';

COMMENT ON COLUMN "public"."pms_announcement"."serial_number" IS '排序编号';

COMMENT ON COLUMN "public"."pms_announcement"."point" IS '公告摘要';

COMMENT ON COLUMN "public"."pms_announcement"."title" IS '公告标题';

COMMENT ON COLUMN "public"."pms_announcement"."content" IS '公告内容';

COMMENT ON COLUMN "public"."pms_announcement"."create_time" IS '添加时间';

COMMENT ON COLUMN "public"."pms_announcement"."create_name" IS '创建人姓名';

COMMENT ON COLUMN "public"."pms_announcement"."user_id" IS '操作人（自动记录）';

COMMENT ON COLUMN "public"."pms_announcement"."system_time" IS '系统记录创建时间';
6.按新命名调整菜单（人事管理-统计报表），涉及到tb_ums_navigate表内容，对应涉及到
admin用户的资源链接池
    1）编制分析：openPageOnMain('page/statistic/bianzhiStatistics_no.jsp?edit=true')
    2）结构统计：openPageOnMain('page/statistic/jiegouStatistics_no.jsp?edit=true')	
    3）奖励分析：openPageOnMain('page/statistic/jiangliStatistics_no.jsp?edit=true')
    其它原有作废
完成情况：
    1）编制分析：缺少后台部分、角色控制、部门选择、查询条件生效，其它ok
    2）结构统计：缺少角色控制、部门选择、查询条件生效
    3）奖励分析：奖励层次已有后台部分，出版著作、年度考核缺少后台部分
                角色控制、部门选择、查询条件生效
7.人事管理--统计汇总，调整了菜单及显示顺序，分别为员工花名册->人事管理
    ->统计汇总->信息审核->统计报表
    统计汇总功能地址：openPageOnMain('page/statistic/pmStatistics_no.jsp?edit=true')
8.admin-资源池管理，增加菜单：
    1）系统管理，包括子菜单：公告设置、日志管理
    2）系统帮助：包括子菜单：普通人员使用指南、人事及管理员使用指南
9.系统管理-公告设置，链接：openPageOnMain('page/portal/announcement_no.jsp')
10.组织机构大模块按要求调整菜单，显示顺序分别为 部门用户-机构管理-角色权限
    角色权限下三级菜单包括角色管理、角色用户
11.组织机构-机构管理 新地址openPageOnMain('page/ums/deptList_no.jsp')
   组织机构-部门用户 新地址	openPageOnMain('page/ums/deptUser_no.jsp')
12.组织机构-角色权限-角色管理 新地址 openPageOnMain('page/ums/roleList_no.jsp')	