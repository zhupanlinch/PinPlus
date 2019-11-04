/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : mysiteforme

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2019-11-04 11:26:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题,input,NO,false,true,true',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题,input,YES,false,false,false',
  `marks` varchar(255) DEFAULT NULL COMMENT '摘要,textarea,YES,false,false,false',
  `show_pic` varchar(255) DEFAULT NULL COMMENT '显示图片,uploadImg,YES,false,false,false',
  `category` varchar(255) DEFAULT NULL COMMENT '文章类型,radio,YES,false,true,true',
  `out_link_url` varchar(255) DEFAULT NULL COMMENT '外链地址,input,YES,false,false,false',
  `resources` varchar(255) DEFAULT NULL COMMENT '来源,input,YES,false,true,false',
  `publist_time` datetime DEFAULT NULL COMMENT '发布时间,timer,YES,false,true,true',
  `content` text NOT NULL COMMENT '内容,editor,NO,false,true,true',
  `text` text COMMENT '纯文字文章内容,textarea,YES,false,false,false',
  `click` int(11) DEFAULT NULL COMMENT '浏览量,0,YES,false,false,false',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '栏目ID,0,YES,false,false,false',
  `sort` int(11) DEFAULT NULL COMMENT '排序值,0,YES,false,false,false',
  `is_top` bit(1) DEFAULT NULL COMMENT '是否置顶,switch,YES,true,true,false',
  `is_recommend` bit(1) DEFAULT NULL COMMENT '是否推荐,switch,YES,true,true,false',
  `status` int(11) DEFAULT NULL COMMENT '文章状态,0,YES,false,false,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='博客内容,1,uploadImg-showPic-YES,timer-publistTime-YES,editor-co';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', 'banner', 'banner', null, '/static/upload/aa75189c-2df0-4ccb-b941-caef99f48b3d.png', '1', null, null, '2018-03-13 08:00:00', '<p>图片<br></p><p><br></p>', '图片', null, '19', '0', '\0', '\0', null, '2018-03-13 12:55:17', '1', '2019-10-31 19:09:03', '1', null, '0');
INSERT INTO `blog_article` VALUES ('2', '本周注意事项', '本周注意事项', '本周注意事项本周注意事项本周注意事项本周注意事项本周注意事项', null, '1', null, null, '2019-11-03 08:00:00', '<p>本周注意事项本周注意事项本周注意事项本周注意事项</p><p><br></p>', '本周注意事项本周注意事项本周注意事项本周注意事项', null, '1', '1', '', '', null, '2019-11-03 10:30:53', '1', '2019-11-03 10:53:59', '1', null, '1');
INSERT INTO `blog_article` VALUES ('3', '撒旦发射点发阿斯顿发顺丰', '啊手动阀手动阀', '啊手动阀手动阀十分', '/static/upload/c3de9537-4ed3-4888-bf9a-53dfb2b427da.jpg', '1', null, null, '2019-11-03 08:00:00', '<p>阿斯顿发射点发的</p>', '阿斯顿发射点发的', null, '14', '0', '\0', '\0', null, '2019-11-03 10:33:13', '1', '2019-11-03 10:33:13', '1', null, '0');

-- ----------------------------
-- Table structure for blog_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tags`;
CREATE TABLE `blog_article_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID,0,NO,false,false,false',
  `tags_id` bigint(20) NOT NULL COMMENT '标签ID,0,NO,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签-文章关联表,3';

-- ----------------------------
-- Records of blog_article_tags
-- ----------------------------

-- ----------------------------
-- Table structure for blog_channel
-- ----------------------------
DROP TABLE IF EXISTS `blog_channel`;
CREATE TABLE `blog_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称,input,NO,false,true,true',
  `site_id` bigint(20) DEFAULT NULL COMMENT '站点ID,0,YES,false,false,false',
  `href` varchar(500) DEFAULT NULL COMMENT '链接地址,input,YES,false,true,true',
  `logo` varchar(255) DEFAULT NULL COMMENT '栏目图标,input,YES,false,true,false',
  `is_base_channel` bit(1) DEFAULT NULL COMMENT '是否为主栏目,switch,YES,true,true,true',
  `can_comment` bit(1) DEFAULT NULL COMMENT '是否能够评论,switch,YES,true,true,true',
  `is_no_name` bit(1) DEFAULT NULL COMMENT '是否匿名,switch,YES,true,true,true',
  `is_can_aduit` bit(1) DEFAULT NULL COMMENT '是否开启审核,switch,YES,true,true,true',
  `seo_title` varchar(255) DEFAULT NULL COMMENT '网页title(seo),input,YES,false,false,false',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT '网页关键字(seo) ,input,YES,false,false,false',
  `seo_description` varchar(255) DEFAULT NULL COMMENT '网页描述(seo),textarea,YES,false,false,false',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点ID',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父节点联集',
  `level` bigint(2) DEFAULT NULL COMMENT '层级深度',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='博客栏目,2,switch-baseChannel-YES-true-is_base_channel,switch-ca';

-- ----------------------------
-- Records of blog_channel
-- ----------------------------
INSERT INTO `blog_channel` VALUES ('1', '网站首页', '1', '/index', '', '\0', '\0', '\0', '\0', null, null, null, null, '1,', '1', '60', '2018-01-22 11:55:24', '1', '2018-01-23 00:37:57', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('2', '文章专栏', '1', '/wzzl', '', '', '', '\0', '\0', null, null, null, null, '2,', '1', '50', '2018-01-22 11:55:56', '1', '2018-02-03 21:41:52', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('3', '资源分享', '1', '/share', '', '\0', '\0', '\0', '\0', null, null, null, null, '3,', '1', '10', '2018-01-22 11:56:50', '1', '2018-02-06 11:20:48', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('4', '点点滴滴', '1', '/dddd', '', '\0', '\0', '\0', '\0', null, null, null, null, '4,', '1', '30', '2018-01-22 11:57:16', '1', '2018-02-08 01:37:32', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('5', '关于本站', '1', '/about', '', '\0', '\0', '\0', '\0', null, null, null, null, '5,', '1', '20', '2018-01-22 11:57:40', '1', '2018-02-06 00:14:18', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('6', '通知', '1', '/tz', null, '\0', '\0', '\0', '\0', null, null, null, null, '6,', '1', '0', '2018-01-22 11:59:01', '1', '2018-01-22 23:25:40', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('7', '更新日志', '1', '/gxrz', null, '\0', '\0', '\0', '\0', null, null, null, null, '7,', '1', '-1', '2018-01-22 23:37:25', '1', '2018-01-22 23:37:38', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('9', 'H5', '1', '/wzzl/h5', null, '', '\0', '\0', '\0', null, null, null, '2', '2,9,', '2', '0', '2018-01-27 01:34:24', '1', '2018-01-27 01:46:23', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('10', 'mysql', '1', '/wzzl/mysql', null, '', '\0', '\0', '\0', null, null, null, '2', '2,10,', '2', '10', '2018-01-27 01:34:42', '1', '2018-01-27 01:46:17', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('11', 'springboot', '1', '/wzzl/springboot', null, '', '\0', '\0', '\0', null, null, null, '2', '2,11,', '2', '20', '2018-01-27 01:35:05', '1', '2018-01-27 01:46:09', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('12', 'mybatis', '1', '/wzzl/mybatis', null, '', '\0', '\0', '\0', null, null, null, '2', '2,12,', '2', '30', '2018-01-27 01:35:18', '1', '2018-01-27 01:46:02', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('13', 'IDE', '1', '/wzzl/ide', null, '', '', '\0', '\0', null, null, null, '2', '2,13,', '2', '40', '2018-01-27 01:35:44', '1', '2018-02-04 04:00:11', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('14', 'java', '1', '/wzzl/java', null, '', '', '\0', '\0', null, null, null, '2', '2,14,', '2', '50', '2018-01-27 01:35:56', '1', '2018-02-04 02:04:20', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('15', '留言墙', '1', '/about/messages', null, '\0', '', '\0', '\0', null, null, null, '5', '5,15,', '2', '0', '2018-02-05 21:27:13', '1', '2018-02-06 00:07:04', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('16', '友情链接', '1', '/about/friendlink', null, '\0', '\0', '\0', '\0', null, null, null, '5', '5,16,', '2', '10', '2018-02-05 21:27:33', '1', '2018-02-06 00:06:30', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('17', '关于作者', '1', '/about/author', null, '\0', '\0', '\0', '\0', null, null, null, '5', '5,17,', '2', '20', '2018-02-05 21:27:51', '1', '2018-02-06 00:06:18', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('18', '关于博客', '1', '/about/blog', null, '\0', '\0', '\0', '\0', null, null, null, '5', '5,18,', '2', '30', '2018-02-05 21:28:09', '1', '2018-02-05 23:14:56', '1', null, '0');
INSERT INTO `blog_channel` VALUES ('19', '首页banner图', '1', '/sybannert', null, '\0', '\0', '\0', '\0', null, null, null, null, '19,', '1', '1', '2018-02-07 10:31:12', '1', '2018-02-07 10:31:21', '1', null, '0');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '评论内容,textarea,NO,false,true,true',
  `type` int(11) DEFAULT NULL COMMENT 'ip,input,YES,false,true,true',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip,input,YES,false,true,true',
  `system` varchar(255) DEFAULT NULL COMMENT '操作系统,input,YES,false,true,false',
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器,input,YES,false,true,false',
  `floor` int(11) DEFAULT NULL COMMENT '楼层,0,YES,false,false,false',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '栏目ID,0,YES,false,false,false',
  `article_id` int(11) DEFAULT NULL COMMENT '文章ID,0,YES,false,false,false',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '回复评论ID,0,YES,false,false,false',
  `is_admin_reply` bit(1) DEFAULT NULL COMMENT '管理员是否回复,switch,YES,true,true,true',
  `reply_content` text COMMENT '管理员回复内容,textarea,YES,false,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客评论,1,switch-adminReply-YES-true-is_admin_reply';

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '标签名字,input,YES,false,true,true',
  `sort` int(11) DEFAULT NULL COMMENT '排序,0,YES,false,false,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客标签,1';

-- ----------------------------
-- Records of blog_tags
-- ----------------------------

-- ----------------------------
-- Table structure for erp_project
-- ----------------------------
DROP TABLE IF EXISTS `erp_project`;
CREATE TABLE `erp_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称,input,YES,false,true,true',
  `content` text COMMENT '招聘简章,textarea,YES,false,true,false',
  `careful` text COMMENT '注意事项,textarea,YES,false,true,false',
  `review` text COMMENT '面试流程,textarea,YES,false,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  `leader_id` bigint(20) DEFAULT NULL COMMENT '组长ID,input,YES,false,true,false',
  `status` int(11) DEFAULT NULL COMMENT '状态,radio,YES,false,true,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='项目表,1';

