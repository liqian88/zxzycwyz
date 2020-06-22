/*
Navicat MySQL Data Transfer

Source Server         : localMySQL
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : db_ebook

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2020-06-22 11:27:12
*/
CREATE DATABASE db_ebook;
SET FOREIGN_KEY_CHECKS=0;
use db_ebook;
-- ----------------------------
-- Table structure for `t_bigtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES ('1', '根茎类', '<p>根茎类</p>');
INSERT INTO `t_bigtype` VALUES ('2', '果实籽仁类', '<p>果实籽仁类</p>');
INSERT INTO `t_bigtype` VALUES ('3', '全草类', '<p>全草类</p>');
INSERT INTO `t_bigtype` VALUES ('4', '花类', '<p>花类</p>');
INSERT INTO `t_bigtype` VALUES ('5', '叶类', '<p>叶类</p>');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `orderNo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '0', '2018-06-26 18:26:39', '20180626062639', '4', '3');
INSERT INTO `t_order` VALUES ('2', '0', '2018-06-26 18:41:05', '20180626064105', '2', '3');
INSERT INTO `t_order` VALUES ('3', '0', '2018-06-26 18:42:30', '20180626064230', '1', '3');
INSERT INTO `t_order` VALUES ('4', '0', '2018-06-26 18:45:12', '20180626064512', '1', '3');
INSERT INTO `t_order` VALUES ('5', '0', '2018-06-26 18:46:49', '20180626064649', '1', '3');
INSERT INTO `t_order` VALUES ('6', '108', '2018-06-28 14:09:09', '20180628020909', '3', '3');
INSERT INTO `t_order` VALUES ('7', '136', '2018-06-28 18:30:37', '20180628063037', '3', '1');
INSERT INTO `t_order` VALUES ('8', '200', '2018-07-01 21:05:46', '20180701090546', '1', '3');
INSERT INTO `t_order` VALUES ('9', '255', '2018-07-01 21:15:11', '20180701091511', '4', '3');
INSERT INTO `t_order` VALUES ('10', '267', '2018-07-07 11:07:44', '20180707110744', '2', '3');
INSERT INTO `t_order` VALUES ('11', '159', '2018-07-07 11:47:18', '20180707114718', '1', '3');
INSERT INTO `t_order` VALUES ('12', '202', '2018-07-09 22:10:59', '20180709101058', '1', '12');
INSERT INTO `t_order` VALUES ('13', '180', '2018-07-13 21:59:20', '20180713095919', '3', '15');
INSERT INTO `t_order` VALUES ('14', '138', '2018-07-14 22:51:07', '20180714105106', '3', '17');
INSERT INTO `t_order` VALUES ('15', '45.1', '2020-01-20 15:50:35', '20200120035035', '1', '18');
INSERT INTO `t_order` VALUES ('16', '51', '2020-02-07 13:26:14', '20200207012614', '1', '7');
INSERT INTO `t_order` VALUES ('17', '251', '2020-06-13 13:48:23', '20200613014823', '1', '3');
INSERT INTO `t_order` VALUES ('18', '45.1', '2020-06-14 23:53:04', '20200614115304', '1', '3');

