package com.mysiteforme.admin.controller;

import com.google.common.collect.Lists;
import com.mysiteforme.admin.base.BaseController;
import com.mysiteforme.admin.entity.*;
import com.mysiteforme.admin.service.ErpProjectService;
import com.mysiteforme.admin.service.ErpTagService;
import com.mysiteforme.admin.service.ErpTeamMemberService;
import com.mysiteforme.admin.util.excel.ExportExcel;
import com.mysiteforme.admin.util.excel.ImportExcel;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.http.impl.cookie.DateUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.service.ErpResumeService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * 简历表  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Controller
@RequestMapping("/admin/erpResume")
public class ErpResumeController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ErpResumeController.class);

    @Autowired
    private ErpResumeService erpResumeService;

    @Autowired
    private ErpTagService erpTagService;

    @Autowired
    private ErpProjectService erpProjectService;

    @Autowired
    private ErpTeamMemberService erpTeamMemberService;

    @GetMapping({"list", "my", "mydo", "teamdo", "alldo", "managedo"})
    @SysLog("跳转简历表列表")
    public String list(HttpServletRequest request){
        String uri = request.getRequestURI();
        if(uri.contains("mydo")){
            return "/admin/erpResume/mydolist";  //我的成交简历
        }
        if(uri.contains("my")){
            return "/admin/erpResume/mylist";  //我的简历
        }
        if(uri.contains("teamdo")){
            return "/admin/erpResume/teamdolist";  //小组成交简历
        }
        if(uri.contains("managedo")){
            return "/admin/erpResume/managedolist";  //小组成交简历
        }
        if(uri.contains("alldo")){
            return "/admin/erpResume/alldolist";  //所有成交简历
        }
        return "/admin/erpResume/list";
    }

    @PostMapping({"list", "my"})
    @ResponseBody
    @SysLog("请求简历表列表数据")
    public LayerData<ErpResume> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                     HttpServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResume> layerData = new LayerData<>();
        EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.lt("job_status", 2);  // 未成交的简历
        String uri = request.getRequestURI();
        if(uri.contains("my")){
            wrapper.eq("create_by", getCurrentUser().getId());  //我的简历
        }
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

            String sex = (String) map.get("sex");
            if(StringUtils.isNotBlank(sex)) {
                wrapper.eq("sex",sex);
            }else{
                map.remove("sex");
            }

            String address = (String) map.get("address");
            if(StringUtils.isNotBlank(address)) {
                wrapper.like("address",address);
            }else{
                map.remove("address");
            }

            String education = (String) map.get("education");
            if(StringUtils.isNotBlank(education)) {
                wrapper.eq("education",education);
            }else{
                map.remove("education");
            }

            String job = (String) map.get("job");
            if(StringUtils.isNotBlank(job)) {
                wrapper.like("job",job);
            }else{
                map.remove("job");
            }

            String status = (String) map.get("status");
            if(StringUtils.isNotBlank(status)) {
                wrapper.eq("status",status);
            }else{
                map.remove("status");
            }

            String addr = (String) map.get("addr");
            if(StringUtils.isNotBlank(addr)) {
                wrapper.like("addr",addr);
            }else{
                map.remove("addr");
            }

            String year = (String) map.get("year");
            if(StringUtils.isNotBlank(year)) {
                wrapper.like("year",year);
            }else{
                map.remove("year");
            }

            String jobStatus = (String) map.get("jobStatus");
            if(StringUtils.isNotBlank(jobStatus)) {
                wrapper.eq("job_status",jobStatus);
            }else{
                map.remove("jobStatus");
            }

        }
        Page<ErpResume> pageData = erpResumeService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @PostMapping({"mydo"})
    @ResponseBody
    @SysLog("我的成交列表数据")
    public LayerData<ErpResume> mydo(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                     @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                     HttpServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResume> layerData = new LayerData<>();
        EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.gt("job_status", 1);  // 成交的简历
        String uri = request.getRequestURI();
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

        }
        wrapper.eq("update_by", getCurrentUser().getId());
        Page<ErpResume> pageData = erpResumeService.selectPage(new Page<>(page,limit),wrapper);
        for(ErpResume r: pageData.getRecords()){
            if(r.getProjectId()!=null && r.getProjectId()!=0){
                ErpProject p = erpProjectService.selectById(r.getProjectId());
                r.setRemarks(p.getName());
            }
        }
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @PostMapping({"teamdo"})
    @ResponseBody
    @SysLog("项目小组的成交列表数据")
    public LayerData<ErpResume> teamdo(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                     @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                     HttpServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResume> layerData = new LayerData<>();
        EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.gt("job_status", 1);  // 成交的简历
        String uri = request.getRequestURI();
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

        }
        EntityWrapper<ErpProject> projectWrapper = new EntityWrapper<ErpProject>();
        projectWrapper.eq("del_flag",false);
        projectWrapper.eq("leader_id", getCurrentUser().getId());
        List<ErpProject> projects = erpProjectService.selectList(projectWrapper); // 我的项目
        String [] projecctIds = new String[projects.size()];
        int i = 0;
        for(ErpProject uProject: projects) {
            projecctIds[i++] = uProject.getId().toString();
        }

        String uProjecctIdsStr = StringUtils.join(projecctIds, ",");
        if(projects.size()==0){
            uProjecctIdsStr = "";
        }
        wrapper.in("project_id", uProjecctIdsStr);

        Page<ErpResume> pageData = erpResumeService.selectPage(new Page<>(page,limit),wrapper);
        for(ErpResume r: pageData.getRecords()){
            if(r.getProjectId()!=null && r.getProjectId()!=0){
                ErpProject p = erpProjectService.selectById(r.getProjectId());
                r.setRemarks(p.getName());

            }
            User u = userService.selectById(r.getUpdateId());
            r.setUpdateUser(u);
        }
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @PostMapping({"managedo"})
    @ResponseBody
    @SysLog("管理小组的成交列表数据")
    public LayerData<ErpResume> managedo(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                       @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                       HttpServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResume> layerData = new LayerData<>();
        EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.gt("job_status", 1);  // 成交的简历
        String uri = request.getRequestURI();
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

        }
        EntityWrapper<ErpTeamMember> tmWrapper = new EntityWrapper<ErpTeamMember>();
        tmWrapper.eq("del_flag",false);
        tmWrapper.eq("create_by", getCurrentUser().getId());
        List<ErpTeamMember> tms = erpTeamMemberService.selectList(tmWrapper); // 我的管理小组的组员IDS集合
        String [] updateByIds = new String[tms.size()];
        int i = 0;
        for(ErpTeamMember tm: tms) {
            updateByIds[i++] = tm.getUserId().toString();
        }

        String updateByIdsStr = StringUtils.join(updateByIds, ",");
        if(tms.size()==0){
            updateByIdsStr = "";
        }
        wrapper.in("update_by", updateByIdsStr);

        Page<ErpResume> pageData = erpResumeService.selectPage(new Page<>(page,limit),wrapper);
        for(ErpResume r: pageData.getRecords()){
            if(r.getProjectId()!=null && r.getProjectId()!=0){
                ErpProject p = erpProjectService.selectById(r.getProjectId());
                r.setRemarks(p.getName());

            }
            User u = userService.selectById(r.getUpdateId());
            r.setUpdateUser(u);
        }
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @PostMapping({"alldo"})
    @ResponseBody
    @SysLog("所有成交列表数据")
    public LayerData<ErpResume> alldo(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                     @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                     HttpServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResume> layerData = new LayerData<>();
        EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.gt("job_status", 1);  // 成交的简历
        String uri = request.getRequestURI();
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

        }
        Page<ErpResume> pageData = erpResumeService.selectPage(new Page<>(page,limit),wrapper);
        for(ErpResume r: pageData.getRecords()){
            if(r.getProjectId()!=null && r.getProjectId()!=0){
                ErpProject p = erpProjectService.selectById(r.getProjectId());
                r.setRemarks(p.getName());
            }
            User u = userService.selectById(r.getUpdateId());
            r.setUpdateUser(u);
        }
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增简历表页面")
    public String add(Model model){
        // 所有标签
        List<ErpTag> tags = erpTagService.listAll();
        model.addAttribute("tags", tags);
        // 查询自己的项目，将自己的项目设置到简历的招聘项目中
        EntityWrapper<ErpProject> wrapper = new EntityWrapper<ErpProject>();
        wrapper.eq("del_flag",false);
        wrapper.exists("select 1 from erp_project_user where project_id = erp_project.id and user_id= "+getCurrentUser().getId()+" ");
        List<ErpProject> projects = erpProjectService.selectList(wrapper);
        model.addAttribute("projects", projects);
        return "/admin/erpResume/add";
    }

    @PostMapping("add")
    @SysLog("保存新增简历表数据")
    @ResponseBody
    public RestResponse add(@RequestBody ErpResume erpResume){
        if(erpResume.getJobStatus()==null){
            erpResume.setJobStatus(1);
        }
        // 查询自己的项目，将自己的项目设置到简历的招聘项目中
        EntityWrapper<ErpProject> wrapper = new EntityWrapper<ErpProject>();
        wrapper.eq("del_flag",false);
        wrapper.exists("select 1 from erp_project_user where project_id = erp_project.id and user_id= "+getCurrentUser().getId()+" ");
        List<ErpProject> projects = erpProjectService.selectList(wrapper);
        erpResume.setResumeProject(new HashSet<>(projects));
        erpResumeService.saveErpResume(erpResume);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑简历表页面")
    public String edit(Long id,Model model){
        ErpResume erpResume = erpResumeService.selectById(id);
        model.addAttribute("erpResume",erpResume);
        // 所有标签
        List<ErpTag> tags = erpTagService.listAll();
        model.addAttribute("tags", tags);
        List<Long> tagIds = Lists.newArrayList();
        tagIds = erpResumeService.selectResumeTagIds(id);
        model.addAttribute("tagIds",tagIds);
        // 查询自己的项目，将自己的项目设置到简历的招聘项目中
        EntityWrapper<ErpProject> wrapper = new EntityWrapper<ErpProject>();
        wrapper.eq("del_flag",false);
        wrapper.exists("select 1 from erp_project_user where project_id = erp_project.id and user_id= "+getCurrentUser().getId()+" ");
        List<ErpProject> projects = erpProjectService.selectList(wrapper);
        model.addAttribute("projects", projects);
        return "/admin/erpResume/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑简历表数据")
    public RestResponse edit(@RequestBody ErpResume erpResume){
        if(null == erpResume.getId() || 0 == erpResume.getId()){
            return RestResponse.failure("ID不能为空");
        }
        if(erpResume.getJobStatus()==null){
            erpResume.setJobStatus(1);
        }
        erpResumeService.updateErpResume(erpResume);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除简历表数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        ErpResume erpResume = erpResumeService.selectById(id);
        erpResume.setDelFlag(true);
        erpResumeService.updateById(erpResume);
        return RestResponse.success();
    }

    /**
     * 导出数据
     * @param erpResume
     * @param response
     * @return
     */
    @RequestMapping(value = "export")
    @SysLog("请求导出简历数据")
    public void exportFile(@RequestBody ErpResume erpResume, HttpServletResponse response) {
        try {
            String fileName = "简历数据"+ DateUtils.formatDate(new Date(), "yyyyMMddHHmmss")+".xlsx";
            EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
            wrapper.eq("del_flag",false);
            List<ErpResume> list = erpResumeService.selectList(wrapper);
            new ExportExcel("简历数据", ErpResume.class).setDataList(list).write(response, fileName).dispose();
        } catch (Exception e) {
            //return RestResponse.failure("导出数据失败");
        }
    }

    /**
     * 下载导入数据模板
     * @param response
     * @return
     */
    @RequestMapping(value = "import/template")
    @SysLog("请求下载导入数据模板")
    public void importFileTemplate(HttpServletResponse response) {
        try {
            String fileName = "简历数据"+ DateUtils.formatDate(new Date(), "yyyyMMddHHmmss")+".xlsx";
            EntityWrapper<ErpResume> wrapper = new EntityWrapper<>();
            wrapper.eq("del_flag",false);
            List<ErpResume> list = erpResumeService.selectPage(new Page<>(1, 1), wrapper).getRecords();
            new ExportExcel("简历数据", ErpResume.class).setDataList(list).write(response, fileName).dispose();
        } catch (Exception e) {
            //return RestResponse.failure("导出数据失败");
        }
    }

    /**
     * 导入数据
     * @param file
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "import", method=RequestMethod.POST)
    @SysLog("请求导入数据")
    public RestResponse importFile(MultipartFile file) {
        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            ImportExcel ei = new ImportExcel(file, 1, 0);
            List<ErpResume> list = ei.getDataList(ErpResume.class);
            for (ErpResume erpResume : list){
                try{
                    erpResume.setJobStatus(1);
                    erpResumeService.insert(erpResume);
                    successNum ++;
                }catch(Exception ex){
                    failureNum++;
                    failureMsg.append("<br/>"+erpResume.getName()+erpResume.getPhone()+" 导入失败");
                }
            }
            if (failureNum>0){
                failureMsg.insert(0, "，失败 "+failureNum+" 条数据，导入信息如下：");
            }
            return RestResponse.success("已成功导入 "+successNum+" 条用户"+failureMsg);
        } catch (Exception e) {
            return RestResponse.failure("导入数据失败");
        }

    }
}