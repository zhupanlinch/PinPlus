<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>项目表添加--${site.name}</title>
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
    <style type="text/css">
        .layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
        @media(max-width:1240px){
            .layui-form-item .layui-inline{ width:100%; float:none; }
        }
        .layui-form-item .role-box {
            position: relative;
        }
        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }

    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="name"  placeholder="请输入名称">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">

            <@my type="erp_project_status">
                <#list result as r>
                    <input type="radio" name="status"  value="${r.value}" title="${r.label}">
                </#list>
            </@my>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">组长</label>
        <div class="layui-input-block">
            <#--<input  type="text"  class="layui-input" name="leaderId"  placeholder="请输入组长ID">-->
            <select name="leaderId">
                <option value="">请选择组长</option>
                <#list leaderList as leader>
                    <option value="${leader.id}" >${leader.nickName}</option>
                </#list>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘专员</label>
        <div class="layui-input-block role-box">
            <div class="jq-role-inline">
                <fieldset class="layui-elem-field">
                    <legend>选择专员</legend>
                    <div class="layui-field-box">
                        <#if userList??>
                            <#if (userList?size > 0)>
                                <#list userList as user>
                                    <input type="checkbox" name="projectUser"  value="${user.id}" title="${user.nickName}" lay-filter="role" />
                                </#list>
                            </#if>
                        </#if>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">项目标签</label>
        <div class="layui-input-block role-box">
            <div class="jq-role-inline">
                <fieldset class="layui-elem-field">
                    <legend>选择标签</legend>
                    <div class="layui-field-box">
                        <#if tags??>
                            <#if (tags?size > 0)>
                                <#list tags as tag>
                                    <input type="checkbox" name="projectTag"  value="${tag.id}" title="${tag.name}" lay-filter="role" />
                                </#list>
                            </#if>
                        </#if>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘简章</label>
        <div class="layui-input-block">

            <textarea name="content"  placeholder="请输入招聘简章" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">注意事项</label>
        <div class="layui-input-block">

            <textarea name="careful"  placeholder="请输入注意事项" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">面试流程</label>
        <div class="layui-input-block">

            <textarea name="review"  placeholder="请输入面试流程" class="layui-textarea"></textarea>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addErpProject">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                layer = layui.layer;


        form.on("submit(addErpProject)",function(data){

            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            //给招聘专员赋值
            delete data.field["projectUser"];
            var selectProjectUser = [];
            $('input[name="projectUser"]:checked').each(function(){
                selectProjectUser.push({"id":$(this).val()});
            });
            data.field.projectUser = selectProjectUser;
            //给标签赋值
            delete data.field["projectTag"];
            var selectProjectTag = [];
            $('input[name="projectTag"]:checked').each(function(){
                selectProjectTag.push({"id":$(this).val()});
            });
            data.field.projectTag = selectProjectTag;
            $.ajax({
                type:"POST",
                url:"${base}/admin/erpProject/add",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(data.field),
                success:function(res){
                    layer.close(loadIndex);
                    if(res.success){
                        parent.layer.msg("项目增加成功！",{time:1500},function(){
                            parent.location.reload();
                        });
                    }else{
                        layer.msg(res.message);
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>