/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : localhost:3306
 Source Schema         : mishop

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 12/06/2020 01:50:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_carts
-- ----------------------------
DROP TABLE IF EXISTS `tb_carts`;
CREATE TABLE `tb_carts`  (
  `carts_id` int(11) NOT NULL AUTO_INCREMENT,
  `carts_userid` int(11) NOT NULL,
  `carts_goodsid` int(11) NOT NULL,
  `carts_goodscolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carts_goodssize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `carts_goodsamout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`carts_id`) USING BTREE,
  INDEX `userid`(`carts_userid`) USING BTREE,
  INDEX `goodsid`(`carts_goodsid`) USING BTREE,
  CONSTRAINT `goodsid` FOREIGN KEY (`carts_goodsid`) REFERENCES `tb_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`carts_userid`) REFERENCES `tb_users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_carts
-- ----------------------------

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_typeid` int(11) NOT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_sale` int(11) NULL DEFAULT NULL,
  `goods_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_weight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_identifier` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_listing` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_displayImages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_productImages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_detailImages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_sizeAndTyrImages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_modelImages` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_questionImages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_enlargeDisplayImages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `typeid`(`goods_typeid`) USING BTREE,
  CONSTRAINT `typeid` FOREIGN KEY (`goods_typeid`) REFERENCES `tb_goodstype` (`goodsType_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (1, 1, '原创设计日常汉服女款绣花长褙子吊带改良宋裤春夏', '18.00', 'images/temp/S-001-1_s.jpg', 513513555, '白色#黑色#粉红色#黄色', 'S#M#L#XL', '1000', '200', 'D-8812', '2017-06-24', 'images/temp/S-001-1_s.jpg#images/temp/S-001-2_s.jpg#images/temp/S-001-3_s.jpg#images/temp/S-001-4_s.jpg#images/temp/S-001-5_s.jpg#images/temp/S-001-6_s.jpg#images/temp/S-001-7_s.jpg#images/temp/S-001-8_s.jpg#images/temp/S-001-9_s.jpg#images/temp/S-001-10_s.jpg', 'images/temp/S-001_1.jpg#images/temp/S-001_2.jpg', 'images/temp/S-001_3.jpg#images/temp/S-001_4.jpg#images/temp/S-001_5.jpg#images/temp/S-001_6.jpg#images/temp/S-001_7.jpg#images/temp/S-001_8.jpg', 'images/temp/S-001_9.jpg#images/temp/S-001_10.jpg#images/temp/S-001_11.jpg#images/temp/S-001_12.jpg', 'images/temp/S-001_13.jpg#images/temp/S-001_14.jpg#images/temp/S-001_15.jpg#images/temp/S-001_16.jpg#images/temp/S-001_17.jpg#images/temp/S-001_18.jpg#images/temp/S-001_19.jpg#images/temp/S-001_20.jpg#images/temp/S-001_21.jpg#images/temp/S-001_22.jpg#images/temp/S-001_23.jpg#images/temp/S-001_24.jpg#images/temp/S-001_25.jpg#images/temp/S-001_26.jpg#images/temp/S-001_27.jpg#images/temp/S-001_28.jpg#images/temp/S-001_29.jpg#images/temp/S-001_30.jpg#images/temp/S-001_31.jpg#images/temp/S-001_32.jpg#images/temp/S-001_33.jpg#images/temp/S-001_34.jpg#images/temp/S-001_35.jpg#images/temp/S-001_36.jpg', 'images/temp/S-001_37.jpg#images/temp/S-001_38.jpg#images/temp/S-001_39.jpg#images/temp/S-001_40.jpg#images/temp/S-001_41.png', 'images/temp/S-001-1_b.jpg#images/temp/S-001-2_b.jpg#images/temp/S-001-3_b.jpg#images/temp/S-001-4_b.jpg#images/temp/S-001-5_b.jpg#images/temp/S-001-6_b.jpg#images/temp/S-001-7_b.jpg#images/temp/S-001-8_b.jpg#images/temp/S-001-9_b.jpg#images/temp/S-001-10_b.jpg');
INSERT INTO `tb_goods` VALUES (2, 1, '古风披风刺绣道袍套装', '¥128.00', 'images/tmall/O1CN01fnR4Gc1FRiHIXa6GM_!!0-item_pic.jpg', 1392991, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (3, 1, '全棉短袖中国风中式打底衫唐装古装', '¥158.00', 'images/tmall/O1CN01sTlUIU1UiOx42swuy_!!0-item_pic.jpg', 222227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (4, 1, '中国风原创黑色龙袍侠客汉服', '¥169.00', 'images/tmall/O1CN01EsiAoj2Ma93GTjotW_!!0-item_pic.jpg', 169254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (5, 1, '序绘原创辟邪麒麟重工男女春夏款汉服', '¥388.00', 'images/tmall/O1CN01krBYXr1HCiWaUDTBu_!!0-item_pic.jpg', 236946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (6, 1, '中国风亚麻七分袖中式汉服', '¥98.00', 'images/tmall/O1CN01S1MLc21FRiHo8lUTm_!!0-item_pic.jpg', 2265274, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (7, 1, '中国风大码亚麻七分袖中式汉服', '¥128.00', 'images/tmall/O1CN011CynAJ1pduvWyRbAu_!!0-item_pic.jpg', 324535, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (8, 1, '中国风棉麻七分袖开衫道袍刺绣汉服', '¥138.00', 'images/tmall/O1CN01N4yDgn1YmlBLez0wj_!!0-item_pic.jpg', 1162610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (9, 1, '夏天薄款佛系道袍亚麻短袖汉服', '¥158.00', 'images/tmall/O1CN01HiXUf31Hg1uVzpxIR_!!0-item_pic.jpg', 4221080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (10, 3, '童装杨紫同款女童超仙公主仙女服', '¥150.52', 'images/tmall/O1CN016wHmXZ1Wz0XFtn08n_!!2-item_pic.png', 14888, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (11, 3, '儿童古代公主古筝演出汉服', '¥55.00', 'images/tmall/O1CN0164NRH61WHUpJ0TDSH_!!0-item_pic.jpg', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (12, 3, '儿童汉服女童古装超仙中国风儿童表演服复古小女孩改良汉服童装', '¥108.00', 'images/tmall/O1CN013BKIE21ks36DxHux8_!!1775464738.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (13, 3, '儿童仙女服古装汉服女童古代衣服公主中大童古筝演出汉服童装小孩', '¥38.00', 'images/tmall/O1CN01BC2S411CKtSNqXcTF_!!2175100063.jpg', 6222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (14, 3, '儿童仙女服古装汉服女童古代衣服公主中大童古筝演出汉服童装小孩', '¥56.39', 'images/tmall/O1CN01XoUJLX1SnmLapIkY8_!!2201311942292.jpg', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (15, 3, '女童中国风超仙汉服襦裙儿童古风汉服童装仙女雪纺汉服连衣裙夏装', '¥158.00', 'images/tmall/O1CN01kbM7aJ2Jb6zoVMi44_!!2088759439.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (16, 3, '。儿童仙女服古装汉服女童古代衣服公主中大童古筝演出汉服童装小', '¥44.32', 'images/tmall/O1CN01MV62lf1WqIzwXI7Zu_!!4270922839.jpg', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (17, 3, '儿童仙女服古装汉服女童古代衣服公主中大童古筝演出汉服童装小孩', '¥41.04', 'images/tmall/O1CN01XbXxah1iazA1La80m_!!2206389114430.jpg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (18, 4, '结婚用品大全创意喜糖盒子糖果盒喜糖袋礼盒装婚礼糖盒回礼手提袋', '¥28.00', 'images/tmall/O1CN01cLirKu1tANwTmd1M2_!!1071025861-0-lubanu-s.jpg', 7148683, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (19, 4, '薰子手工小布包手拎包 女包汉服复古民族花边迷你束口抽绳手提包', '¥36.90', 'images/tmall/O1CN01xE8CXl1KShBFCPZg0_!!0-item_pic.jpg', 3992180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (20, 4, '中国风仙女斜跨包2020新款古风汉服包口金包单肩手提包珍珠链条包', '¥58.00', 'images/tmall/O1CN01zUyjls1rpUEZ0ffow_!!4154975680.jpg', 259130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (21, 4, '小斜跨包包女2020新款古风汉服包口金包珍珠单肩包旗袍配饰手提包', '¥56.00', 'images/tmall/O1CN011JWbE01rpUEIRtnYG_!!4154975680.jpg', 226287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (22, 4, '云深不知处古风汉服斜挎手提包包中国风配古装森系仙女百搭链条包', '¥65.00', 'images/tmall/O1CN01rqpz4c1rpUFcz8OG6_!!4154975680.jpg', 23754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (23, 4, '汉尚华莲原创中国风刺绣汉服口金包', '¥199.00', 'images/tmall/O1CN019f0bEH2CclAnNPDsG_!!0-item_pic.jpg', 460, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (24, 4, '仙女小包包女2020夏天新款珍珠手提水桶包蕾丝链条斜挎包古风汉服', '¥39.90', 'images/tmall/O1CN01uCQwet1pxc2j8Vurq_!!3695615427-0-lubanu-s.jpg', 14529, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (25, 4, '复古民族风帆布手提包单肩包斜挎包两用通勤女包汉服中国风背包', '¥69.00', 'images/tmall/O1CN01rjxIiM1nb3Dlp57Gh_!!1919535107.jpg', 54185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (26, 5, '古风汉服平跟翘头履软底鞋子', '¥168.00', 'images/tmall/O1CN01FQRyz51v8fc1Uyjhl_!!0-item_pic.gif', 1339, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (27, 5, '黛烟汉服中国风内增高鞋子', '¥59.00', 'images/tmall/O1CN01PUyuHZ1UF5bYTVMTE_!!0-item_pic.jpg', 5613, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (28, 5, '古风鞋子女汉服鞋平跟弓鞋翘头履汉服配鞋古装鞋高跟中国风绣花鞋', '¥58.00', 'images/tmall/O1CN01A9cVdT1ypDFpueIYr_!!0-item_pic.gif', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (29, 5, '汉服搭配鞋汉服鞋内增高古装鞋高跟古代鞋子女配汉服的古风绣花鞋', '¥36.65', 'images/tmall/O1CN01vAuEIp1tKSbLZRzX9_!!631005883.jpg', 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (30, 5, '老北京布鞋儿童汉服古风表演绣花鞋', '¥16.92', 'images/tmall/O1CN01CDBTSo1PwzUX8hYQ2_!!0-item_pic.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (31, 5, '儿童老北京布鞋汉服鞋宝宝鞋中国风古装唐装拜年鞋汉鞋女童绣花鞋', '¥39.90', 'images/tmall/O1CN0164pASh1u8qCkixoTH_!!1675055993.jpg', 32901293, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (32, 5, '汉服鞋子儿童女童绣花鞋女古装手工民族汉鞋公主中国风老北京布鞋', '¥39.90', 'images/tmall/O1CN01oE4hGo1u8q8pHg0D0_!!1675055993.gif', 24886356, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (33, 5, '老北京布鞋绣花鞋女童鞋儿童汉服童鞋宝宝透气古装民族中国风凉鞋', '¥99.00', 'images/tmall/O1CN01FoaOIX1u8qD8OMrg8_!!1675055993.jpg', 3983569, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (34, 2, '春夏齐胸花神赋中国风短袖抹胸原创汉服', '¥288.00', 'images/tmall/O1CN01OMf9cV25BYKHt7e6G_!!0-item_pic.jpg', 210667, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (35, 2, '蝶韵姬瑶台仙原创齐腰汉服', '¥328.00', 'images/tmall/O1CN01CVVftu1O7PHZnaoLS_!!0-item_pic.jpg', 59133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (36, 2, '仙鹤汉服女白菜价齐胸超仙中国风襦裙正品原创整套学生花神赋汉服', '¥298.00', 'images/tmall/O1CN01nUXQHb25BYJzuui1H_!!0-item_pic.jpg', 7850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (37, 2, '洛轻雅原创齐胸裙装刺绣日常汉服', '¥59.90', 'images/tmall/O1CN0192NMgY1x05UqPVLZR_!!0-item_pic.jpg', 16671, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (38, 2, '言然指间砂原创新款齐胸襦裙烫金日常清新汉服', '¥49.00', 'images/tmall/O1CN01Vte43T1XFxCbvGX0u_!!0-item_pic.jpg', 1976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (39, 2, '复古风汉服唐装绣花上衣', '¥229.00', 'images/tmall/O1CN01yMC5VT1HsOXNpq7Hc_!!0-item_pic.jpg', 1422, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (40, 2, '中国风扶摇白浅古筝舞蹈汉服', '¥218.00', 'images/tmall/O1CN01VbEpwM2AAFIDJrTUT_!!3252688162-0-pixelsss.jpg', 887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_goods` VALUES (41, 2, '尖妃醉唐风新款齐胸襦裙仙烫金日常汉服', '¥168.00', 'images/tmall/O1CN01uBzqLV1NVqmOsPfB9_!!0-item_pic.jpg', 77301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `tb_goodstype`;
CREATE TABLE `tb_goodstype`  (
  `goodsType_id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsType_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`goodsType_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_goodstype
-- ----------------------------
INSERT INTO `tb_goodstype` VALUES (1, '男装');
INSERT INTO `tb_goodstype` VALUES (2, '女装');
INSERT INTO `tb_goodstype` VALUES (3, '童装');
INSERT INTO `tb_goodstype` VALUES (4, '包包');
INSERT INTO `tb_goodstype` VALUES (5, '鞋靴');

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`  (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `users_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `users_registerDate` datetime NOT NULL,
  `users_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `users_birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`users_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES (1, '14747575027', 'aaa111', '2020-06-10 01:03:50', 'W', '2020-06-19');
INSERT INTO `tb_users` VALUES (2, '14747575023', 'aaa111', '2020-06-10 10:13:12', NULL, NULL);
INSERT INTO `tb_users` VALUES (3, '14747575021', 'aaa111', '2020-06-11 22:30:11', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
