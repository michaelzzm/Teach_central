/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : teach_central

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-10-07 22:01:57
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tc_attach
-- ----------------------------
INSERT INTO `tc_attach` VALUES ('1', '1Lesson Plan SDUST 2013 - Kylie.pdf', 'application/pdf', '194959', 'pdf', 'michael/', '2010_lesson_plan.pdf', '1', '1412586135', '5f4cf240056ea35d90ad959551b22e89', '0', '0', '1412586135', '1');
INSERT INTO `tc_attach` VALUES ('2', '1Lesson Plan SDUST 2013 - Kylie.pdf', 'application/pdf', '194959', 'pdf', 'michael/', '2010_lesson_plan.pdf', '1', '1412586466', '5f4cf240056ea35d90ad959551b22e89', '0', '0', '1412586466', '1');
