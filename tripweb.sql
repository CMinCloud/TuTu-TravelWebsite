/*
 Navicat Premium Data Transfer

 Source Server         : cs1
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : tripweb

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 01/06/2022 20:58:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection`  (
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `collection_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `service_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `t_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_collection_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `t_service` (`service_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_collection
-- ----------------------------
INSERT INTO `t_collection` VALUES (2, 1, '2022-06-01');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '用户id（外键）',
  `service_id` int(11) NULL DEFAULT 0 COMMENT '旅游服务id',
  `note_id` int(11) NULL DEFAULT 0 COMMENT '游记id',
  `comment_type` int(11) NOT NULL COMMENT '评论类型',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `comment_date` date NULL DEFAULT NULL COMMENT '评论日期',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (247, 2, 0, 3, 2, '我啊你淼淼', '2022-06-01');

-- ----------------------------
-- Table structure for t_note
-- ----------------------------
DROP TABLE IF EXISTS `t_note`;
CREATE TABLE `t_note`  (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `note_date` date NULL DEFAULT NULL,
  `note_img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_like` int(11) NULL DEFAULT 0,
  `playdays` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `recommend` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`note_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_note_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_note
-- ----------------------------
INSERT INTO `t_note` VALUES (3, '阿拉斯加，无可抗拒', 1, '2022-06-01', 'NoteModuleImg/ced7f286190d4882a65515760041c1c2.jpg', 0, '3天', '要真正了解真正 阿拉斯加 的真实和不加修饰，我们需要体验它的野性，它原始的山地荒野和海岸峡湾，它的天然冰川、温泉和生态系统，它丰富的野生动植物和海洋生物。只有当你走出人迹罕至的地方，置身于广袤荒原的环境中，并感到自身难以置信的渺小时，才能真正领会到 阿拉斯加 独一无二的特性。自驾游最大的好处，就是可以享受完全自主的旅行生活，不受羁绊，没有约束，想往哪走就往哪走，想走多远就走多远，想看什么就看什么，想停多久就停多久。直到在那魂牵梦萦的远方，找到自己久违的感动为止。');
INSERT INTO `t_note` VALUES (4, '杭州露营记 千年文明下的真诚', 1, '2022-06-01', 'NoteModuleImg/30d97c4844ad4b709ad8147f0d814e35.jpg', 0, '3天', '新疆 跟内地的时差，官方显示是两个小时，实际上我们在此感受起码有三个小时，\r\n住在老城里，放下行李的我们还有大把时间可以先走走看看，\r\n先去百年老茶馆吧！\r\n一切的网络攻略大家都别太信，\r\n有一些抒发个人情感，有一些强迫症打卡，有一些只是顺路经过：哎呦不错呦！\r\n看你怎么理解， 比如 百年老茶馆…\r\n都说不到 喀什 不算到 新疆 ，\r\n不到 喀什 古城不算到 喀什 ，\r\n不到百年老茶馆不算到 喀什 古城。\r\n不知道是我们三人见识太广，还是知识面广，反正我们都无感。\r\n由此可见，养女娃的家庭一定要让她们早一些见识这个世界，');
INSERT INTO `t_note` VALUES (5, '千年文明下的真诚', 2, '2022-06-01', 'NoteModuleImg/23652d6c677d43abb8de2da182edea58.jpg', 0, '22天', '我们三个人兴高采烈准备着发送“三缺一”的约伴宣言，\r\n莉莉请假被无情扼杀，剩下我和红毛可怜的嗷嗷。\r\n三月初，迫在眉睫的出行日日逼近，\r\n红毛和我虽说在没有“网红”这个词语之前就已经是马蜂窝网红，是第一代马蜂窝蜂首作者，\r\n但苦于“跌落凡间”，早已“淡出江湖”，马蜂窝约伴竟然无法发送，\r\n转战某博、小某书约伴，反响平平，\r\n要不是路线不同，要不就是日子不同，\r\n眼看着两三天过去了，没有影响力的我两惨淡经营，心里想着要不咱俩到了 喀什 机场现拼人……\r\n这世上有些事情就是当你不抱希望之时，希望就来了，\r\n此时我小某书帖子约到了大气随和的Amy姐，Amy姐直接说我们仨可以住一间，\r\n又推荐了自己多次去 新疆 结识的好相处师傅，即刻成团。');
INSERT INTO `t_note` VALUES (6, '这世界有那么多人', 2, '2022-06-01', 'NoteModuleImg/0d4ebe67973846bab60bc3477f5b6f02.jpg', 0, '22', '定下 南疆 杏花行之后，红毛约了以往她的同伴莉莉，\r\n我们三个人兴高采烈准备着发送“三缺一”的约伴宣言，\r\n莉莉请假被无情扼杀，剩下我和红毛可怜的嗷嗷。\r\n三月初，迫在眉睫的出行日日逼近，\r\n红毛和我虽说在没有“网红”这个词语之前就已经是马蜂窝网红，是第一代马蜂窝蜂首作者，\r\n但苦于“跌落凡间”，早已“淡出江湖”，马蜂窝约伴竟然无法发送，\r\n转战某博、小某书约伴，反响平平，\r\n要不是路线不同，要不就是日子不同，');

-- ----------------------------
-- Table structure for t_notemodule
-- ----------------------------
DROP TABLE IF EXISTS `t_notemodule`;
CREATE TABLE `t_notemodule`  (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note_id` int(11) NOT NULL,
  `module_img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playdays` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`module_id`) USING BTREE,
  INDEX `note_id`(`note_id`) USING BTREE,
  CONSTRAINT `t_notemodule_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `t_note` (`note_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notemodule
-- ----------------------------
INSERT INTO `t_notemodule` VALUES (3, '杭州露营记', '阿朵的《一人一花》，土家语和汉语并存的一首歌曲。\r\n这是我在 双廊 游记曾经用过的背景音乐，\r\n也是我在马蜂窝那些年疯狂码字时候单曲循环的唯一曲目，\r\n更是我个人听歌的创纪录，一年只单曲循环这一首歌。\r\n讲不出灵魂深处为何就这么爱她，或许是有一些佛乐的静心感，\r\n又或许是因为歌词的牵引力……\r\n那个人已经不在了，我依然是自己的花，独自流浪，骄傲自强的绽放着！', 3, 'NoteModuleImg/f957fff5fdc04e8891eb18690c9202fe.jpg', 1);
INSERT INTO `t_notemodule` VALUES (4, '杭州露营记', '许久不写游记，可我的初心依旧没变，只发马蜂窝，不论他的流量是否跟当年一样，\r\n也希望马蜂窝一直可以为我们这些情怀坚守者此生常（长）存。\r\n记录只为老来便于回忆，是自己的一个收藏点，同时分享一些有用的信息给需要的人。\r\n\r\n近些年小视频快餐的流行，让笔耕不辍的游记作者们每次对自己的游记都非常维权，可屡盗不止，\r\n游记是回忆录，装满文字的同时要装着当时的图片或视频，还有作者个人心境……\r\n一键盗图盗游记的轻松复制粘贴，实属丧德之举，', 4, 'NoteModuleImg/6e019a3ffc62410a9bf54ec1ff67beba.jpg', 1);
INSERT INTO `t_notemodule` VALUES (5, '行程综述', '66°33′ 北极 圈以南，包括 加拿大 的 西北 行政区、 育空 地区和 阿拉斯加 的广泛地区。有感于这片区域的荒原风情大致相同，历史的进程极为相似，甚至连土著风情都趋于雷同，因此本文所提及的 阿拉斯加 是一个广义上的区域，而不是特指 阿拉斯加 行政区域的范围。在 阿拉斯加 这片昔日广袤的荒原上，有着很多迷人的土著风情和古老的传说。一路上我们前脚还在卡克 罗斯 ，被眼前一亮的视觉艺术和现场表演所震慑。后脚到了北方博物馆，又因为零距离触摸到土著的历史而雀跃。在被困道森的三天三夜里，我们在百无聊赖之下地反复观看的影片，却在不经意间拓宽了对淘金热的认知。在看似露宿餐风，实质乐也融融露营地，我们透过咖啡飘香认识了素昧平生的旅人，然后交换着美酒与咖啡一起举杯邀明月。真的很庆幸我们一开始就选择了自驾游的出行方式，从而收获到如此丰富且不可预知的见闻。', 4, 'NoteModuleImg/34fe012912a74ca7a04ae50b0599c899.jpg', 1);
INSERT INTO `t_notemodule` VALUES (6, '杭州露营记', '许久不写游记，可我的初心依旧没变，只发马蜂窝，不论他的流量是否跟当年一样，\r\n也希望马蜂窝一直可以为我们这些情怀坚守者此生常（长）存。\r\n记录只为老来便于回忆，是自己的一个收藏点，同时分享一些有用的信息给需要的人。\r\n\r\n近些年小视频快餐的流行，让笔耕不辍的游记作者们每次对自己的游记都非常维权，可屡盗不止，\r\n游记是回忆录，装满文字的同时要装着当时的图片或视频，还有作者个人心境……\r\n一键盗图盗游记的轻松复制粘贴，实属丧德之举，\r\n望各位有想法的看就好，轻拿轻放！', 5, 'NoteModuleImg/45641ce344a44b59884613dc321df20f.jpg', 1);
INSERT INTO `t_notemodule` VALUES (7, '淘金热历史', '先去百年老茶馆吧！\r\n一切的网络攻略大家都别太信，\r\n有一些抒发个人情感，有一些强迫症打卡，有一些只是顺路经过：哎呦不错呦！\r\n看你怎么理解， 比如 百年老茶馆…\r\n都说不到 喀什 不算到 新疆 ，\r\n不到 喀什 古城不算到 喀什 ，\r\n不到百年老茶馆不算到 喀什 古城。\r\n不知道是我们三人见识太广，还是知识面广，反正我们都无感。\r\n由此可见，养女娃的家庭一定要让她们早一些见识这个世界，\r\n要不就多读书，从此认知世界的格局大，见什么都不稀奇 ', 6, 'NoteModuleImg/d23c4f14d8e24fd181090947256ee241.jpg', 1);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `service_id` int(11) NOT NULL COMMENT '旅游服务id',
  `order_date` date NULL DEFAULT NULL COMMENT '出行日期',
  `amount` int(11) NULL DEFAULT 1 COMMENT '订单数量',
  `total` float NOT NULL COMMENT '总价',
  PRIMARY KEY (`user_id`, `service_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `t_service` (`service_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (2, 1, '2022-06-01', 3, 960);

-- ----------------------------
-- Table structure for t_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_pic`;
CREATE TABLE `t_pic`  (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NULL DEFAULT NULL,
  `pic_type` int(11) NULL DEFAULT NULL,
  `pic_src` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  CONSTRAINT `t_pic_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `t_service` (`service_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_pic
-- ----------------------------
INSERT INTO `t_pic` VALUES (1, 1, NULL, 'serviceImgs/s1.jpg');
INSERT INTO `t_pic` VALUES (2, 1, NULL, 'serviceImgs/s2.jpg');
INSERT INTO `t_pic` VALUES (3, 1, NULL, 'serviceImgs/s3.jpg');
INSERT INTO `t_pic` VALUES (4, 2, NULL, 'serviceImgs/s4.jpg');
INSERT INTO `t_pic` VALUES (5, 2, NULL, 'serviceImgs/s5.jpg');
INSERT INTO `t_pic` VALUES (6, 2, NULL, 'serviceImgs/s6.jpg');
INSERT INTO `t_pic` VALUES (7, 3, NULL, 'serviceImgs/s7.jpg');
INSERT INTO `t_pic` VALUES (8, 3, NULL, 'serviceImgs/s8.jpg');
INSERT INTO `t_pic` VALUES (9, 3, NULL, 'serviceImgs/s9.jpg');
INSERT INTO `t_pic` VALUES (10, 4, NULL, 'serviceImgs/s10.jpg');
INSERT INTO `t_pic` VALUES (11, 4, NULL, 'serviceImgs/s11.jpg');
INSERT INTO `t_pic` VALUES (12, 4, NULL, 'serviceImgs/s12.jpg');
INSERT INTO `t_pic` VALUES (13, 5, NULL, 'serviceImgs/s13.jpg');
INSERT INTO `t_pic` VALUES (14, 5, NULL, 'serviceImgs/s14.jpg');
INSERT INTO `t_pic` VALUES (15, 5, NULL, 'serviceImgs/s15.jpg');
INSERT INTO `t_pic` VALUES (16, 5, NULL, 'serviceImgs/s16.jpg');
INSERT INTO `t_pic` VALUES (17, 6, NULL, 'serviceImgs/s17.jpg');
INSERT INTO `t_pic` VALUES (18, 6, NULL, 'serviceImgs/s18.jpg');
INSERT INTO `t_pic` VALUES (19, 7, NULL, 'serviceImgs/s19.jpg');
INSERT INTO `t_pic` VALUES (20, 7, NULL, 'serviceImgs/s20.jpg');
INSERT INTO `t_pic` VALUES (21, 8, NULL, 'serviceImgs/s21.jpg');
INSERT INTO `t_pic` VALUES (22, 8, NULL, 'serviceImgs/s22.jpg');
INSERT INTO `t_pic` VALUES (23, 9, NULL, 'serviceImgs/s23.jpg');
INSERT INTO `t_pic` VALUES (24, 9, NULL, 'serviceImgs/s24.jpg');
INSERT INTO `t_pic` VALUES (25, 10, NULL, 'serviceImgs/s25.jpg');
INSERT INTO `t_pic` VALUES (26, 10, NULL, 'serviceImgs/s26.jpg');
INSERT INTO `t_pic` VALUES (27, 10, NULL, 'serviceImgs/s27.jpg');
INSERT INTO `t_pic` VALUES (28, 10, NULL, 'serviceImgs/s28.jpg');

-- ----------------------------
-- Table structure for t_secretinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_secretinfo`;
CREATE TABLE `t_secretinfo`  (
  `secret_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`secret_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_secretinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_secretinfo
-- ----------------------------
INSERT INTO `t_secretinfo` VALUES (7, 1, '你的生日', '0101');
INSERT INTO `t_secretinfo` VALUES (8, 1, '你小学老师的名字', '张三');
INSERT INTO `t_secretinfo` VALUES (9, 1, '你最喜欢的数字', '7');

-- ----------------------------
-- Table structure for t_service
-- ----------------------------
DROP TABLE IF EXISTS `t_service`;
CREATE TABLE `t_service`  (
  `service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `service_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅游服务名称',
  `service_type` int(11) NULL DEFAULT NULL COMMENT '旅游服务类型',
  `price` float(8, 2) NOT NULL COMMENT '价格',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `status` int(11) NOT NULL COMMENT '可下单状态',
  `collect_count` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  `service_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体地址',
  `service_img` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `service_content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ad` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_service
-- ----------------------------
INSERT INTO `t_service` VALUES (1, '八达岭长城', NULL, 320.00, '不到长城非好汉', 27, 0, '北京市延庆区G6京藏高速58号出口', 'serviceTitle/t1.jpg', '八达岭长城史称天下九塞之一，是万里长城的精华，在明长城中，独具代表性，八达岭景区以八达岭长城为主，兴建了八达岭饭店、全周影院和由江泽民主席亲笔题名的中国长城博物馆等功能齐全的现代化旅游服务设施。八达岭景区以其宏伟的景观、完善的设施和深厚的文化历史内涵而著称于世，古称“居庸之险不在关而在八达岭”。该段长城地势险峻，居高临下，集巍峨险峻、秀丽苍翠于一体。八达岭是历史上许多重大事件的见证，从八达岭取道大同，再驾返咸阳；肖太后巡幸、元太祖入关、元代皇帝每年两次往返北京和上都之间、明代帝王北伐、李自成攻陷北京、清代天子亲征……八达岭都是必经之地。近代史上，慈禧西逃泪洒八达岭——京张铁路、孙中山先生登临八达岭长城等，都留下了许多历史典故和珍贵的历史回忆。八达岭长城驰名中外，誉满全球。“不到长城非好汉”。迄今。八达岭已接待中外游人一亿三千万，先后有尼克松、里根、撒切尔、戈尔巴乔夫、伊丽莎白、希思等372位外国首脑和众多的世界风云人物，登上八达岭观光游览。', '【成人票】10点出发北京八达岭长城门票+往返直通车票');
INSERT INTO `t_service` VALUES (2, '故宫博物院', NULL, 320.00, '穿越明清两朝的皇家宫殿群', 27, 0, '北京市东城区景山前街4号', 'serviceTitle/t2.jpg', '北京故宫，旧称紫禁城，是中国明、清两代24位皇帝的皇宫，现在指位于北京的故宫博物院，位于北京市中心，是无与伦比的古代建筑杰作。故宫宫殿建筑均是木结构、黄琉璃瓦顶、青白石底座，饰以金碧辉煌的彩画。建筑整体沿着一条南北向中轴线排列并向两旁展开，南北取直，左右对称。依据其布局与功用分为“外朝”与“内廷”两大部分，以乾清门为界，乾清门以南为外朝，以北为内廷。外朝、内廷的建筑气氛迥然不同。外朝以太和殿、中和殿、保和殿三大殿为中心，其中三大殿中的“太和殿”俗称“金銮殿”，是皇帝举行朝会的地方，也称为“前朝”。此外两翼东有文华殿、文渊阁、上驷院、南三所；西有武英殿、内务府等建筑。建筑造型宏伟壮丽，庭院明朗开阔，象征封建政权至高无上。内廷以乾清宫、交泰殿、坤宁宫后三宫为中心，两翼为养心殿、东六宫、西六宫、斋宫、毓庆宫，后有御花园。是封建帝王与后妃居住之所。', '北京故宫不可错过的游览项目');
INSERT INTO `t_service` VALUES (3, '承德避暑山庄', NULL, 130.00, '塞外的清朝皇家园林', 27, 0, '承德市双桥区丽正门路20号', 'serviceTitle/t3.jpg', '这里是中国地理形貌之缩影，来到承德避暑山庄，如同走过大江南北。承德避暑山庄又名承德离宫或热河行宫，是中国清代皇帝夏天避暑和处理政务的场所。避暑山庄是清朝皇帝为了实现安抚、团结中国边疆少数民族，巩固国家统一的政治目的而修建的一座夏宫。避暑山庄始建于1703年，历经清朝三代皇帝：康熙、雍正、乾隆，历时89年。避暑山庄占地564万平方米，环绕山庄婉蜒起伏的宫墙长达万米。相当于颐和园的两倍，有八个北海公园那么大。与北京紫禁城相比，避暑山庄以朴素淡雅的山村野趣为格调，取自然山水之本色，吸收江南塞北之风光。山庄的建筑布局大体可分为宫殿区和苑景区两大部分，苑景区又可分成湖区、平原区和山区三部分。内有康熙乾隆钦定的72景。山庄不仅规模宏大，而且在总体规划布局和园林建筑设计上都充分利用了原有的自然山水的景观特点和有利条件，吸取唐、宋，加以综合、提高，把园林艺术与技术水准推向了空前的高度。', '承德避暑山庄门票成人票-11:00-17:00入园【11:00-17:00】');
INSERT INTO `t_service` VALUES (4, '宏村', NULL, 94.00, '中国画里乡村', 27, 0, '黄山市黟县宏村镇宏村景区', 'serviceTitle/t5.jpg', '宏村位于徽州六县之一的黟县东北部，地理坐标：东经117°38′，北纬30°11′，村落面积19.11公顷，整个村依山伴水而建，村后以青山为屏障，地势高爽，可挡北面来风，既无山洪暴发冲击之危机，又有仰视山色泉声之乐。八九百年前的建村者便有先建水系后依水系而建村的前瞻，所以使它有了水一样的灵性，这也正是它比其他徽派建筑的村落更具魅力的原因。村中两棵古树，白果树和红杨树是“牛角”。湖光山色与层楼叠院和谐共处,自然景观与人文内涵交相辉映，是宏村区别于其他民居建筑布局的特色，成为当今世界历史文化遗产一大奇迹。全村现完好保存明清民居140余幢，承志堂“三雕”精湛，富丽堂皇，被誉为“民间故宫”。著名景点还有：南湖风光、南湖书院、月沼春晓、牛肠水圳、双溪映碧、亭前大树、雷岗夕照、树人堂、明代祠堂、乐叙堂等。村周有闻名遐迩的雉山木雕楼、奇墅湖、塔川秋色、木坑竹海、万村明祠“爱敬堂”等景观。', '宏村景区门票成人票【00:00-09:00】');
INSERT INTO `t_service` VALUES (5, '桂林山水高尔夫', NULL, 320.00, '综合性高尔夫度假俱乐部', 27, 0, '桂林市七星区金鸡岭25号', 'serviceTitle/t6.jpg', '桂林山水高尔夫俱乐部，于1996年正式营业，为桂林这个旅游城市增添了不少色彩。俱乐部主要以球会友，是一座集休闲、度假、观光、娱乐、养身的综合性高尔夫度假俱乐部。球场内环境清幽、高雅、脱俗，为顾客精心规划设计而成。球场四周群山环绕、举目所见尽是山水国画般的仙境。球道设计动线明畅，全长8400码，27洞的球场，呈现出大自然的磅礴奇景与君临天下之豪情。独特的球道设计，使打完前九洞后可要求骑马到第十洞准备开球；或在136码短洞且趣味的第十七洞，如果能一杆ON上果岭，这时果岭前的湖面上喷出一排喷泉水舞来庆賀。等同组人开完球走下Tee台，还可坐上静候在旁的小舟，享受由舟上两个船夫缓缓將船划到岛果嶺上的遐意。', '桂林山水景区门票成人票【00:00-09:00】');
INSERT INTO `t_service` VALUES (6, '杭州西湖', NULL, 35.00, '杭州之美的代言人', 27, 0, '杭州市西湖风景名胜区', 'serviceTitle/t7.jpg', '西湖古称“钱塘湖”，又名“西子湖”，古代诗人苏轼就对它评价道：“欲把西湖比西子，淡妆浓抹总相宜。”西湖形态为近于等轴的多边形，湖面被孤山及苏堤、白堤两条人工堤分割为5个子湖区，子湖区间由桥孔连通，各部分的湖水不能充分掺混，造成各湖区水质差异，大部分径流补给先进入西侧3个子湖区，再进入外西湖；湖水总面积5.593平方公里;总容积1．10亿立方米，平均水深1．97 米；西湖底质是一种有机质含量特别高的湖沼相沉积，属于粉砂质粘土或粉砂质亚粘土（黑色有机质粘土），中层泥炭层或沼泽土；入湖河流部是短小的溪涧，主要补水河流为金沙涧、龙泓涧和长桥溪泄流。西湖，是一首诗，一幅天然图画，一个美丽动人的故事，不论是多年居住在这里的人还是匆匆而过的旅人，无不为这天下无双的美景所倾倒。', '【成人】西湖休闲游船票+三潭印月登岛门票(08:00-12:00)【08:00-12:00】');
INSERT INTO `t_service` VALUES (7, '秦始皇帝陵博物院', NULL, 120.00, '秦始皇的地下御林军', 27, 0, '陕西省西安市临潼区秦陵北路与秦俑馆公路', 'serviceTitle/t8.jpg', '秦始皇帝陵博物院位于陕西省西安市临潼区，是以秦始皇兵马俑博物馆为基础，以秦始皇帝陵遗址公园（丽山园）为依托的一座大型遗址博物院；也是以秦始皇帝陵及其众多陪葬坑为主体，基于考古遗址本体及其环境的保护与展示，融合了教育、科研、游览、休闲等多项功能的公共文化空间。2007年，秦始皇帝陵博物院获评首批国家AAAAA旅游景区，景点包括秦始皇兵马俑博物馆和丽山园。两个景点相距2200米，观众可乘坐免费旅游专车往返。2008年，秦始皇兵马俑博物馆获评首批国家一级博物馆。', '秦始皇兵马俑博物馆门票成人票【08:30-10:00】');
INSERT INTO `t_service` VALUES (8, '拙政园', NULL, 320.00, '设计精巧的苏州地标园林', 27, 0, '苏州市姑苏区东北街178号', 'serviceTitle/t9.jpg', '拙政园，中国四大名园之一，坐落于中国著名的历史文化名城的江苏省苏州市平江区，是苏州四大古名园之一，国家5A级旅游景区，全国特殊旅游参观点，被誉为“中国园林之母”，被列入《世界文化遗产名录》，堪称中国私家园林经典。拙政园的建园艺术以水见长，自然典雅，庭院错落，花木为胜。今园辖地面积约八十三点五亩，开放面积约七十三亩，其中园林中部、西部及晚清张之万住宅（今苏州园林博物馆旧馆）为晚清建筑园林遗产，约三十八亩。拙政园是江南园林的代表，全园以水为中心，山水萦绕，厅榭精美，花木繁茂，充满诗情画意，具有浓郁的江南水乡特色。花园分为东、中、西三部分，东花园开阔疏朗，中花园是全园精华所在，西花园建筑精美，各具特色。园南为住宅区，体现典型江南民居多进的格局。园南还建有苏州园林博物馆。', '苏州园林成人票(旺4.1-5.31)【07:30-08:30入园】');
INSERT INTO `t_service` VALUES (9, '长江三峡', NULL, 123.00, '游壮丽峡谷观名胜古迹', 27, 0, '北京长城的地址', 'serviceTitle/t10.jpg', '举世闻名的长江三峡西起重庆奉节，东至湖北宜昌，全长193公里。三峡是瞿塘峡、巫峡、西陵峡的总称。瞿塘峡居西，在重庆所辖的奉节、巫山境内。峡口为夔门，两山壁立，有如门户，山高水急，极为壮观，人称“夔门天下雄”。峡内名胜众多。峡口高处有白帝古城，内多三国遗迹，有的旅游船安排有白帝城观光项目。瞿塘峡下是大宁河宽谷，大宁河小三峡是三峡风光的重要组成部分。巫峡居中，地处重庆巫山和湖北巴东两县之间，谷深峡长，幽静秀雅。著名的巫山十二峰恰似亭亭玉立的十二仙女，自古就有“朝为行云，暮为行雨”的浪漫传说，游客一定要依船上的提示注意观赏。伟大的爱国诗人屈原和汉代美女王昭君的故乡都在巫峡附近。西陵峡居东，在湖北境内，全长75公里，历来以水急滩多、行船艰险而令人望而生畏，后经整治，通盘条件已大为改善。西陵峡两岸石壁的形态、色泽都十分奇特，牛肝马肺峡、兵书宝剑峡和黄牛峡等区段都名有特色。西陵峡下口正在修建宏伟的三峡水利枢纽工程，已形成以现代化建设为主要内容的新兴人文景观。三峡之行到西陵峡外结束，游客可舍舟登岸，转道铁路、公路继续旅行，也可乘舟通过葛洲坝巨型船闸（轮船过闸时的感受也十分有趣，几乎可以看作三峡之外的第四峡），观赏三峡以下江宽流缓的壮丽景色。', '【官方】两坝一峡+三峡大坝+豪华船过葛洲坝+西陵峡+午餐');
INSERT INTO `t_service` VALUES (10, '台湾日月潭', NULL, 5.00, '乘船游湖，赏青山绿水环抱', 27, 0, '台湾南投县鱼池乡水社村', 'serviceTitle/t4.jpg', '旧称水沙连，又名水社里，位于阿里山以北、能高山之南的南投县鱼池乡水社村，堪称明珠之冠。在清朝时即被选为台湾八大景之一，有“海外别一洞天”之称。区内依特色规划有六处主题公园，包括景观、自然、孔雀及蝴蝶、水鸟、宗教等六个主题公园，还有八个特殊景点，以及水社、德化社两大服务区。日月潭由玉山和阿里山漳的断裂盆地积水而成。环潭周长35公里，平均水深30米，水域面积达900多公顷，比杭州西湖大三分之一左右。日月潭中有一小岛，远望好象浮在水面上的一颗珠子，名“珠子屿”。抗战胜利后，为庆祝台湾光复，把它改名为“光华岛”。岛的东北面湖水形圆如日，称日潭，西南面湖水形觚如月，称月潭，统称日月潭。', '日月潭手机自动导游25个讲解，不含门票');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '真实姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `sex` int(11) NULL DEFAULT 1 COMMENT '性别',
  `user_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `details` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户个人介绍',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `USERNAME`(`USERNAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '淼淼', 'abc123456', 'CYM', '19938164397', 0, 'user/user2.jpg', '我是淼淼嘻嘻嘻');
INSERT INTO `t_user` VALUES (2, '黄黄', 'hhh', 'HQC', '19938164394', 0, 'user/user1.png', '我是黄黄嘻嘻嘻');
INSERT INTO `t_user` VALUES (3, '刘刘', 'lll', 'LHJ', '19938164392', 0, 'user/user4.jpg', '我是刘刘嘻嘻嘻');
INSERT INTO `t_user` VALUES (4, '家家', 'jjj', 'TYJ', '19938164391', 0, 'user/user3.jpg', '我是家家嘻嘻嘻');
INSERT INTO `t_user` VALUES (5, 'admin', 'aaa', 'admin', '19938164393', 0, 'user/user3.jpg', '我是家家嘻嘻嘻');

SET FOREIGN_KEY_CHECKS = 1;
