<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>简历表--${site.name}</title>
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
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field">
  <legend>简历表检索</legend>
  <div class="layui-field-box">
    <form class="layui-form" id="searchForm">
    <div class="layui-inline" style="margin-left: 15px">
            <label>姓名:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_name" placeholder="请输入姓名" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>性别:</label>
                <div class="layui-input-inline">
                <select name="s_sex">
                    <option value="" selected="">请选择性别</option>
                    <@my type="erp_resume_sex">
                    <#list result as r>
                    <option value="${r.value}" >${r.label}</option>
                    </#list>
                    </@my>
                </select>
                </div>
    </div>
    <#--<div class="layui-inline" style="margin-left: 15px">
            <label>地址:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_address" placeholder="请输入地址" class="layui-input search_input">
                </div>
    </div>-->
    <div class="layui-inline" style="margin-left: 15px">
            <label>学历:</label>
                <div class="layui-input-inline">
                <select name="s_education">
                    <option value="" selected="">请选择学历</option>
                    <@my type="erp_resume_education">
                    <#list result as r>
                    <option value="${r.value}" >${r.label}</option>
                    </#list>
                    </@my>
                </select>
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>期望职位:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_job" placeholder="请输入期望职位" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>求职状态:</label>
                <div class="layui-input-inline">
                <select name="s_status">
                    <option value="" selected="">请选择求职状态</option>
                    <@my type="erp_resume_status">
                    <#list result as r>
                    <option value="${r.value}" >${r.label}</option>
                    </#list>
                    </@my>
                </select>
                </div>
    </div>
    <#--<div class="layui-inline" style="margin-left: 15px">
            <label>期望地址:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_addr" placeholder="请输入期望地址" class="layui-input search_input">
                </div>
    </div>-->
    <div class="layui-inline" style="margin-left: 15px">
            <label>工作经验:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_year" placeholder="请输入工作经验" class="layui-input search_input">
                </div>
    </div>
        <div class="layui-inline">
            <a class="layui-btn" lay-submit="" lay-filter="searchForm">查询</a>
        </div>
        <div class="layui-inline" >
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-normal" data-type="addErpResume">添加简历</a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-primary" data-type="exportTemplate">下载模板</a>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn" id="importErpResume"><i class="layui-icon"></i>导入</button>
        </div><#--
        <div class="layui-inline">
            <a class="layui-btn layui-btn-warm" data-type="exportErpResume">导出</a>
        </div>-->
    </form>
  </div>
</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="myErpResumeList" lay-filter="demo"></table>
    <script type="text/html" id="sex">
        <@my type="erp_resume_sex">
        <#list result as r>
        {{#  if(d.sex == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="education">
        <@my type="erp_resume_education">
        <#list result as r>
        {{#  if(d.education == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="status">
        <@my type="erp_resume_status">
        <#list result as r>
        {{#  if(d.status == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="jobStatus">
        <@my type="erp_resume_job_status">
        <#list result as r>
        {{#  if(d.jobStatus == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="type">
        <@my type="erp_resume_type">
        <#list result as r>
        {{#  if(d.type == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="userStatus">
        <!-- 这里的 checked 的状态只是演示 -->
        {{#  if(d.delFlag == false){ }}
        <span class="layui-badge layui-bg-green">正常</span>
        {{#  } else { }}
        <span class="layui-badge layui-bg-gray">停用</span>
        {{#  } }}
    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>
<div id="page"></div>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer','form','table','laydate','upload'], function() {
        var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form,
                laydate = layui.laydate,
                table = layui.table,
                upload = layui.upload;


        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                var editIndex = layer.open({
                    title : "编辑简历表",
                    type : 2,
                    content : "${base}/admin/erpResume/edit?id="+data.id,
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回简历表列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(editIndex);
                });
                layer.full(editIndex);
            }
            if(obj.event === "del"){
                layer.confirm("你确定要删除该简历表么？",{btn:['是的,我确定','我再想想']},
                        function(){
                            $.post("${base}/admin/erpResume/delete",{"id":data.id},function (res){
                                if(res.success){
                                    layer.msg("删除成功",{time: 1000},function(){
                                        location.reload();
                                    });
                                }else{
                                    layer.msg(res.message);
                                }

                            });
                        }
                )
            }
        });

        var t = {
            elem: '#myErpResumeList',
            url:'${base}/admin/erpResume/my',
            method:'post',
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                groups: 2, //只显示 1 个连续页码
                first: "首页", //显示首页
                last: "尾页", //显示尾页
                limits:[3,10, 20, 30]
            },
            cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            cols: [[
                {type:'checkbox'},
                {field:'name', title: '姓名'},
                {field:'sex', title: '性别',templet:'#sex'},
                {field:'age', title: '年龄'},
                {field:'phone', title: '电话'},
                // {field:'address', title: '地址'},
                {field:'education', title: '学历',templet:'#education'},
                {field:'salary', title: '期望薪资'},
                {field:'job', title: '应聘职位'},
                {field:'status', title: '求职状态',templet:'#status'},
                // {field:'addr', title: '期望地址'},
                {field:'year', title: '工作经验'},
                {field:'jobStatus', title: '人才状态<i class="layui-icon" onmouseover="javascript:layer.tips(\'注意：未入职状态的简历第二天将会自动推荐给其他同事！\', this, {tips: 1});">&#xe60b;</i>',templet:'#jobStatus'},
                // {field:'type', title: '类型',templet:'#type'},
                // {field:'currJob', title: '现职位'},
                // {field:'mail', title: '电子邮件'},
                // {field:'unit', title: '现单位'},
                // {field:'school', title: '学校'},
                // {field:'major', title: '专业'},
                {field:'downDate',  title: '下载日期',templet:'<div>{{ layui.laytpl.toDateString(d.downDate,"yyyy-MM-dd") }}</div>',unresize: true},
                {field:'updateDate',  title: '更新时间',templet:'<div>{{ layui.laytpl.toDateString(d.updateDate,"yyyy-MM-dd") }}</div>',unresize: true},
                // {field:'delFlag',    title: '简历表状态',width:'12%',templet:'#userStatus'},
                // {field:'createDate',  title: '创建时间',width:'15%',templet:'<div>{{ layui.laytpl.toDateString(d.createDate) }}</div>',unresize: true}, //单元格内容水平居中
                {fixed: 'right', title:'操作',  width: '15%', align: 'center',toolbar: '#barDemo'}
            ]]
        };
        table.render(t);

        var active={
            addErpResume : function(){
                var addIndex = layer.open({
                    title : "添加简历表",
                    type : 2,
                    content : "${base}/admin/erpResume/add",
                    success : function(layero, addIndex){
                        setTimeout(function(){
                            layer.tips('点击此处返回简历表列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(addIndex);
                });
                layer.full(addIndex);
            },
            exportErpResume : function () {
                window.location = '${base}/admin/erpResume/export';
            },
            exportTemplate : function () {
                window.location = '${base}/admin/erpResume/import/template';
            }
        };

        $('.layui-inline .layui-btn-normal, .layui-btn-warm, .layui-btn-primary').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        form.on("submit(searchForm)",function(data){
            t.where = data.field;
            table.reload('myErpResumeList', t);
            return false;
        });

        upload.render({ //允许上传的文件后缀
            elem: '#importErpResume',
            url: '${base}/admin/erpResume/import',
            accept: 'file', //普通文件
            exts: 'xls|xlsx', //只允许上传压缩文件
            done: function(res){
                layer.msg(res.message);
                location.reload();
            }
        });

    });
</script>
</body>
</html>