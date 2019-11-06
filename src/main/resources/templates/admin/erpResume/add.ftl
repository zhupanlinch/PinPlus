<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>简历表添加--${site.name}</title>
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
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="name"  placeholder="请输入姓名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">

            <@my type="erp_resume_sex">
                <#list result as r>
                <input type="radio" name="sex"  value="${r.value}" title="${r.label}">
                </#list>
            </@my>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">简历标签</label>
        <div class="layui-input-block role-box">
            <div class="jq-role-inline">
                <fieldset class="layui-elem-field">
                    <legend>选择标签</legend>
                    <div class="layui-field-box">
                    <#if tags??>
                        <#if (tags?size > 0)>
                            <#list tags as tag>
                                <input type="checkbox" name="resumeTag"  value="${tag.id}" title="${tag.name}" lay-filter="role" />
                            </#list>
                        </#if>
                    </#if>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">成交项目</label>
        <div class="layui-input-block role-box">
            <div class="jq-role-inline">
                <fieldset class="layui-elem-field">
                    <legend>选择成交项目</legend>
                    <div class="layui-field-box">
                    <#if projects??>
                        <#if (projects?size > 0)>
                            <#list projects as r>
                                <input type="radio" name="projectId"  value="${r.id}" title="${r.name}">
                            </#list>
                        </#if>
                    </#if>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">人才状态</label>
        <div class="layui-input-block">
        <@my type="erp_resume_job_status">
            <#list result as r>
                <input type="radio" name="jobStatus" value="${r.value}" title="${r.label}" >
            </#list>
        </@my>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="age"  placeholder="请输入年龄">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="phone"  placeholder="请输入电话">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="address"  placeholder="请输入地址">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学历</label>
        <div class="layui-input-block">

            <select name="education" >
                <option value="" selected="">请选择学历</option>
                <@my type="erp_resume_education">
                <#list result as r>
                <option value="${r.value}" >${r.label}</option>
                </#list>
                </@my>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">期望薪资</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="salary"  placeholder="请输入工资">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">应聘职位</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="job"  placeholder="请输入期望职位">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">求职状态</label>
        <div class="layui-input-block">

            <@my type="erp_resume_status">
                <#list result as r>
                <input type="radio" name="status"  value="${r.value}" title="${r.label}">
                </#list>
            </@my>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">期望地址</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="addr"  placeholder="请输入期望地址">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">工作经验</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="year"  placeholder="请输入工作经验">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">

            <@my type="erp_resume_type">
                <#list result as r>
                <input type="radio" name="type"  value="${r.value}" title="${r.label}">
                </#list>
            </@my>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">现职位</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="currJob"  placeholder="请输入现职位">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电子邮件</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="mail"  placeholder="请输入电子邮件">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">现单位</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="unit"  placeholder="请输入现单位">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学校</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="school"  placeholder="请输入学校">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="major"  placeholder="请输入专业">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">下载日期</label>
        <div class="layui-input-block">

            <input type="text" name="downDate" id="downDate"   lay-verify="date" placeholder="请选择下载日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">

            <textarea name="remarks"  placeholder="请输入备注" class="layui-textarea">${erpResume.remarks}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addErpResume">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer','laydate'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                laydate = layui.laydate,
                layer = layui.layer;

                          //初始赋值
                          laydate.render({
                            elem: '#downDate'
                          });

        form.on("submit(addErpResume)",function(data){
                       if(null === data.field.downDate || "" ===data.field.downDate){
                        delete data.field["downDate"];
                    }else{
                        data.field.downDate = new Date(data.field.downDate);
                    }

            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            //给标签赋值
            delete data.field["resumeTag"];
            var selectResumeTag = [];
            $('input[name="resumeTag"]:checked').each(function(){
                selectResumeTag.push({"id":$(this).val()});
            });
            data.field.resumeTag = selectResumeTag;
            $.ajax({
                type:"POST",
                url:"${base}/admin/erpResume/add",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(data.field),
                success:function(res){
                    layer.close(loadIndex);
                    if(res.success){
                        parent.layer.msg("简历保存成功！",{time:1500},function(){
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