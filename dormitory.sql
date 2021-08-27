/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80023
Source Host           : localhost:3306
Source Database       : dormitory

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2021-08-27 16:26:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `a_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'lw666', '52537272', '李维', '13152230488');
INSERT INTO `t_admin` VALUES ('2', 'WANG', 'k4k56', '王鸿', '13187713952');

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `c_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` char(4) NOT NULL COMMENT '班级名',
  `major` varchar(20) NOT NULL COMMENT '专业名',
  `counsellor_name` varchar(20) DEFAULT NULL COMMENT '辅导员姓名',
  `counsellor_phone` char(11) NOT NULL COMMENT '辅导员手机号码',
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `counsellor_phone` (`counsellor_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('1', '1701', '化工', '刘晓芳', '13874736688');
INSERT INTO `t_class` VALUES ('2', '1702', '化工', '张译衫', '13930536088');
INSERT INTO `t_class` VALUES ('3', '1801', '计算机', '韩桓', '13128470406');
INSERT INTO `t_class` VALUES ('4', '1802', '计算机', '蒋艳贞', '13450743790');
INSERT INTO `t_class` VALUES ('5', '1801', '数学', '尤洲信', '13868307763');
INSERT INTO `t_class` VALUES ('6', '1802', '数学', '刘朔', '15169406224');
INSERT INTO `t_class` VALUES ('7', '1803', '数学', '张友佳', '13950623006');
INSERT INTO `t_class` VALUES ('8', '1804', '数学', '欧阳春华', '13426329865');
INSERT INTO `t_class` VALUES ('9', '1801', '化工', '李崞原', '13822650945');
INSERT INTO `t_class` VALUES ('10', '1802', '化工', '何艾', '15846200314');
INSERT INTO `t_class` VALUES ('11', '1803', '化工', '沈斌儒', '13423262509');

