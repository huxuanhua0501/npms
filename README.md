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

3.pms_user中添加字段，COMMENT ON COLUMN "public"."pms_user"."marital_status" IS '婚姻状况';
4.目前按人员搜索，工作经历，教育经历按照2018-11（数据库是这种格式，修改数据库后，修改页面格式）