/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/6/25 星期四 11:26:16                       */
/*==============================================================*/


drop table if exists chapter_knowledge_point_relationship;

drop table if exists chapters;

drop table if exists chapters_studying_phase_relationship;

drop table if exists knowledge_point_paper_relationship;

drop table if exists knowledge_points;

drop table if exists location;

drop table if exists location_papers_relationship;

drop table if exists papers;

drop table if exists question_banks;

drop table if exists question_knowledge_point_relationship;

drop table if exists question_levels;

drop table if exists questions;

drop table if exists roles;

drop table if exists studying_phase;

drop table if exists subjects;

drop table if exists user_role_relationship;

drop table if exists users;

/*==============================================================*/
/* Table: chapter_knowledge_point_relationship                  */
/*==============================================================*/
create table chapter_knowledge_point_relationship
(
   chapter_id           int not null,
   point_id             int not null,
   primary key (chapter_id, point_id)
);

alter table chapter_knowledge_point_relationship comment '章节和知识点的关联';

/*==============================================================*/
/* Table: chapters                                              */
/*==============================================================*/
create table chapters
(
   chapter_id           int not null,
   question_bank_id     int,
   subject_id           int,
   chapter_name         varchar(100),
   chapter_content      text,
   primary key (chapter_id)
);

alter table chapters comment '章节';

/*==============================================================*/
/* Table: chapters_studying_phase_relationship                  */
/*==============================================================*/
create table chapters_studying_phase_relationship
(
   chapter_id           int not null,
   studying_phase_id    int not null,
   primary key (chapter_id, studying_phase_id)
);

alter table chapters_studying_phase_relationship comment '章节和学习阶段的关联';

/*==============================================================*/
/* Table: knowledge_point_paper_relationship                    */
/*==============================================================*/
create table knowledge_point_paper_relationship
(
   point_id             int not null,
   paper_id             int not null,
   primary key (point_id, paper_id)
);

/*==============================================================*/
/* Table: knowledge_points                                      */
/*==============================================================*/
create table knowledge_points
(
   point_id             int not null,
   point_name           varchar(100),
   point_desc           varchar(1000),
   primary key (point_id)
);

alter table knowledge_points comment '知识点';

/*==============================================================*/
/* Table: location                                              */
/*==============================================================*/
create table location
(
   location_id          bigint not null,
   location_name        varchar(200),
   location_code        varchar(50),
   location_short_name  varchar(100),
   parent_id            bigint,
   level                int,
   location_type        int,
   location_desc        char(10),
   primary key (location_id)
);

/*==============================================================*/
/* Table: location_papers_relationship                          */
/*==============================================================*/
create table location_papers_relationship
(
   location_id          bigint not null,
   paper_id             int not null,
   primary key (location_id, paper_id)
);

alter table location_papers_relationship comment '班级/学校/地区和试卷关联';

/*==============================================================*/
/* Table: papers                                                */
/*==============================================================*/
create table papers
(
   paper_id             int not null,
   chapter_id           int,
   question_level_id    int,
   paper_name           varchar(500),
   primary key (paper_id)
);

alter table papers comment '试卷';

/*==============================================================*/
/* Table: question_banks                                        */
/*==============================================================*/
create table question_banks
(
   question_bank_id     int not null,
   location_id          bigint,
   question_bank_name   varchar(100),
   primary key (question_bank_id)
);

alter table question_banks comment '题库';

/*==============================================================*/
/* Table: question_knowledge_point_relationship                 */
/*==============================================================*/
create table question_knowledge_point_relationship
(
   question_id          int not null,
   point_id             int not null,
   primary key (question_id, point_id)
);

alter table question_knowledge_point_relationship comment '试题和知识点关联';

/*==============================================================*/
/* Table: question_levels                                       */
/*==============================================================*/
create table question_levels
(
   question_level_id    int not null,
   question_level_name  varchar(50),
   question_level_code  varchar(50),
   primary key (question_level_id)
);

alter table question_levels comment '难度';

/*==============================================================*/
/* Table: questions                                             */
/*==============================================================*/
create table questions
(
   question_id          int not null,
   chapter_id           int,
   subject_id           int,
   question_level_id    int,
   question_name        varchar(100),
   question_abs         varchar(500),
   real_answer          varchar(500),
   primary key (question_id)
);

alter table questions comment '试题';

/*==============================================================*/
/* Table: roles                                                 */
/*==============================================================*/
create table roles
(
   role_id              int not null,
   role_name            varchar(50),
   role_code            varchar(50),
   primary key (role_id)
);

