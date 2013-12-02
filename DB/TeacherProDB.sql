/*==============================================================*/
/* Database name:  TTitleDB                                     */
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2013/10/15 14:11:08                          */
/*==============================================================*/


drop database TTitleDB
go

/*==============================================================*/
/* Database: TTitleDB                                           */
/*==============================================================*/
create database TTitleDB
on (
    name= "TTitle",
    filename= 'D:\DB\TTitle\TTitle.mdf'
)
log on (
    name= "TTitle_log",
    filename= 'D:\DB\TTitle\TTitle_log.mdf'
)
go

use TTitleDB
go

/*==============================================================*/
/* Table: ActivityAttachment                                    */
/*==============================================================*/
create table ActivityAttachment (
   AA_Code              int                  identity,
   AP_Code              int                  not null,
   AA_Name              nvarchar(100)        not null,
   AA_Path              nvarchar(200)        not null,
   constraint PK_ACTIVITYATTACHMENT primary key (AA_Code)
)
go

/*==============================================================*/
/* Table: ActivityFormSort                                      */
/*==============================================================*/
create table ActivityFormSort (
   AFS_Code             int                  identity,
   AFS_Type             nvarchar(100)        not null,
   AFS_MinClassHour     varchar(30)          not null,
   constraint PK_ACTIVITYFORMSORT primary key (AFS_Code)
)
go

/*==============================================================*/
/* Table: ActivityMaterial                                      */
/*==============================================================*/
create table ActivityMaterial (
   AM_Code              int                  identity,
   ASU_Code             int                  null,
   AM_Name              nvarchar(100)        not null,
   AM_SavePath          nvarchar(200)        not null,
   constraint PK_ACTIVITYMATERIAL primary key (AM_Code)
)
go

/*==============================================================*/
/* Table: ActivityPlan                                          */
/*==============================================================*/
create table ActivityPlan (
   AP_Code              int                  identity,
   TA_Code              int                  not null,
   AP_Theme             nvarchar(Max)        not null,
   AP_Speaker           nvarchar(100)        null,
   AP_SchoolYear        nvarchar(20)         not null,
   AP_StartTime         nvarchar(20)         not null,
   AP_EndTime           nvarchar(20)         not null,
   AP_Place             nvarchar(100)        not null,
   AP_Limit             varchar(10)          null,
   AP_Left              varchar(10)          null,
   AP_Candidate         varchar(10)          null,
   AP_CandidateLeft     varchar(10)          null,
   AP_ReleaseTime       nvarchar(20)         not null,
   AP_ClassHour         nvarchar(20)         not null,
   AP_StatusKey         int                  not null,
   AP_StatusValue       nvarchar(10)         not null,
   AP_SecondCheck       int                  null,
   AP_Remark            nvarchar(300)        null,
   constraint PK_ACTIVITYPLAN primary key (AP_Code)
)
go

/*==============================================================*/
/* Table: ActivityRemark                                        */
/*==============================================================*/
create table ActivityRemark (
   AR_Code              numeric              identity,
   AR_Content           nvarchar(Max)        null,
   constraint PK_ACTIVITYREMARK primary key (AR_Code)
)
go

/*==============================================================*/
/* Table: ActivitySignUp                                        */
/*==============================================================*/
create table ActivitySignUp (
   ASU_Code             int                  identity,
   U_Code               int                  not null,
   AP_Code              int                  null,
   ASU_Time             varchar(20)          null,
   ASU_IsCandidateKey   int                  not null,
   ASU_IsCandidateVal   nvarchar(10)         not null,
   ASU_StatusKey        int                  not null,
   ASU_StatusValue      nvarchar(10)         not null,
   ASU_Remark           nvarchar(Max)        null,
   ASU_Reason           nvarchar(Max)        null,
   constraint PK_ACTIVITYSIGNUP primary key (ASU_Code)
)
go

/*==============================================================*/
/* Table: ActivitySummary                                       */
/*==============================================================*/
create table ActivitySummary (
   AS_Code              int                  identity,
   AP_Code              int                  not null,
   U_Code               int                  not null,
   AS_Tutor             nvarchar(50)         null,
   AS_Results           nvarchar(Max)        null,
   AS_Remark            nvarchar(Max)        null,
   AS_StatusKey         int                  not null,
   AS_StatusValue       nvarchar(10)         not null,
   constraint PK_ACTIVITYSUMMARY primary key (AS_Code)
)
go

