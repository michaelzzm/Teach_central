/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : teach_central

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-10-08 00:55:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tc_attach`
-- ----------------------------
DROP TABLE IF EXISTS `tc_attach`;
CREATE TABLE `tc_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` varchar(20) NOT NULL,
  `extension` varchar(20) NOT NULL,
  `savepath` varchar(255) NOT NULL,
  `savename` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `hash` varchar(32) NOT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `version` smallint(3) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tc_attach
-- ----------------------------
INSERT INTO `tc_attach` VALUES ('2', '1Lesson Plan SDUST 2013 - Kylie.pdf', 'application/pdf', '194959', 'pdf', 'michael/', '2010_lesson_plan.pdf', '1', '1412586466', '5f4cf240056ea35d90ad959551b22e89', '0', '0', '1412586466', '1');
INSERT INTO `tc_attach` VALUES ('4', '2010_lesson_plan.pdf', 'application/pdf', '194959', 'pdf', 'michael/', '2014_Lesson_Plan.pdf', '1', '1412699044', '5f4cf240056ea35d90ad959551b22e89', '0', '0', '1412699044', '1');

-- ----------------------------
-- Table structure for `tc_group`
-- ----------------------------
DROP TABLE IF EXISTS `tc_group`;
CREATE TABLE `tc_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tc_group
-- ----------------------------

-- ----------------------------
-- Table structure for `tc_user`
-- ----------------------------
DROP TABLE IF EXISTS `tc_user`;
CREATE TABLE `tc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `group_id` int(11) NOT NULL,
  `login_count` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tc_user
-- ----------------------------
INSERT INTO `tc_user` VALUES ('1', 'michael', '7c4a8d09ca3762af61e59520943dc26494f8941b', '0', '0', '1');