-- ----------------------------
-- Table structure for `t_order_zyc`
-- ----------------------------
DROP TABLE IF EXISTS `t_order_zyc`;
CREATE TABLE `t_order_zyc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `zycId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order_zyc
-- ----------------------------
INSERT INTO `t_order_zyc` VALUES ('1', '2', '1', '4');
INSERT INTO `t_order_zyc` VALUES ('2', '1', '1', '3');
INSERT INTO `t_order_zyc` VALUES ('3', '1', '2', '6');
INSERT INTO `t_order_zyc` VALUES ('4', '3', '3', '5');
INSERT INTO `t_order_zyc` VALUES ('5', '2', '4', '3');
INSERT INTO `t_order_zyc` VALUES ('6', '1', '5', '6');
INSERT INTO `t_order_zyc` VALUES ('7', '1', '6', '5');
INSERT INTO `t_order_zyc` VALUES ('8', '1', '6', '8');
INSERT INTO `t_order_zyc` VALUES ('9', '1', '7', '5');
INSERT INTO `t_order_zyc` VALUES ('10', '1', '7', '7');
INSERT INTO `t_order_zyc` VALUES ('11', '1', '7', '3');
INSERT INTO `t_order_zyc` VALUES ('12', '2', '8', '3');
INSERT INTO `t_order_zyc` VALUES ('13', '2', '8', '9');
INSERT INTO `t_order_zyc` VALUES ('14', '2', '9', '4');
INSERT INTO `t_order_zyc` VALUES ('15', '1', '9', '6');
INSERT INTO `t_order_zyc` VALUES ('16', '2', '10', '4');
INSERT INTO `t_order_zyc` VALUES ('17', '1', '10', '3');
INSERT INTO `t_order_zyc` VALUES ('18', '1', '11', '3');
INSERT INTO `t_order_zyc` VALUES ('19', '1', '11', '4');
INSERT INTO `t_order_zyc` VALUES ('20', '3', '12', '3');
INSERT INTO `t_order_zyc` VALUES ('21', '1', '12', '5');
INSERT INTO `t_order_zyc` VALUES ('22', '2', '13', '3');
INSERT INTO `t_order_zyc` VALUES ('23', '2', '13', '6');
INSERT INTO `t_order_zyc` VALUES ('24', '2', '14', '3');
INSERT INTO `t_order_zyc` VALUES ('25', '1', '14', '7');
INSERT INTO `t_order_zyc` VALUES ('26', '1', '15', '10');
INSERT INTO `t_order_zyc` VALUES ('27', '1', '16', '3');
INSERT INTO `t_order_zyc` VALUES ('28', '3', '17', '3');
INSERT INTO `t_order_zyc` VALUES ('29', '2', '17', '9');
INSERT INTO `t_order_zyc` VALUES ('30', '1', '18', '10');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `zid` int(11) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------
INSERT INTO `t_shopcart` VALUES ('11', '3', '5', '1');
INSERT INTO `t_shopcart` VALUES ('12', '6', '4', '2');
INSERT INTO `t_shopcart` VALUES ('13', '6', '2', '1');

-- ----------------------------
-- Table structure for `t_smalltype`
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `bigTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES ('1', 'A', '<p>根茎类首字母为A</p>', '1');
INSERT INTO `t_smalltype` VALUES ('2', 'B', '<p>根茎类首字母为B</p>', '1');
INSERT INTO `t_smalltype` VALUES ('3', 'C', '<p>根茎类首字母为C</p>', '1');
INSERT INTO `t_smalltype` VALUES ('4', 'D', '<p>根茎类首字母为D</p>', '1');
INSERT INTO `t_smalltype` VALUES ('5', 'B', '<p>果实籽仁类首字母为B</p>', '2');
INSERT INTO `t_smalltype` VALUES ('6', 'L', '<p>果实籽仁类首字母为L</p>', '2');
INSERT INTO `t_smalltype` VALUES ('7', 'M', '<p>花类首字母为M</p>', '4');
INSERT INTO `t_smalltype` VALUES ('8', 'B', '<p>全草类首字母为B</p>', '3');
INSERT INTO `t_smalltype` VALUES ('9', 'A', '<p>叶类首字母为A</p>', '5');
INSERT INTO `t_smalltype` VALUES ('10', 'H', '<p>果实籽仁类首字母为H</p>', '2');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trueName` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `identityCode` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '张三', 'admin', '123456', '男', '2018-06-22', '21010420180622', 'zs@sina.com', '18888888888', '火星', '2');
INSERT INTO `t_user` VALUES ('3', '贾斌1', 'binbin', '1231', '女', '2018-06-26', '210104198205193711', 'kyu1@sina.com', '15505258141', 'dfgds1', '1');
INSERT INTO `t_user` VALUES ('4', '三', '小三', '123', '男', '2018-06-26', '123456789012345678', 'kyu@sina.com', '12345678901', 'dfgds', '1');
INSERT INTO `t_user` VALUES ('5', '李四', '小四', '123', '男', '2018-06-26', '123456789012345678', 'kyu@sina.com', '12345678901', 'dfgds', '1');
INSERT INTO `t_user` VALUES ('6', 'd', 'd', 'd', '男', '2018-06-12', '123456789012345678', 'kyu@sina.com', '12345678901', 'd', '1');
INSERT INTO `t_user` VALUES ('7', 'e', 'e', 'e', '男', '2018-06-12', '123456789012345678', 'kyu@sina.com', '12345678901', 'e', '1');
INSERT INTO `t_user` VALUES ('11', '发给2', '风格化2', '342', '女', '2018-07-01', '210104198205193712', '2kyu@sina.com', '234534532', '添加对方国家和地方2', '1');
INSERT INTO `t_user` VALUES ('12', 'i三', 'zhangsan', '123', '男', '2018-07-26', '123456789034567890', '232@qq.com', '11111111111', '23', '1');
INSERT INTO `t_user` VALUES ('13', '32', '32', '32', '男', '2018-06-27', '332', '323a@qq.com', '32', '32', '1');
INSERT INTO `t_user` VALUES ('14', '二小', 'abcd', '1234', '男', '2018-07-11', '123456789034567890', '21312@qq.com', '11111111111', 'safsad', '1');
INSERT INTO `t_user` VALUES ('15', '牛牛', 'niuniu', '123456', '男', '2018-07-13', '123456789034567890', '21423@qq.com', '11111111111', 'safsad', '1');
INSERT INTO `t_user` VALUES ('16', '32', '32', '32', '男', '2018-07-04', '32', '323a@qq.com', '32', '32', '1');
INSERT INTO `t_user` VALUES ('17', '先111', 'qq1234', '1234', '男', '2018-07-18', '123456789034567890', '21423@qq.com', '11111111111', 'safsad', '1');
INSERT INTO `t_user` VALUES ('18', 'lyj', 'LYJ', '12345678', '女', '2020-01-29', '420302199904080022', '2679586559@qq.com', '15271847985', '99', '1');
INSERT INTO `t_user` VALUES ('19', 'lq', 'lq', '123', '男', '2020-06-22', '123456789087654321', 'lq@qq.com', '12345678901', '水星', '1');
INSERT INTO `t_user` VALUES ('20', 'fyz', 'fyz', '123', '男', '2020-06-22', '123456789087654321', 'fyz@qq.com', '12345678901', '金星', '2');
INSERT INTO `t_user` VALUES ('21', 'gs', 'gs', '123', '男', '2020-06-22', '123456789087654321', 'gs@qq..com', '12345678901', '地球', '1');
INSERT INTO `t_user` VALUES ('22', 'dyx', 'dyx', '123', '男', '2020-06-22', '123456789087654321', 'dyx@qq.com', '12345678901', '木星', '1');