-- ----------------------------
-- Records of erp_project
-- ----------------------------
INSERT INTO `erp_project` VALUES ('1', '有家', '一、【企业简介】\n有家便利店，是领跑中国名族品牌便利店的先行者，不断刷新传统便利店行业标准，颠覆行业营销模式，只为给消费者创造更高品质便利生活方式。以“让生活更便利、让城市更温暖”为使命的连锁经营企业。旨在打造“便利店第一品牌”。公司现拥有便利店600余家，遍布武汉三镇。，南昌全市，深圳、广州，长沙等城市，店铺数量还在持续增长，公司“五年十城”计划将于五年内辐射至整个全国，店铺开设数量将增长至2000余家，让有家的便利传遍全国、温暖全国！\n二、【加入我们，你将拥有】\n①美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n②舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划\n，用最短的时间实现华丽转身，获得尊重和认可。\n③武汉三镇所有门店就近分配，工作地点自由弹性大。\n④高于同行业的薪酬制度。\n三、【招聘岗位】\n收银员、、理货员、陈列员、营业员。\n四、【招聘要求】\n20—35岁，男女不限，高中以上学历（优秀可以放宽），身体健康能接受晚班者优先。\n五、【工资计算】\n①底薪3000元+200学历补贴（大专及以上学历）+30元/次 夜班补贴 超过法定劳动工时1.5倍工资，节假日三倍工资。\n②奖金0-800（与销售额相关）\n③月综合工资3500-4500 。\n六、【福利待遇】\n①试用期买工伤险和意外险，转正后购买五险一金（表现优异者可提前转正或升为店长领班）\n②可以提前预支工资（每个月10号可预支，每月预支一次。\n七、【工作时间】\n早班7：00-16:00  中班 12:00-21:00  晚班21:30-7:30 三班倒 店长灵活排班。\n八、【工作地址】\n武汉三镇200多家店就近分配弹性大，就近分配。\n九、【面试时间】\n每周一到周五都可以安排面试\n十、【面试地点】\n武汉泛海国际SOHO城5栋1902。途经公交：360路/628路 地铁：地铁三号线中央商务区地铁站L出口\n十一、【温馨提示】\n实实在在招聘，不以任何形式收费，请求职者放心报名', '22', '尊敬的先生/女士您好，有家便利店邀请您参加面试，请于周X（X月X日）上午：X：XX准时到我司有家便利店总部参加面试\n详细地址：泛海国际SOHO城5栋1902。\n途经公交：360路/628路 地铁：地铁三号线中央商务区地铁站K出口。到面试地点可联系负责人胡老师：13237181865\n温馨提示：请携带签字笔一只(用于填写简历表)，身份证，复印件，一寸照片两张\n应聘渠道 或推荐方代码: D\n实实在在招聘，不收任何费用，收到请回复，谢谢！', '2019-10-27 12:41:13', '2', '2019-10-29 19:50:22', '2', null, '0', '7', '1');
INSERT INTO `erp_project` VALUES ('2', '7-11', '7-11招聘简章（2019.8）\n一、【公司简介】\n7-ELEVEn便利店，世界500强企业，世界最大的连锁便利店集团（没有之一），在便利店行业里面广为流传的一句话，这个行业只有两种便利店，一种叫做7-ELEVEn，一种叫做“其他便利店”。\n二、【加入我们，您将拥有】\n①美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n②舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划\n，用最短的时间实现华丽转身，获得尊重和认可。\n③武汉三镇所有门店就近分配，工作地点自由弹性大。\n④高于同行业的薪酬制度。\n三、【招聘岗位】\n储备店长，店员。（50人）。\n四、【任职资格】\n①年龄18-40岁；不限学历，不限经验。\n②工作认真负责，具有较强的沟通能力及服务意识，吃苦耐劳。\n③接受应届毕业生。\n④需要接受可以上晚班，并接受店铺调动。\n五、【工作时间】\n8小时/天，月休4天。\n早班7:30-16:30 中班12:30-21:30 晚班21:30-7:30，灵活排班。\n上班期间一个小时吃饭休息时间。\n六、【岗位职责】\n①指导客户购物、门店销售收银、现金及单据整理、熟食加工；\n②提供顾客服务、维持环境清洁、维护产品品质等工作的执行；\n③收点货、补货、打标、商品陈列管理。\n④完成上级领导交办的其他任务。\n七、【薪资待遇】\n3000-3500元/月（基本工资+岗位补贴+房补+绩效工资+夜班补贴+加班费+月奖+单项奖），五险一金，节假日福利、生日慰问物质、年假、企业文化活动等。每三个月有一次晋级加薪机会。每月15号发工资。\n八、【工作地址】\n武汉三镇就近分配。\n九、【面试时间】\n每周一到周五都可以安排面试。\n十、【面试地点】\n武汉市武昌区公正路216号平安金融科技大厦8楼\n十一、\n【晋升空间】店员-副店-店长。\n十二、\n【温馨提示】实实在在招聘，不以任何形式收费，请求职者放心报名。', null, '尊敬的××先生/女士您好，711便利店邀请您参加面试，请您于周×（×月×日）上午9点-11点 或 下午1点半-4点半到我司指定面试点参加面试。\n详细地址：武汉市武昌区公正路216号平安金融科技大厦8楼\n如有疑问直接联系徐主管： 17679112449\n温馨提示:请携带黑色中性笔，身份证原件及复印件2张，1寸免冠照片2张，迟到不能参加面试，若再有同事跟您预约，请告知已有预约，收到请回复，谢谢！', '2019-10-27 12:41:29', '2', '2019-10-29 19:42:17', '2', null, '0', '3', '1');
INSERT INTO `erp_project` VALUES ('3', '中百罗森', '中百罗森招聘简章（2019.8）\n一、【公司简介】\n中百罗森24小时便利店是武汉龙头便利店企业，目前门店已经超过400家，罗森品牌是全球规模最大的连锁便利店集团，罗森秉承着一个全球共通的企业理念：『我们让共同生活的城市变得更美好』。为了实现这个理念，我们以『有没有关怀他人的胸怀』、『有没有开拓创新的精神』、『有没有无论如何达成目标的信念』为思考起点时刻鞭策和激励自己。我们相信，有罗森的地方，就有安心安全的商品和全新的生活模式。\n二、【加入我们，你将拥有】\n①美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n②舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划\n，用最短的时间实现华丽转身，获得尊重和认可。\n③武汉三镇所有门店就近分配，工作地点自由弹性大。\n④高于同行业的薪酬制度。\n三、【招聘岗位】\n店员、营业员、理货员、领班、店长（100人）。\n四、【岗位要求】\n①年龄要求18-45岁；不限经验，不限学历\n②身体健康，能吃苦耐劳，品行端正；\n③能接受夜班及门店调剂；\n五、【薪酬待遇】\n①夜班补贴20元/晚，每月20号发放薪资\n②转正后购买社保\n③法定节假日期间按照国家三倍工资计算 以上综合薪资3000-5000元/月。\n六、【工作时间】\n早班8:30-20:30  晚班 20:30-8:30 两班倒 做五休二 灵活排班，弹性工作。\n七、【工作地点】\n武汉三镇400家门店就近分配，就近分配。\n八、【面试时间】\n每周一到周五都可以安排面试。\n九、【面试地址】\n武汉市硚口区古田二路凯景国际大厦A座10楼，乘地铁1号线到古田二路地铁站从C出口向右转1000米左右即到。\n十、【温馨提示】\n实实在在招聘，不以任何形式收费，请求职者放心报名。', null, '面试短信：尊敬的求职者您好，中百罗森邀请您参加面试，请您于周一（X月X号）上午9:00到我司总部参加面试，请携带身份证原件、一寸白底照片和一支黑色中性笔。详细地址：武汉市硚口区古田二路103号凯景国际大厦A座10楼\n（公交：古田二路长丰乡站，途经公交548丶328丶311。轻轨：1号线古田二路站C出口右转直行8分钟），到了直接联系负责人汤老师：17798235650 \n温馨提示：请准时到场，迟到不能参加面试，若再有同事跟您预约，请告知已有预约，收到请回复，谢谢', '2019-10-27 12:41:53', '2', '2019-10-29 19:50:47', '2', null, '0', '6', '1');
INSERT INTO `erp_project` VALUES ('4', 'Today', 'Today\n一、【薪资及福利】\n综合薪资3100-3500\n1、试用期：2571底薪+300房补+300~600绩效+夜班补贴（夜班补贴30元）+1.5倍加班费，法定节假日三薪 综合薪资3600-4000\n2、转正满三个月以后：2571底薪+300房补+400带店补助+600~1000绩效+夜班补贴（夜班补贴30元）+1.5倍加班费，法定节假日三薪 4000+\n、转正满六个月以后：2571底薪+300房补+400带店补助+800~1200绩效+夜班补贴（夜班补贴30元）+1.5倍加班费，法定节假日三薪 5000+。\n二、【岗位要求】\n1、男女不限，18-35岁，身体健康，工作认真仔细；\n2、学历不限；经验不限，能吃苦耐劳。\n3、无纹身、无鲜艳的头发颜色。\n三、【工作内容】\n1、负责做好货品盘点、账目核对、销售统计等工作；\n2、完成商品的来货验收、上架陈列摆放、补货、退货防损等日常营业工作；\n3、做好所负责区域及店铺设备的卫生清洁工作；\n4、完成上级领导交办的其他任务；\n5、晋升：店员（两月）---副店长（两月）---店长\n四、【工作时间】\n8小时制，月休4-6天（排班由店长安排）\n早班：7：30-16：30 中班：12：30-21：30 晚班：21：30-7：30（详细的根据每个店面的情况，然后店长分配）\n五、【加入我们，您将拥有】\n1、美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n2、舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划\n，用最短的时间实现华丽转身，获得尊重和认可。\n3、武汉三镇所有门店就近分配，工作地点自由弹性大。\n4、高于同行业的薪酬制度。\n六、【工作地址】\n武汉400家门店就近分配！就近分配！！！', null, 'TODAY\n尊敬的许星辰您好，Today便利店诚邀您参加面试，请于周三（10月23日）上午10：00-11:30我司Today便利店总部参加面试，详细地址：武汉市硚口区中山大道1号越秀财富中心21楼Today梦工厂（1号线硚口站C2出口第一个路口右拐直行200m即到，到了越秀财富中心先提前联系负责人杨女士：15271773360\n温馨提示：请务必携带黑色中性笔一支和身份证原件，收到请回复谢谢。', '2019-10-27 12:42:11', '2', '2019-10-30 19:21:49', '2', null, '0', '4', '1');
INSERT INTO `erp_project` VALUES ('5', '普安', '普安罗森\n一、【公司简介】\n普安药房是普安医药集团旗下的全国药品零售连锁品牌。普安药房一直致力于为消费者提供优质的健康产品和专业的药学服务。十余年来，在企业不断创新和发展中，培养出一大批素质优秀、勤奋上进的药品销售和管理人才。成功的营运及管理模式成为业内同行竞相学习的榜样，舒适时尚的购物体验更赢得了广大消费者的高度信赖。目前普安已在武汉、北京、天津、上海开设连锁药房逾百家。连续七年被中国非处方协会授予“中国优良药房”称号。普安药房已发展成为“中国连锁药房百强企业”。\n二、【加入我们，你将拥有】\n①美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n②舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划\n，用最短的时间实现华丽转身，获得尊重和认可。\n③武汉三镇所有门店就近分配，工作地点自由弹性大。\n④高于同行业的薪酬制度。\n三、【工作岗位】 \n营业员、理货员、 店员。\n四、【招聘要求】\n①18到38岁之内，男女不限,中专以上学历,\n②不限工作经验（可接受应届毕业生），身体健康。\n五、【工作时间】 \n9：00-20:00，月休4～6天。\n六、【工资待遇】 \nA、白班13元/时,夜班14元/事+夜班补贴25元（工时饱满）。\nB、绩效奖金(根据门店销售计算)\nC、节假日三倍工资。\n综合工资月薪3500到4500之间。\n七、【福利待遇】\n①提供住宿,有空调热水器,独立卫生间, WIFI。\n②每月10号可以预支工资。\n③每月公司组织两次旅游活动,可携带亲朋好友,都是免费。\n④公司提供足够宽广的晋升空间:内部竞聘店长，开店速度快店长稀缺机会多。\n八、【工作地址】 \n武汉三镇50家门店就近分配，工作地点自己选,弹性大。', null, '普安罗森（药房）\n您好，普安药房邀请您参加面试，请您于周三（X月X日)9点30准时到我司 参加面试\n详细地址：江汉区新华路福星国际商会大厦2102（公交：江汉北路新华路口站，途径公交290/592/605/807 地铁:2号线中山公园C出口 直走左转 )\n到了直接联系负责人郭主管：18086495883\n温馨提示：请携带黑色中性笔，身份证复印件，一寸照片，准时到场，迟到不能参加面试，请回复，谢谢！', '2019-10-27 12:42:33', '2', '2019-10-30 19:23:13', '2', null, '0', '3', '1');
INSERT INTO `erp_project` VALUES ('6', '中百超市', '中百超市\n一、【公司简介】\n中百仓储超市有限公司（简称：中百超市）成立于1997年12月，是中国上市公司中百控股集团股份有限公司的全资公司。公司围绕消费者息息相关的\"饭桌子、米袋子、油瓶子、菜篮子\"，以其\"低价无假货\"的经营宗旨，成为湖北省规模最大、网点最广，最具影响力的大型连锁超市。\n二、【加入我们，你将拥有】\n①美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n②舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划，用最短的时间实现华丽转身，获得尊重和认可。\n③武汉三镇所有门店就近分配，工作地点自由弹性大。\n④高于同行业的薪酬制度。\n三、【招聘岗位】收银员，理货员，生鲜员，店员。\n四、【招聘要求】男女不限，学历不限，18到50岁之内，身体健康，能吃苦耐劳。\n五、【工作时间】轮班制，每天8小时制，长白班，没有晚班，月休4-6天。\n六、【工资待遇】\n①薪资每小时14.5元，分割手每小时15.5元。法定节假日30元每小时,月薪3000—4000元。\n②不包吃住，每月15号之前发放上个月薪资(招商银行卡）;公司设有微波炉跟冰箱可以带饭到公司。\n七、【工作时间】早班7:00–14:30，中班14:00–21:30，吃饭扣半小时，每天7小时，月休4天；倒班一天一倒（今天早班明天中班）；\n八、【福利待遇】\n1、提供住宿（部分有住宿，部分没有）有空调，热水器，独立卫生间。\n2、晋升空间大，发展渠道广。\n3、就近安排工作地址。\n九、【工作地址】：武汉三镇就近分配。', null, null, '2019-10-27 12:42:57', '2', '2019-10-30 19:26:03', '2', null, '0', '5', '2');
INSERT INTO `erp_project` VALUES ('7', '中百仓储', '中百仓储\n一、【公司简介】中百仓储超市有限公司（简称：中百仓储）成立于1997年12月，是中国上市公司中百控股集团股份有限公司的全资公司。公司围绕消费者息息相关的\"饭桌子、米袋子、油瓶子、菜篮子\"，以其\"低价无假货\"的经营宗旨，成为湖北省规模最大、网点最广，最具影响力的大型连锁超市。\n二、【加入我们，您将拥有】\n①美女如云，帅哥成群，这里将是你邂逅缘分，告别单身最好的归宿。\n②舒适温馨的办公环境，朝气蓬勃的工作氛围，完善健全的培训体系，科学的职业提升计划\n，用最短的时间实现华丽转身，获得尊重和认可。\n③武汉三镇所有门店就近分配，工作地点自由弹性大。\n④高于同行业的薪酬制度。\n三、【招聘岗位】\n收银员、理货员、防损员若干\n四、【任职资格】\n①年龄18-50岁；不限学历，不限经验。\n②工作认真负责，具有较强的沟通能力及服务意识，吃苦耐劳。\n③接受应届毕业生。\n④需要接受可以上晚班，并接受店铺调动。\n五、【工作时间】\n早班7:00–14:30，中班14:00–22:00，每天7小时，月休4天；\n上班期间一个小时吃饭休息时间。\n六、【岗位职责】\n①指导客户购物、门店销售收银、现金及单据整理、熟食加工；\n②提供顾客服务、维持环境清洁、维护产品品质等工作的执行；\n③收点货、补货、打标、商品陈列管理。\n④完成上级领导交办的其他任务。\n七、【薪资待遇】\n①收银岗15.5元/每小时；水产、精肉岗16.5元/每小时，其他岗位15.5元/每小时；\n②国家法定节假日三倍薪资；月薪3000—4000元\n③每月20号左右发放上个月薪资(招商银行卡）；\n④公司设有微波炉跟冰箱可以带饭到公司；\n⑤员工有专门的储物柜存放私人物品；	\n八、【工作地址】\n武汉三镇所有门店就近分配。', null, '中百仓储\n尊敬的求职者您好，中百仓储邀请您参加面试，请您于xxx(x月x日)xxxx到xxxxxx店(中百仓储)面试；请带上身份证复印件两张和黑色中性笔一支，地址：xxxxxxxxxxxxxxxxx\n到了现场联系负责人：xx主管：号码xxxxxxxxxxxxxxxxx 若再有同事跟您联系，请告知已有预约，实实在在招聘，不以任何形式收费，收到请回复，谢谢！', '2019-10-27 12:43:18', '2', '2019-10-30 19:28:40', '2', null, '0', '5', '1');
INSERT INTO `erp_project` VALUES ('8', '京东', '京东\n【J东简介】J东是中国最大的自营式电商企业，2004年正式涉足电商领域。旗下设有J东商城，J东金融，拍拍，J东智能，J东到家及海外事业部。公司发展至今，市场规模不断扩大，市场交易额飞速增长.\n【工作岗位】分拣员； 理货员；扫描员  非常简单轻松，之前做过的人都知道  每天都招聘\n【入职要求】男女不限，18到45岁之内，学历不限，身体健康，能吃苦耐劳\n【薪资待遇】20元/时（15元/时的基本工资+每小时5元的餐补）  综合工资4500——6000元/月\n【福利保险】免费提供住宿、棉被，直接拎包上班。住宿环境有独立卫生间，热水器，空调，住宿期间产生水电费均摊；免费买商业保险、意外保险\n附加福利：可预支工资\n【工作时间】早班 7:00——17:00   晚班   14:00——24:00  无深夜夜班\n【工作地点】武汉汉阳J东弗兰西地物流园\n【报名方式】京东+名字+电话发送至xxxxxxxxx\n【温馨提示】本岗位实实在在招聘，不以任何形式收取任何费用，请求职者放心报名，谢谢！！\n•快递小件分拣高薪长白班\n', null, '京东\n王春晶您好。武汉京东物流欢迎您：请您明天（10.25号）下午13:00-13:30或者15.00-15.30到达蔡甸区常福工业园赛尔公寓集合安排京东住宿和入职，请带上2张身份证复印件以及个人行李。乘车路线：可在地铁三号线<沌口大道>站B出口乘坐656路公交到终点站牌下车走到赛尔公寓福欣佳惠超市，到了请联系万主管：15927622739。\n特别说明：请准备好建行、工行或者汉口银行的银行卡或卡号，方便后期发工资。此岗位不以任何形式收费，如遇收费请及时举报，若再有同事跟您预约，请告知已有预约，收到请回复，谢谢！', '2019-10-27 12:43:47', '2', '2019-10-30 19:29:58', '2', null, '0', null, '1');
INSERT INTO `erp_project` VALUES ('9', '盒马', '盒马\n河马鲜生-是一种新的生鲜电商。河马是超市，是餐饮店，也是菜市场，但这样的描述似乎又都不准确。消费者可到店购买，也可以在河马App下单。而河马最大的特点之一就是快速配送：门店附近3公里范围内，30分钟送货上门。\n现因公司发展诚聘以下岗位：\n一.招聘岗位\n1. 理货员 （超市货架物品的码放及补货）\n2. 厨工 （帮助厨师简单处理打荷）\n3. 分拣员 （根据线上客户订单拣取相对应的食品）\n4. 水产杀鱼 （负责水产海鲜之类的粗加工）\n5.服务员（负责餐吧点餐及排面整洁）\n二． 任职要求：18-40岁，中专及以上学历，具备较强的动手能力，学习能力强，责任心强，具有零售相关的工作经验优先考虑，工作认真负责\n三．上班时间：早班7:00-16:00, 中班13：00-22：00，月休四天\n四． 薪资待遇：15/小时，月综合工资3000元/月-4000元/月\n五． 福利待遇：带薪年假，法定节假日三倍加班工资，完善的晋升平台，节假日福利，不定期的激励\n六．门店地址：武汉三镇就近安排。报名从速，有意者直接电话报名咨询\n注：有无经验均可，室内带薪培训.门店直招，不收取任何费用和押金。', null, '盒马\n尊敬的求职者您好，盒马鲜生邀请您参加面试，请您于星期四(7月11日)下午14：00到15:00到xxxxxxxxx店(xxxx店面地址xxxxx)面试；请带上身份证复印件两张和黑色中性笔一支，\n到了现场联系负责人：汪主管：15527284300。 若再有同事跟您联系，请告知已有预约，实实在在招聘，不以任何形式收费，收到请回复，谢谢！', '2019-10-27 12:44:06', '2', '2019-11-01 14:07:07', '2', null, '0', '4', '1');
INSERT INTO `erp_project` VALUES ('10', '集渔', '集渔\n【企业简介】\n集渔是由成都爱都投资管理咨询服务有限公司2017年成功注册的品牌，是以\n泰式海鲜火锅的研发经营及加盟为主的品牌。集渔泰式海鲜火锅源于泰国普吉岛\n芭东海滩，落地成都，2018年开放加盟\n【岗位要求】\n一：18-40岁，不限学历\n二：服务员：35岁以下，能吃苦耐劳\n三：收银：20~30岁之间，长相甜美\n四：迎宾：长相甜美 160cm+\n五：摆盘：切配 、摆盘 分冰船 和素菜区，冰船 素菜区 \n六：吧台 ：饮品制作、本成品甜品制作出品 、及收银\n七：甜品小吃：甜品制作等\n【工作时间】\n上班时间11:00~22:00两班倒 综合工作9.5-10小时，由门店店长排班\n【福利待遇】\n收银、服务员：3300元-5000元\n后厨：3300元-5500元\n3100底薪+200全勤+绩效奖金（岗位不同、绩效不同）\n每月15号发放薪资\n包吃（一日三餐）包住、我们提供：优质的宿舍管家服务、丰富的节日福利\n月休四天、全勤奖金、业绩奖金、节假日福利、带薪年假\n每月贴心的生日聚会福利、每月生活用品的发放、每月水电费补贴', null, '集渔\n尊敬的刘刚您好，集渔餐饮邀请您参加面试，请您于周五（10月25日）11：00-17：00之间到我司指定面试点参加面试。\n详细地址：武汉市江汉区青年路308号花园道商业区B区2层209号（地铁2号线，王家墩东C2出口花园道）\n到了请直接联系：周经理13554195687或者杨经理17762404410\n温馨提示:请携带黑色中性笔，身份证原件及复印件2张，1寸免冠照片2张，迟到不能参加面试，若再有同事跟您预约，请告知已有预约，收到请回复，谢谢！', '2019-10-27 17:49:02', '2', '2019-10-30 19:32:23', '2', null, '0', '8', '1');
INSERT INTO `erp_project` VALUES ('11', '华星光电', null, null, null, '2019-11-01 19:36:09', '2', '2019-11-01 19:36:09', '2', null, '0', '6', '1');

-- ----------------------------
-- Table structure for erp_project_tag
-- ----------------------------
DROP TABLE IF EXISTS `erp_project_tag`;
CREATE TABLE `erp_project_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID,0,NO,false,false,false',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID,0,NO,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='项目标签表,3';

-- ----------------------------
-- Records of erp_project_tag
-- ----------------------------
INSERT INTO `erp_project_tag` VALUES ('33', '2', '2');
INSERT INTO `erp_project_tag` VALUES ('34', '2', '9');
INSERT INTO `erp_project_tag` VALUES ('35', '2', '3');
INSERT INTO `erp_project_tag` VALUES ('36', '2', '8');
INSERT INTO `erp_project_tag` VALUES ('37', '2', '1');
INSERT INTO `erp_project_tag` VALUES ('42', '1', '1');
INSERT INTO `erp_project_tag` VALUES ('43', '1', '2');
INSERT INTO `erp_project_tag` VALUES ('44', '1', '10');
INSERT INTO `erp_project_tag` VALUES ('45', '1', '8');
INSERT INTO `erp_project_tag` VALUES ('46', '3', '2');
INSERT INTO `erp_project_tag` VALUES ('47', '3', '1');
INSERT INTO `erp_project_tag` VALUES ('48', '3', '8');
INSERT INTO `erp_project_tag` VALUES ('49', '3', '10');
INSERT INTO `erp_project_tag` VALUES ('50', '4', '8');
INSERT INTO `erp_project_tag` VALUES ('51', '4', '1');
INSERT INTO `erp_project_tag` VALUES ('52', '4', '10');
INSERT INTO `erp_project_tag` VALUES ('53', '5', '1');
INSERT INTO `erp_project_tag` VALUES ('54', '5', '10');
INSERT INTO `erp_project_tag` VALUES ('55', '5', '8');
INSERT INTO `erp_project_tag` VALUES ('56', '5', '2');
INSERT INTO `erp_project_tag` VALUES ('57', '6', '8');
INSERT INTO `erp_project_tag` VALUES ('58', '6', '10');
INSERT INTO `erp_project_tag` VALUES ('59', '7', '8');
INSERT INTO `erp_project_tag` VALUES ('60', '7', '10');
INSERT INTO `erp_project_tag` VALUES ('61', '8', '10');
INSERT INTO `erp_project_tag` VALUES ('62', '8', '8');
INSERT INTO `erp_project_tag` VALUES ('66', '10', '7');
INSERT INTO `erp_project_tag` VALUES ('67', '10', '8');
INSERT INTO `erp_project_tag` VALUES ('68', '9', '8');
INSERT INTO `erp_project_tag` VALUES ('69', '9', '10');
INSERT INTO `erp_project_tag` VALUES ('70', '9', '2');

-- ----------------------------
-- Table structure for erp_project_user
-- ----------------------------
DROP TABLE IF EXISTS `erp_project_user`;
CREATE TABLE `erp_project_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID,0,NO,false,false,false',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID,0,NO,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='项目专员表,3';

-- ----------------------------
-- Records of erp_project_user
-- ----------------------------
INSERT INTO `erp_project_user` VALUES ('43', '2', '18');
INSERT INTO `erp_project_user` VALUES ('44', '2', '3');
INSERT INTO `erp_project_user` VALUES ('45', '2', '9');
INSERT INTO `erp_project_user` VALUES ('46', '2', '12');
INSERT INTO `erp_project_user` VALUES ('47', '2', '8');
INSERT INTO `erp_project_user` VALUES ('53', '1', '9');
INSERT INTO `erp_project_user` VALUES ('54', '1', '5');
INSERT INTO `erp_project_user` VALUES ('55', '1', '23');
INSERT INTO `erp_project_user` VALUES ('56', '1', '11');
INSERT INTO `erp_project_user` VALUES ('57', '1', '16');
INSERT INTO `erp_project_user` VALUES ('58', '1', '15');
INSERT INTO `erp_project_user` VALUES ('59', '1', '7');
INSERT INTO `erp_project_user` VALUES ('60', '3', '4');
INSERT INTO `erp_project_user` VALUES ('61', '3', '12');
INSERT INTO `erp_project_user` VALUES ('62', '3', '14');
INSERT INTO `erp_project_user` VALUES ('63', '3', '17');
INSERT INTO `erp_project_user` VALUES ('64', '3', '6');
INSERT INTO `erp_project_user` VALUES ('65', '4', '6');
INSERT INTO `erp_project_user` VALUES ('66', '4', '7');
INSERT INTO `erp_project_user` VALUES ('67', '4', '4');
INSERT INTO `erp_project_user` VALUES ('68', '4', '17');
INSERT INTO `erp_project_user` VALUES ('69', '5', '5');
INSERT INTO `erp_project_user` VALUES ('70', '5', '13');
INSERT INTO `erp_project_user` VALUES ('71', '5', '3');
INSERT INTO `erp_project_user` VALUES ('72', '5', '21');
INSERT INTO `erp_project_user` VALUES ('73', '6', '8');
INSERT INTO `erp_project_user` VALUES ('74', '6', '17');
INSERT INTO `erp_project_user` VALUES ('75', '6', '18');
INSERT INTO `erp_project_user` VALUES ('76', '6', '13');
INSERT INTO `erp_project_user` VALUES ('77', '6', '5');
INSERT INTO `erp_project_user` VALUES ('78', '6', '11');
INSERT INTO `erp_project_user` VALUES ('79', '6', '21');
INSERT INTO `erp_project_user` VALUES ('80', '7', '16');
INSERT INTO `erp_project_user` VALUES ('81', '7', '5');
INSERT INTO `erp_project_user` VALUES ('82', '7', '12');
INSERT INTO `erp_project_user` VALUES ('83', '8', '13');
INSERT INTO `erp_project_user` VALUES ('84', '8', '16');
INSERT INTO `erp_project_user` VALUES ('85', '8', '3');
INSERT INTO `erp_project_user` VALUES ('86', '8', '21');
INSERT INTO `erp_project_user` VALUES ('87', '8', '9');
INSERT INTO `erp_project_user` VALUES ('88', '8', '22');
INSERT INTO `erp_project_user` VALUES ('89', '8', '10');
INSERT INTO `erp_project_user` VALUES ('90', '8', '20');
INSERT INTO `erp_project_user` VALUES ('91', '8', '7');
INSERT INTO `erp_project_user` VALUES ('92', '8', '15');
INSERT INTO `erp_project_user` VALUES ('93', '8', '6');
INSERT INTO `erp_project_user` VALUES ('94', '8', '11');
INSERT INTO `erp_project_user` VALUES ('95', '8', '14');
INSERT INTO `erp_project_user` VALUES ('96', '8', '5');
INSERT INTO `erp_project_user` VALUES ('97', '8', '19');
INSERT INTO `erp_project_user` VALUES ('98', '8', '24');
INSERT INTO `erp_project_user` VALUES ('99', '8', '8');
INSERT INTO `erp_project_user` VALUES ('100', '8', '12');
INSERT INTO `erp_project_user` VALUES ('101', '8', '4');
INSERT INTO `erp_project_user` VALUES ('102', '8', '17');
INSERT INTO `erp_project_user` VALUES ('103', '8', '18');
INSERT INTO `erp_project_user` VALUES ('104', '8', '23');
INSERT INTO `erp_project_user` VALUES ('106', '10', '20');
INSERT INTO `erp_project_user` VALUES ('107', '10', '4');
INSERT INTO `erp_project_user` VALUES ('108', '10', '11');
INSERT INTO `erp_project_user` VALUES ('109', '10', '19');
INSERT INTO `erp_project_user` VALUES ('110', '10', '8');
INSERT INTO `erp_project_user` VALUES ('111', '10', '6');
INSERT INTO `erp_project_user` VALUES ('112', '10', '14');
INSERT INTO `erp_project_user` VALUES ('113', '10', '5');
INSERT INTO `erp_project_user` VALUES ('114', '10', '17');
INSERT INTO `erp_project_user` VALUES ('115', '10', '3');
INSERT INTO `erp_project_user` VALUES ('116', '10', '21');
INSERT INTO `erp_project_user` VALUES ('117', '10', '7');
INSERT INTO `erp_project_user` VALUES ('118', '10', '15');
INSERT INTO `erp_project_user` VALUES ('119', '10', '22');
INSERT INTO `erp_project_user` VALUES ('120', '10', '10');
INSERT INTO `erp_project_user` VALUES ('121', '10', '9');
INSERT INTO `erp_project_user` VALUES ('122', '10', '12');
INSERT INTO `erp_project_user` VALUES ('123', '10', '24');
INSERT INTO `erp_project_user` VALUES ('124', '10', '13');
INSERT INTO `erp_project_user` VALUES ('125', '10', '23');
INSERT INTO `erp_project_user` VALUES ('126', '10', '16');
INSERT INTO `erp_project_user` VALUES ('127', '10', '18');
INSERT INTO `erp_project_user` VALUES ('128', '9', '3');
INSERT INTO `erp_project_user` VALUES ('129', '9', '25');
INSERT INTO `erp_project_user` VALUES ('130', '9', '6');
INSERT INTO `erp_project_user` VALUES ('131', '9', '20');
INSERT INTO `erp_project_user` VALUES ('132', '9', '5');
INSERT INTO `erp_project_user` VALUES ('133', '9', '9');
INSERT INTO `erp_project_user` VALUES ('134', '9', '4');
INSERT INTO `erp_project_user` VALUES ('135', '9', '11');
INSERT INTO `erp_project_user` VALUES ('136', '9', '23');

