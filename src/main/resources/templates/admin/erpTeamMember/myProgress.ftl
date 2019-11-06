<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>管理小组--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="${site.description}"/>
    <meta name="keywords" content="${site.keywords}"/>
    <meta name="author" content="${site.author}"/>
    <link rel="icon" href="${site.logo}">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all" />

    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="childrenBody">
<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>我的进度(数量)</legend>
    </fieldset>

    <div class="layui-progress layui-progress-big" lay-showpercent="true">
        <div class="layui-progress-bar" lay-percent="${data.progress}"></div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>我的进度(百分比)</legend>
    </fieldset>

    <div class="layui-progress layui-progress-big" lay-showpercent="true">
        <div class="layui-progress-bar" lay-percent="${data.finish}/${data.target}"></div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>时间进度</legend>
    </fieldset>

    <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="dateProgress">
        <div id="dateProgress" class="layui-progress-bar layui-bg-red" lay-percent="${day}/${days}"></div>
    </div>



</div>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['element'], function(){
        var $ = layui.jquery,
                element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        // 初始化时间进度条
        /*var date = new Date();
        var day = date.getDate();
        date.setMonth(date.getMonth() + 1);
        date.setDate(0);
        var days = date.getDate();
        //设置时间进度
        element.progress('dateProgress', (day/days * 100).toFixed(2) + '%');*/
    });
</script>
</body>
</html>