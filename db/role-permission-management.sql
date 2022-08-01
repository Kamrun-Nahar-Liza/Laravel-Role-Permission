/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.21-MariaDB : Database - role-permission-management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`role-permission-management` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `role-permission-management`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',1),(1,'App\\Models\\User',4),(2,'App\\Models\\User',2),(2,'App\\Models\\User',3);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'User_all','web','2022-07-28 09:03:43','2022-07-31 05:44:00'),(3,'Dashboard','web','2022-07-28 09:19:32','2022-07-28 09:19:32'),(4,'Permission_all','web','2022-07-31 05:45:03','2022-07-31 05:45:03'),(5,'login','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(6,'logout','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(7,'register','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(8,'password.request','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(9,'password.email','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(10,'password.reset','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(11,'password.update','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(12,'password.confirm','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(13,'home','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(14,'roles.index','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(15,'roles.create','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(16,'roles.store','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(17,'roles.show','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(18,'roles.edit','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(19,'roles.update','web','2022-07-31 06:47:29','2022-07-31 06:47:29'),(20,'roles.destroy','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(21,'users.index','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(22,'users.create','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(23,'users.store','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(24,'users.show','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(25,'users.edit','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(26,'users.update','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(27,'users.destroy','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(28,'permissions.index','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(29,'permissions.create','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(30,'permissions.store','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(31,'permissions.show','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(32,'permissions.edit','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(33,'permissions.update','web','2022-07-31 06:47:30','2022-07-31 06:47:30'),(34,'permissions.destroy','web','2022-07-31 06:47:30','2022-07-31 06:47:30');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (1,2),(1,3),(3,1),(3,2),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'Admin','web','2022-07-28 08:51:04','2022-07-28 08:51:04'),(2,'Software Developer','web','2022-07-28 08:52:03','2022-07-28 08:54:09'),(3,'QA','web','2022-07-28 08:55:26','2022-07-28 08:55:26');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`phone_number`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'System Admin','admin@gmail.com','',NULL,'$2y$10$JfGWiVMYAO8lasYp4Dl5Ve6AIm938JvgIbYr0XGEK5vSyZ5XpcZbK',NULL,'2022-07-28 08:50:13','2022-07-28 08:50:13'),(2,'Test User','test@gmail.com','01876234529',NULL,'$2y$10$/V06RbVH5JwUntYRjo1ZqeDJMdafLeyjboK6KKrjFGM6bOKYNEdXO',NULL,'2022-07-28 08:56:03','2022-08-01 06:54:12'),(3,'Rina','rina@gmail.com','01777031111',NULL,'$2y$10$sCfvV.gqbzXDPZnzPly.feRGzGPMWWm3BPFo5TTXsNrsA4XpWNhDe',NULL,'2022-08-01 06:17:21','2022-08-01 08:44:49'),(4,'Tatiana Mitchell','lofe@mailinator.com','01777011117',NULL,'$2y$10$vJhLeyDZvevsjOK0Gqd33umSDXOmVIvSOEIoRgJb48NpAp0Q1xirO',NULL,'2022-08-01 06:47:17','2022-08-01 08:44:19');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