-- ----------------------------
-- Table structure for `t_zyc`
-- ----------------------------
DROP TABLE IF EXISTS `t_zyc`;
CREATE TABLE `t_zyc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '书名',
  `bieming` varchar(50) DEFAULT NULL COMMENT '别名',
  `xueming` varchar(100) DEFAULT NULL COMMENT '学名',
  `price` float DEFAULT NULL COMMENT '价格',
  `press` varchar(200) DEFAULT NULL COMMENT '产地',
  `publishTime` date DEFAULT NULL COMMENT '上架时间',
  `keshu` varchar(100) DEFAULT NULL COMMENT '科属',
  `shape` text COMMENT '形态',
  `yongtu` text COMMENT '用途',
  `smallTypeId` int(11) DEFAULT NULL COMMENT '小类别',
  `slide` smallint(6) DEFAULT NULL COMMENT '是否轮播0否1是',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `click` int(11) DEFAULT NULL COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zyc
-- ----------------------------
INSERT INTO `t_zyc` VALUES ('1', '党参', '黄参，中灵草', 'Codonopsis pilosula', '145', '云南', '2018-06-20', '价格可商量', '<p>多年生草本，有乳汁。茎基具多数瘤状茎痕，根常肥大呈纺锤状或纺锤状圆柱形，较少分枝或中部以下略有分枝，长15-30厘米，直径1-3厘米，表面灰黄色，上端5-10厘米部分有细密环纹。</p>', '<p>用于脾肺气虚，食少倦怠，咳嗽虚喘，气血不足，面色萎黄，心悸气短，津伤口渴，内热消渴。</p>', '4', '1', 'static/images/zycs/dangshen.jpg', '2018-06-25 20:14:12', '100', '2');
INSERT INTO `t_zyc` VALUES ('2', '白起', '鹅管白前、竹叶白前、石蓝、嗽药', 'Cynanchum stauntonii(Decne.)Schltr.ex Lévl', '18', '湖北', '1982-01-01', '价格可商量', '<p>柳叶白前：多年生草本。高30～60厘米。根茎匍匐。茎直立，单一，下部木质化。单叶对生，具短柄；叶片披针形至线状披针形，长3～8厘米，宽3～8毫米，先端渐尖，基部渐狭，边缘反卷；下部的叶较短而宽；顶端的叶渐短而狭</p>', '<p>用于肺气壅实，咳嗽痰多，胸满喘急。</p>', '2', '1', 'static/images/zycs/baiqian.jpg', '2020-06-15 11:40:14', '100', '7');
INSERT INTO `t_zyc` VALUES ('3', '白头翁', '野丈人、胡王使者、白头公', 'Pulsatilla chinensis （Bunge）Regel', '20', '东北', '2018-03-01', '价格可商量', '<p>白头翁，多年生草本，高15～875。呈类圆柱形或圆锥形，稍扭曲，长6～500，直径0.5～50。表面黄棕色或棕褐色，具不规则纵皱纹或纵沟，皮部易脱落，露出黄色的木部，有的有网状裂纹或裂隙，近根头处常有朽状凹洞。根头部稍膨大，有白色绒毛，有的可见鞘状叶柄残基。</p>', '<p>清热解毒，凉血止痢。\r\n热毒血痢，阴痒带下。\r\n</p>', '2', '1', 'static/images/zycs/baitouwong.jpg', '2018-06-25 20:04:13', '100', '5');
INSERT INTO `t_zyc` VALUES ('4', '百部', '百部草、百条根、闹虱、玉箫、箭杆、药虱药', 'Stemona sessilifolia(Miq.)Miq', '18', '浙江', '2018-01-01', '价格可商量', '<p>块根肉质，成簇，常长圆状纺锤形，粗1-1.5厘米。茎长达1米许，常有少数分枝，下部直立，上部攀援状。叶2-4（-5）枚轮生，纸质或薄革质。花序柄贴生于叶片中脉上，花单生或数朵排成聚伞状花序；蒴果卵形、扁的，赤褐色。种子椭圆形，稍扁平。</p>', '<p>百部根可以入药，外用于杀虫、止痒、灭虱；内服有润肺、止咳、祛痰之效。</p>', '2', '1', 'static/images/zycs/baibu.jpg', '2018-06-25 20:06:06', '100', '6');
INSERT INTO `t_zyc` VALUES ('5', '板蓝根', '菘蓝、山蓝、大蓝根、马蓝根', 'IsatisindigoticaFort', '9', '河南', '2018-05-01', '价格可商量', '<p>二年生草本，植株高50-100cm。光滑无毛常被粉霜。根肥厚，近圆锥形，直径2-3cm，长20-30cm，表面土黄色，具短横纹及少数须根。基生叶莲座状，叶片长圆形至宽倒披针形，长5-15cm，宽1.5-4cm，先端钝尖，边缘全缘，或稍具浅波齿，有圆形叶耳或不明显；茎顶部叶宽条形，全缘，无柄。</p>', '<p>具有清热解毒，凉血，利咽的功效。主治外感发热，温病初起，咽喉肿痛，温毒发斑，痄腮，丹毒，痈肿疮毒。</p>', '2', '1', 'static/images/zycs/banlangen.jpg', '2018-06-25 20:19:47', '100', '7');
INSERT INTO `t_zyc` VALUES ('6', '北沙参', '莱阳参、海沙参、银沙参、辽沙参、苏条参、条参、北条参。', 'Glehnia lit－toralis F.Schmidt ex Miq．', '18', '河北', '2018-04-01', '价格可商量', '<p>多年生草本。全株有毛，主根和侧根区分明显，主根圆柱形，细长，长30~40cm，直径0.5~1.5cm，肉质致密，外皮黄白色，须根细小，着生在主根上，少有侧生根。基生叶卵形或宽三角状卵形，三出式羽状分裂或2～3回羽状深裂，具长柄；茎上部叶卵形，边缘具有三角形圆锯齿。复伞形花序顶生，密被灰褐色绒毛；伞幅10～14，不等长；小总苞片8～12，线状披针形；花梗约30；花小，白色。双悬果近球\r\r\n</p>', '<p>是临床常用的滋阴药，养阴清肺，祛痰止咳。主治肺燥干咳、热病伤津、口渴等症。</p>', '2', '0', 'static/images/zycs/beishasen.jpg', '2018-06-25 20:05:18', '100', '8');
INSERT INTO `t_zyc` VALUES ('7', '白术', '鹤形术、金线术、或白术腿', 'Atractylodes macrocephala Koidz.', '18', '安徽', '2018-02-01', '价格可商量', '<p>菊科苍术属多年生草本植物，高可达60厘米，结节状根状茎。茎直立，全部光滑无毛。叶互生，叶片羽状全裂，侧裂片倒披针形、椭圆形或长椭圆形，顶裂片比侧裂片大，全部叶质地薄，纸质，两面绿色，无毛，头状花序单生茎枝顶端，苞叶绿色，针刺状羽状全裂。</p>', '<p>药用功能运脾药，性味苦温辛烈，有燥湿、化浊、止痛之效</p>', '2', '0', 'static/images/zycs/baishu.jpg', '2018-06-25 20:06:49', '100', '11');
INSERT INTO `t_zyc` VALUES ('8', '白及', '兰科植物白', 'Bletilla striata（ Thunb.） Reichb.f.', '200', '云南', '2018-07-11', '价格可商量', '<p>本品呈不规则扁圆形，多有2～3个爪状分枝，长1.5～5cm，厚0.5～1.5cm。表面灰白色或黄白色，有数圈同心环节和棕色点状须根痕，上面有突起的茎痕，下面有连接另一块茎的痕迹。质坚硬，不易折断，断面类白色，角质样。气微，味苦，嚼之有黏性。</p>', '<p>归肺、肝、胃经。\r\n功效：收敛止血，消肿生肌。\r\n用于咯血，吐血，外伤出血，疮疡肿毒，皮肤皲裂。</p>', '2', '1', 'static/images/zycs/baiji.jpg', '2018-07-02 19:32:50', '51', '22');
INSERT INTO `t_zyc` VALUES ('9', '胡桃仁', '胡桃肉、核桃仁', 'Hu Tao Ren', '36', '河南', '2020-06-22', '价格可商量', '<p>胡桃(《千金食治》)，又名:羌桃(《名物志，)，核桃(《纲目》)，万岁子(《花镜》)。落叶乔木，高30～35米。枝幼时被短腺毛，髓部片状。单数羽状复叶，小叶5～11片，长圆状卵形、椭圆形或倒卵形，长5～13厘米，宽2～7厘米，先端钝或锐尖，基部圆形，或略偏斜，全缘，幼时有波状锯齿，上面无毛，下面幼时脉腋间有毛。花单性，雌雄同株；雄花集成赛荑花序，腋生，下垂，长5～12厘米，花小而密生；苞片1，矩圆形，两侧2小苞片长卵形，花被通常3片，苞片及花被均被白色柔毛；雄蕊15～30；雌花序生于幼枝顶端，排列成穗状；苞片3，长卵形；花被4裂，裂片线形；子房下位，花柱短，柱头2裂。果实近球形，径3～5厘米，外果皮肉质，灰绿色，有棕色斑点；内果皮坚硬，有浅皱褶，黄褐色。花期4～5月。果期10月。\r\n喜生于较温润的肥沃土壤中，多栽培于平地。我国各地广泛栽培。</p>', '<p>补肾固精，温肺定喘，润肠，治肾虚喘嗽，腰痛脚弱，阳痿，遗精，小便频数，石淋，大便燥结。</p>', '10', '0', 'static/images/zycs/hetao.jpg', '2020-06-22 10:41:04', '100', '9');
INSERT INTO `t_zyc` VALUES ('10', '八角茴香', '舶上茴香,大茴香,八角大茴', 'Illicium verum', '60', '广西', '2020-06-22', '价格可商量', '<p>常绿乔木，高10～14米，树皮灰色至红褐色。单叶互生，革质，披针形至长椭圆形，长6～12厘米，宽2～5厘米，先端急尖或渐尖，基部楔形，全缘，下面疏被柔毛，叶脉羽状，中脉下陷，侧脉稍凸起；叶柄粗壮。花单生于叶腋，花梗长1.5～3厘米；花圆球形，花被肉质；萼片3，黄绿色；花瓣6～9，排成2～3轮，淡粉红色或深红色，广卵圆形或长圆形；雄蕊15～19，成2～3轮，心皮8～9，分离，花柱短，基部肥厚，柱头细小。蓇葖果成星芒状排列，幼时绿色，成熟时红棕色，星状体径约2.5～3厘米，开裂。种子扁卵形，棕色有光泽。第1次花期2～3月，果期8～9月。第2次花期在第1次果期之后，第2次果期为翌年2～3月</p>', '<p>温阳，散寒，理气。治中寒呕逆，寒疝腹痛，肾虚腰痛，干、湿脚气。<br>①《品汇精要》：\"主一切冷气及诸疝疗痛。\"</p>', '5', '0', 'static/images/zycs/bajiao.jpg', '2020-06-22 10:48:16', '100', '11');
INSERT INTO `t_zyc` VALUES ('11', '连翘', '青壳、连召、老翘', 'Forsythia suspensa', '0.05', '陕西', '2020-06-22', '价格可商量', '<p>青翘，蒴果，狭卵形。长约1.5～2.5厘米，中部直径约6～10毫米。顶端尖，微开裂或不开裂，形如鸟喙。基部有短柄或已脱落，表面绿褐色，两面各有纵沟纹一条和多数凸起的微笑黄白色麻点。外壳略坚脆，易开裂，壳内含种子多枚，黄绿色，着生于中间纵隔膜上。种子略呈长棱形 ，一侧有膜翅，含粘油质。气微香，味苦微辛。老翘：形态略与青翘相同，唯已成黄棕色或灰黄色。多开裂或已裂有两瓣，种子多已脱落。气微，味微苦辛。不含粘优质。青翘以果实完整，均匀，青绿色，无枝梗者为佳。</p>', '<p>1、抗菌。有效成分为连翘酚。对金黄色葡萄球菌和志贺氏痢疾杆菌的抗菌效力最大。对溶血性链球菌、肺炎双球菌、伤寒杆菌等亦有较强的抗菌作用。对结核杆菌的生长也有显著的抑制作用。对小白鼠实验性结核病有疗效。\r\n\r\n2、抗病毒，对流感病毒有抑制作用。\r\n\r\n3、强心、利尿。有效成分为齐墩果酸。</p>', '6', '0', 'static/images/zycs/lianqiao.jpg', '2020-06-22 10:54:11', '100', '12');
INSERT INTO `t_zyc` VALUES ('12', '玫瑰花', '红玫瑰', 'Rosa rugosa Thunb', '60', '甘肃', '2020-06-22', '价格可商量', '<p>花蕾呈不规则的圆球形，直径1~1.5厘米，花朵半球形，直径1.5~2.5厘米。花瓣多数，膜质，层迭而生，紫红色，脱色部位棕黄色，基部宿萼绿褐色，花托球形，萼片五裂披针形。剥落花瓣，中有雄蕊多数。气香浓，味微苦涩。\r\n\r\n以花蕾、花朵大而完整，色紫红鲜艳，香气浓郁者为佳。</p>', '<p>含挥发油，其中主要为牻牛耳醇。花瓣含有蜡质、二十九（碳）烷，以及鞣质等。\r\n\r\n功效与作用：舒肝镇痛，收敛止泻。</p>', '7', '0', 'static/images/zycs/meigui.jpg', '2020-06-22 10:57:27', '100', '12');
INSERT INTO `t_zyc` VALUES ('13', '薄荷', '银丹草', 'Mentha haplocalyx Briq.', '5', '河南', '2020-06-22', '价格可商量', '<p>草木，多年生，茎方形，被逆生长柔毛，全株有辛凉香气。单叶对生，长卵形或椭圆形，叶缘锐锯齿状。花在腋部成轮状花序，花冠略成二唇形，淡红色或紫色。四枚小坚果，藏于宿存厚膜质的萼筒内</p>', '<p>疏散风热，其作用为：1、消炎；2、镇痛；3、健胃祛风；4、止痒。</p>', '8', '0', 'static/images/zycs/bohe.jpg', '2020-06-22 11:02:14', '100', '13');
INSERT INTO `t_zyc` VALUES ('14', '艾叶', '艾蒿、家艾', 'Artemisia argyi Levl.et Vant', '5', '安徽', '2020-06-22', '价格可商量', '<p>为多年生草本，高40~120厘米。茎直立，圆柱形，质硬，基部木质化，外披灰白色软毛，茎中部以上分枝。茎下部的叶在开花时枯萎，单叶，不规则互生，具短柄，叶片卵状椭圆形，羽状深裂，背面灰绿色，密披白色绒毛，近茎顶端的叶片有时全缘，无柄，披针形。花序总序排列，顶生或多数的头状花序集合而成。瘦果长圆形。</p>', '<p>温经而止血，散寒除湿镇痛。现证实其原理为：\r\n\r\n1、止血。能缩短出血和凝血时间，炒炭后作用较显著。\r\n\r\n2、抗真菌。艾叶煎剂对皮肤癣菌有微弱的对抗作用。艾熏法对多重致病性皮肤真菌有抗菌作用。\r\n\r\n3、健胃。促进胃液分泌，增进食欲，但大量反会引起恶心、呕吐。</p>', '9', '0', 'static/images/zycs/aiye.jpg', '2020-06-22 11:10:45', '100', '14');