/*==============================================================*/
/* Table: ClassHourSum                                          */
/*==============================================================*/
create table ClassHourSum (
   CH_Code              int                  identity,
   ASU_Code             int                  null,
   CH_GetTime           nvarchar(20)         null,
   CH_Content           nvarchar(1000)       null,
   CH_GetHour           varchar(10)          null,
   CH_Remark            nvarchar(1000)       null,
   constraint PK_CLASSHOURSUM primary key (CH_Code)
)
go

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department (
   D_Code               int                  identity,
   D_Name               nvarchar(50)         not null,
   D_IsValid            int                  not null,
   constraint PK_DEPARTMENT primary key (D_Code)
)
go

/*==============================================================*/
/* Table: FriendlyLink                                          */
/*==============================================================*/
create table FriendlyLink (
   FL_Code              int                  identity,
   FL_Name              nvarchar(50)         not null,
   FL_Link              varchar(50)          not null,
   FL_Status            int                  not null,
   constraint PK_FRIENDLYLINK primary key (FL_Code)
)
go

/*==============================================================*/
/* Table: Institute                                             */
/*==============================================================*/
create table Institute (
   I_Code               int                  identity,
   I_Name               nvarchar(50)         not null,
   I_IsValid            int                  not null,
   constraint PK_INSTITUTE primary key (I_Code)
)
go

/*==============================================================*/
/* Table: MaxClassHourTable                                     */
/*==============================================================*/
create table MaxClassHourTable (
   MCH_Code             int                  identity,
   MCH_Hour             varchar(20)          not null,
   TA_Code              varchar(200)         not null,
   constraint PK_MAXCLASSHOURTABLE primary key (MCH_Code)
)
go

/*==============================================================*/
/* Table: News                                                  */
/*==============================================================*/
create table News (
   N_Code               int                  identity,
   N_Name               nvarchar(50)         not null,
   N_Content            nvarchar(Max)        not null,
   N_Time               nvarchar(30)         not null,
   N_People             nvarchar(20)         not null,
   N_Attachment         varchar(200)         null,
   N_Status             int                  not null,
   constraint PK_NEWS primary key (N_Code)
)
go

/*==============================================================*/
/* Table: NewsAttachment                                        */
/*==============================================================*/
create table NewsAttachment (
   NA_Code              int                  identity,
   N_Code               int                  not null,
   NA_Name              nvarchar(200)        not null,
   NA_Path              varchar(200)         not null,
   constraint PK_NEWSATTACHMENT primary key (NA_Code)
)
go

/*==============================================================*/
/* Table: SysConfig                                             */
/*==============================================================*/
create table SysConfig (
   SC_Code              int                  identity,
   SC_FieldName         varchar(30)          not null,
   SC_FieldAttr         varchar(30)          not null,
   SC_FieldCode         int                  not null,
   constraint PK_SYSCONFIG primary key (SC_Code)
)
go

/*==============================================================*/
/* Table: TMessage                                              */
/*==============================================================*/
create table TMessage (
   TM_Code              int                  identity,
   AP_Code              int                  null,
   U_Code               int                  null,
   TM_Content           nvarchar(Max)        null,
   TM_Time              varchar(20)          not null,
   TM_U_Name            char(10)             null,
   constraint PK_TMESSAGE primary key (TM_Code)
)
go

/*==============================================================*/
/* Table: TeachingActivity                                      */
/*==============================================================*/
create table TeachingActivity (
   TA_Code              int                  identity,
   AFS_Code             int                  not null,
   TA_Form              nvarchar(100)        not null,
   TA_Way               nvarchar(500)        null,
   TA_Material          nvarchar(500)        not null,
   TA_ClassHour         nvarchar(500)        not null,
   TA_MaxClassHour      varchar(20)          null,
   TA_PlaceKey          int                  not null,
   TA_PlaceValue        nvarchar(10)         not null,
   TA_IsUnion           int                  not null,
   TA_IsValid           int                  not null,
   constraint PK_TEACHINGACTIVITY primary key (TA_Code)
)
go

