<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>系统分配给用户的简历--${site.name}</title>
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
  <legend>系统分配给用户的简历检索</legend>
  <div class="layui-field-box">
    <form class="layui-form" id="searchForm">
        <div class="layui-inline" style="margin-left: 15px">
            <label>推荐时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="s_beginCreateTime" id="beginCreateTime" lay-verify="date"  autocomplete="off" class="layui-input">
            </div>
            <span>-</span>
            <div class="layui-input-inline">
                <input type="text" name="s_endCreateTime" id="endCreateTime" lay-verify="date"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <a class="layui-btn" lay-submit="" lay-filter="searchForm">查询</a>
        </div>
        <div class="layui-inline" >
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
        <#--<div class="layui-inline">
            <a class="layui-btn layui-btn-normal" data-type="addErpUserResume">添加系统分配给用户的简历</a>
        </div>-->
    </form>
  </div>
</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="test" lay-filter="demo"></table>
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
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">不合适</a>
    </script>
</div>
<div id="page"></div>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer','form','table','laydate'], function() {
        var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form,
                laydate = layui.laydate,
                table = layui.table;


        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
                var editIndex = layer.open({
                    title : "编辑系统分配给用户的简历",
                    type : 2,
                    content : "${base}/admin/erpResume/edit?id="+data.id,
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回系统分配给用户的简历列表', '.layui-layer-setwin .layui-layer-close', {
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
                layer.confirm("不合适的简历将会从推荐列表中消失，确定不合适吗？",{btn:['是的,我确定','我再想想']},
                        function(){
                            $.post("${base}/admin/erpUserResume/overdue",{"id":data.id},function (res){
                                if(res.success){
                                    layer.msg("设置成功",{time: 1000},function(){
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
            elem: '#test',
            url:'${base}/admin/erpUserResume/list',
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
                {field:'education', title: '学历',templet:'#education'},
                {field:'salary', title: '期望薪资'},
                {field:'job', title: '应聘职位'},
                {field:'status', title: '求职状态',templet:'#status'},
                {field:'year', title: '工作经验'},
                {field:'jobStatus', title: '人才状态',templet:'#jobStatus'},
                {field:'downDate',  title: '下载日期',templet:'<div>{{ layui.laytpl.toDateString(d.downDate,"yyyy-MM-dd") }}</div>',unresize: true},
                {fixed: 'right', title:'操作',  width: '15%', align: 'center',toolbar: '#barDemo'}
            ]]
        };
        table.render(t);

        var active={
            addErpUserResume : function(){
                var addIndex = layer.open({
                    title : "添加系统分配给用户的简历",
                    type : 2,
                    content : "${base}/admin/erpUserResume/add",
                    success : function(layero, addIndex){
                        setTimeout(function(){
                            layer.tips('点击此处返回系统分配给用户的简历列表', '.layui-layer-setwin .layui-layer-close', {
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
            }
        };

        $('.layui-inline .layui-btn-normal').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        form.on("submit(searchForm)",function(data){
            t.where = data.field;
            table.reload('test', t);
            return false;
        });

        var beginCreateTime= laydate.render({//渲染开始时间选择
            elem: '#beginCreateTime', //通过id绑定html中插入的start
            type: 'date',
            max:"2099-12-31",//设置一个默认最大值
            done: function (value, dates) {
                beginCreateTime.config.min ={
                    year:dates.year,
                    month:dates.month-1, //关键
                    date: dates.date,
                    hours: 0,
                    minutes: 0,
                    seconds : 0
                };
            }
        });

        var endCreateTime= laydate.render({//渲染结束时间选择
            elem: '#endCreateTime',//通过id绑定html中插入的end
            type: 'date',
            min:"1970-1-1",//设置min默认最小值
            done: function (value, dates) {
                endCreateTime.config.max={
                    year:dates.year,
                    month:dates.month-1,//关键
                    date: dates.date,
                    hours: 0,
                    minutes: 0,
                    seconds : 0
                }
            }
        });

    });
</script>
</body>
</html>