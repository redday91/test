-- MySQL dump 10.13  Distrib 5.5.24, for osx10.6 (i386)
--
-- Host: localhost    Database: recruit_jhalesga_development
-- ------------------------------------------------------
-- Server version	5.5.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_years`
--

DROP TABLE IF EXISTS `academic_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `begins_on` date NOT NULL,
  `ends_on` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `diversity_data_set_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_academic_years_on_diversity_data_set_id` (`diversity_data_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activation_notifications`
--

DROP TABLE IF EXISTS `activation_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activation_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `sent_to_email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sent_by_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activation_notifications_on_sent_by_id` (`sent_by_id`),
  KEY `index_activation_notifications_on_applicant_id` (`applicant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_sources`
--

DROP TABLE IF EXISTS `ad_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ad_sources_on_recruitment_id` (`recruitment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applicant_degrees`
--

DROP TABLE IF EXISTS `applicant_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicant_degrees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `dissertation_title` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `advisor_1` varchar(255) DEFAULT NULL,
  `advisor_2` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `applicant_id` (`applicant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16750 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password_hash` varchar(64) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `affiliation` varchar(255) NOT NULL,
  `current_job_title` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_expiration` datetime DEFAULT NULL,
  `notified_on` datetime DEFAULT NULL,
  `activated_on` datetime DEFAULT NULL,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_index` (`username`),
  KEY `index_applicants_on_created_by_user_id` (`created_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16784 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_activity_logs`
--

DROP TABLE IF EXISTS `application_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `loggable_type` varchar(255) DEFAULT NULL,
  `loggable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_application_activity_logs_on_position_application_id` (`application_id`),
  KEY `index_application_activity_logs_on_author_id` (`author_id`),
  KEY `index_application_activity_logs_on_status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_bundles`
--

DROP TABLE IF EXISTS `application_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_bundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) DEFAULT NULL,
  `with_references` tinyint(1) DEFAULT NULL,
  `generated_with_cache_key` varchar(255) DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `generation_duration` float DEFAULT NULL,
  `last_accessed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_application_bundles_on_position_application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_events`
--

DROP TABLE IF EXISTS `application_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_visit_id` int(11) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `event_description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_application_events_on_application_visit_id` (`application_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_file_types`
--

DROP TABLE IF EXISTS `application_file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_file_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT '0',
  `file_type` enum('APPLICATION','REFERENCE') NOT NULL DEFAULT 'APPLICATION',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `list_order` int(11) NOT NULL DEFAULT '0',
  `legacy_id` int(11) unsigned DEFAULT NULL,
  `is_tardy` tinyint(1) DEFAULT '0',
  `tardy_date` datetime DEFAULT NULL,
  `tardy_email_sent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_application_file_types_on_position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5078 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_flags`
--

DROP TABLE IF EXISTS `application_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_flags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `created_by_user_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `reviewer_visible` tinyint(1) DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position_application_id` (`application_id`),
  KEY `index_application_flags_on_created_by_user_id` (`created_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_management_details`
--

DROP TABLE IF EXISTS `application_management_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_management_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `viewed_on` datetime DEFAULT NULL,
  `marked_as_read_on` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `note_updated_on` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_application_management_details_on_user_id` (`user_id`),
  KEY `index_application_management_details_on_position_application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1587 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_statuses`
--

DROP TABLE IF EXISTS `application_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_statuses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_application_statuses_on_version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_visits`
--

DROP TABLE IF EXISTS `application_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `summary` text,
  `bio` text,
  `application_id` int(11) NOT NULL,
  `main_time` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position_application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) unsigned NOT NULL,
  `position_id` int(11) unsigned NOT NULL,
  `application_status_id` int(11) unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `survey_taken` tinyint(1) DEFAULT '0',
  `last_modified` datetime NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `marked_unqualified_at` datetime DEFAULT NULL,
  `marked_unqualified_by_user_id` bigint(20) DEFAULT NULL,
  `basic_qualifications_code` varchar(1) DEFAULT NULL,
  `completed_before_review_date_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applicant_id` (`applicant_id`),
  KEY `position_id` (`position_id`),
  KEY `index_position_applications_on_application_status_id` (`application_status_id`),
  KEY `marked_unqualified_at_index` (`marked_unqualified_at`),
  KEY `basic_qualifications_index` (`basic_qualifications_code`),
  KEY `index_position_applications_on_position_id_and_is_hidden` (`position_id`,`is_hidden`),
  KEY `application_review_window` (`position_id`,`completed_before_review_date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16743 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applications_decline_reasons`
--

DROP TABLE IF EXISTS `applications_decline_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_decline_reasons` (
  `application_id` int(11) NOT NULL,
  `decline_reason_id` int(11) NOT NULL,
  KEY `reason_id_app_id_index` (`decline_reason_id`,`application_id`),
  KEY `app_id_reason_id_index` (`application_id`,`decline_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applications_disposition_reasons`
--

DROP TABLE IF EXISTS `applications_disposition_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications_disposition_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disposition_reason_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_disposition_reason_index` (`application_id`,`disposition_reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `percent_time` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_appointments_on_offer_id` (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approval_workflow_steps`
--

DROP TABLE IF EXISTS `approval_workflow_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_workflow_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_workflow_id` int(11) DEFAULT NULL,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_approval_workflow_steps_on_approval_workflow_id` (`approval_workflow_id`),
  KEY `index_approval_workflow_steps_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approval_workflows`
--

DROP TABLE IF EXISTS `approval_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `context` varchar(255) DEFAULT NULL,
  `conditions_recipe` text,
  PRIMARY KEY (`id`),
  KEY `index_approval_workflows_on_created_by_user_id` (`created_by_user_id`),
  KEY `index_approval_workflows_on_context` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approvals`
--

DROP TABLE IF EXISTS `approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `on_type` varchar(255) DEFAULT NULL,
  `on_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_approvals_on_on_type_and_on_id` (`on_type`,`on_id`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approvers`
--

DROP TABLE IF EXISTS `approvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filled_by_user_id` bigint(20) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '1',
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_approvers_on_approval_id` (`approval_id`),
  KEY `index_approvers_on_filled_by_user_id` (`filled_by_user_id`),
  KEY `index_approvers_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=1293 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `publish_on` datetime DEFAULT NULL,
  `unpublish_on` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) DEFAULT 'Banner',
  PRIMARY KEY (`id`),
  KEY `index_contact_us_banners_on_publish_on_and_unpublish_on` (`publish_on`,`unpublish_on`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_comments`
--

DROP TABLE IF EXISTS `base_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `on_type` varchar(255) NOT NULL,
  `on_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `markup` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_on_type_and_on_id` (`on_type`,`on_id`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3854 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `committees`
--

DROP TABLE IF EXISTS `committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cross_listed_positions`
--

DROP TABLE IF EXISTS `cross_listed_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cross_listed_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decline_reasons`
--

DROP TABLE IF EXISTS `decline_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decline_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `list_order` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT 'applicant_reason',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_roles`
--

DROP TABLE IF EXISTS `department_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `resource_type` varchar(128) NOT NULL,
  `resource_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id_resource_type_index` (`resource_id`,`resource_type`),
  KEY `index_department_roles_on_department_id` (`department_id`),
  KEY `index_department_roles_on_role_id` (`role_id`),
  KEY `index_department_roles_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `external_id` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_departments_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `descriptions`
--

DROP TABLE IF EXISTS `descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `text` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `on_id` int(11) DEFAULT NULL,
  `on_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_id_type_index` (`on_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposition_reason_categories`
--

DROP TABLE IF EXISTS `disposition_reason_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposition_reason_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposition_reason_suppressions`
--

DROP TABLE IF EXISTS `disposition_reason_suppressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposition_reason_suppressions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) DEFAULT NULL,
  `disposition_reason_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposition_reasons`
--

DROP TABLE IF EXISTS `disposition_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposition_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `disposition_reason_category_id` int(11) DEFAULT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disposition_reason_category_id_index` (`disposition_reason_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diversity_data`
--

DROP TABLE IF EXISTS `diversity_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diversity_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_specialty_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `question_name` varchar(32) DEFAULT NULL,
  `option_descriptor` varchar(32) DEFAULT NULL,
  `diversity_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_diversity_data_on_diversity_type_id` (`diversity_type_id`),
  KEY `index_diversity_data_on_recruitment_specialty_id` (`recruitment_specialty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40273 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diversity_data_sets`
--

DROP TABLE IF EXISTS `diversity_data_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diversity_data_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diversity_types`
--

DROP TABLE IF EXISTS `diversity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diversity_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diversity_data_set_id` int(11) DEFAULT NULL,
  `hiring_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_diversity_types_on_diversity_data_set_id` (`diversity_data_set_id`),
  KEY `index_diversity_types_on_hiring_type_id` (`hiring_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_contents`
--

DROP TABLE IF EXISTS `file_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `herc_categories`
--

DROP TABLE IF EXISTS `herc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herc_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `herc_division_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `herc_divisions`
--

DROP TABLE IF EXISTS `herc_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herc_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hiring_types`
--

DROP TABLE IF EXISTS `hiring_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hiring_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `initial_search_allocations`
--

DROP TABLE IF EXISTS `initial_search_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_search_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(255) DEFAULT NULL,
  `long_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letter_requests`
--

DROP TABLE IF EXISTS `letter_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `grants_access` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_listings_on_recruitment_id_and_department_id_and_school_id` (`recruitment_id`,`department_id`,`school_id`),
  KEY `index_listings_on_recruitment_id` (`recruitment_id`),
  KEY `index_listings_on_department_id` (`department_id`),
  KEY `index_listings_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_transaction_manifests`
--

DROP TABLE IF EXISTS `mail_transaction_manifests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_transaction_manifests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manifest` text,
  `mail_transaction_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mail_transaction_manifests_on_mail_transaction_id` (`mail_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_transactions`
--

DROP TABLE IF EXISTS `mail_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_failed_at` datetime DEFAULT NULL,
  `last_failure_message` text,
  `reference_id` int(11) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `delivery_method` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `regarding_id` int(11) DEFAULT NULL,
  `regarding_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applicant_id_index` (`applicant_id`),
  KEY `job_status_send_at_index` (`job_status`,`send_at`),
  KEY `index_mail_transactions_on_reference_id` (`reference_id`),
  KEY `index_mail_transactions_on_message_id` (`message_id`),
  KEY `index_mail_transactions_on_regarding_type_and_regarding_id` (`regarding_type`,`regarding_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30779 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailing_addresses`
--

DROP TABLE IF EXISTS `mailing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailing_addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address` text,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` enum('Position','Applicant','Reference','Recruitment') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`,`resource_type`),
  KEY `index_mailing_addresses_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `modified_by_user_id` bigint(20) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_news_on_created_by_user_id` (`created_by_user_id`),
  KEY `index_news_on_modified_by_user_id` (`modified_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_title_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discipline` varchar(255) DEFAULT NULL,
  `starting_salary` int(11) DEFAULT NULL,
  `step` varchar(255) DEFAULT NULL,
  `anticipated_start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_offers_on_position_application_id` (`application_id`),
  KEY `index_offers_on_recruitment_title_id` (`recruitment_title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_survey_reports`
--

DROP TABLE IF EXISTS `old_survey_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_survey_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diversity_data_set_id` int(11) NOT NULL,
  `recruitment_id` int(11) NOT NULL,
  `hiring_type_id` int(11) NOT NULL,
  `recruit_applicants` int(11) NOT NULL,
  `other_applicants` int(11) NOT NULL,
  `survey_response_count` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_reports_hiring_types` (`hiring_type_id`),
  KEY `index_old_survey_reports_on_diversity_data_set_id` (`diversity_data_set_id`),
  KEY `index_old_survey_reports_on_recruitment_id` (`recruitment_id`),
  CONSTRAINT `fk_survey_reports_hiring_types` FOREIGN KEY (`hiring_type_id`) REFERENCES `hiring_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_survey_reports_recruitment_specialties`
--

DROP TABLE IF EXISTS `old_survey_reports_recruitment_specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_survey_reports_recruitment_specialties` (
  `recruitment_specialty_id` int(11) NOT NULL,
  `old_survey_report_id` int(11) NOT NULL,
  KEY `recruitment_specialty_id_old_survey_report_id_index` (`recruitment_specialty_id`,`old_survey_report_id`),
  KEY `old_survey_report_id_recruitment_specialty_id_index` (`old_survey_report_id`,`recruitment_specialty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `old_survey_reports_recruitment_titles`
--

DROP TABLE IF EXISTS `old_survey_reports_recruitment_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_survey_reports_recruitment_titles` (
  `recruitment_title_id` int(11) NOT NULL,
  `old_survey_report_id` int(11) NOT NULL,
  UNIQUE KEY `fk_rtsr_tuple_unique` (`recruitment_title_id`,`old_survey_report_id`),
  KEY `fk_rtsr_join_survey_reports` (`old_survey_report_id`),
  CONSTRAINT `fk_rtsr_join_old_survey_reports` FOREIGN KEY (`old_survey_report_id`) REFERENCES `old_survey_reports` (`id`),
  CONSTRAINT `fk_rtsr_join_recruitment_titles` FOREIGN KEY (`recruitment_title_id`) REFERENCES `recruitment_titles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openid_users`
--

DROP TABLE IF EXISTS `openid_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid_url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tool_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_permissions_on_tool_id` (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `permission_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  KEY `permission_id_role_id_index` (`permission_id`,`role_id`),
  KEY `role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `applicant_help_email` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `thank_you_from_email` varchar(255) DEFAULT NULL,
  `thank_you_from_name` varchar(255) DEFAULT NULL,
  `thank_you_body` text,
  `created_by_user_id` bigint(20) NOT NULL,
  `min_required_references` int(11) unsigned NOT NULL DEFAULT '3',
  `max_required_references` int(11) unsigned NOT NULL DEFAULT '5',
  `required_reference_type_id` int(11) NOT NULL,
  `viewer_access_right_id` int(11) NOT NULL DEFAULT '1',
  `recruitment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recruitment_id_index` (`recruitment_id`),
  KEY `index_positions_on_required_reference_type_id` (`required_reference_type_id`),
  KEY `index_positions_on_viewer_access_right_id` (`viewer_access_right_id`),
  KEY `index_positions_on_created_by_user_id` (`created_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruitment_specialties`
--

DROP TABLE IF EXISTS `recruitment_specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitment_specialties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_specialty_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code_index` (`recruitment_specialty_type_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2430 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruitment_specialties_recruitments`
--

DROP TABLE IF EXISTS `recruitment_specialties_recruitments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitment_specialties_recruitments` (
  `recruitment_specialty_id` int(11) NOT NULL,
  `recruitment_id` int(11) NOT NULL,
  KEY `recruitment_id_index` (`recruitment_id`),
  KEY `recruitment_specialty_id_recruitment_id_index` (`recruitment_specialty_id`,`recruitment_id`),
  KEY `recruitment_id_recruitment_specialty_id_index` (`recruitment_id`,`recruitment_specialty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruitment_specialty_types`
--

DROP TABLE IF EXISTS `recruitment_specialty_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitment_specialty_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `diversity_data_set_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_recruitment_specialty_types_on_diversity_data_set_id` (`diversity_data_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruitment_titles`
--

DROP TABLE IF EXISTS `recruitment_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitment_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `cto` varchar(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `senate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruitment_titles_recruitments`
--

DROP TABLE IF EXISTS `recruitment_titles_recruitments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitment_titles_recruitments` (
  `recruitment_title_id` int(11) NOT NULL,
  `recruitment_id` int(11) NOT NULL,
  KEY `recruitment_id_index` (`recruitment_id`),
  KEY `recruitment_title_id_recruitment_id_index` (`recruitment_title_id`,`recruitment_id`),
  KEY `recruitment_id_recruitment_title_id_index` (`recruitment_id`,`recruitment_title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recruitments`
--

DROP TABLE IF EXISTS `recruitments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruitments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hiring_type_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `salary_control` varchar(255) DEFAULT NULL,
  `information_url` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `open_date` datetime NOT NULL,
  `close_date` datetime NOT NULL,
  `final_date` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by_user_id` bigint(20) NOT NULL,
  `job_number` varchar(32) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `survey_id` int(11) NOT NULL,
  `search_breadth_id` int(11) NOT NULL,
  `initial_search_allocation_id` int(11) NOT NULL,
  `diversity_data_set_id` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by_user_id` bigint(20) DEFAULT NULL,
  `affirmative_action_goals` varchar(255) DEFAULT NULL,
  `herc_category_id` int(11) DEFAULT NULL,
  `salary_range` varchar(255) DEFAULT NULL,
  `rank_step` varchar(255) DEFAULT NULL,
  `initial_search_outcome_code` varchar(1) DEFAULT NULL,
  `committee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_number_index` (`job_number`),
  KEY `is_active_index` (`is_active`),
  KEY `fk_recruitment_surveys` (`survey_id`),
  KEY `final_date_index` (`final_date`),
  KEY `index_recruitments_on_diversity_data_set_id` (`diversity_data_set_id`),
  KEY `index_recruitments_on_search_breadth_id` (`search_breadth_id`),
  KEY `index_recruitments_on_initial_search_allocation_id` (`initial_search_allocation_id`),
  KEY `index_recruitments_on_hiring_type_id` (`hiring_type_id`),
  KEY `index_recruitments_on_academic_year_id` (`academic_year_id`),
  KEY `index_recruitments_on_created_by_user_id` (`created_by_user_id`),
  KEY `index_recruitments_on_published_at` (`published_at`),
  KEY `index_recruitments_on_committee_id` (`committee_id`),
  CONSTRAINT `fk_recruitment_surveys` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_histories`
--

DROP TABLE IF EXISTS `reference_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_id` int(11) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `legacy_id` int(11) DEFAULT NULL,
  `legacy_key` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `affiliation` varchar(255) NOT NULL,
  `access_key` varchar(128) NOT NULL,
  `legacy_key` varchar(8) DEFAULT NULL,
  `accepted_agreement` tinyint(1) NOT NULL DEFAULT '0',
  `last_notified` datetime DEFAULT NULL,
  `notify_bounced` tinyint(1) DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `legacy_id` int(11) unsigned DEFAULT NULL,
  `inactivated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position_application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_files`
--

DROP TABLE IF EXISTS `report_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `file_content_id` int(11) unsigned DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `label` varchar(15) NOT NULL DEFAULT '',
  `filename` varchar(70) NOT NULL DEFAULT '',
  `content_type` varchar(70) NOT NULL DEFAULT '',
  `respond_to_format` varchar(5) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `report_type` varchar(255) DEFAULT NULL,
  `cloud_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_report_files_on_file_content_id` (`file_content_id`),
  KEY `index_report_files_on_report_id_and_report_type` (`report_id`,`report_type`),
  KEY `index_report_files_on_cloud_key` (`cloud_key`)
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `required_reference_types`
--

DROP TABLE IF EXISTS `required_reference_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `required_reference_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_dates`
--

DROP TABLE IF EXISTS `review_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `public` tinyint(1) DEFAULT '1',
  `creator_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_review_dates_on_recruitment_id` (`recruitment_id`),
  KEY `index_review_dates_on_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revoked_reference_keys`
--

DROP TABLE IF EXISTS `revoked_reference_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revoked_reference_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_key` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_revoked_reference_keys_on_access_key` (`access_key`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tool_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_tool_id` (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `address` text,
  `external_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4775 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_breadths`
--

DROP TABLE IF EXISTS `search_breadths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_breadths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(255) DEFAULT NULL,
  `long_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_plans`
--

DROP TABLE IF EXISTS `search_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) DEFAULT NULL,
  `generated_by_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_reports`
--

DROP TABLE IF EXISTS `search_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) DEFAULT NULL,
  `generated_by_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `effort` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `data` mediumtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=126528 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting_names_user_settings`
--

DROP TABLE IF EXISTS `setting_names_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_names_user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name_id` int(11) DEFAULT NULL,
  `user_setting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_options`
--

DROP TABLE IF EXISTS `survey_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `survey_question_id` int(11) NOT NULL,
  `key` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `descriptor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_options_on_survey_question_id` (`survey_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_question_surveys` (`survey_id`),
  CONSTRAINT `fk_survey_question_surveys` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_report_data`
--

DROP TABLE IF EXISTS `survey_report_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_report_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_survey_report_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  `survey_option_id` int(11) NOT NULL,
  `responses` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_report_data_on_old_survey_report_id` (`old_survey_report_id`),
  KEY `index_survey_report_data_on_survey_question_id` (`survey_question_id`),
  KEY `index_survey_report_data_on_survey_option_id` (`survey_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_reports`
--

DROP TABLE IF EXISTS `survey_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_response_count` int(11) NOT NULL DEFAULT '0',
  `other_applicant_count` int(11) NOT NULL DEFAULT '0',
  `basic_qualifications_are_met` int(11) NOT NULL DEFAULT '0',
  `shortlisted_applicant_count` int(11) NOT NULL DEFAULT '0',
  `recruitment_id` int(11) DEFAULT NULL,
  `hiring_type_id` int(11) DEFAULT NULL,
  `old_survey_report_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `basic_qualifications_are_unmet` int(11) DEFAULT NULL,
  `basic_qualifications_are_unknown` int(11) DEFAULT NULL,
  `show_meets_basic_qualifications` tinyint(1) DEFAULT '0',
  `serious_consideration_applicant_count` int(11) DEFAULT NULL,
  `basic_qualifications_are_unmet_with_survey` int(11) DEFAULT '0',
  `basic_qualifications_are_unknown_with_survey` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_survey_reports_on_hiring_type_id` (`hiring_type_id`),
  KEY `index_survey_reports_on_recruitment_id` (`recruitment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_responses`
--

DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruitment_id` int(11) NOT NULL,
  `ip_address` varchar(128) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_initial` varchar(255) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `ethnicity` varchar(32) DEFAULT NULL,
  `ad_source` varchar(255) DEFAULT NULL,
  `degree_year` varchar(255) DEFAULT NULL,
  `degree_name` varchar(255) DEFAULT NULL,
  `degree_other` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `given_job_number` varchar(64) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `veteran_status` varchar(255) DEFAULT NULL,
  `disability_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_responses_on_recruitment_id` (`recruitment_id`),
  KEY `index_survey_responses_on_position_application_id` (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13944 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `version` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uploaded_files`
--

DROP TABLE IF EXISTS `uploaded_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploaded_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_by_user_id` bigint(20) DEFAULT NULL,
  `application_file_type_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `description` text,
  `filename` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned NOT NULL,
  `file_content_id` int(11) unsigned DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` int(11) unsigned NOT NULL,
  `provided_content_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'ApplicationFile',
  `application_id` int(11) DEFAULT NULL,
  `ad_source_id` int(11) DEFAULT NULL,
  `cloud_key` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`,`resource_type`),
  KEY `index_application_files_on_created_by_user_id` (`created_by_user_id`),
  KEY `index_application_files_on_file_content_id` (`file_content_id`),
  KEY `index_application_files_on_application_file_type_id` (`application_file_type_id`),
  KEY `index_application_files_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_uploaded_files_on_position_application_id` (`application_id`),
  KEY `index_uploaded_files_on_cloud_key` (`cloud_key`(36))
) ENGINE=InnoDB AUTO_INCREMENT=17792 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_demographic_data`
--

DROP TABLE IF EXISTS `user_demographic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_demographic_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `ethnicity` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `member_type` varchar(20) NOT NULL DEFAULT 'faculty',
  PRIMARY KEY (`id`),
  KEY `index_user_demographic_data_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_recruitment_settings`
--

DROP TABLE IF EXISTS `user_recruitment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_recruitment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `last_applicant_list_access` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_recruitment_settings_on_user_id` (`user_id`),
  KEY `index_user_recruitment_settings_on_recruitment_id` (`recruitment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  `resource_type` varchar(128) NOT NULL,
  `resource_id` int(11) unsigned DEFAULT NULL,
  `auto` tinyint(1) DEFAULT '0',
  `inherited_from_department_role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `resource_type` (`resource_type`,`resource_id`),
  KEY `index_user_roles_on_inherited_from_department_role_id` (`inherited_from_department_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` blob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_settings_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `email_address` varchar(64) NOT NULL DEFAULT '',
  `department` varchar(64) NOT NULL DEFAULT '',
  `alias` varchar(64) NOT NULL,
  `last_first_name` varchar(64) NOT NULL DEFAULT '',
  `department_code` varchar(32) NOT NULL DEFAULT '',
  `student_id` varchar(16) NOT NULL DEFAULT '',
  `employee_id` varchar(16) NOT NULL DEFAULT '',
  `campus_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `faculty_level` varchar(16) DEFAULT '',
  `external_user_id` varchar(64) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`campus_id`),
  UNIQUE KEY `external_user_id_index` (`external_user_id`),
  KEY `alias` (`alias`,`student_id`,`employee_id`),
  KEY `student_id` (`student_id`),
  KEY `email_address` (`email_address`),
  KEY `campus_id` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=730 DEFAULT CHARSET=utf8 COMMENT='UCI Directory Mirror';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viewer_access_rights`
--

DROP TABLE IF EXISTS `viewer_access_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer_access_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waiver_titles`
--

DROP TABLE IF EXISTS `waiver_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waiver_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waiver_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_waiver_titles_on_waiver_id` (`waiver_id`),
  KEY `index_waiver_titles_on_title_id` (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waivers`
--

DROP TABLE IF EXISTS `waivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `created_by_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `affirmative_action_goals` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_waivers_on_department_id` (`department_id`),
  KEY `index_waivers_on_academic_year_id` (`academic_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-04 14:08:29
