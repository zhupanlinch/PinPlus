对本系统感兴趣欢迎联络购买，最新完整版上门搭建。 联络邮箱：`jupanshuai@qq.com` btw:`求一Java团队收留 `

# 聘++一站式人力资源管理系统
《聘++一站式人力资源管理系统》是一款专为人力资源外包企业打造的行业智能解决方案，本系统致力于解决简历利用率低，维护困难等行业痛点。我们的目标就是让简历得到充分利用，重复利用。核心功能包括角色（招聘专员，招聘组长，管理员）管理，企业员工管理，简历管理，项目管理，标签管理，成交管理，以及系统自动对简历进行重新分配，智能推荐等功能。

招聘专员：我的项目，我的简历，系统分配简历，我的成交简历

招聘组长：小组成交简历，员工管理

管理员：项目管理，标签管理，简历管理，成交简历管理


## 主要功能
* 系统用户,角色,权限增删改查,权限分配，权限配色<br/>
* 文件上传可自由选择本地存储,七牛云存储,阿里云存储
* 系统字典<br/>
* 配置网站基本信息，包括博客数据限制<br/>
* 查看系统关键操作的日志(可在系统后台自动定制需要监控的模板)<br/>
* 在线新增数据库并直接生成 前，后台基本源码，放到源码相应目录中重启tomcat可直接使用，预览<br/>
* 系统定时任务的新增改查 立即启动 暂停 恢复<br/>
* 标签管理,用于对项目和简历进行标记
* 项目管理
* 简历管理，支持批量导入导出
* 智能分配简历，根据项目和简历的标签，将系统中的未成交简历重新智能分配到每个招聘专员

## 技术框架
* 核心框架：`SpringBoot`
* 安全框架：`Apache Shiro 1.3.2`
* 缓存框架：`Redis 4.0`
* 搜索框架：`Lucene 7.1`
* 任务调度：`quartz 2.3`
* 持久层框架：`MyBatis 3` <a href="http://baomidou.oschina.io/mybatis-plus-doc/#/" target="_blank">mybatisplus</a> 2.1.4
* 数据库连接池：`Alibaba Druid 1.0.2`
* 日志管理：`SLF4J 1.7`、`Log4j`
* 前端框架：`layui`
* 后台模板：<a href="http://layuicms.gitee.io/layuicms2.0/index.html" target="_blank">layuicms 2.0。</a>
* 富文本：<a href="http://www.wangeditor.com/" target="_blank">wangEditor</a>

### 系统登录
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E7%99%BB%E5%BD%95%E9%A1%B5.png)
### 角色管理
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%86.png)
### 企业员工管理
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E4%BC%81%E4%B8%9A%E5%91%98%E5%B7%A5%E7%AE%A1%E7%90%86.png)
### 标签管理
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E6%A0%87%E7%AD%BE%E7%AE%A1%E7%90%86.png)
### 项目管理
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86.png)
### 简历管理
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E7%AE%80%E5%8E%86%E7%AE%A1%E7%90%86.png)
### 招聘专员
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E6%8B%9B%E8%81%98%E4%B8%93%E5%91%98.png)
### 招聘组长
![](https://github.com/zhupanlinch/PinPlus/blob/master/src/main/resources/static/images/%E6%8B%9B%E8%81%98%E7%BB%84%E9%95%BF.png)

### 开发环境
建议开发者使用以下环境，这样避免版本带来的问题
* IDE:`idea`
* DB:`Mysql5.7`  `Redis`(<a href="https://github.com/MicrosoftArchive/redis/releases" target="_blank">Window版本</a>,<a href="https://redis.io/download" target="_blank">Linux版本</a>)
* JDK:`JAVA 8`
* WEB:<del>Tomcat8</del> （采用springboot框架开发时,并没有用到额外的tomcat 用的框架自带的）

# 运行环境
* WEB服务器：`Weblogic`、`Tomcat`、`WebSphere`、`JBoss`、`Jetty` 等
* 数据库服务器：`Mysql5.5+`
* 操作系统：`Windows`、`Linux` (Linux 大小写特别敏感 特别要注意,还有Linux上没有微软雅黑字体,需要安装这个字体,用于生成验证码)

# 快速体验
* 将源码导入IDE 
* 将源码路径下的src/main/resources/sql 中的PinPlus.sql导入到数据库中(qrtz.sql为定时任务的几张基本表 PinPlus.sql已经包含)
* 将src\main\resources目录下的application.yml配置文件里的mysql用户名密码改成你本地的
* 安装redis数据库 默认数据库密码为空(注*** 必须安装redis 否则本系统会报错)
* redis的window版本有些地方下载可以下不下来,可以到这里下载`https://pan.baidu.com/s/1dG22JQT`  
* 注册redis系统服务 打开cmd--->切换到安装redis的目录--->`redis-server.exe --service-install redis.windows-service.conf`
* 启动系统 预览地址为:`http://localhost:8080`  
* 系统管理员用户名：`admin` 密码：`123456`
* 管理员用户名：`liubei` 密码：`123456`
* 招聘组长用户名：`xuxianliang` 密码：`123456`
* 招聘专员用户名：`caiyuqing` 密码：`123456`

### 欢迎赞赏
![赞赏](https://github.com/zhupanlinch/pay/blob/master/src/main/resources/static/common/%E8%B5%9E%E8%B5%8F%E7%A0%81.png)