-- ----------------------------
-- Table structure for erp_resume
-- ----------------------------
DROP TABLE IF EXISTS `erp_resume`;
CREATE TABLE `erp_resume` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名,input,YES,false,true,true',
  `sex` int(11) DEFAULT NULL COMMENT '性别,radio,YES,false,true,true',
  `age` int(11) DEFAULT NULL COMMENT '年龄,input,YES,false,true,false',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话,input,YES,false,true,false',
  `address` varchar(255) DEFAULT NULL COMMENT '地址,input,YES,false,true,true',
  `education` int(11) DEFAULT NULL COMMENT '学历,select,YES,false,true,true',
  `salary` varchar(255) DEFAULT NULL COMMENT '工资,input,YES,false,true,false',
  `job` varchar(255) DEFAULT NULL COMMENT '期望职位,input,YES,false,true,true',
  `status` int(11) DEFAULT NULL COMMENT '求职状态,radio,YES,false,true,true',
  `addr` varchar(255) DEFAULT NULL COMMENT '期望地址,input,YES,false,true,true',
  `year` varchar(255) DEFAULT NULL COMMENT '工作经验,input,YES,false,true,true',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  `job_status` int(11) DEFAULT NULL COMMENT '人才状态,select,YES,false,true,true',
  `type` int(11) DEFAULT NULL COMMENT '类型,radio,YES,false,true,false',
  `curr_job` varchar(255) DEFAULT NULL COMMENT '现职位,input,YES,false,true,false',
  `mail` varchar(32) DEFAULT NULL COMMENT '电子邮件,input,YES,false,true,false',
  `unit` varchar(64) DEFAULT NULL COMMENT '现单位,input,YES,false,true,false',
  `school` varchar(255) DEFAULT NULL COMMENT '学校,input,YES,false,true,false',
  `major` varchar(255) DEFAULT NULL COMMENT '专业,input,YES,false,true,false',
  `down_date` datetime DEFAULT NULL COMMENT '下载日期,timer,YES,false,true,false',
  `project_id` bigint(20) DEFAULT NULL COMMENT '成交项目,0,YES,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='简历表,1,timer-downDate-YES';