-- ----------------------------
-- Table structure for t_repair
-- ----------------------------
DROP TABLE IF EXISTS `t_repair`;
CREATE TABLE `t_repair` (
  `re_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `r_id` int DEFAULT NULL COMMENT '房间id',
  `re_er_id` int DEFAULT NULL COMMENT '维修人员id',
  `message` text COMMENT '维修描述',
  `repair_time` datetime DEFAULT NULL COMMENT '维修时间',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='维修表';

-- ----------------------------
-- Records of t_repair
-- ----------------------------
INSERT INTO `t_repair` VALUES ('1', '19', '1', '电风扇线路老化', '2019-12-23 00:00:00');
INSERT INTO `t_repair` VALUES ('2', '8', '1', '插座线路老化', '2020-04-08 00:00:00');
INSERT INTO `t_repair` VALUES ('3', '33', '1', '电风扇线路老化', '2019-12-26 00:00:00');
INSERT INTO `t_repair` VALUES ('4', '16', '2', '下水道堵塞', '2020-02-10 00:00:00');

-- ----------------------------
-- Table structure for t_repairer
-- ----------------------------
DROP TABLE IF EXISTS `t_repairer`;
CREATE TABLE `t_repairer` (
  `re_er_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` char(11) DEFAULT NULL COMMENT '维修人员手机号码',
  `name` varchar(20) DEFAULT NULL COMMENT '维修人员姓名',
  PRIMARY KEY (`re_er_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_repairer
-- ----------------------------
INSERT INTO `t_repairer` VALUES ('1', '15941614102', '郑桓隆');
INSERT INTO `t_repairer` VALUES ('2', '13821073405', '李琛');

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `r_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `building` varchar(20) NOT NULL COMMENT '宿舍楼',
  `number` char(3) NOT NULL COMMENT '房间号',
  `bed_total` int DEFAULT '0' COMMENT '床位总数',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='房间表';

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('1', '3号楼', '101', '4');
INSERT INTO `t_room` VALUES ('2', '3号楼', '102', '4');
INSERT INTO `t_room` VALUES ('3', '3号楼', '103', '4');
INSERT INTO `t_room` VALUES ('4', '3号楼', '104', '4');
INSERT INTO `t_room` VALUES ('5', '3号楼', '105', '4');
INSERT INTO `t_room` VALUES ('6', '3号楼', '106', '4');
INSERT INTO `t_room` VALUES ('7', '3号楼', '107', '4');
INSERT INTO `t_room` VALUES ('8', '3号楼', '108', '4');
INSERT INTO `t_room` VALUES ('9', '3号楼', '109', '4');
INSERT INTO `t_room` VALUES ('10', '3号楼', '110', '4');
INSERT INTO `t_room` VALUES ('11', '3号楼', '111', '4');
INSERT INTO `t_room` VALUES ('12', '3号楼', '112', '4');
INSERT INTO `t_room` VALUES ('13', '3号楼', '201', '4');
INSERT INTO `t_room` VALUES ('14', '3号楼', '202', '4');
INSERT INTO `t_room` VALUES ('15', '3号楼', '203', '4');
INSERT INTO `t_room` VALUES ('16', '3号楼', '204', '4');
INSERT INTO `t_room` VALUES ('17', '3号楼', '205', '4');
INSERT INTO `t_room` VALUES ('18', '3号楼', '206', '4');
INSERT INTO `t_room` VALUES ('19', '3号楼', '207', '4');
INSERT INTO `t_room` VALUES ('20', '3号楼', '208', '4');
INSERT INTO `t_room` VALUES ('21', '3号楼', '209', '4');
INSERT INTO `t_room` VALUES ('22', '3号楼', '210', '4');
INSERT INTO `t_room` VALUES ('23', '3号楼', '211', '4');
INSERT INTO `t_room` VALUES ('24', '3号楼', '212', '4');
INSERT INTO `t_room` VALUES ('25', '1号楼', '101', '4');
INSERT INTO `t_room` VALUES ('26', '1号楼', '102', '4');
INSERT INTO `t_room` VALUES ('27', '1号楼', '103', '4');
INSERT INTO `t_room` VALUES ('28', '1号楼', '104', '4');
INSERT INTO `t_room` VALUES ('29', '1号楼', '105', '4');
INSERT INTO `t_room` VALUES ('30', '1号楼', '106', '4');
INSERT INTO `t_room` VALUES ('31', '1号楼', '107', '4');
INSERT INTO `t_room` VALUES ('32', '1号楼', '108', '4');
INSERT INTO `t_room` VALUES ('33', '1号楼', '109', '4');
INSERT INTO `t_room` VALUES ('34', '1号楼', '110', '4');
INSERT INTO `t_room` VALUES ('35', '1号楼', '111', '4');
INSERT INTO `t_room` VALUES ('36', '1号楼', '112', '4');
INSERT INTO `t_room` VALUES ('37', '1号楼', '113', '4');
INSERT INTO `t_room` VALUES ('38', '1号楼', '114', '4');
INSERT INTO `t_room` VALUES ('39', '1号楼', '115', '4');
INSERT INTO `t_room` VALUES ('40', '3号楼', '301', '4');
INSERT INTO `t_room` VALUES ('42', '3号楼', '302', '4');

-- ----------------------------
-- Table structure for t_room_in
-- ----------------------------
DROP TABLE IF EXISTS `t_room_in`;
CREATE TABLE `t_room_in` (
  `r_in_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `r_id` int DEFAULT NULL COMMENT '房间id',
  `s_id` int DEFAULT NULL COMMENT '学生id',
  `bed_number` int DEFAULT NULL COMMENT '床位号',
  PRIMARY KEY (`r_in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='入住信息表';

-- ----------------------------
-- Records of t_room_in
-- ----------------------------
INSERT INTO `t_room_in` VALUES ('1', '1', '3', '1');
INSERT INTO `t_room_in` VALUES ('2', '1', '4', '2');
INSERT INTO `t_room_in` VALUES ('3', '1', '5', '3');
INSERT INTO `t_room_in` VALUES ('4', '1', '6', '4');
INSERT INTO `t_room_in` VALUES ('5', '2', '7', '1');
INSERT INTO `t_room_in` VALUES ('6', '2', '10', '2');
INSERT INTO `t_room_in` VALUES ('7', '2', '11', '3');
INSERT INTO `t_room_in` VALUES ('8', '2', '14', '4');
INSERT INTO `t_room_in` VALUES ('9', '3', '17', '1');
INSERT INTO `t_room_in` VALUES ('10', '3', '21', '2');
INSERT INTO `t_room_in` VALUES ('11', '3', '24', '3');
INSERT INTO `t_room_in` VALUES ('12', '3', '25', '4');
INSERT INTO `t_room_in` VALUES ('13', '4', '26', '1');
INSERT INTO `t_room_in` VALUES ('14', '4', '28', '2');
INSERT INTO `t_room_in` VALUES ('15', '4', '29', '3');
INSERT INTO `t_room_in` VALUES ('16', '4', '33', '4');
INSERT INTO `t_room_in` VALUES ('17', '5', '37', '1');
INSERT INTO `t_room_in` VALUES ('18', '5', '39', '2');
INSERT INTO `t_room_in` VALUES ('19', '5', '42', '3');
INSERT INTO `t_room_in` VALUES ('20', '25', '1', '1');
INSERT INTO `t_room_in` VALUES ('21', '25', '2', '2');
INSERT INTO `t_room_in` VALUES ('22', '25', '8', '3');
INSERT INTO `t_room_in` VALUES ('23', '25', '9', '4');
INSERT INTO `t_room_in` VALUES ('24', '26', '12', '1');
INSERT INTO `t_room_in` VALUES ('25', '26', '13', '2');
INSERT INTO `t_room_in` VALUES ('26', '26', '15', '3');
INSERT INTO `t_room_in` VALUES ('27', '26', '16', '4');
INSERT INTO `t_room_in` VALUES ('28', '27', '18', '1');
INSERT INTO `t_room_in` VALUES ('29', '27', '19', '2');
INSERT INTO `t_room_in` VALUES ('30', '27', '20', '3');
INSERT INTO `t_room_in` VALUES ('31', '27', '22', '4');
INSERT INTO `t_room_in` VALUES ('32', '28', '23', '1');
INSERT INTO `t_room_in` VALUES ('33', '28', '27', '2');
INSERT INTO `t_room_in` VALUES ('34', '28', '30', '3');
INSERT INTO `t_room_in` VALUES ('35', '28', '31', '4');
INSERT INTO `t_room_in` VALUES ('36', '29', '32', '1');
INSERT INTO `t_room_in` VALUES ('37', '29', '34', '2');
INSERT INTO `t_room_in` VALUES ('38', '29', '35', '3');
INSERT INTO `t_room_in` VALUES ('39', '29', '36', '4');
INSERT INTO `t_room_in` VALUES ('40', '30', '38', '1');
INSERT INTO `t_room_in` VALUES ('41', '30', '40', '2');
INSERT INTO `t_room_in` VALUES ('42', '30', '41', '3');
INSERT INTO `t_room_in` VALUES ('43', '30', '43', '4');
INSERT INTO `t_room_in` VALUES ('45', '31', '50', '1');

-- ----------------------------
-- Table structure for t_room_in_change
-- ----------------------------
DROP TABLE IF EXISTS `t_room_in_change`;
CREATE TABLE `t_room_in_change` (
  `r_in_change_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `s_id` int DEFAULT NULL COMMENT '学生id',
  `old_r_ld` int DEFAULT NULL COMMENT '原房间id',
  `new_r_ld` int DEFAULT NULL COMMENT '新房间id',
  `old_bed_number` int DEFAULT NULL COMMENT '原床位号',
  `new_bed_number` int DEFAULT NULL COMMENT '新床位号',
  PRIMARY KEY (`r_in_change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入住信息变更表';

-- ----------------------------
-- Records of t_room_in_change
-- ----------------------------

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `s_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `id` char(9) NOT NULL COMMENT '学号',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` char(1) NOT NULL COMMENT '性别',
  `age` int NOT NULL COMMENT '年龄',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `c_id` int DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', '201760559', '魏乾', '男', '22', '13727398549', '1');
INSERT INTO `t_student` VALUES ('2', '201728370', '黄坚', '男', '22', '13680704385', '1');
INSERT INTO `t_student` VALUES ('3', '201783827', '冯晶', '女', '22', '13476646454', '1');
INSERT INTO `t_student` VALUES ('4', '201794621', '范萍', '女', '22', '13465063528', '1');
INSERT INTO `t_student` VALUES ('5', '201783988', '陈冰华', '女', '22', '13228940548', '1');
INSERT INTO `t_student` VALUES ('6', '201786598', '陈瑗芝', '女', '22', '13828427663', '1');
INSERT INTO `t_student` VALUES ('7', '201750977', '方娅婕', '女', '22', '13425099751', '1');
INSERT INTO `t_student` VALUES ('8', '201792810', '傅晟', '男', '22', '13202927314', '1');
INSERT INTO `t_student` VALUES ('9', '201718175', '郑琨臣', '男', '22', '13459570204', '1');
INSERT INTO `t_student` VALUES ('10', '201752294', '周莉', '女', '22', '13191575498', '1');
INSERT INTO `t_student` VALUES ('11', '201794081', '周倩娴', '女', '22', '13918237480', '1');
INSERT INTO `t_student` VALUES ('12', '201722740', '郑奎山', '男', '22', '13899514001', '1');
INSERT INTO `t_student` VALUES ('13', '201717585', '韩上凌', '男', '22', '13145151714', '1');
INSERT INTO `t_student` VALUES ('14', '201774149', '黄玉珍', '女', '22', '13131145613', '1');
INSERT INTO `t_student` VALUES ('15', '201799350', '蒋域上', '男', '22', '13284865471', '1');
INSERT INTO `t_student` VALUES ('16', '201740872', '许乾琨', '男', '22', '13936933238', '1');
INSERT INTO `t_student` VALUES ('17', '201722443', '沈月', '女', '22', '13686236295', '1');
INSERT INTO `t_student` VALUES ('18', '201715135', '孙昭镜', '男', '22', '13898595606', '1');
INSERT INTO `t_student` VALUES ('19', '201799868', '傅逸津', '男', '22', '13954966205', '1');
INSERT INTO `t_student` VALUES ('20', '201760573', '沈茂彧', '男', '22', '13224356000', '1');
INSERT INTO `t_student` VALUES ('21', '201772854', '张慧', '女', '22', '13284548175', '1');
INSERT INTO `t_student` VALUES ('22', '201769728', '何鑫', '男', '22', '13587351224', '1');
INSERT INTO `t_student` VALUES ('23', '201747196', '朱达逸', '男', '22', '13753620171', '1');
INSERT INTO `t_student` VALUES ('24', '201774846', '黄菊婷', '女', '22', '13862363168', '1');
INSERT INTO `t_student` VALUES ('25', '201716914', '张倩', '女', '22', '13275975627', '1');
INSERT INTO `t_student` VALUES ('26', '201727065', '孙宁勤', '女', '22', '13680864696', '1');
INSERT INTO `t_student` VALUES ('27', '201759789', '苏殿中', '男', '22', '13252563451', '1');
INSERT INTO `t_student` VALUES ('28', '201724207', '吕露梦', '女', '22', '13194638313', '1');
INSERT INTO `t_student` VALUES ('29', '201763366', '张珍丽', '女', '22', '13543580392', '1');
INSERT INTO `t_student` VALUES ('30', '201772939', '严凌逵', '男', '22', '13789333020', '1');
INSERT INTO `t_student` VALUES ('31', '201760316', '陈锋霄', '男', '22', '13728528393', '1');
INSERT INTO `t_student` VALUES ('32', '201714938', '郑钟', '男', '22', '13905458144', '1');
INSERT INTO `t_student` VALUES ('33', '201726952', '张荷媛', '女', '22', '13128103633', '1');
INSERT INTO `t_student` VALUES ('34', '201771308', '沈禹', '男', '22', '13501315022', '1');
INSERT INTO `t_student` VALUES ('35', '201756329', '秦鑫', '男', '22', '13470398856', '1');
INSERT INTO `t_student` VALUES ('36', '201778267', '郑瑞殿', '男', '22', '13365534587', '1');
INSERT INTO `t_student` VALUES ('37', '201714335', '秦月蓓', '女', '22', '13960322353', '1');
INSERT INTO `t_student` VALUES ('38', '201750401', '秦泽', '男', '22', '13599699671', '1');
INSERT INTO `t_student` VALUES ('39', '201729308', '周雅梦', '女', '22', '13996260187', '1');
INSERT INTO `t_student` VALUES ('40', '201732853', '许洋权', '男', '22', '13341956501', '1');
INSERT INTO `t_student` VALUES ('41', '201753216', '王殿桓', '男', '22', '13801935932', '1');
INSERT INTO `t_student` VALUES ('42', '201738378', '韩爽晓', '女', '22', '13102475814', '1');
INSERT INTO `t_student` VALUES ('43', '201771110', '傅浩上', '男', '22', '13468929983', '1');
INSERT INTO `t_student` VALUES ('50', '201896310', '胡田', '男', '21', '15778604223', '5');
INSERT INTO `t_student` VALUES ('54', '201892366', '韩忠硕', '男', '21', '13421605865', '5');
INSERT INTO `t_student` VALUES ('55', '201891022', '黄馥卿', '女', '21', '15131620887', '6');

-- ----------------------------
-- Table structure for t_visitor
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor`;
CREATE TABLE `t_visitor` (
  `v_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) NOT NULL COMMENT '访客姓名',
  `phone` char(11) NOT NULL COMMENT '访客手机号码',
  `r_id` int DEFAULT NULL COMMENT '房间id',
  `come_time` datetime DEFAULT NULL COMMENT '到来时间',
  `leave_time` datetime DEFAULT NULL COMMENT '离开时间',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='访客表';

-- ----------------------------
-- Records of t_visitor
-- ----------------------------
INSERT INTO `t_visitor` VALUES ('1', '严瑗', '13722762078', '29', '2020-06-02 18:22:00', '2020-06-02 18:35:00');
INSERT INTO `t_visitor` VALUES ('2', '许域', '15257311436', '16', '2020-03-17 12:10:00', '2020-03-17 13:54:00');