/*==============================================================*/
/* Table: studying_phase                                        */
/*==============================================================*/
create table studying_phase
(
   studying_phase_id    int not null,
   studying_phase_name  varchar(100),
   start_time           datetime,
   end_time             datetime,
   primary key (studying_phase_id)
);

alter table studying_phase comment '学习阶段';

/*==============================================================*/
/* Table: subjects                                              */
/*==============================================================*/
create table subjects
(
   subject_id           int not null,
   subject_name         varchar(100),
   primary key (subject_id)
);

alter table subjects comment '科目';

/*==============================================================*/
/* Table: user_role_relationship                                */
/*==============================================================*/
create table user_role_relationship
(
   user_id              int not null,
   role_id              int not null,
   primary key (user_id, role_id)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   user_id              int not null,
   location_id          bigint,
   user_name            varchar(50),
   nick_name            varchar(50),
   true_name            varchar(20),
   password             varchar(100),
   id_card              varchar(18),
   primary key (user_id)
);

alter table chapter_knowledge_point_relationship add constraint FK_chapter_knowledge_point_relationship foreign key (chapter_id)
      references chapters (chapter_id) on delete restrict on update restrict;

alter table chapter_knowledge_point_relationship add constraint FK_chapter_knowledge_point_relationship2 foreign key (point_id)
      references knowledge_points (point_id) on delete restrict on update restrict;

alter table chapters add constraint FK_chapter_subject_relationship foreign key (subject_id)
      references subjects (subject_id) on delete restrict on update restrict;

alter table chapters add constraint FK_question_bank_chapters_relationship foreign key (question_bank_id)
      references question_banks (question_bank_id) on delete restrict on update restrict;

alter table chapters_studying_phase_relationship add constraint FK_chapters_studying_phase_relationship foreign key (chapter_id)
      references chapters (chapter_id) on delete restrict on update restrict;

alter table chapters_studying_phase_relationship add constraint FK_chapters_studying_phase_relationship2 foreign key (studying_phase_id)
      references studying_phase (studying_phase_id) on delete restrict on update restrict;

alter table knowledge_point_paper_relationship add constraint FK_knowledge_point_paper_relationship foreign key (point_id)
      references knowledge_points (point_id) on delete restrict on update restrict;

alter table knowledge_point_paper_relationship add constraint FK_knowledge_point_paper_relationship2 foreign key (paper_id)
      references papers (paper_id) on delete restrict on update restrict;

alter table location_papers_relationship add constraint FK_location_papers_relationship foreign key (location_id)
      references location (location_id) on delete restrict on update restrict;

alter table location_papers_relationship add constraint FK_location_papers_relationship2 foreign key (paper_id)
      references papers (paper_id) on delete restrict on update restrict;

alter table papers add constraint FK_chapter_paper_relationship foreign key (chapter_id)
      references chapters (chapter_id) on delete restrict on update restrict;

alter table papers add constraint FK_question_level_paper_relationship foreign key (question_level_id)
      references question_levels (question_level_id) on delete restrict on update restrict;

alter table question_banks add constraint FK_location_question_bank_relationship foreign key (location_id)
      references location (location_id) on delete restrict on update restrict;

alter table question_knowledge_point_relationship add constraint FK_question_knowledge_point_relationship foreign key (question_id)
      references questions (question_id) on delete restrict on update restrict;

alter table question_knowledge_point_relationship add constraint FK_question_knowledge_point_relationship2 foreign key (point_id)
      references knowledge_points (point_id) on delete restrict on update restrict;

alter table questions add constraint FK_chapter_questions_relationship foreign key (chapter_id)
      references chapters (chapter_id) on delete restrict on update restrict;

alter table questions add constraint FK_question_question_level_relationship foreign key (question_level_id)
      references question_levels (question_level_id) on delete restrict on update restrict;

alter table questions add constraint FK_question_subject_relationship foreign key (subject_id)
      references subjects (subject_id) on delete restrict on update restrict;

alter table user_role_relationship add constraint FK_user_role_relationship foreign key (user_id)
      references users (user_id) on delete restrict on update restrict;

alter table user_role_relationship add constraint FK_user_role_relationship2 foreign key (role_id)
      references roles (role_id) on delete restrict on update restrict;

alter table users add constraint FK_user_location_relationship foreign key (location_id)
      references location (location_id) on delete restrict on update restrict;