-- ----------------------------
-- Records of erp_resume
-- ----------------------------
INSERT INTO `erp_resume` VALUES ('1', '李亚双', '2', '19', '13207163422', '洪山区', '2', '4000', '收银', '1', '洪山区', '1', '2019-11-01 10:34:04', '5', '2019-11-03 10:48:40', '3', null, '0', '3', '1', null, null, null, null, null, null, '8');
INSERT INTO `erp_resume` VALUES ('2', '艾伦', '2', '19', '13797132449', '盘龙城', '3', '3500', '收银员', '1', '汉口都行', null, '2019-11-01 11:24:00', '7', '2019-11-01 11:24:00', '7', null, '0', '1', '1', null, null, null, null, null, '2019-09-20 08:00:00', '1');
INSERT INTO `erp_resume` VALUES ('3', '赵杰', '1', '21', '18571452048', null, null, '3000-5000', '店员', '1', null, null, '2019-11-01 11:24:03', '4', '2019-11-01 11:24:03', '4', null, '0', '2', null, null, null, null, null, null, null, '3');
INSERT INTO `erp_resume` VALUES ('4', '李江毅', '1', '20', '13986773743', '湖北宜昌', '6', null, '服务员', '1', null, null, '2019-11-01 11:28:54', '21', '2019-11-01 11:28:54', '21', null, '0', '2', '1', null, null, null, null, null, null, '10');
INSERT INTO `erp_resume` VALUES ('5', '于国强', '1', '20', '15697175116', '湖北宜昌', null, null, null, '1', null, null, '2019-11-01 11:30:03', '21', '2019-11-01 11:30:03', '21', null, '0', '2', '1', null, null, null, null, null, null, '10');
INSERT INTO `erp_resume` VALUES ('6', '龚小飞', '1', '25', '13477118407', null, null, null, null, '1', null, null, '2019-11-01 11:33:00', '21', '2019-11-01 11:33:00', '21', null, '0', '2', '1', null, null, null, null, null, null, '10');
INSERT INTO `erp_resume` VALUES ('7', '鲍子龙', '1', '24', '18645602067', '青鱼嘴', '3', '3500', '储备干部', '1', null, null, '2019-11-01 11:34:01', '7', '2019-11-01 11:34:58', '7', null, '0', '1', '1', null, null, null, null, null, '2019-09-20 08:00:00', '1');
INSERT INTO `erp_resume` VALUES ('8', '陈皓然', '2', '21', '13339868790', '湖北省武汉市江夏区锦绣龙城D区北门', null, '3000-5000', '店员', '1', '湖北省武汉市江夏区锦绣龙城D区北门', null, '2019-11-01 11:35:07', '4', '2019-11-01 11:35:07', '4', null, '0', '2', '1', null, null, null, null, null, null, '4');
INSERT INTO `erp_resume` VALUES ('9', '王欣', '2', '21', '15872416152', null, '1', null, null, null, '武汉硚口区宗关', '1-3年', '2019-11-01 11:36:10', '12', '2019-11-01 11:36:10', '12', null, '0', '1', '1', null, null, null, null, null, null, null);
INSERT INTO `erp_resume` VALUES ('10', '王红林', '2', '41', '18696207206', '龙阳雅苑', '3', '3000', '防损员', '1', '龙阳村', '销售专员', '2019-11-01 11:36:31', '16', '2019-11-01 11:36:31', '16', null, '0', '2', '1', null, null, null, null, null, '2019-11-01 08:00:00', '7');
INSERT INTO `erp_resume` VALUES ('11', '吕学营', '1', '38', '15327480825', null, '3', '5000-8000', '厨师', '1', null, '5-10年', '2019-11-01 11:36:53', '10', '2019-11-01 11:36:53', '10', null, '0', '1', '1', null, null, null, null, null, null, '10');
INSERT INTO `erp_resume` VALUES ('12', '肖恒', '1', '26', '15972916723', '江汉区', '1', '5000-8000', '店员', '1', '江汉区', '福隆珠宝  2018年03月-2019年06月', '2019-11-01 11:38:01', '18', '2019-11-01 11:38:01', '18', null, '0', '2', '1', '销售', null, '福隆珠宝', '武汉市二轻工业学院', '机电一体化', null, '10');
INSERT INTO `erp_resume` VALUES ('13', '张晶', '2', '27', '13657293121', '天顺园五组团', '3', '3000', '营业员', '1', '硚口区', '房产销售', '2019-11-01 11:44:30', '16', '2019-11-01 11:44:30', '16', null, '0', '1', '1', null, null, null, null, null, '2019-11-01 08:00:00', '7');
INSERT INTO `erp_resume` VALUES ('14', '余慧', '2', '37', '15671589355', '江汉区新华路', null, null, '盒马鲜生管培生', '1', '江汉区新华路盒马鲜生', null, '2019-11-01 14:01:35', '3', '2019-11-03 10:06:54', '9', null, '0', '2', '1', null, null, null, null, null, '2019-11-01 08:00:00', '9');
INSERT INTO `erp_resume` VALUES ('15', '周蓝', '2', '48', '18171097716', '江岸区新北路', '4', '4K-6K', '收银', '1', '江岸区附近', '新世界发展物业管理有限公司', '2019-11-01 14:51:02', '18', '2019-11-01 14:51:02', '18', null, '0', '2', '1', '物业管理', null, '新世界发展物业管理有限公司', '中央广播电视大学', '法学', null, '6');
INSERT INTO `erp_resume` VALUES ('16', '陈箐', '2', '41', '15827550658', '武汉江汉区杨汊湖', '1', '3000-5000', '店员-营业员', '1', '武汉江汉区杨汊湖', '10年', '2019-11-01 15:33:15', '6', '2019-11-01 15:33:15', '6', null, '0', '1', '1', null, null, null, null, null, null, '3');
INSERT INTO `erp_resume` VALUES ('17', '李静', '2', '41', '15327195886', '武汉市武昌区', '3', '3000-5000', '店员-营业员', '1', '武汉武昌区徐东、武汉武昌区中南路', '10年', '2019-11-01 15:35:21', '6', '2019-11-01 15:35:21', '6', null, '0', '1', '1', null, null, null, null, null, null, null);
INSERT INTO `erp_resume` VALUES ('18', '孙鹏', '1', '29', '18971461870', '江汉区华安里', '2', '3000-5000', '后厨', '1', '江汉区', null, '2019-11-01 15:56:52', '14', '2019-11-01 15:56:52', '14', null, '0', '1', '1', null, null, null, null, null, null, '10');
INSERT INTO `erp_resume` VALUES ('19', '曹卓', '2', '24', '18674172367', null, '1', '3000-5000', '前台/总机/接待', '1', '武汉', '3年', '2019-11-01 16:19:51', '17', '2019-11-01 16:19:51', '17', null, '0', '1', '1', '离职', null, null, null, null, '2019-11-01 08:00:00', '3');
INSERT INTO `erp_resume` VALUES ('20', '杨如意', '1', '27', '13410570012', '蔡甸区', '2', '4500-6000', '分拣员', '1', '蔡甸区', null, '2019-11-01 16:22:14', '14', '2019-11-01 16:22:14', '14', null, '0', '1', '1', null, null, null, null, null, null, '8');
INSERT INTO `erp_resume` VALUES ('21', '胡珍', '2', '30', '13971635745', '青山区武东', '3', '3K-5K', '收银员', '2', '青山区武东附近', '5年', '2019-11-01 16:38:04', '13', '2019-11-01 16:38:04', '13', null, '0', '3', '1', null, null, null, null, null, null, '6');
INSERT INTO `erp_resume` VALUES ('22', '杜林', '1', '20', '18571626958', '循礼门', '6', '3k-4k', '收银', '1', '就近分配', '无', '2019-11-01 16:49:59', '8', '2019-11-01 16:49:59', '8', null, '0', '1', '1', null, null, null, null, null, null, '2');
INSERT INTO `erp_resume` VALUES ('23', '王齐钢', '1', '22', '15727004545', '洪山区金地雄楚一号', '4', '5000-8000', '店员', '1', '洪山区', '有家便利店店长', '2019-11-01 16:59:41', '18', '2019-11-01 16:59:41', '18', null, '0', '2', '1', '店长', null, '有家便利店', null, null, null, '2');
INSERT INTO `erp_resume` VALUES ('24', '张乾禾', '1', '39', '15072390085', '江岸区后湖', null, null, '理货导购', '1', '万家汇门店', '无超市工作经验', '2019-11-01 17:06:04', '3', '2019-11-01 17:06:04', '3', null, '0', '2', '1', null, null, null, null, null, '2019-11-01 08:00:00', '9');
INSERT INTO `erp_resume` VALUES ('25', '贺晓波', '1', '26', '15327415523', '钟家村', '3', '3500', '营业员', '1', '钟家村', '销售专员', '2019-11-01 17:10:50', '16', '2019-11-01 17:10:50', '16', null, '0', '1', '1', null, null, null, null, null, '2019-11-01 08:00:00', '1');
INSERT INTO `erp_resume` VALUES ('26', '测试11', '1', null, null, null, null, null, null, null, null, null, '2019-11-03 10:01:44', '9', '2019-11-03 10:07:25', '9', null, '0', '1', null, null, null, null, null, null, null, '9');
INSERT INTO `erp_resume` VALUES ('27', '测试12', '2', null, null, null, null, null, null, null, null, null, '2019-11-03 10:03:51', '9', '2019-11-03 10:05:52', '9', null, '0', '2', null, null, null, null, null, null, null, '1');
INSERT INTO `erp_resume` VALUES ('28', '测试22', '2', null, null, null, null, null, null, null, null, null, '2019-11-03 10:09:47', '3', '2019-11-03 10:09:47', '3', null, '0', '1', null, null, null, null, null, null, null, null);
INSERT INTO `erp_resume` VALUES ('29', '测试22-xu', '2', null, null, null, null, null, null, null, null, null, '2019-11-03 10:10:14', '3', '2019-11-03 10:10:14', '3', null, '0', '2', null, null, null, null, null, null, null, '5');
INSERT INTO `erp_resume` VALUES ('30', '李丽丽', '2', '36', '13407257478', null, '2', '面议', '中百仓储理货员', null, null, '3-5年', '2019-11-03 10:41:47', '2', '2019-11-03 10:44:15', '3', null, '0', '2', '1', null, null, null, null, null, '2018-09-29 08:00:00', '9');
INSERT INTO `erp_resume` VALUES ('31', '周建林', '2', '29', '18272175814', '武汉武昌区', '2', '面议', '中百仓储/长白班/8小时', null, null, '6-10年', '2019-11-03 10:41:47', '2', '2019-11-03 10:41:47', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('32', '谈志成', '1', '23', '15271692211', null, '2', '5000-8000', '京东五险+包住餐补5k', null, null, '1-2年', '2019-11-03 10:41:47', '2', '2019-11-03 10:41:47', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('33', '杨琼丽', '2', '36', '15927496623', '孝感其他', '2', '面议', '京东4K长短期提供棉被', null, null, '无经验', '2019-11-03 10:41:47', '2', '2019-11-03 10:41:47', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('34', '王军芳', '2', '23', '18271878422', null, '1', '3000-5000', '普工4K无需体检拎包入住', null, null, '1-2年', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', '业务员', null, '武汉皖南同创房产顾问有限公司', '武汉外语外事学院', '销售', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('35', '徐梅', '2', '21', '18327876210', null, '4', '面议', '京东+分拣+不熬夜当天上', null, null, '应届生', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('36', '杨小龙', '1', '28', '18871258283', null, '3', '5000-8000', '京东4K长短期提供棉被', null, null, '10年以上', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('37', '鲁礼安', '1', '16', '17683809411', null, '3', '3000-5000', '白班分拣+5K上岗送棉被', null, null, '应届生', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('38', '刘栋', '1', '25', '18872630791', null, null, '3000-5000', '物流分拣员当天即可入职', null, null, '10年以上', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', '会籍顾问', null, '天浩健身俱乐部', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('39', '涂文冠', '1', '17', '18671293639', null, null, '2000-3000', '白班分拣+5K上岗送棉被', null, null, '无经验', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('40', '志祥', '1', '17', '18271759074', null, '3', '3000-5000', '京东+4K长短期工提供被', null, null, '1-2年', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', 'KTV楼面陆长', null, '五洲传媒有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('41', '叶秋', '1', '26', '13872092160', '黄石黄石港', '4', '面议', '名幸电子包吃住', null, null, '3-5年', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', '人事主管', null, '智汇招聘人力资源有限公司', '武汉音乐学院', '音乐表演', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('42', '李雪', '2', '25', '15500908635', null, '2', '3000-5000', '名幸电子5000+包吃住', null, null, '6-10年', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:48', '2', null, '0', '1', '1', '销售', null, '服装西餐厅美容', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('43', '徐德建', '1', '25', '15897700538', null, '2', '3000-5000', '名幸电子5000+包吃住', null, null, '6-10年', '2019-11-03 10:41:48', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('44', '杜迪凡', '1', '24', '15271662801', null, '1', '2000-3000', '京东+分拣+不熬夜当天上', null, null, '1年以下', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', '水处理员', '3410129660@qq.com', '黄石市体育馆游泳馆', '湖北工程职业学院', '建筑工程工程造价', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('45', '冯薇玲', '2', '33', '18627017102', null, null, '面议', '京东4K长短期提供棉被', null, null, '6-10年', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', '会计', null, '物流公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('46', '黄英', '2', '21', '13429819091', '武汉江岸区后湖', '2', '面议', '中百罗森收银员月休12', null, null, '1-2年', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('47', '章余', '2', '29', '15871393583', null, null, '5000-8000', '中百罗森+做四休三+包住', null, null, '10年以上', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', '店助', null, '机场鄂尔多斯', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('48', '陈卓卓', '1', '16', '18071404157', null, null, '3000-5000', '京东分拣扫描包住月4K', null, null, '应届生', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('49', '郭壮', '1', '23', '18062404996', '武汉', '1', '面议', '中百仓储招聘待遇好', null, null, '1-2年', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', '包装工', null, '百威英博（宁波）啤酒有限公司', '湖北轻工职业技术学院', '啤酒技术', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('50', '陈思远', '1', '24', '18506713769', '孝感', '1', '面议', '名幸电子招短期包吃住', null, null, '无经验', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', null, null, null, '鄂东职业技术学院', '模具设计与制造', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('51', '董意', '1', '26', '15826872805', null, null, '3000-5000', '京东4K长短期提供棉被', null, null, '6-10年', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', '送外卖', null, '美团外卖', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('52', '张强', '1', '26', '18335844448', null, null, '3000-5000', '京东+预支工资5K送棉被', null, null, '3-5年', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:49', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('53', '刘腾', '1', '34', '13349865380', null, null, '面议', '白班分拣+5K当天上岗', null, null, '10年以上', '2019-11-03 10:41:49', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('54', '漆国兵', '1', '49', '18881840292', null, '3', '面议', '中百仓储招聘待遇好', null, null, '10年以上', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('55', '王东飞', '1', '23', '18534776823', null, '1', '3000-5000', '京东+无门槛5K男女不限', null, null, '3-5年', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', '配菜', null, '东北满意水饺王', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('56', '赵永胜', '1', '26', '18702752270', '武汉江夏区藏龙岛', '3', '面议', '中百仓储招收银员4K', null, null, '3-5年', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('57', '王策', '1', '19', '17635472006', null, '4', '2000-3000', '京东+无门槛5K男女不限', null, null, '1年以下', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', '服务员', null, '快乐迪', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('58', '黄志', '1', '29', '15072590406', null, '2', '面议', '白班分拣当天上岗包5K', null, null, '6-10年', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('59', '刘佳', '2', '34', '15927983048', null, '2', '3000-5000', '物流分拣月4K提供棉被', null, null, '1-2年', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', '操作工', null, '联想电子生产基地', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('60', '张金安', '1', '43', '15072628185', null, '3', '5000-8000', '普工4K无需体检拎包入住', null, null, '10年以上', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', '电工', null, '惠阳电器', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('61', '伍徐珍', '2', '36', '13726243268', null, '2', '3000-5000', '京东4K长短期提供棉被', null, null, '6-10年', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('62', '许亮', '1', '30', '15972307157', null, '2', '3000-5000', '京东+分拣+不熬夜当天上', null, null, '无经验', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:50', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('63', '李千喜', '1', '19', '13018059377', null, '4', '面议', '京东+分拣5K包住高薪', null, null, '无经验', '2019-11-03 10:41:50', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, '汉口学院', '经济与金融', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('64', '梅建康', '1', '28', '18625292052', '仙桃', '3', '面议', '京东+分拣5K包住高薪', null, null, '无经验', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('65', '刘昌美', '2', '21', '18335775717', null, '4', '面议', '京东4K长短期工提供被', null, null, '无经验', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, '山西师范大学', '体育教育', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('66', '汪西周', '1', '47', '15272782986', null, '3', '8000-12000', '物流分拣扫描月5包住', null, null, '1-2年', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('67', '祝宗稳', '1', '25', '15072031586', null, null, '面议', '京东+分拣+不熬夜当天上', null, null, '3-5年', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('68', '杨小芳', '1', '28', '18871248332', '武汉', '2', '面议', '京东招聘拎包入住', null, null, '1-2年', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('69', '仰威', '1', '25', '18671222806', null, '3', '3000-5000', '京东+扫描员+可预支工资', null, null, '3-5年', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('70', '刘亮', '1', '28', '17716851713', null, null, '3000-5000', '物流分拣扫描月5包住', null, null, '6-10年', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', '售后', null, '南京暖亿家稀光科技有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('71', '熊德重', '1', '23', '19972928816', null, '2', '5000-8000', '普工4K无需体检拎包入住', null, null, '3-5年', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('72', '龚利双', '2', '39', '13477515946', null, '3', '2000-3000', '物流分拣员当天即可入职', null, null, '10年以上', '2019-11-03 10:41:51', '2', '2019-11-03 10:41:51', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('73', '季双玲', '2', '32', '15572552157', null, '2', '2000-3000', '京东五险+包住餐补5k', null, null, '1-2年', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('74', '罗时军', '1', '45', '15355898923', null, '2', '面议', '京东+分拣5K包住高薪', null, null, '1年以下', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('75', '万怡君', '2', '26', '15926458255', '武汉', '1', '面议', '中百便利店4K招营业收银', null, null, '3-5年', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', '生产部行政验收', null, '东风神龙汽车有限公司', '湖北工业学院', '机电与应用', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('76', '黄发志', '1', '30', '15335764619', null, null, '5000-8000', 'JD物流分拣扫描无体检', null, null, '1-2年', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', '叉车司机', null, '东江环保', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('77', '陈旧言', '2', '22', '13762426705', null, '2', '3000-5000', '中百便利店4K招营业收银', null, null, '1年以下', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', '迎宾', null, '香山物业', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('78', '章余', '2', '29', '15871393583', null, null, '5000-8000', '中百罗森+做四休三+包住', null, null, '10年以上', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', '副店', null, '内蒙古鄂尔多斯', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('79', '宋玲', '2', '45', '13972775332', null, null, '2000-3000', '京东+分拣+不熬夜当天上', null, null, '3-5年', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('80', '阳果', '1', '18', '15826836383', null, '2', '面议', '物流分拣扫描月5包住', null, null, '应届生', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('81', '邹玲', '2', '37', '13367207748', '仙桃', null, '面议', '京东+分拣5K包住高薪', null, null, '10年以上', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', '老师', null, '金贝中英文幼儿园', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('82', '玲子', '2', '36', '13367207748', null, null, '5000-8000', '物流分拣员当天即可入职', null, null, '10年以上', '2019-11-03 10:41:52', '2', '2019-11-03 10:41:52', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('83', '包晓娇', '2', '21', '17764199244', '武汉江夏区藏龙岛', '1', '面议', '中百仓储招收银员4K', null, null, '无经验', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('84', '宋新开', '1', '19', '13227307739', '孝感', '3', '面议', 'JD物流分拣扫描无体检', null, null, '1年以下', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('85', '杨学军', '1', '39', '18672486053', null, '1', '面议', '京东+分拣+不熬夜当天上', null, null, '10年以上', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('86', '董欣宇', '1', '16', '18695093683', null, '3', '1000-2000', '京东4K长短期提供棉被', null, null, '应届生', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('87', '洪莲花', '2', '20', '13647969364', '武汉洪山区光谷', '2', '面议', '中百仓储招聘长白班', null, null, '1-2年', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('88', '胡峻宇', '1', '25', '13971390754', '武汉江岸区百步亭', '1', '3000-5000', '中百罗森收银员月休12', null, null, '1-2年', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', '陈列师', '455839537@qq.com', '綾致时装有限公司', '武汉市燃气热力学校', '天然气与供暖', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('89', '敖耀红', '2', '42', '15072186244', null, '2', '2000-3000', '京东4K长短期提供棉被', null, null, '3-5年', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('90', '廖宇', '2', '23', '13277066155', null, null, '面议', '京东扫描+上岗快预支5K', null, null, '3-5年', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('91', '廖宇1', '2', '33', '13277066155', null, null, '面议', '京东+扫描员+可预支工资', null, null, '3-5年', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('92', '龚利双', '2', '39', '13477515946', null, '3', '2000-3000', '物流分拣员当天即可入职', null, null, '10年以上', '2019-11-03 10:41:53', '2', '2019-11-03 10:41:53', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('93', '刘菊萍', '2', '47', '18872656400', null, '3', '面议', '京东分拣不熬夜当天入职', null, null, '10年以上', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', '会计监话务', null, '益加益集团', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('94', '郝瑞恩', '1', '19', '17635144855', null, null, '面议', '京东+无门槛5K男女不限', null, null, '1年以下', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', '服务生', null, '糖果KTV', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('95', '黄敏明', '1', '29', '15171310746', null, '4', '3000-5000', '白班分拣+5K当天上岗', null, null, '6-10年', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', '仓库及财务负责人', null, 'Ivvi毛淡绵手机公司', '长江大学', '行政管理', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('96', '高乔', '2', '28', '15327385936', null, '2', '3000-5000', '普工4K无需体检拎包入住', null, null, '6-10年', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', '饲养员', null, '温氏', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('97', '熊威', '1', '29', '15507109505', '鄂州鄂城区', '1', '面议', '京东4K长短期工提供被', null, null, '3-5年', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('98', '馬雲', '1', '19', '15971996263', null, '3', '3000-5000', '京东+分拣5K包住高薪', null, null, '3-5年', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', '業務員', null, '廣東花都區正陽皮具廠', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('99', '董琦', '1', '25', '13247107518', null, '3', '3000-5000', '京东分拣扫描包住月4K', null, null, '3-5年', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('100', '黄威子', '1', '36', '15572531566', null, '3', '面议', '名幸电子5000+包吃住', null, null, '无经验', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('101', '彭志刚', '1', '47', '13439625158', null, '2', '面议', '邮政月薪5千包住招扫码员', null, null, '无经验', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('102', '付凤琴', '2', '32', '18086683528', null, '3', '面议', '便利店4K包住宿招营业员', null, null, '6-10年', '2019-11-03 10:41:54', '2', '2019-11-03 10:41:54', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('103', '曹靖', '1', '31', '15827158874', null, null, '面议', '中百仓储招防损员/收银员', null, null, '6-10年', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('104', '孙林林', '2', '30', '13697133395', null, '3', '3000-5000', '京东+扫描员+可预支工资', null, null, '6-10年', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', 'PMC经理助理', null, '深圳市川祺盛实业有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('105', '王伟', '1', '19', '17607114607', null, '3', '2000-3000', '京东+分拣5K包住高薪', null, null, '无经验', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('106', '董意', '1', '26', '15826872805', null, null, '3000-5000', '京东4K长短期提供棉被', null, null, '6-10年', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', '送外卖', null, '美团外卖', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('107', '段琴华', '2', '39', '15271984289', '仙桃', null, '3000-5000', '京东+分拣5K包住高薪', null, null, '6-10年', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', '会计', null, '爱登堡服装有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('108', '李琦俊', '1', '20', '15107185364', null, '1', '3000-5000', '白班分拣+5K当天上岗', null, null, '1年以下', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('109', '李慧', '2', '20', '17362670169', null, null, '2000-3000', '名幸电子包吃住', null, null, '应届生', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('110', '董晓辉', '1', '21', '18636409578', null, '3', '面议', '京东+无门槛5K男女不限', null, null, '无经验', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('111', '段丽丽', '2', '24', '15072664616', '武汉', '2', '面议', '急招分拣扫描打包当天入职', null, null, '3-5年', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('112', '左凤珍', '2', '35', '15972338669', null, null, '面议', '京东五险+包住餐补5k', null, null, '6-10年', '2019-11-03 10:41:55', '2', '2019-11-03 10:41:55', '2', null, '0', '1', '1', '质检', ' ', '深圳德昌电机', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('113', '施万飞', '1', '35', '15071194566', null, null, '5000-8000', '高薪扫描+拎包上岗不熬夜', null, null, '3-5年', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('114', '刘定富', '1', '44', '18228611362', null, '2', '面议', '京东4K长短期工提供被', null, null, '无经验', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('115', '曾晶', '2', '19', '15623531590', null, '4', '2000-3000', '中百超市理货员4000', null, null, '1年以下', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('116', '汪西周', '1', '47', '15272782986', null, '3', '8000-12000', '物流分拣扫描月5包住', null, null, '1-2年', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('117', '刘长征', '1', '40', '15342554692', null, '2', '面议', '名幸电子招短期包吃住', null, null, '应届生', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('118', '李芹', '2', '32', '15997677815', null, '2', '3000-5000', '白班分拣+5K当天上岗', null, null, '无经验', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('119', '薛帆秀', '2', '31', '13593430090', null, '3', '1000-2000', '京东+无门槛5K男女不限', null, null, '3-5年', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('120', '何生', '1', '46', '17764003298', '安陆', '1', '面议', '京东扫描+上岗快预支5K', null, null, '1-2年', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('121', '付建伟', '1', '34', '13825705573', null, '3', '3000-5000', '京东4K长短期提供棉被', null, null, '10年以上', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('122', '代季华', '2', '41', '18671233958', null, '2', '面议', '京东五险+包住餐补5k', null, null, '10年以上', '2019-11-03 10:41:56', '2', '2019-11-03 10:41:56', '2', null, '0', '1', '1', '营业员', null, '中百超市', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('123', '谢从武', '1', '53', '13339705716', '仙桃', null, '面议', '京东+分拣5K包住高薪', null, null, '10年以上', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('124', '陈玉聪', '2', '22', '18371127879', null, '3', '面议', '罗森收银3千包住做四休三', null, null, '1-2年', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('125', '何苗', '2', '23', '18696313464', '武汉汉阳区王家湾', null, '面议', '龙阳村地铁站店招收银理货', null, null, '3-5年', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('126', '罗简明', '1', '39', '18971972193', '汉川', '2', '3000-5000', '京东4K长短期提供棉被', null, null, '6-10年', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', '驾驶员', null, '英速物流', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('127', '金涛', '1', '35', '18372712891', null, '2', '3000-5000', '京东五险+包住餐补5k', null, null, '无经验', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('128', '田佳文', '1', '28', '17710487037', null, '2', '面议', '京东+分拣5K包住高薪', null, null, '3-5年', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', '货运司机', null, '天天快递', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('129', '乔同学', '1', '18', '15907296778', null, '3', '面议', '京东分拣不熬夜当天入职', null, null, '无经验', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('130', '董意', '1', '26', '15826872805', null, null, '3000-5000', '京东4K长短期提供棉被', null, null, '6-10年', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', '送外卖', null, '美团外卖', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('131', '余亮', '1', '29', '13872054106', null, '3', '面议', '京东+分拣+不熬夜当天上', null, null, '1-2年', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:57', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('132', '何京', '1', '18', '17762610825', null, '3', '面议', '京东+扫描员+可预支工资', null, null, '无经验', '2019-11-03 10:41:57', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('133', '马磊', '1', '36', '13807226196', '凉山会理', '2', '面议', '京东+分拣5K包住高薪', null, null, '无经验', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('134', '陈欢', '2', '25', '18627803569', null, '1', '3000-5000', '白班分拣+5K当天上岗', null, null, '3-5年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', '后勤主管', null, '上海强民经济贸易有限公司', '武汉工商学院', '工商管理', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('135', '陈亮', '1', '28', '15171299280', null, '2', '3000-5000', '名幸电子普工五险一包吃住', null, null, '6-10年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('136', '赵涛涛', '1', '28', '15272846059', null, null, '面议', '京东扫描当天上岗预支', null, null, '6-10年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('137', '喻春国', '1', '55', '15897792833', null, '2', '2000-3000', '京东+分拣+不熬夜当天上', null, null, '6-10年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('138', '胡敏', '1', '28', '18727461227', null, '3', '2000-3000', '普工5K无需体检拎包入住', null, null, '6-10年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', '发货员', null, '江苏九州通医药有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('139', '冯丕祥', '1', '28', '15171678142', '黄冈蕲春县　', '3', '面议', '京东五险+包住5k', null, null, '6-10年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('140', '梁欢', '2', '26', '15571267925', null, '3', '3000-5000', '急招分拣扫描打包当天入职', null, null, '3-5年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('141', '徐永俊', '1', '23', '13776502694', null, '3', '5000-8000', '京东4K长短期提供棉被', null, null, '3-5年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:58', '2', null, '0', '1', '1', '证券经济人', null, '天鼎证券', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('142', '徐德建', '1', '25', '15897700538', null, '2', '3000-5000', '名幸电子5000+包吃住', null, null, '6-10年', '2019-11-03 10:41:58', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('143', '孟小勇', '1', '23', '18303580834', '太原', null, '2000-3000', '京东4K长短期工提供被', null, null, '1-2年', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('144', '梁先生', '1', '28', '18696480126', null, '1', '面议', '京东+分拣5K包住高薪', null, null, '1-2年', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('145', '曹晓华', '1', '38', '15549550498', '武汉', '2', '面议', '京东+无夜班+包住', null, null, '6-10年', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('146', '王友英', '2', '46', '13697390753', null, '2', '5000-8000', '京东+分拣5K包住高薪', null, null, '10年以上', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', '普工', null, '真巧开机好邻居导购收银健鼎普工', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('147', '刘悬', '1', '20', '17671864793', null, '2', '5000-8000', '京东五险+包住餐补5k', null, null, '1年以下', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', '复核', null, '京东物流', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('148', '任胤龙', '1', '20', '15871615021', null, '4', '3000-5000', '京东五险+包住餐补5k', null, null, '应届生', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('149', '喜获丰收', '1', '31', '15997981607', '武汉', '2', '面议', '物流分拣月4K提供棉被', null, null, '3-5年', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('150', '叶丹', '2', '23', '18571109326', null, '3', '3000-5000', '京东+分拣+不熬夜当天上', null, null, '3-5年', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('151', '刘琪', '1', '27', '18662353146', null, '1', '3000-5000', '京东+扫描员+可预支工资', null, null, '3-5年', '2019-11-03 10:41:59', '2', '2019-11-03 10:41:59', '2', null, '0', '1', '1', '模具维修工程师', null, '富士康昆山科技集团', '武汉工程职业技术学院', '模具设计与制造', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('152', '高洋', '1', '27', '15727098530', null, '2', '面议', '普工4千无体检当天入职', null, null, '1-2年', '2019-11-03 10:41:59', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('153', '曾梓威', '1', '19', '18727874502', '鄂州', '4', '面议', '京东+分拣+不熬夜当天上', null, null, '应届生', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, ' ', null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('154', '苏胜利', '1', '38', '18625967121', '北京', '3', '面议', '中国邮政高薪招聘快递员', null, null, '无经验', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('155', '吴辉武', '1', '40', '15926025037', null, '2', '面议', '京东+分拣+不熬夜当天上', null, null, '1-2年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', '分拣员', null, '申通快递', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('156', '耿佳滢', '2', '19', '17343418826', null, '3', '5000-8000', '京东+分拣+不熬夜当天上', null, null, '1-2年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('157', '史小芹', '2', '29', '13789960210', null, null, '2000-3000', 'JD物流分拣扫描无体检', null, null, '1-2年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('158', '王海艳', '2', '33', '13657294296', '武汉蔡甸区', null, '面议', '中百收银月休12天月三千', null, null, '6-10年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('159', '潘坤', '1', '30', '17671844004', null, '3', '3000-5000', '京东招聘拎包入住', null, null, '6-10年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('160', '刘佳鹏', '1', '30', '15090909133', null, '1', '3000-5000', '名幸电子包吃住', null, null, '10年以上', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', '后勤主管仓管一线领队驾驶', null, '保密', '江西公安干部中等学校宜春分校', '协警', '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('161', '雷思敏', '2', '22', '17607191681', '武汉江汉区', null, '面议', '中百罗森招收银员月4K', null, null, '3-5年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:00', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('162', '袁倩', '2', '17', '17612701373', null, '1', '2000-3000', '中百仓储超市收银', null, null, '1-2年', '2019-11-03 10:42:00', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('163', '龚澳杰', '1', '19', '17740545942', null, '1', '2000-3000', '物流分拣员当天即可入职', null, null, '应届生', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('164', '王意', '2', '43', '17671863236', null, '2', '3000-5000', '扫描员包住无需健康证', null, null, '6-10年', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', '车间管理', null, '广东普宁制衣有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('165', '吉炼炼', '1', '17', '18572117303', null, null, '3000-5000', '京东五险+包住餐补5k', null, null, '应届生', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('166', '王思琪', '2', '25', '13469795897', '孝感', '3', '面议', '扫描员包住无需健康证', null, null, '3-5年', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', '培训讲师', null, '金韵早慧潜能科技开发研究院', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('167', '胡双平', '1', '37', '19907123724', null, '3', '3000-5000', '名幸电子包吃住', null, null, '10年以上', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', '理货员', null, '集鲸仓储有限公司', null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('168', '邓足华', '1', '30', '15897729325', null, '3', '面议', '水果湖中百仓储招收银员', null, null, '1年以下', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('169', '况剑秋', '1', '24', '13545474455', '孝感', '2', '面议', '名幸电子包吃住', null, null, '应届生', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('170', '李杰', '1', '23', '18872083805', null, '2', '3000-5000', '名幸电子普工五险一包吃住', null, null, '1-2年', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('171', '王兰兰', '2', '31', '15072706690', null, '2', '1000-2000', '京东+扫描员+可预支工资', null, null, '无经验', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:01', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('172', '小琪', '2', '23', '15526820649', null, '1', '面议', '京东+扫描员+可预支工资', null, null, '1-2年', '2019-11-03 10:42:01', '2', '2019-11-03 10:42:02', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('173', '蒋垒', '2', '22', '15972038141', null, '3', '面议', '阿里巴巴高薪诚招理货员', null, null, '1-2年', '2019-11-03 10:42:02', '2', '2019-11-03 10:42:02', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('174', '刘志海', '1', '45', '18571515827', null, '1', '3000-5000', '名幸电子包吃住', null, null, '10年以上', '2019-11-03 10:42:02', '2', '2019-11-03 10:42:02', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);
INSERT INTO `erp_resume` VALUES ('175', '姚星星', '2', '38', '18771276059', '咸宁', '3', '面议', '京东五险+包住餐补5k', null, null, '10年以上', '2019-11-03 10:42:02', '2', '2019-11-03 10:42:02', '2', null, '0', '1', '1', null, null, null, null, null, '2018-09-29 00:00:00', null);

-- ----------------------------
-- Table structure for erp_resume_project
-- ----------------------------
DROP TABLE IF EXISTS `erp_resume_project`;
CREATE TABLE `erp_resume_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` bigint(20) NOT NULL COMMENT '简历ID,0,NO,false,false,false',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID,0,NO,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='简历被招聘的项目,3';

-- ----------------------------
-- Records of erp_resume_project
-- ----------------------------
INSERT INTO `erp_resume_project` VALUES ('1', '1', '1');
INSERT INTO `erp_resume_project` VALUES ('2', '1', '5');
INSERT INTO `erp_resume_project` VALUES ('3', '1', '8');
INSERT INTO `erp_resume_project` VALUES ('4', '1', '7');
INSERT INTO `erp_resume_project` VALUES ('5', '1', '10');
INSERT INTO `erp_resume_project` VALUES ('6', '1', '6');
INSERT INTO `erp_resume_project` VALUES ('7', '2', '1');
INSERT INTO `erp_resume_project` VALUES ('8', '2', '4');
INSERT INTO `erp_resume_project` VALUES ('9', '2', '10');
INSERT INTO `erp_resume_project` VALUES ('10', '2', '8');
INSERT INTO `erp_resume_project` VALUES ('11', '3', '9');
INSERT INTO `erp_resume_project` VALUES ('12', '3', '4');
INSERT INTO `erp_resume_project` VALUES ('13', '3', '3');
INSERT INTO `erp_resume_project` VALUES ('14', '3', '10');
INSERT INTO `erp_resume_project` VALUES ('15', '3', '8');
INSERT INTO `erp_resume_project` VALUES ('16', '4', '10');
INSERT INTO `erp_resume_project` VALUES ('17', '4', '5');
INSERT INTO `erp_resume_project` VALUES ('18', '4', '6');
INSERT INTO `erp_resume_project` VALUES ('19', '4', '8');
INSERT INTO `erp_resume_project` VALUES ('20', '5', '10');
INSERT INTO `erp_resume_project` VALUES ('21', '5', '5');
INSERT INTO `erp_resume_project` VALUES ('22', '5', '8');
INSERT INTO `erp_resume_project` VALUES ('23', '5', '6');
INSERT INTO `erp_resume_project` VALUES ('24', '6', '8');
INSERT INTO `erp_resume_project` VALUES ('25', '6', '6');
INSERT INTO `erp_resume_project` VALUES ('26', '6', '5');
INSERT INTO `erp_resume_project` VALUES ('27', '6', '10');
INSERT INTO `erp_resume_project` VALUES ('28', '7', '8');
INSERT INTO `erp_resume_project` VALUES ('29', '7', '1');
INSERT INTO `erp_resume_project` VALUES ('30', '7', '10');
INSERT INTO `erp_resume_project` VALUES ('31', '7', '4');
INSERT INTO `erp_resume_project` VALUES ('32', '8', '9');
INSERT INTO `erp_resume_project` VALUES ('33', '8', '3');
INSERT INTO `erp_resume_project` VALUES ('34', '8', '4');
INSERT INTO `erp_resume_project` VALUES ('35', '8', '8');
INSERT INTO `erp_resume_project` VALUES ('36', '8', '10');
INSERT INTO `erp_resume_project` VALUES ('37', '9', '10');
INSERT INTO `erp_resume_project` VALUES ('38', '9', '3');
INSERT INTO `erp_resume_project` VALUES ('39', '9', '7');
INSERT INTO `erp_resume_project` VALUES ('40', '9', '2');
INSERT INTO `erp_resume_project` VALUES ('41', '9', '8');
INSERT INTO `erp_resume_project` VALUES ('42', '10', '1');
INSERT INTO `erp_resume_project` VALUES ('43', '10', '10');
INSERT INTO `erp_resume_project` VALUES ('44', '10', '8');
INSERT INTO `erp_resume_project` VALUES ('45', '10', '7');
INSERT INTO `erp_resume_project` VALUES ('46', '11', '8');
INSERT INTO `erp_resume_project` VALUES ('47', '11', '10');
INSERT INTO `erp_resume_project` VALUES ('48', '12', '6');
INSERT INTO `erp_resume_project` VALUES ('49', '12', '10');
INSERT INTO `erp_resume_project` VALUES ('50', '12', '8');
INSERT INTO `erp_resume_project` VALUES ('51', '12', '2');
INSERT INTO `erp_resume_project` VALUES ('52', '13', '7');
INSERT INTO `erp_resume_project` VALUES ('53', '13', '8');
INSERT INTO `erp_resume_project` VALUES ('54', '13', '1');
INSERT INTO `erp_resume_project` VALUES ('55', '13', '10');
INSERT INTO `erp_resume_project` VALUES ('56', '14', '8');
INSERT INTO `erp_resume_project` VALUES ('57', '14', '2');
INSERT INTO `erp_resume_project` VALUES ('58', '14', '10');
INSERT INTO `erp_resume_project` VALUES ('59', '14', '5');
INSERT INTO `erp_resume_project` VALUES ('60', '15', '10');
INSERT INTO `erp_resume_project` VALUES ('61', '15', '2');
INSERT INTO `erp_resume_project` VALUES ('62', '15', '6');
INSERT INTO `erp_resume_project` VALUES ('63', '15', '8');
INSERT INTO `erp_resume_project` VALUES ('64', '16', '4');
INSERT INTO `erp_resume_project` VALUES ('65', '16', '9');
INSERT INTO `erp_resume_project` VALUES ('66', '16', '10');
INSERT INTO `erp_resume_project` VALUES ('67', '16', '3');
INSERT INTO `erp_resume_project` VALUES ('68', '16', '8');
INSERT INTO `erp_resume_project` VALUES ('69', '17', '3');
INSERT INTO `erp_resume_project` VALUES ('70', '17', '10');
INSERT INTO `erp_resume_project` VALUES ('71', '17', '9');
INSERT INTO `erp_resume_project` VALUES ('72', '17', '4');
INSERT INTO `erp_resume_project` VALUES ('73', '17', '8');
INSERT INTO `erp_resume_project` VALUES ('74', '18', '8');
INSERT INTO `erp_resume_project` VALUES ('75', '18', '3');
INSERT INTO `erp_resume_project` VALUES ('76', '18', '10');
INSERT INTO `erp_resume_project` VALUES ('77', '19', '3');
INSERT INTO `erp_resume_project` VALUES ('78', '19', '4');
INSERT INTO `erp_resume_project` VALUES ('79', '19', '10');
INSERT INTO `erp_resume_project` VALUES ('80', '19', '6');
INSERT INTO `erp_resume_project` VALUES ('81', '19', '8');
INSERT INTO `erp_resume_project` VALUES ('82', '20', '3');
INSERT INTO `erp_resume_project` VALUES ('83', '20', '10');
INSERT INTO `erp_resume_project` VALUES ('84', '20', '8');
INSERT INTO `erp_resume_project` VALUES ('85', '21', '5');
INSERT INTO `erp_resume_project` VALUES ('86', '21', '6');
INSERT INTO `erp_resume_project` VALUES ('87', '21', '10');
INSERT INTO `erp_resume_project` VALUES ('88', '21', '8');
INSERT INTO `erp_resume_project` VALUES ('89', '22', '2');
INSERT INTO `erp_resume_project` VALUES ('90', '22', '10');
INSERT INTO `erp_resume_project` VALUES ('91', '22', '8');
INSERT INTO `erp_resume_project` VALUES ('92', '22', '6');
INSERT INTO `erp_resume_project` VALUES ('93', '23', '8');
INSERT INTO `erp_resume_project` VALUES ('94', '23', '2');
INSERT INTO `erp_resume_project` VALUES ('95', '23', '6');
INSERT INTO `erp_resume_project` VALUES ('96', '23', '10');
INSERT INTO `erp_resume_project` VALUES ('97', '24', '2');
INSERT INTO `erp_resume_project` VALUES ('98', '24', '5');
INSERT INTO `erp_resume_project` VALUES ('99', '24', '10');
INSERT INTO `erp_resume_project` VALUES ('100', '24', '8');
INSERT INTO `erp_resume_project` VALUES ('101', '24', '9');
INSERT INTO `erp_resume_project` VALUES ('102', '25', '7');
INSERT INTO `erp_resume_project` VALUES ('103', '25', '10');
INSERT INTO `erp_resume_project` VALUES ('104', '25', '8');
INSERT INTO `erp_resume_project` VALUES ('105', '25', '1');
INSERT INTO `erp_resume_project` VALUES ('106', '26', '10');
INSERT INTO `erp_resume_project` VALUES ('107', '26', '1');
INSERT INTO `erp_resume_project` VALUES ('108', '26', '9');
INSERT INTO `erp_resume_project` VALUES ('109', '26', '2');
INSERT INTO `erp_resume_project` VALUES ('110', '26', '8');
INSERT INTO `erp_resume_project` VALUES ('111', '27', '9');
INSERT INTO `erp_resume_project` VALUES ('112', '27', '2');
INSERT INTO `erp_resume_project` VALUES ('113', '27', '10');
INSERT INTO `erp_resume_project` VALUES ('114', '27', '1');
INSERT INTO `erp_resume_project` VALUES ('115', '27', '8');
INSERT INTO `erp_resume_project` VALUES ('116', '28', '8');
INSERT INTO `erp_resume_project` VALUES ('117', '28', '5');
INSERT INTO `erp_resume_project` VALUES ('118', '28', '9');
INSERT INTO `erp_resume_project` VALUES ('119', '28', '2');
INSERT INTO `erp_resume_project` VALUES ('120', '28', '10');
INSERT INTO `erp_resume_project` VALUES ('121', '29', '2');
INSERT INTO `erp_resume_project` VALUES ('122', '29', '9');
INSERT INTO `erp_resume_project` VALUES ('123', '29', '5');
INSERT INTO `erp_resume_project` VALUES ('124', '29', '10');
INSERT INTO `erp_resume_project` VALUES ('125', '29', '8');
INSERT INTO `erp_resume_project` VALUES ('126', '26', '2');
INSERT INTO `erp_resume_project` VALUES ('127', '26', '10');
INSERT INTO `erp_resume_project` VALUES ('128', '26', '5');
INSERT INTO `erp_resume_project` VALUES ('129', '26', '8');
INSERT INTO `erp_resume_project` VALUES ('130', '26', '9');

-- ----------------------------
-- Table structure for erp_resume_pub
-- ----------------------------
DROP TABLE IF EXISTS `erp_resume_pub`;
CREATE TABLE `erp_resume_pub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` bigint(20) NOT NULL COMMENT '简历ID,0,NO,false,false,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公示板,1';

-- ----------------------------
-- Records of erp_resume_pub
-- ----------------------------

-- ----------------------------
-- Table structure for erp_resume_tag
-- ----------------------------
DROP TABLE IF EXISTS `erp_resume_tag`;
CREATE TABLE `erp_resume_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` bigint(20) NOT NULL COMMENT '简历ID,0,NO,false,false,false',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID,0,NO,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='简历标签表,3';

-- ----------------------------
-- Records of erp_resume_tag
-- ----------------------------
INSERT INTO `erp_resume_tag` VALUES ('2', '2', '8');
INSERT INTO `erp_resume_tag` VALUES ('3', '2', '3');
INSERT INTO `erp_resume_tag` VALUES ('4', '3', '10');
INSERT INTO `erp_resume_tag` VALUES ('5', '3', '8');
INSERT INTO `erp_resume_tag` VALUES ('6', '4', '8');
INSERT INTO `erp_resume_tag` VALUES ('7', '5', '8');
INSERT INTO `erp_resume_tag` VALUES ('8', '6', '8');
INSERT INTO `erp_resume_tag` VALUES ('9', '8', '8');
INSERT INTO `erp_resume_tag` VALUES ('10', '10', '8');
INSERT INTO `erp_resume_tag` VALUES ('11', '11', '8');
INSERT INTO `erp_resume_tag` VALUES ('12', '12', '7');
INSERT INTO `erp_resume_tag` VALUES ('13', '12', '8');
INSERT INTO `erp_resume_tag` VALUES ('14', '13', '8');
INSERT INTO `erp_resume_tag` VALUES ('20', '15', '7');
INSERT INTO `erp_resume_tag` VALUES ('21', '15', '8');
INSERT INTO `erp_resume_tag` VALUES ('22', '16', '2');
INSERT INTO `erp_resume_tag` VALUES ('23', '16', '8');
INSERT INTO `erp_resume_tag` VALUES ('24', '17', '8');
INSERT INTO `erp_resume_tag` VALUES ('25', '17', '2');
INSERT INTO `erp_resume_tag` VALUES ('26', '18', '8');
INSERT INTO `erp_resume_tag` VALUES ('27', '18', '7');
INSERT INTO `erp_resume_tag` VALUES ('28', '19', '8');
INSERT INTO `erp_resume_tag` VALUES ('29', '19', '1');
INSERT INTO `erp_resume_tag` VALUES ('30', '19', '10');
INSERT INTO `erp_resume_tag` VALUES ('31', '19', '2');
INSERT INTO `erp_resume_tag` VALUES ('32', '20', '8');
INSERT INTO `erp_resume_tag` VALUES ('33', '20', '7');
INSERT INTO `erp_resume_tag` VALUES ('34', '20', '10');
INSERT INTO `erp_resume_tag` VALUES ('35', '21', '8');
INSERT INTO `erp_resume_tag` VALUES ('36', '22', '8');
INSERT INTO `erp_resume_tag` VALUES ('37', '22', '1');
INSERT INTO `erp_resume_tag` VALUES ('38', '23', '3');
INSERT INTO `erp_resume_tag` VALUES ('39', '23', '8');
INSERT INTO `erp_resume_tag` VALUES ('40', '24', '3');
INSERT INTO `erp_resume_tag` VALUES ('41', '24', '8');
INSERT INTO `erp_resume_tag` VALUES ('42', '25', '8');
INSERT INTO `erp_resume_tag` VALUES ('48', '27', '1');
INSERT INTO `erp_resume_tag` VALUES ('50', '14', '8');
INSERT INTO `erp_resume_tag` VALUES ('51', '26', '8');
INSERT INTO `erp_resume_tag` VALUES ('52', '29', '8');
INSERT INTO `erp_resume_tag` VALUES ('54', '1', '8');

-- ----------------------------
-- Table structure for erp_tag
-- ----------------------------
DROP TABLE IF EXISTS `erp_tag`;
CREATE TABLE `erp_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '标签名称,input,YES,false,true,true',
  `sort` int(11) DEFAULT NULL COMMENT '排序,input,YES,false,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='人力标签,1';

-- ----------------------------
-- Records of erp_tag
-- ----------------------------
INSERT INTO `erp_tag` VALUES ('1', '夜班', '10', '2019-10-27 12:34:57', '2', '2019-10-28 18:18:42', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('2', '社保', '20', '2019-10-27 12:35:22', '2', '2019-10-27 12:35:22', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('3', '五险一金', '30', '2019-10-27 12:35:42', '2', '2019-10-27 12:35:43', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('4', '轮班', '40', '2019-10-27 12:36:45', '2', '2019-10-27 19:19:08', '2', null, '1');
INSERT INTO `erp_tag` VALUES ('5', '房补', '50', '2019-10-27 12:37:22', '2', '2019-10-27 19:19:04', '2', null, '1');
INSERT INTO `erp_tag` VALUES ('6', '餐补', '60', '2019-10-27 12:37:44', '2', '2019-10-27 19:18:56', '2', null, '1');
INSERT INTO `erp_tag` VALUES ('7', '包吃包住', '70', '2019-10-27 12:38:03', '2', '2019-10-27 12:38:03', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('8', '全职', '80', '2019-10-27 18:59:39', '2', '2019-10-27 18:59:39', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('9', '兼职', '90', '2019-10-27 19:00:04', '2', '2019-10-27 19:00:04', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('10', '提供住宿', '50', '2019-10-29 19:48:13', '2', '2019-10-29 19:48:14', '2', null, '0');
INSERT INTO `erp_tag` VALUES ('11', '不接受夜班', '90', '2019-11-03 10:19:54', '2', '2019-11-03 10:20:21', '2', null, '1');

-- ----------------------------
-- Table structure for erp_team_member
-- ----------------------------
DROP TABLE IF EXISTS `erp_team_member`;
CREATE TABLE `erp_team_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `leader_id` bigint(20) NOT NULL COMMENT '组长ID,0,NO,false,false,false',
  `member_id` bigint(20) NOT NULL COMMENT '组员ID,0,NO,false,false,false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组长组员表,3';

-- ----------------------------
-- Records of erp_team_member
-- ----------------------------

-- ----------------------------
-- Table structure for erp_user_resume
-- ----------------------------
DROP TABLE IF EXISTS `erp_user_resume`;
CREATE TABLE `erp_user_resume` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID,0,YES,false,false,false',
  `resume_id` bigint(20) DEFAULT NULL COMMENT '简历ID,0,YES,false,false,false',
  `is_read` bit(1) DEFAULT NULL COMMENT '是否查看,switch,YES,true,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='系统分配给用户的简历,1,switch-read-YES-true-is_read';

-- ----------------------------
-- Records of erp_user_resume
-- ----------------------------
INSERT INTO `erp_user_resume` VALUES ('1', '3', '1', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('2', '4', '2', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('3', '5', '7', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('4', '6', '9', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('5', '7', '11', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('6', '8', '13', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('7', '9', '14', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('8', '10', '16', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('9', '11', '17', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('10', '12', '18', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('11', '13', '19', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('12', '14', '22', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('13', '15', '20', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('14', '17', '25', '\0', '2019-11-02 01:00:00', null, '2019-11-02 01:00:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('15', '3', '26', '', '2019-11-03 10:24:47', null, '2019-11-03 10:45:06', '3', null, '0');
INSERT INTO `erp_user_resume` VALUES ('16', '4', '28', '\0', '2019-11-03 10:24:47', null, '2019-11-03 10:24:47', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('17', '3', '30', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('18', '3', '31', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('19', '3', '32', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('20', '3', '33', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('21', '3', '34', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('22', '3', '35', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('23', '4', '36', '\0', '2019-11-03 10:42:59', null, '2019-11-03 10:42:59', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('24', '4', '37', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('25', '4', '38', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('26', '4', '39', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('27', '4', '40', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('28', '4', '41', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('29', '5', '42', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('30', '5', '43', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('31', '5', '44', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('32', '5', '45', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('33', '5', '46', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('34', '5', '47', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('35', '6', '48', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('36', '6', '49', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('37', '6', '50', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('38', '6', '51', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('39', '6', '52', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('40', '6', '53', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('41', '7', '54', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('42', '7', '55', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('43', '7', '56', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('44', '7', '57', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('45', '7', '58', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('46', '7', '59', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('47', '8', '60', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('48', '8', '61', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('49', '8', '62', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('50', '8', '63', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('51', '8', '64', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('52', '8', '65', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('53', '9', '66', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('54', '9', '67', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('55', '9', '68', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('56', '9', '69', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('57', '9', '70', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('58', '9', '71', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('59', '10', '72', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('60', '10', '73', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('61', '10', '74', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('62', '10', '75', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('63', '10', '76', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('64', '10', '77', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('65', '11', '78', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('66', '11', '79', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('67', '11', '80', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('68', '11', '81', '\0', '2019-11-03 10:43:00', null, '2019-11-03 10:43:00', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('69', '11', '82', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('70', '11', '83', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('71', '12', '84', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('72', '12', '85', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('73', '12', '86', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('74', '12', '87', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('75', '12', '88', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('76', '12', '89', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('77', '13', '90', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('78', '13', '91', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('79', '13', '92', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('80', '13', '93', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('81', '13', '94', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('82', '13', '95', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('83', '14', '96', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('84', '14', '97', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('85', '14', '98', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('86', '14', '99', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('87', '14', '100', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('88', '14', '101', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('89', '15', '102', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('90', '15', '103', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('91', '15', '104', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('92', '15', '105', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('93', '15', '106', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('94', '15', '107', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('95', '16', '108', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('96', '16', '109', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('97', '16', '110', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('98', '16', '111', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('99', '16', '112', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('100', '16', '113', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('101', '17', '114', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('102', '17', '115', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('103', '17', '116', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('104', '17', '117', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('105', '17', '118', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('106', '17', '119', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('107', '18', '120', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('108', '18', '121', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('109', '18', '122', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('110', '18', '123', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('111', '18', '124', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('112', '18', '125', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('113', '19', '126', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('114', '19', '127', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('115', '19', '128', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('116', '19', '129', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('117', '19', '130', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('118', '19', '131', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('119', '20', '132', '\0', '2019-11-03 10:43:01', null, '2019-11-03 10:43:01', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('120', '20', '133', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('121', '20', '134', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('122', '20', '135', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('123', '20', '136', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('124', '20', '137', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('125', '21', '138', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('126', '21', '139', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('127', '21', '140', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('128', '21', '141', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('129', '21', '142', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('130', '21', '143', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('131', '22', '144', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('132', '22', '145', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('133', '22', '146', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('134', '22', '147', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('135', '22', '148', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('136', '22', '149', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('137', '23', '150', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('138', '23', '151', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('139', '23', '152', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('140', '23', '153', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('141', '23', '154', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('142', '23', '155', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('143', '24', '156', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('144', '24', '157', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('145', '24', '158', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('146', '24', '159', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('147', '24', '160', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('148', '24', '161', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('149', '25', '162', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('150', '25', '163', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('151', '25', '164', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('152', '25', '165', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('153', '25', '166', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');
INSERT INTO `erp_user_resume` VALUES ('154', '25', '167', '\0', '2019-11-03 10:43:02', null, '2019-11-03 10:43:02', null, null, '0');

-- ----------------------------
-- Table structure for hat_area
-- ----------------------------
DROP TABLE IF EXISTS `hat_area`;
CREATE TABLE `hat_area` (
  `id` int(11) NOT NULL,
  `areaID` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `father` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hat_area
-- ----------------------------
INSERT INTO `hat_area` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `hat_area` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `hat_area` VALUES ('3', '110103', '崇文区', '110100');
INSERT INTO `hat_area` VALUES ('4', '110104', '宣武区', '110100');
INSERT INTO `hat_area` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `hat_area` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `hat_area` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `hat_area` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `hat_area` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `hat_area` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `hat_area` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `hat_area` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `hat_area` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `hat_area` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `hat_area` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `hat_area` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `hat_area` VALUES ('17', '110228', '密云县', '110200');
INSERT INTO `hat_area` VALUES ('18', '110229', '延庆县', '110200');
INSERT INTO `hat_area` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `hat_area` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `hat_area` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `hat_area` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `hat_area` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `hat_area` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `hat_area` VALUES ('25', '120107', '塘沽区', '120100');
INSERT INTO `hat_area` VALUES ('26', '120108', '汉沽区', '120100');
INSERT INTO `hat_area` VALUES ('27', '120109', '大港区', '120100');
INSERT INTO `hat_area` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `hat_area` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `hat_area` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `hat_area` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `hat_area` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `hat_area` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `hat_area` VALUES ('34', '120221', '宁河县', '120200');
INSERT INTO `hat_area` VALUES ('35', '120223', '静海县', '120200');
INSERT INTO `hat_area` VALUES ('36', '120225', '蓟　县', '120200');
INSERT INTO `hat_area` VALUES ('37', '130101', '市辖区', '130100');
INSERT INTO `hat_area` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `hat_area` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `hat_area` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `hat_area` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `hat_area` VALUES ('42', '130107', '井陉矿区', '130100');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', '0 0 1 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', '0 0 1 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MySiteForMeScheduler', 'TASK_3', 'DEFAULT', '0 0 1-3 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MySiteForMeScheduler', 'TASK_4', 'DEFAULT', '0 0 0 * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(140) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(19) NOT NULL,
  `SCHED_TIME` bigint(19) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` tinyint(1) NOT NULL,
  `IS_NONCONCURRENT` tinyint(1) NOT NULL,
  `IS_UPDATE_DATA` tinyint(1) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', null, 'com.mysiteforme.admin.util.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016132EF0DB7787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000707371007E001677080000016132EF0DB87871007E00187074000B3020302031202A202A203F74001BE5908CE6ADA5E69687E7ABA0E6B58FE8A788E9878FE695B0E68DAE740000737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001A73796E6368726F6E697A6174696F6E41727469636C65566965777800);
INSERT INTO `qrtz_job_details` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', null, 'com.mysiteforme.admin.util.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000027372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613F9BEBCB787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740031E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC95EFBC8CE6AF8FE5A4A9E6999AE4B88A31E782B9E689A7E8A18C7371007E00167708000001613F9BEBCB7871007E00187074000B3020302031202A202A203F740018E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC9574000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74001263726561746541727469636C65496E6465787800);
INSERT INTO `qrtz_job_details` VALUES ('MySiteForMeScheduler', 'TASK_3', 'DEFAULT', null, 'com.mysiteforme.admin.util.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016E1B9D0EAC787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740029E6AF8FE5A4A9E5878CE699A831E782B9E588B033E782B9E695B4E782B9E689A7E8A18CE4B880E6ACA17371007E001677080000016E1B9D0ED87871007E00187074000D30203020312D33202A202A203F740015E58886E9858DE7AE80E58E86E588B0E4B893E5919874000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A53797374656D5461736B740014646973747269627574696F6E4F66526573756D657800);
INSERT INTO `qrtz_job_details` VALUES ('MySiteForMeScheduler', 'TASK_4', 'DEFAULT', null, 'com.mysiteforme.admin.util.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000047372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016E1C6E7F67787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740037E6AF8FE5A4A930E782B9E5B086E4B98BE5898DE79A84E68EA8E88D90E7AE80E58E86E585A8E983A8E8AEBEE7BDAEE4B8BAE8BF87E69C9F7371007E001677080000016E1C6E7F8F7871007E00187074000B3020302030202A202A203F740021E5B086E4BBA5E5898DE79A84E68EA8E88D90E8AEBEE7BDAEE4B8BAE8BF87E69C9F74000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B74000F6F7665726475654F66526573756D657800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MySiteForMeScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MySiteForMeScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(19) NOT NULL,
  `CHECKIN_INTERVAL` bigint(19) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MySiteForMeScheduler', 'win7-PC1572836228124', '1572836276495', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` tinyint(1) DEFAULT NULL,
  `BOOL_PROP_2` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(19) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(19) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(19) NOT NULL,
  `END_TIME` bigint(19) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('MySiteForMeScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1516986000000', '-1', '5', 'PAUSED', 'CRON', '1516977982000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016132EF0E187871007E001570737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740022E6AF8FE5A4A9E5878CE699A831E782B9E9929FE689A7E8A18CE8AFA5E4BBBBE58AA17371007E001677080000016E01A959507871007E00157074000B3020302031202A202A203F74001BE5908CE6ADA5E69687E7ABA0E6B58FE8A788E9878FE695B0E68DAE74000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000174000A73797374656D5461736B74001A73796E6368726F6E697A6174696F6E41727469636C65566965777800);
INSERT INTO `qrtz_triggers` VALUES ('MySiteForMeScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1517245200000', '-1', '5', 'PAUSED', 'CRON', '1517190638000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000027372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001613F9BED98787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740031E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC95EFBC8CE6AF8FE5A4A9E6999AE4B88A31E782B9E689A7E8A18C7371007E001677080000016E01A978907871007E00187074000B3020302031202A202A203F740018E7949FE68890E69687E7ABA0E6909CE7B4A2E7B4A2E5BC9574000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000174000A73797374656D5461736B74001263726561746541727469636C65496E6465787800);
INSERT INTO `qrtz_triggers` VALUES ('MySiteForMeScheduler', 'TASK_3', 'DEFAULT', 'TASK_3', 'DEFAULT', null, '1572454800000', '-1', '5', 'WAITING', 'CRON', '1572421308000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016E1B9D0E60787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740029E6AF8FE5A4A9E5878CE699A831E782B9E588B033E782B9E695B4E782B9E689A7E8A18CE4B880E6ACA17371007E001677080000016E1BBBFC587871007E00187074000D30203020312D33202A202A203F740015E58886E9858DE7AE80E58E86E588B0E4B893E5919874000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000074000A73797374656D5461736B740014646973747269627574696F6E4F66526573756D657800);
INSERT INTO `qrtz_triggers` VALUES ('MySiteForMeScheduler', 'TASK_4', 'DEFAULT', 'TASK_4', 'DEFAULT', null, '1572451200000', '-1', '5', 'PAUSED', 'CRON', '1572435034000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720027636F6D2E6D7973697465666F726D652E61646D696E2E656E746974792E51756172747A5461736B00000000000000010200064C000463726F6E7400124C6A6176612F6C616E672F537472696E673B4C00046E616D6571007E00094C0006706172616D7371007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B4C000A7461726765744265616E71007E00094C000B74726765744D6574686F6471007E000978720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E44617461456E7469747900000000000000010200084C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000863726561746549647400104C6A6176612F6C616E672F4C6F6E673B4C000A637265617465557365727400234C636F6D2F6D7973697465666F726D652F61646D696E2F656E746974792F557365723B4C000764656C466C61677400134C6A6176612F6C616E672F426F6F6C65616E3B4C000772656D61726B7371007E00094C000A7570646174654461746571007E000C4C0008757064617465496471007E000D4C000A7570646174655573657271007E000E78720025636F6D2E6D7973697465666F726D652E61646D696E2E626173652E42617365456E74697479F87065A24F9EB43D0200014C0002696471007E000D7872002B636F6D2E62616F6D69646F752E6D796261746973706C75732E6163746976657265636F72642E4D6F64656C000000000000000102000078707372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000047372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016E1C6E7BA8787371007E0013000000000000000170737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C7565787000740037E6AF8FE5A4A930E782B9E5B086E4B98BE5898DE79A84E68EA8E88D90E7AE80E58E86E585A8E983A8E8AEBEE7BDAEE4B8BAE8BF87E69C9F7371007E001677080000016E1F645B487871007E00187074000B3020302030202A202A203F740021E5B086E4BBA5E5898DE79A84E68EA8E88D90E8AEBEE7BDAEE4B8BAE8BF87E69C9F74000131737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00140000000174000A73797374656D5461736B74000F6F7665726475654F66526573756D657800);

-- ----------------------------
-- Table structure for quartz_task
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task`;
CREATE TABLE `quartz_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称,input,YES,false,true,true',
  `cron` varchar(255) DEFAULT NULL COMMENT '任务表达式,input,YES,false,true,false',
  `target_bean` varchar(255) DEFAULT NULL COMMENT '执行的类,input,YES,false,true,false',
  `trget_method` varchar(255) DEFAULT NULL COMMENT '执行方法,input,YES,false,true,false',
  `params` varchar(255) DEFAULT NULL COMMENT '执行参数,textarea,YES,false,false,false',
  `status` int(11) DEFAULT NULL COMMENT '任务状态,radio,YES,false,true,true',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='定时任务,1';

-- ----------------------------
-- Records of quartz_task
-- ----------------------------
INSERT INTO `quartz_task` VALUES ('1', '同步文章浏览量数据', '0 0 1 * * ?', 'systemTask', 'synchronizationArticleView', '1', '1', '2018-01-26 22:46:23', '1', '2019-10-25 14:45:06', '1', '每天凌晨1点钟执行该任务', '0');
INSERT INTO `quartz_task` VALUES ('2', '生成文章搜索索引', '0 0 1 * * ?', 'systemTask', 'createArticleIndex', '1', '1', '2018-01-29 09:50:39', '1', '2019-10-25 14:45:14', '1', '生成文章搜索索引，每天晚上1点执行', '0');
INSERT INTO `quartz_task` VALUES ('3', '分配简历到专员', '0 0 1-3 * * ?', 'systemTask', 'distributionOfResume', '1', '0', '2019-10-30 15:41:48', '1', '2019-10-30 16:15:35', '1', '每天凌晨1点到3点整点执行一次', '0');
INSERT INTO `quartz_task` VALUES ('4', '将以前的推荐设置为过期', '0 0 0 * * ?', 'systemTask', 'overdueOfResume', '1', '1', '2019-10-30 19:30:33', '1', '2019-10-31 09:18:21', '1', '每天0点将之前的推荐简历全部设置为过期', '0');

-- ----------------------------
-- Table structure for quartz_task_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_task_log`;
CREATE TABLE `quartz_task_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` bigint(20) DEFAULT NULL COMMENT '任务ID,0,YES,false,false,false',
  `name` varchar(255) DEFAULT NULL COMMENT '定时任务名称,input,YES,false,true,true',
  `target_bean` varchar(255) DEFAULT NULL COMMENT '定制任务执行类,input,YES,false,true,false',
  `trget_method` varchar(255) DEFAULT NULL COMMENT '定时任务执行方法,input,YES,false,true,false',
  `params` varchar(255) DEFAULT NULL COMMENT '执行参数,input,YES,false,true,false',
  `status` int(11) DEFAULT NULL COMMENT '任务状态,0,YES,false,false,false',
  `error` text COMMENT '异常消息,textarea,YES,false,false,false',
  `times` int(11) DEFAULT NULL COMMENT '执行时间,input,YES,false,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='任务执行日志,1';

-- ----------------------------
-- Records of quartz_task_log
-- ----------------------------
INSERT INTO `quartz_task_log` VALUES ('1', '3', '执行定时任务【分配简历到专员】', 'SystemTask', 'distributionOfResume', '1', '1', 'No bean named \'SystemTask\' available', '6', '2019-10-30 15:49:11', '1', '2019-10-30 15:49:11', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('2', '3', '执行定时任务【分配简历到专员】', 'SystemTask', 'distributionOfResume', '1', '1', 'No bean named \'SystemTask\' available', '3', '2019-10-30 16:15:02', '1', '2019-10-30 16:15:02', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('3', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '56', '2019-10-30 16:15:45', '1', '2019-10-30 16:15:45', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('4', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '44796', '2019-10-30 16:17:03', '1', '2019-10-30 16:17:48', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('5', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '59052', '2019-10-30 16:24:01', '1', '2019-10-30 16:25:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('6', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '35482', '2019-10-30 17:05:12', '1', '2019-10-30 17:05:48', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('7', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '13683', '2019-10-30 17:14:50', '1', '2019-10-30 17:15:04', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('8', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '4513', '2019-10-30 17:26:10', '1', '2019-10-30 17:26:15', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('9', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '45', '2019-10-30 17:36:12', '1', '2019-10-30 17:36:12', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('10', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '11793', '2019-10-30 17:36:31', '1', '2019-10-30 17:36:43', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('11', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '23391', '2019-10-30 17:47:34', '1', '2019-10-30 17:47:57', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('12', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '15435', '2019-10-30 17:52:28', '1', '2019-10-30 17:52:43', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('13', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '13435', '2019-10-30 18:05:20', '1', '2019-10-30 18:05:33', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('14', '4', '执行定时任务【将以前的推荐设置为过期】', 'systemTask', 'overdueOfResume', '1', '0', null, '17', '2019-10-30 20:36:19', '1', '2019-10-30 20:36:19', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('15', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '4643', '2019-10-30 20:36:46', '1', '2019-10-30 20:36:51', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('16', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1139', '2019-10-30 20:41:34', '1', '2019-10-30 20:41:35', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('17', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '27', '2019-10-30 20:44:30', '1', '2019-10-30 20:44:30', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('18', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '21', '2019-10-30 20:47:13', '1', '2019-10-30 20:47:13', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('19', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '974', '2019-10-30 20:47:41', '1', '2019-10-30 20:47:42', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('20', '4', '执行定时任务【将以前的推荐设置为过期】', 'systemTask', 'overdueOfResume', '1', '0', null, '15', '2019-10-30 20:50:35', '1', '2019-10-30 20:50:35', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('21', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '924', '2019-10-30 20:50:53', '1', '2019-10-30 20:50:54', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('22', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1079', '2019-10-30 20:52:21', '1', '2019-10-30 20:52:22', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('23', '4', '执行定时任务【将以前的推荐设置为过期】', 'systemTask', 'overdueOfResume', '1', '0', null, '25', '2019-10-30 20:56:30', '1', '2019-10-30 20:56:30', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('24', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1047', '2019-10-30 20:56:30', '1', '2019-10-30 20:56:31', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('25', '4', '执行定时任务【将以前的推荐设置为过期】', 'systemTask', 'overdueOfResume', '1', '0', null, '56', '2019-10-31 00:00:00', '1', '2019-10-31 00:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('26', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1080', '2019-10-31 01:00:00', '1', '2019-10-31 01:00:01', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('27', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '56', '2019-10-31 02:00:00', '1', '2019-10-31 02:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('28', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '31', '2019-10-31 03:00:00', '1', '2019-10-31 03:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('29', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '28204', '2019-10-31 16:24:10', '1', '2019-10-31 16:24:38', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('30', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '24219', '2019-10-31 16:30:29', '1', '2019-10-31 16:30:54', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('31', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '23356', '2019-10-31 16:32:39', '1', '2019-10-31 16:33:03', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('32', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '2339', '2019-10-31 16:34:36', '1', '2019-10-31 16:34:39', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('33', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '4103', '2019-10-31 16:44:11', '1', '2019-10-31 16:44:15', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('34', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '186', '2019-10-31 16:51:47', '1', '2019-10-31 16:51:47', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('35', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '178', '2019-10-31 16:54:07', '1', '2019-10-31 16:54:07', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('36', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '20605', '2019-10-31 16:55:48', '1', '2019-10-31 16:56:08', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('37', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '271', '2019-10-31 16:58:46', '1', '2019-10-31 16:58:47', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('38', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '173', '2019-10-31 16:59:15', '1', '2019-10-31 16:59:15', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('39', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '177', '2019-10-31 17:00:41', '1', '2019-10-31 17:00:41', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('40', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '11157', '2019-10-31 17:01:17', '1', '2019-10-31 17:01:28', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('41', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1388', '2019-10-31 17:02:55', '1', '2019-10-31 17:02:57', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('42', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '184880', '2019-10-31 17:05:51', '1', '2019-10-31 17:08:56', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('43', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1283', '2019-10-31 17:10:23', '1', '2019-10-31 17:10:25', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('44', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1456', '2019-10-31 17:14:14', '1', '2019-10-31 17:14:15', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('45', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '171013', '2019-10-31 17:14:56', '1', '2019-10-31 17:17:47', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('46', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1680', '2019-10-31 17:20:28', '1', '2019-10-31 17:20:29', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('47', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1888', '2019-10-31 17:26:41', '1', '2019-10-31 17:26:43', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('48', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '1898', '2019-10-31 17:30:54', '1', '2019-10-31 17:30:55', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('49', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '894', '2019-10-31 17:39:25', '1', '2019-10-31 17:39:26', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('50', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '244', '2019-11-01 01:00:00', '1', '2019-11-01 01:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('51', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '199', '2019-11-01 02:00:00', '1', '2019-11-01 02:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('52', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '190', '2019-11-01 03:00:00', '1', '2019-11-01 03:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('53', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '799', '2019-11-02 01:00:00', '1', '2019-11-02 01:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('54', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '197', '2019-11-02 02:00:00', '1', '2019-11-02 02:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('55', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '229', '2019-11-02 03:00:00', '1', '2019-11-02 03:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('56', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '228', '2019-11-03 01:00:00', '1', '2019-11-03 01:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('57', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '241', '2019-11-03 02:00:00', '1', '2019-11-03 02:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('58', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '240', '2019-11-03 03:00:00', '1', '2019-11-03 03:00:00', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('59', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '207', '2019-11-03 10:24:47', '1', '2019-11-03 10:24:47', '1', null, '0');
INSERT INTO `quartz_task_log` VALUES ('60', '3', '执行定时任务【分配简历到专员】', 'systemTask', 'distributionOfResume', '1', '0', null, '2834', '2019-11-03 10:42:59', '1', '2019-11-03 10:43:02', '1', null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` int(10) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表,测试表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '0', '否', 'is_or_not', '系统字段', '0', '0', '1', '2018-01-05 20:38:12', '1', '2018-01-05 20:38:15', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '是', 'is_or_not', '系统字段', '1', '0', '1', '2018-01-05 20:38:40', '1', '2018-01-05 20:38:44', null, '0');
INSERT INTO `sys_dict` VALUES ('3', 'qiniu', '七牛云存储', 'sys_rescource_source', '系统字段', '0', '0', '1', '2018-01-14 06:39:57', '1', '2018-01-14 06:39:57', null, '0');
INSERT INTO `sys_dict` VALUES ('4', 'oss', '阿里云存储', 'sys_rescource_source', '系统字段', '1', '0', '1', '2018-01-14 06:39:57', '1', '2018-01-14 06:39:57', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '2333', '我的标签2', 'you_sign', null, '2', '0', '1', '2018-01-16 16:03:12', '1', '2018-01-16 17:52:15', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '322', '他的标签', 'you_sign', '我', '3', '0', '1', '2018-01-16 17:52:49', '1', '2018-01-16 18:02:37', null, '0');
INSERT INTO `sys_dict` VALUES ('121', '1', '本站文章', 'blog_article_category', '博客内容-文章类型(此数据为系统自动创建:数据表【blog_article】中的字段【category】对应的值)', '0', '0', '1', '2018-01-17 16:05:45', '1', '2018-01-17 16:05:45', null, '0');
INSERT INTO `sys_dict` VALUES ('122', '2', '外链', 'blog_article_category', '博客内容-文章类型(此数据为系统自动创建:数据表【blog_article】中的字段【category】对应的值)', '1', '0', '1', '2018-01-17 16:05:45', '1', '2018-01-17 16:05:45', null, '0');
INSERT INTO `sys_dict` VALUES ('123', '0', '正常', 'quartz_task_status', '定时任务-任务状态(此数据为系统自动创建:数据表【quartz_task】中的字段【status】对应的值)', '0', '0', '1', '2018-01-24 23:41:56', '1', '2018-01-24 23:41:56', null, '0');
INSERT INTO `sys_dict` VALUES ('124', '1', '暂停', 'quartz_task_status', '定时任务-任务状态(此数据为系统自动创建:数据表【quartz_task】中的字段【status】对应的值)', '1', '0', '1', '2018-01-24 23:41:56', '1', '2018-01-24 23:41:56', null, '0');
INSERT INTO `sys_dict` VALUES ('125', '1', '男', 'erp_resume_sex', '简历表-性别(此数据为系统自动创建:数据表【erp_resume】中的字段【sex】对应的值)', '0', '0', '1', '2019-10-26 15:35:37', '1', '2019-10-26 15:35:37', null, '0');
INSERT INTO `sys_dict` VALUES ('126', '2', '女', 'erp_resume_sex', '简历表-性别(此数据为系统自动创建:数据表【erp_resume】中的字段【sex】对应的值)', '1', '0', '1', '2019-10-26 15:35:37', '1', '2019-10-26 15:35:37', null, '0');
INSERT INTO `sys_dict` VALUES ('133', '1', '求职中', 'erp_resume_status', '简历表-求职状态(此数据为系统自动创建:数据表【erp_resume】中的字段【status】对应的值)', '0', '0', '1', '2019-10-26 15:35:39', '1', '2019-10-26 15:35:40', null, '0');
INSERT INTO `sys_dict` VALUES ('134', '2', '工作中', 'erp_resume_status', '简历表-求职状态(此数据为系统自动创建:数据表【erp_resume】中的字段【status】对应的值)', '1', '0', '1', '2019-10-26 15:35:40', '1', '2019-10-26 15:35:40', null, '0');
INSERT INTO `sys_dict` VALUES ('135', '1', '未入职', 'erp_resume_job_status', '简历表-人才状态(此数据为系统自动创建:数据表【erp_resume】中的字段【job_status】对应的值)', '0', '0', '1', '2019-10-26 15:45:17', '1', '2019-10-26 15:45:17', null, '0');
INSERT INTO `sys_dict` VALUES ('136', '2', '待面试', 'erp_resume_job_status', '简历表-人才状态(此数据为系统自动创建:数据表【erp_resume】中的字段【job_status】对应的值)', '1', '0', '1', '2019-10-26 15:45:17', '1', '2019-10-26 15:45:17', null, '0');
INSERT INTO `sys_dict` VALUES ('137', '3', '面试通过', 'erp_resume_job_status', '简历表-人才状态(此数据为系统自动创建:数据表【erp_resume】中的字段【job_status】对应的值)', '2', '0', '1', '2019-10-26 15:45:17', '1', '2019-10-26 15:45:18', null, '0');
INSERT INTO `sys_dict` VALUES ('138', '4', '培训期', 'erp_resume_job_status', '简历表-人才状态(此数据为系统自动创建:数据表【erp_resume】中的字段【job_status】对应的值)', '3', '0', '1', '2019-10-26 15:45:18', '1', '2019-10-26 15:45:18', null, '0');
INSERT INTO `sys_dict` VALUES ('139', '5', '培训通过', 'erp_resume_job_status', '简历表-人才状态(此数据为系统自动创建:数据表【erp_resume】中的字段【job_status】对应的值)', '4', '0', '1', '2019-10-26 15:45:18', '1', '2019-10-26 15:45:18', null, '0');
INSERT INTO `sys_dict` VALUES ('140', '6', '已入职', 'erp_resume_job_status', '简历表-人才状态(此数据为系统自动创建:数据表【erp_resume】中的字段【job_status】对应的值)', '5', '0', '1', '2019-10-26 15:45:18', '1', '2019-10-26 15:45:18', null, '0');
INSERT INTO `sys_dict` VALUES ('147', '1', '在招', 'erp_project_status', '项目表-状态(此数据为系统自动创建:数据表【erp_project】中的字段【status】对应的值)', '0', '0', '1', '2019-10-27 12:48:06', '1', '2019-10-27 12:48:06', null, '0');
INSERT INTO `sys_dict` VALUES ('148', '2', '暂停', 'erp_project_status', '项目表-状态(此数据为系统自动创建:数据表【erp_project】中的字段【status】对应的值)', '1', '0', '1', '2019-10-27 12:48:06', '1', '2019-10-27 12:48:06', null, '0');
INSERT INTO `sys_dict` VALUES ('167', '1', '全职', 'erp_resume_type', '简历表-类型(此数据为系统自动创建:数据表【erp_resume】中的字段【type】对应的值)', '0', '0', '1', '2019-10-27 22:19:41', '1', '2019-10-27 22:19:41', null, '0');
INSERT INTO `sys_dict` VALUES ('168', '2', '兼职', 'erp_resume_type', '简历表-类型(此数据为系统自动创建:数据表【erp_resume】中的字段【type】对应的值)', '1', '0', '1', '2019-10-27 22:19:42', '1', '2019-10-27 22:19:42', null, '0');
INSERT INTO `sys_dict` VALUES ('169', '1', '大专', 'erp_resume_education', '简历表-学历(此数据为系统自动创建:数据表【erp_resume】中的字段【education】对应的值)', '0', '0', '1', '2019-10-30 19:48:23', '1', '2019-10-30 19:48:23', null, '0');
INSERT INTO `sys_dict` VALUES ('170', '2', '高中以下', 'erp_resume_education', '简历表-学历(此数据为系统自动创建:数据表【erp_resume】中的字段【education】对应的值)', '1', '0', '1', '2019-10-30 19:48:24', '1', '2019-10-30 19:48:24', null, '0');
INSERT INTO `sys_dict` VALUES ('171', '3', '高中', 'erp_resume_education', '简历表-学历(此数据为系统自动创建:数据表【erp_resume】中的字段【education】对应的值)', '2', '0', '1', '2019-10-30 19:48:24', '1', '2019-10-30 19:48:24', null, '0');
INSERT INTO `sys_dict` VALUES ('172', '4', '本科', 'erp_resume_education', '简历表-学历(此数据为系统自动创建:数据表【erp_resume】中的字段【education】对应的值)', '3', '0', '1', '2019-10-30 19:48:24', '1', '2019-10-30 19:48:24', null, '0');
INSERT INTO `sys_dict` VALUES ('173', '5', '本科以上', 'erp_resume_education', '简历表-学历(此数据为系统自动创建:数据表【erp_resume】中的字段【education】对应的值)', '4', '0', '1', '2019-10-30 19:48:25', '1', '2019-10-30 19:48:25', null, '0');
INSERT INTO `sys_dict` VALUES ('174', '6', '其他', 'erp_resume_education', '简历表-学历(此数据为系统自动创建:数据表【erp_resume】中的字段【education】对应的值)', '5', '0', '1', '2019-10-30 19:48:25', '1', '2019-10-30 19:48:25', null, '0');

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '分组名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分组ID',
  `level` bigint(2) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '分组序列号',
  `sort` smallint(6) DEFAULT NULL COMMENT '分组排序值',
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group_ur
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_ur`;
CREATE TABLE `sys_group_ur` (
  `group_id` bigint(20) NOT NULL COMMENT '分组ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_group_ur
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作用户昵称',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `http_method` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `class_method` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求类型.方法',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `session_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'sessionId',
  `response` longtext COLLATE utf8_bin COMMENT '返回内容',
  `use_time` bigint(11) DEFAULT NULL COMMENT '方法执行时间',
  `browser` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '浏览器信息',
  `area` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地区',
  `province` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `isp` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '网络服务提供商',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_parent_id_idx` (`parent_id`) USING BTREE,
  KEY `menu_sort_idx` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', null, '1', '1,', '20', '', null, '', null, '1', '', '1', '2018-01-16 11:29:46', '1', '2018-01-20 03:09:26', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '企业员工管理', '1', '2', '1,2,', '9', '/admin/system/user/list', null, '', '#47e69c', '1', 'sys:user:list', '1', '2018-01-16 11:31:18', '1', '2019-10-27 11:53:19', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '系统角色管理', '1', '2', '1,3,', '10', '/admin/system/role/list', null, '', '#c23ab9', '1', 'sys:role:list', '1', '2018-01-16 11:32:33', '1', '2018-01-20 05:58:58', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '系统权限管理', '1', '2', '1,4,', '20', '/admin/system/menu/list', null, '', '#d4573b', '1', 'sys:menu:list', '1', '2018-01-16 11:33:19', '1', '2018-02-08 09:49:28', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '系统资源管理', '1', '2', '1,5,', '30', '/admin/system/rescource/list', null, '', '#f5e42a', '1', 'sys:rescource:list', '1', '2018-01-16 11:34:48', '1', '2018-01-20 05:56:35', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '系统日志管理', '1', '2', '1,6,', '40', '/admin/system/log/list', null, '', '#b56c18', '1', 'sys:log:list', '1', '2018-01-16 11:35:31', '1', '2018-01-20 05:12:17', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '网站基本信息', '1', '2', '1,7,', '50', '/admin/system/site/show', null, '', '#95deb9', '1', 'sys:site:list', '1', '2018-01-16 11:36:50', '1', '2018-01-20 05:55:44', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '数据库管理', '1', '2', '1,8,', '60', '/admin/system/table/list', null, '', '#369e16', '1', 'sys:table:list', '1', '2018-01-16 11:38:29', '1', '2018-01-20 03:14:23', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '系统字典管理', '1', '2', '1,9,', '70', '/admin/system/dict/list', null, '', '#1bbcc2', '1', 'sys:dict:list', '1', '2018-01-16 14:51:52', '1', '2018-01-20 03:12:27', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '博客管理', null, '1', '10,', '10', '', null, '', null, '1', '', '1', '2018-01-17 13:21:53', '1', '2018-01-22 00:28:28', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '栏目管理', '10', '2', '10,11,', '6', '/admin/blogChannel/list', null, '', null, '1', 'blog:channel:list', '1', '2018-01-17 13:22:57', '1', '2018-02-08 10:20:54', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '博客评论', '10', '2', '10,12,', '7', '/admin/blogComment/list', null, '', '#c8e332', '1', 'blog:comment:list', '1', '2018-01-17 13:23:52', '1', '2018-02-08 10:25:26', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '博客文章', '10', '2', '10,13,', '8', '/admin/blogArticle/list', null, '', '#1962b5', '1', 'blog:article:list', '1', '2018-01-17 16:02:07', '1', '2018-02-08 10:26:13', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '定时任务', null, '1', '14,', '5', '', null, '', null, '1', '', '1', '2018-01-26 22:39:35', '1', '2018-02-08 10:31:05', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '任务列表', '14', '2', '14,15,', '15', '/admin/quartzTask/list', null, '', '#d6d178', '1', 'quartz:task:list', '1', '2018-01-26 22:41:25', '1', '2018-02-08 10:31:11', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '任务执行日志', '14', '2', '14,16,', '10', '/admin/quartzTaskLog/list', null, '', '#5158d6', '1', 'quartz:log:list', '1', '2018-01-27 01:07:11', '1', '2018-02-08 10:37:51', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '新增字典', '9', '3', '1,9,17,', '0', '', null, null, null, '0', 'sys:dict:add', '1', '2018-02-08 09:39:09', '1', '2018-02-08 09:39:19', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '编辑字典', '9', '3', '1,9,18,', '10', '', null, null, null, '0', 'sys:dict:edit', '1', '2018-02-08 09:40:37', '1', '2018-02-08 09:40:46', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '编辑字典类型', '9', '3', '1,9,19,', '20', '', null, null, null, '0', 'sys:dict:editType', '1', '2018-02-08 09:42:46', '1', '2018-02-08 09:54:07', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '新增系统权限', '4', '3', '1,4,20,', '0', '', null, null, null, '0', 'sys:menu:add', '1', '2018-02-08 09:49:15', '1', '2018-02-08 09:49:38', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '编辑系统权限', '4', '3', '1,4,21,', '10', '', null, null, null, '0', 'sys:menu:edit', '1', '2018-02-08 09:50:16', '1', '2018-02-08 09:50:25', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '删除系统权限', '4', '3', '1,4,22,', '20', '', null, null, null, '0', 'sys:menu:delete', '1', '2018-02-08 09:51:53', '1', '2018-02-08 09:53:42', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '删除系统资源', '5', '3', '1,5,23,', '0', '', null, null, null, '0', 'sys:rescource:delete', '1', '2018-02-08 09:56:44', '1', '2018-02-08 09:56:53', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '新增系统角色', '3', '3', '1,3,24,', '0', '', null, null, null, '0', 'sys:role:add', '1', '2018-02-08 09:58:11', '1', '2018-02-08 09:58:11', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '编辑菜单权限', '3', '3', '1,3,25,', '10', '', null, null, null, '0', 'sys:role:edit', '1', '2018-02-08 09:59:01', '1', '2018-02-08 09:59:01', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '删除角色', '3', '3', '1,3,26,', '20', '', null, null, null, '0', 'sys:role:delete', '1', '2018-02-08 09:59:56', '1', '2018-02-08 09:59:56', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '编辑系统信息', '7', '3', '1,7,27,', '0', '', null, null, null, '0', 'sys:site:edit', '1', '2018-02-08 10:01:40', '1', '2018-02-08 10:01:40', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '数据库新增', '8', '3', '1,8,28,', '0', '', null, null, null, '0', 'sys:table:add', '1', '2018-02-08 10:02:51', '1', '2018-02-08 10:02:51', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '编辑数据库', '8', '3', '1,8,29,', '10', '', null, null, null, '0', 'sys:table:edit', '1', '2018-02-08 10:03:58', '1', '2018-02-08 10:03:58', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '新增数据库字段', '8', '3', '1,8,30,', '20', '', null, null, null, '0', 'sys:table:addField', '1', '2018-02-08 10:05:11', '1', '2018-02-08 10:05:11', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '编辑数据库字段', '8', '3', '1,8,31,', '30', '', null, null, null, '0', 'sys:table:editField', '1', '2018-02-08 10:05:47', '1', '2018-02-08 10:05:47', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '删除数据库字段', '8', '3', '1,8,32,', '40', '', null, null, null, '0', 'sys:table:deleteField', '1', '2018-02-08 10:07:29', '1', '2018-02-08 10:15:39', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '删除数据库', '8', '3', '1,8,33,', '50', '', null, null, null, '0', 'sys:table:deleteTable', '1', '2018-02-08 10:08:16', '1', '2018-02-08 10:08:16', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '下载源码', '8', '3', '1,8,34,', '60', '', null, null, null, '0', 'sys:table:download', '1', '2018-02-08 10:09:28', '1', '2018-02-08 10:09:28', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '新增系统用户', '2', '3', '1,2,35,', '0', '', null, null, null, '0', 'sys:user:add', '1', '2018-02-08 10:10:32', '1', '2018-02-08 10:10:32', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '编辑系统用户', '2', '3', '1,2,36,', '10', '', null, null, null, '0', 'sys:user:edit', '1', '2018-02-08 10:11:49', '1', '2018-02-08 10:11:49', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '删除系统用户', '2', '3', '1,2,37,', '20', '', null, null, null, '0', 'sys:user:delete', '1', '2018-02-08 10:12:43', '1', '2018-02-08 10:12:43', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '新增博客文章', '13', '3', '10,13,38,', '0', '', null, null, null, '0', 'blog:article:add', '1', '2018-02-08 10:16:59', '1', '2018-02-08 10:16:59', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '博客文章编辑', '13', '3', '10,13,39,', '10', '', null, null, null, '0', 'blog:article:edit', '1', '2018-02-08 10:17:16', '1', '2018-02-08 10:17:16', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '博客文章删除', '13', '3', '10,13,40,', '20', '', null, null, null, '0', 'blog:article:delete', '1', '2018-02-08 10:17:34', '1', '2018-02-08 10:44:02', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '博客评论回复', '12', '3', '10,12,41,', '0', '', null, null, null, '0', 'blog:comment:reply', '1', '2018-02-08 10:19:29', '1', '2018-02-08 10:20:33', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '新增博客栏目', '11', '3', '10,11,42,', '0', '', null, null, null, '0', 'blog:channel:add', '1', '2018-02-08 10:22:06', '1', '2018-02-08 10:22:06', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '编辑博客栏目', '11', '3', '10,11,43,', '10', '', null, null, null, '0', 'blog:channel:edit', '1', '2018-02-08 10:23:31', '1', '2018-02-08 10:23:31', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '删除博客栏目', '11', '3', '10,11,44,', '20', '', null, null, null, '0', 'blog:channel:delete', '1', '2018-02-08 10:23:57', '1', '2018-02-08 10:23:57', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '删除博客评论', '12', '3', '10,12,45,', '10', '', null, null, null, '0', 'blog:comment:delete', '1', '2018-02-08 10:28:48', '1', '2018-02-08 10:28:48', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '新增定时任务', '15', '3', '14,15,46,', '0', '', null, null, null, '0', 'quartz:task:add', '1', '2018-02-08 10:32:46', '1', '2018-02-08 10:32:46', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '编辑定时任务', '15', '3', '14,15,47,', '10', '', null, null, null, '0', 'quartz:task:edit', '1', '2018-02-08 10:34:18', '1', '2018-02-08 10:34:18', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '删除定时任务', '15', '3', '14,15,48,', '20', '', null, null, null, '0', 'quartz:task:delete', '1', '2018-02-08 10:35:07', '1', '2018-02-08 10:35:07', null, '0');
INSERT INTO `sys_menu` VALUES ('49', '暂停定时任务', '15', '3', '14,15,49,', '30', '', null, null, null, '0', 'quartz:task:paush', '1', '2018-02-08 10:35:43', '1', '2018-02-08 10:35:43', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '恢复运行任务', '15', '3', '14,15,50,', '40', '', null, null, null, '0', 'quartz:task:resume', '1', '2018-02-08 10:36:26', '1', '2018-02-08 10:36:26', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '立即执行运行任务', '15', '3', '14,15,51,', '50', '', null, null, null, '0', 'quartz:task:run', '1', '2018-02-08 10:36:55', '1', '2018-02-08 10:36:55', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '删除定时任务日志', '16', '3', '14,16,52,', '0', '', null, null, null, '0', 'quartz:log:delete', '1', '2018-02-08 10:39:04', '1', '2018-02-08 10:39:04', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '修改密码', '2', '3', '1,2,53,', '30', '', null, '', null, '0', 'sys:user:changePassword', '1', '2018-03-15 10:14:06', '1', '2018-03-15 10:14:06', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '删除字典', '9', '3', '1,9,54,', '30', '', null, null, null, '0', 'sys:dict:delete', '1', '2018-03-15 10:16:55', '1', '2018-03-15 10:16:55', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '系统日志删除', '6', '3', '1,6,55,', '0', '', null, null, null, '0', 'system:logs:delete', '1', '2018-06-16 04:30:32', '1', '2018-06-16 04:30:32', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '博客标签', '10', '2', '10,56,', '3', '/admin/blogTags/list', null, '', '#c3e8ce', '1', 'blog:tags:list', '1', '2018-06-16 04:42:15', '1', '2018-06-16 04:42:30', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '博客标签新增', '56', '3', '10,56,57,', '0', '', null, null, null, '0', 'blog:tags:add', '1', '2018-06-16 04:43:02', '1', '2018-06-16 04:43:02', null, '0');
INSERT INTO `sys_menu` VALUES ('58', '博客标签编辑', '56', '3', '10,56,58,', '10', '', null, null, null, '0', 'blog:tags:edit', '1', '2018-06-16 04:43:26', '1', '2018-06-16 04:43:26', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '博客标签删除', '56', '3', '10,56,59,', '20', '', null, null, null, '0', 'blog:tags:delete', '1', '2018-06-16 04:43:56', '1', '2018-06-16 04:43:56', null, '0');
INSERT INTO `sys_menu` VALUES ('60', 'Druid数据监控', '1', '2', '1,60,', '25', '/admin/druid/list', null, '', '#7e8755', '1', 'sys:druid:list', '1', '2018-06-16 05:06:17', '1', '2018-06-16 05:06:26', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '七牛云存储信息', '7', '3', '1,7,61,', '10', '', null, null, null, '0', 'sys:site:editQiniu', '1', '2018-07-12 18:46:39', '1', '2018-07-12 18:46:39', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '阿里云信息存储', '7', '3', '1,7,62,', '20', '', null, null, null, '0', 'sys:site:editOss', '1', '2018-07-12 18:47:05', '1', '2018-07-12 18:47:05', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '人力资源', null, '1', '63,', '30', '', null, '', null, '1', '', '1', '2019-10-26 21:25:48', '1', '2019-10-26 21:25:48', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '标签管理', '63', '2', '63,64,', '0', '/admin/erpTag/list', null, '', null, '1', '', '1', '2019-10-27 11:44:44', '1', '2019-10-27 11:44:44', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '项目管理', '63', '2', '63,65,', '10', '/admin/erpProject/list', null, '', null, '1', '', '1', '2019-10-27 11:47:07', '1', '2019-10-27 11:47:07', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '简历管理', '63', '2', '63,66,', '20', '/admin/erpResume/list', null, '', null, '1', '', '1', '2019-10-27 11:48:11', '1', '2019-10-27 11:48:11', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '我的项目', null, '1', '67,', '40', '/admin/erpProject/my', null, '', null, '1', '', '1', '2019-10-29 10:01:30', '1', '2019-10-29 10:01:31', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '我的简历', null, '1', '68,', '50', '/admin/erpResume/my', null, '', null, '1', '', '1', '2019-10-29 10:02:34', '1', '2019-10-29 10:02:35', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '系统分配简历', null, '1', '69,', '60', '/admin/erpUserResume/list', null, '', null, '1', '', '1', '2019-10-29 10:03:24', '1', '2019-10-30 17:35:57', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '我的成交简历', null, '1', '70,', '70', '/admin/erpResume/mydo', null, '', null, '1', '', '1', '2019-10-29 10:04:07', '1', '2019-10-29 10:04:08', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '小组成交简历', null, '1', '71,', '80', '/admin/erpResume/teamdo', null, '', null, '1', '', '1', '2019-10-29 10:04:58', '1', '2019-10-29 10:04:59', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '成交简历', '63', '2', '63,72,', '30', '/admin/erpResume/alldo', null, '', null, '1', '', '1', '2019-10-31 19:22:46', '1', '2019-10-31 19:22:47', null, '0');

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES ('2', '77861034-25ef-4856-87ec-24da18398ecf.jpg', 'qiniu', 'https://static.mysiteforme.com/77861034-25ef-4856-87ec-24da18398ecf.jpg', 'FvRpJ_-DlF-eFJ4l28xVGVUsHRCX', '105kb', '.jpg', null, '2018-02-08 13:57:44', '1', '2018-02-08 13:57:44', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('3', '04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg', 'qiniu', 'https://static.mysiteforme.com/04ea0ce0-e53b-4eb3-b1ea-dc316063d29f.jpg', 'FrJ5IUYX0zMw5HpDW4fUfNvMv4Q3', '329kb', '.jpg', null, '2018-02-08 13:59:06', '1', '2018-02-08 13:59:06', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('4', '3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'qiniu', 'https://static.mysiteforme.com/3e2baf40-f2e5-4b3c-93d1-3f97965017ec.jpg', 'FpgHWPFgcyMX1lqNEDk8Pdnl3lsu', '228kb', '.jpg', null, '2018-03-13 12:54:36', '1', '2018-03-13 12:54:36', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('5', '545105c9-b59d-4d3c-87bb-5c0068868352.icon', 'local', '/static/upload/545105c9-b59d-4d3c-87bb-5c0068868352.icon', 'FhZz0LI5OES-oqv7n2u2ydVh5R-U', '1kb', 'application/octet-stream', null, '2019-10-25 16:07:56', '1', '2019-10-25 16:07:56', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('6', 'aa75189c-2df0-4ccb-b941-caef99f48b3d.png', 'local', '/static/upload/aa75189c-2df0-4ccb-b941-caef99f48b3d.png', 'FgCCupjUiu2vil-fH3rq1I6B5XuR', '187kb', 'image/png', null, '2019-10-31 19:02:15', '1', '2019-10-31 19:02:16', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('7', 'be5d9522-1638-4025-8510-2a2a4baffb94.png', 'local', '/static/upload/be5d9522-1638-4025-8510-2a2a4baffb94.png', 'FjsicAyXkTgHlN9oxQEGwpGR-_0z', '130kb', 'image/png', null, '2019-10-31 19:08:11', '1', '2019-10-31 19:08:11', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('8', 'c3de9537-4ed3-4888-bf9a-53dfb2b427da.jpg', 'local', '/static/upload/c3de9537-4ed3-4888-bf9a-53dfb2b427da.jpg', 'FqGfB0x_2YTuSYxZa3X5ttjzlqGR', '2582kb', 'image/jpeg', null, '2019-11-03 10:33:09', '1', '2019-11-03 10:33:09', '1', null, '0');
INSERT INTO `sys_rescource` VALUES ('9', '9fac1518-5846-4c45-938a-9d081c9cf0ec.jpeg', 'local', '/static/upload/9fac1518-5846-4c45-938a-9d081c9cf0ec.jpeg', 'FnQbp5myT_n0FnPOIS97RkoqtN9f', '132kb', 'image/jpeg', null, '2019-11-04 10:38:51', '1', '2019-11-04 10:38:51', '1', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '老司机', '2017-11-02 14:19:07', '1', '2019-10-27 11:24:58', '1', '', '1');
INSERT INTO `sys_role` VALUES ('2', '系统管理员', '2017-11-29 19:36:37', '1', '2019-10-27 18:34:05', '2', '', '0');
INSERT INTO `sys_role` VALUES ('3', '组长', '2019-10-27 11:28:06', '1', '2019-10-29 10:06:14', '1', '', '0');
INSERT INTO `sys_role` VALUES ('4', '招聘专员', '2019-10-27 11:28:22', '1', '2019-10-29 10:06:52', '1', '', '0');
INSERT INTO `sys_role` VALUES ('5', '管理员', '2019-10-27 11:29:34', '1', '2019-10-31 19:23:55', '1', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('4', '67');
INSERT INTO `sys_role_menu` VALUES ('4', '68');
INSERT INTO `sys_role_menu` VALUES ('4', '69');
INSERT INTO `sys_role_menu` VALUES ('4', '70');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '35');
INSERT INTO `sys_role_menu` VALUES ('5', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '37');
INSERT INTO `sys_role_menu` VALUES ('5', '53');
INSERT INTO `sys_role_menu` VALUES ('5', '63');
INSERT INTO `sys_role_menu` VALUES ('5', '64');
INSERT INTO `sys_role_menu` VALUES ('5', '65');
INSERT INTO `sys_role_menu` VALUES ('5', '66');
INSERT INTO `sys_role_menu` VALUES ('5', '72');

-- ----------------------------
-- Table structure for sys_site
-- ----------------------------
DROP TABLE IF EXISTS `sys_site`;
CREATE TABLE `sys_site` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL COMMENT '系统网址',
  `open_message` bit(1) DEFAULT NULL COMMENT '是否开放评论',
  `is_no_name` bit(1) DEFAULT NULL COMMENT '是否匿名评论',
  `version` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `author_icon` varchar(255) DEFAULT NULL,
  `file_upload_type` varchar(255) DEFAULT NULL,
  `weibo` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `git` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `database` varchar(255) DEFAULT NULL,
  `max_upload` int(11) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `powerby` varchar(255) DEFAULT NULL,
  `record` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` text,
  `del_flag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_site
-- ----------------------------
INSERT INTO `sys_site` VALUES ('1', '人力资源管理', 'https://123.207.243.40/', '', '\0', '1.0', 'Jupanshuai', 'https://static.mysiteforme.com/3c5b69f4-2e39-4f88-b302-a6eb48e4c43a.jpg', 'local', 'https://weibo.com/6314935934', '1034570286', 'https://gitee.com/wanglingxiao/', 'https://github.com/zhupanlinch/', '13163396277', 'jupanshuai@qq.com', '湖北-武汉', '/static/upload/545105c9-b59d-4d3c-87bb-5c0068868352.icon', 'windows', 'mysql', '2', null, '网站描述', null, '鄂ICP备17014298号', '1', '2017-12-30 22:46:15', '1', '2019-10-26 10:58:47', '<p>92年小码农一只,从事java后台开发</p><p><br></p>', '\0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '我是管理员', '/static/upload/9fac1518-5846-4c45-938a-9d081c9cf0ec.jpeg', 'abeb4759a3c1a023ab924ebc012d825a732d1cad', '572d7ee24ad88431', '13776055179', 'b@qq.com', '0', '2017-11-27 22:19:39', '1', '2019-11-04 10:38:53', '1', '', '0');
INSERT INTO `sys_user` VALUES ('2', 'liubei', '刘备', null, '938bad19f98fabe4d556239f8f4afecc64116bf9', '3688dcea808cdd44', '', '', '0', '2019-10-27 11:31:54', '1', '2019-10-27 11:31:54', '1', null, '0');
INSERT INTO `sys_user` VALUES ('3', 'xuxianliang', '徐显亮', null, 'e2220ebc0baa99307561b4c86b30964e81b15428', '759db3c52eacaea7', '17679112449', '1137130032@qq.com', '0', '2019-10-27 11:32:20', '1', '2019-10-27 19:30:19', '2', null, '0');
INSERT INTO `sys_user` VALUES ('4', 'wangjinlong', '王金龙', null, '1e387af8ea488560fec339b03a6af4489c6faa4b', '3fa72093e3317bff', '15623755006', '1029092931@qq.com', '0', '2019-10-27 11:32:42', '1', '2019-10-27 19:31:21', '2', null, '0');
INSERT INTO `sys_user` VALUES ('5', 'yuxingzhi', '余兴志', null, '3aa293082d2d3d01cb31ba25269f1d9daacdbd15', 'e66c375fea58369d', '15927166157', '805608677@qq.com', '0', '2019-10-27 11:33:18', '1', '2019-10-27 19:34:23', '2', null, '0');
INSERT INTO `sys_user` VALUES ('6', 'zuobiao', '左彪', null, 'b635f13c8989f37ba2cbda06b47679ab12c04f5d', '7dd89c2e8a8f07e3', '13538138419', '', '0', '2019-10-27 11:34:34', '1', '2019-10-27 19:35:24', '2', null, '0');
INSERT INTO `sys_user` VALUES ('7', 'wangmin', '汪敏', null, 'b187eae18839b6fae098837d45b169d9a2d2a7b1', '7a088d15d57a47cb', '18062673152', '', '0', '2019-10-27 11:34:57', '1', '2019-10-27 19:36:29', '2', null, '0');
INSERT INTO `sys_user` VALUES ('8', 'luoanqi', '罗安琪', null, '6120f645535cdb1eb78000119c1c07d95e834e04', 'd32ad654cdfb8767', '18871742576', '', '0', '2019-10-27 11:35:21', '1', '2019-10-27 19:37:11', '2', null, '0');
INSERT INTO `sys_user` VALUES ('9', 'caiyuqing', '蔡雨清', null, 'f74156c556bf0a76cb21dbd4a0c3464195d88151', '1cd32907f20fc2e4', '15871943382', '', '0', '2019-10-27 11:35:37', '1', '2019-10-27 19:39:24', '2', null, '0');
INSERT INTO `sys_user` VALUES ('10', 'fangliu', '方柳', null, 'fcae8f908717b9015e7bc05657326ec0d276653b', '7a782ba82d933c2e', '15827387672', '', '0', '2019-10-27 11:36:03', '1', '2019-10-27 19:40:10', '2', null, '0');
INSERT INTO `sys_user` VALUES ('11', 'huangshanshan', '黄杉杉', null, '849598e541b1cef7e5e2bdddf03ebf2fda950711', 'f62059eef7fb3a37', '18372063830', '', '0', '2019-10-27 11:36:23', '1', '2019-10-27 19:41:04', '2', null, '0');
INSERT INTO `sys_user` VALUES ('12', 'jiangshan', '江珊', null, 'e56902247c725307ff4798ce0e68a01aa803cd82', 'd0823274d1785856', '17612728114', '', '0', '2019-10-27 19:41:57', '2', '2019-10-27 19:41:57', '2', null, '0');
INSERT INTO `sys_user` VALUES ('13', 'yueming', '乐鸣', null, 'a775b3a3a5d9bc7d6818c43d729d06f4b09440d4', 'afa60de567130157', '17371419761', '', '0', '2019-10-27 19:42:39', '2', '2019-11-01 17:53:08', '2', null, '0');
INSERT INTO `sys_user` VALUES ('14', 'liuzhi', '刘智', null, '08399ffa035478fcce2e125c44fa2c45a244dfa8', 'a16f3c9534b00d42', '15271919765', '', '0', '2019-10-27 19:43:37', '2', '2019-10-27 19:43:37', '2', null, '0');
INSERT INTO `sys_user` VALUES ('15', 'songyuting', '宋玉婷', null, '7d71c8d1ded653905aba23241bf3154fe663a2e2', '55cbabdefff28f18', '15623742315', '', '0', '2019-10-27 19:45:00', '2', '2019-10-27 19:45:00', '2', null, '0');
INSERT INTO `sys_user` VALUES ('16', 'tongli', '童丽', null, '333da0bd22455a4bf6e775fa2d4a104bd715aa56', 'a67de91ebb4fe34b', '18771076513', '', '0', '2019-10-27 19:45:52', '2', '2019-10-27 19:45:52', '2', null, '0');
INSERT INTO `sys_user` VALUES ('17', 'wangzhiwei', '王志伟', null, '537ddcdcddb38392c9e34af6476b4f5ce2c37215', 'cface656dc111646', '13636005705', '', '0', '2019-10-27 19:49:08', '2', '2019-10-27 19:49:08', '2', null, '0');
INSERT INTO `sys_user` VALUES ('18', 'xiaoqing', '肖青', null, 'd15686b929fbfc505a006882139c927aa8582649', '99b1cdbd5b7e712c', '15172489662', '', '0', '2019-10-27 19:53:13', '2', '2019-10-27 19:53:13', '2', null, '0');
INSERT INTO `sys_user` VALUES ('19', 'yangxin', '杨鑫', null, '80886fb807e008c4f0d44629d18907fdf1d6d528', '0d15d1ba47dc5355', '19907118160', '', '0', '2019-10-27 19:53:47', '2', '2019-10-27 19:53:47', '2', null, '0');
INSERT INTO `sys_user` VALUES ('20', 'zhangbai', '章白', null, '61516f20974cb3defffbf8c583491a3b253f751d', 'b9883a1d8a66d031', '17671318225', '', '0', '2019-10-27 19:56:49', '2', '2019-10-27 19:56:49', '2', null, '0');
INSERT INTO `sys_user` VALUES ('21', 'zhaojinchi', '赵金池', null, '4aedd5cdcb02a84a39ede179f5d731879013f736', '7ca470449ac2f1ce', '13597639414', '', '0', '2019-10-27 19:58:03', '2', '2019-10-27 19:58:03', '2', null, '0');
INSERT INTO `sys_user` VALUES ('22', 'liuyunxiang', '刘云翔', null, '99f747485570c4482c972d5f22a91e6e47faa20d', 'f4b0f0768eaa634c', '17871138667', '', '0', '2019-10-27 19:58:50', '2', '2019-10-27 19:58:50', '2', null, '0');
INSERT INTO `sys_user` VALUES ('23', 'qinxiangli', '秦想丽', null, 'b3108a8f16dedc46eded52c542bdbbcf6fba6c75', '54e20fa28d1e4105', '15007677534', '', '0', '2019-10-29 19:33:25', '2', '2019-10-29 19:33:25', '2', null, '0');
INSERT INTO `sys_user` VALUES ('24', 'daibin', '戴斌', null, 'b6bbb3c329ec783455df93fa925f71ed81484c69', 'da2ffc27e105a890', '17671101541', '', '0', '2019-10-29 19:38:14', '2', '2019-10-30 19:41:57', '2', null, '0');
INSERT INTO `sys_user` VALUES ('25', 'wanmingyan', '万明艳', null, 'c066c9b79a07303a841dd37d97b473af89f9db75', '46661c05a28a0b2c', '13545880524', '', '0', '2019-10-30 19:38:26', '2', '2019-10-30 19:38:26', '2', null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('2', '5');
INSERT INTO `sys_user_role` VALUES ('3', '3');
INSERT INTO `sys_user_role` VALUES ('3', '4');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('4', '4');
INSERT INTO `sys_user_role` VALUES ('5', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '3');
INSERT INTO `sys_user_role` VALUES ('6', '4');
INSERT INTO `sys_user_role` VALUES ('7', '3');
INSERT INTO `sys_user_role` VALUES ('7', '4');
INSERT INTO `sys_user_role` VALUES ('8', '3');
INSERT INTO `sys_user_role` VALUES ('8', '4');
INSERT INTO `sys_user_role` VALUES ('9', '4');
INSERT INTO `sys_user_role` VALUES ('10', '4');
INSERT INTO `sys_user_role` VALUES ('11', '4');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '4');
INSERT INTO `sys_user_role` VALUES ('14', '4');
INSERT INTO `sys_user_role` VALUES ('15', '4');
INSERT INTO `sys_user_role` VALUES ('16', '4');
INSERT INTO `sys_user_role` VALUES ('17', '4');
INSERT INTO `sys_user_role` VALUES ('18', '4');
INSERT INTO `sys_user_role` VALUES ('19', '4');
INSERT INTO `sys_user_role` VALUES ('20', '4');
INSERT INTO `sys_user_role` VALUES ('21', '4');
INSERT INTO `sys_user_role` VALUES ('22', '4');
INSERT INTO `sys_user_role` VALUES ('23', '4');
INSERT INTO `sys_user_role` VALUES ('24', '4');
INSERT INTO `sys_user_role` VALUES ('25', '4');

-- ----------------------------
-- Table structure for upload_info
-- ----------------------------
DROP TABLE IF EXISTS `upload_info`;
CREATE TABLE `upload_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `local_window_url` varchar(255) DEFAULT NULL COMMENT '本地window系统上传路径,input,YES,false,true,false',
  `local_linux_url` varchar(255) DEFAULT NULL COMMENT '本地LINUX系统上传路径,input,YES,false,true,false',
  `qiniu_base_path` varchar(255) DEFAULT NULL COMMENT '七牛前缀路径,input,YES,false,true,false',
  `qiniu_bucket_name` varchar(255) DEFAULT NULL COMMENT '七牛bucket的目录名称,input,YES,false,true,false',
  `qiniu_dir` varchar(255) DEFAULT NULL COMMENT '七牛文件存储目录,input,YES,false,true,false',
  `qiniu_access_key` varchar(255) DEFAULT NULL COMMENT '七牛qiniuAccess值,input,YES,false,true,false',
  `qiniu_secret_key` varchar(255) DEFAULT NULL COMMENT '七牛qiniuKey的值,input,YES,false,true,false',
  `qiniu_test_access` bit(1) DEFAULT NULL COMMENT '七牛上传测试,switch,YES,true,true,false',
  `oss_base_path` varchar(255) DEFAULT NULL COMMENT '阿里云前缀路径,input,YES,false,true,false',
  `oss_bucket_name` varchar(255) DEFAULT NULL COMMENT '阿里云bucket的目录名称,input,YES,false,true,false',
  `oss_dir` varchar(255) DEFAULT NULL COMMENT '阿里云文件上传目录,input,YES,false,true,false',
  `oss_key_id` varchar(255) DEFAULT NULL COMMENT '阿里云ACCESS_KEY_ID值,input,YES,false,true,false',
  `oss_key_secret` varchar(255) DEFAULT NULL COMMENT '阿里云ACCESS_KEY_SECRET,input,YES,false,true,false',
  `oss_endpoint` varchar(255) DEFAULT NULL COMMENT '阿里云ENDPOINT值,input,YES,false,true,false',
  `oss_test_access` bit(1) DEFAULT NULL COMMENT '阿里云上传测试,switch,YES,true,true,false',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文件上传配置,1,switch-qiniuTestAccess-YES-true-qiniu_test_access,switch-ossTestAccess-YES-true-oss_test_access';

-- ----------------------------
-- Records of upload_info
-- ----------------------------
INSERT INTO `upload_info` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-07-12 18:48:23', '1', '2018-07-12 18:48:25', '1', null, '0');