/*==============================================================*/
/* Table: UserType                                              */
/*==============================================================*/
create table UserType (
   UT_Code              int                  identity,
   UTType               nvarchar(10)         not null,
   constraint PK_USERTYPE primary key (UT_Code)
)
go

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users (
   U_Code               int                  identity,
   U_Account            nvarchar(20)         not null,
   U_PassWord           nvarchar(20)         not null,
   U_Name               nvarchar(50)         not null,
   U_Sex                int                  null,
   U_Birth              nvarchar(50)         null,
   U_Nation             nvarchar(50)         null,
   I_Code               int                  not null,
   D_Code               int                  null,
   U_Research           nvarchar(50)         null,
   U_SchoolTime         nvarchar(50)         null,
   U_WorkTime           nvarchar(50)         null,
   U_Major              nvarchar(50)         null,
   U_IDCard             nvarchar(30)         null,
   U_Title              nvarchar(50)         null,
   U_TitleLevel         nvarchar(50)         null,
   U_EngageTime         nvarchar(50)         null,
   U_LongPhone          varchar(50)          null,
   U_ShortPhone         varchar(50)          null,
   U_Mail               varchar(100)         null,
   UT_Code              int                  not null,
   U_Remark             nvarchar(1000)       null,
   U_IsValid            int                  not null,
   constraint PK_USERS primary key (U_Code),
   constraint AK_KEY_2_USERS unique (U_Account)
)
go

alter table ActivityAttachment
   add constraint FK_ACTIVITY_REFERENCE_ACTIVITY foreign key (AP_Code)
      references ActivityPlan (AP_Code)
go

alter table ActivityMaterial
   add constraint FK_ACTIVITY_REFERENCE_ACTIVITY_1 foreign key (ASU_Code)
      references ActivitySignUp (ASU_Code)
go

alter table ActivityPlan
   add constraint FK_ACTIVITY_REFERENCE_TEACHING foreign key (TA_Code)
      references TeachingActivity (TA_Code)
go

alter table ActivitySignUp
   add constraint FK_ACTIVITY_REFERENCE_ACTPLAN_1 foreign key (AP_Code)
      references ActivityPlan (AP_Code)
go

alter table ActivitySignUp
   add constraint FK_ACTIVITY_REFERENCE_USERS foreign key (U_Code)
      references Users (U_Code)
go

alter table ActivitySummary
   add constraint FK_ACTIVITY_REFERENCE_ACTIVITY_2 foreign key (AP_Code)
      references ActivityPlan (AP_Code)
go

alter table ActivitySummary
   add constraint FK_ACTIVITY_REFERENCE_USERS_03 foreign key (U_Code)
      references Users (U_Code)
go

alter table ClassHourSum
   add constraint FK_CLASSHOU_REFERENCE_ACTIVITY foreign key (ASU_Code)
      references ActivitySignUp (ASU_Code)
go

alter table NewsAttachment
   add constraint FK_NEWSATTA_REFERENCE_NEWS foreign key (N_Code)
      references News (N_Code)
go

alter table TMessage
   add constraint FK_TMESSAGE_REFERENCE_ACTIVITY foreign key (AP_Code)
      references ActivityPlan (AP_Code)
go

alter table TMessage
   add constraint FK_TMESSAGE_REFERENCE_USERS foreign key (U_Code)
      references Users (U_Code)
go

alter table TeachingActivity
   add constraint FK_TEACHING_REFERENCE_ACTIVITY foreign key (AFS_Code)
      references ActivityFormSort (AFS_Code)
go

alter table Users
   add constraint FK_USERS_REFERENCE_INSTITUT foreign key (I_Code)
      references Institute (I_Code)
go

alter table Users
   add constraint FK_USERS_REFERENCE_DEPARTME foreign key (D_Code)
      references Department (D_Code)
go

alter table Users
   add constraint FK_USERS_REFERENCE_USERTYPE foreign key (UT_Code)
      references UserType (UT_Code)
go

