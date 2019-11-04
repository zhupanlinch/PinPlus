package com.mysiteforme.admin.controller;

import com.google.common.collect.Lists;
import com.mysiteforme.admin.base.BaseController;
import com.mysiteforme.admin.entity.ErpTag;
import com.mysiteforme.admin.entity.User;
import com.mysiteforme.admin.service.ErpTagService;
import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.ErpProject;
import com.mysiteforme.admin.service.ErpProjectService;
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
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 项目表  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Controller
@RequestMapping("/admin/erpProject")
public class ErpProjectController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ErpProjectController.class);

    @Autowired
    private ErpProjectService erpProjectService;

    @Autowired
    private ErpTagService erpTagService;

    @GetMapping({"list", "my"})
    @SysLog("跳转项目表列表")
    public String list(HttpServletRequest request){
        String uri = request.getRequestURI();
        if(uri.contains("my")){
            return "/admin/erpProject/mylist";  //我的项目
        }
        return "/admin/erpProject/list";
    }

    @PostMapping({"list", "my"})
    @ResponseBody
    @SysLog("请求项目表列表数据")
    public LayerData<ErpProject> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "20")Integer limit,
                                      HttpServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpProject> layerData = new LayerData<>();
        EntityWrapper<ErpProject> wrapper = new EntityWrapper<ErpProject>();
        wrapper.eq("del_flag",false);
        String uri = request.getRequestURI();
        if(uri.contains("my")){
            wrapper.exists("select 1 from erp_project_user where project_id = erp_project.id and user_id= "+getCurrentUser().getId()+" ");  //我的项目
        }
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

        }
        Page<ErpProject> pageData = erpProjectService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增项目表页面")
    public String add(Model model){
        // 所有标签
        List<ErpTag> tags = erpTagService.listAll();
        model.addAttribute("tags", tags);
        // 所有招聘专员
        List<User> userList = userService.selectUserByRoleId(4L);  // 招聘专员ID为4
        model.addAttribute("userList", userList);
        // 所有组长
        List<User> leaderList = userService.selectUserByRoleId(3L);  // 组长ID为3
        model.addAttribute("leaderList", leaderList);
        return "/admin/erpProject/add";
    }

    @PostMapping("add")
    @SysLog("保存新增项目表数据")
    @ResponseBody
    public RestResponse add(@RequestBody ErpProject erpProject){
        erpProjectService.saveErpProject(erpProject);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑项目表页面")
    public String edit(Long id,Model model){
        ErpProject erpProject = erpProjectService.selectById(id);
        model.addAttribute("erpProject",erpProject);
        // 所有标签
        List<ErpTag> tags = erpTagService.listAll();
        model.addAttribute("tags", tags);
        // 所有招聘专员
        List<User> userList = userService.selectUserByRoleId(4L);  // 招聘专员ID为4
        model.addAttribute("userList", userList);
        // 所有组长
        List<User> leaderList = userService.selectUserByRoleId(3L);  // 组长ID为3
        model.addAttribute("leaderList", leaderList);
        // 项目的招聘专员ID集合和标签ID集合
        List<Long> userIds = Lists.newArrayList();
        List<Long> tagIds = Lists.newArrayList();
        userIds = erpProjectService.selectProjectUserIds(id);
        tagIds = erpProjectService.selectProjectTagIds(id);
        model.addAttribute("userIds",userIds);
        model.addAttribute("tagIds",tagIds);
        return "/admin/erpProject/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑项目表数据")
    public RestResponse edit(@RequestBody ErpProject erpProject){
        if(null == erpProject.getId() || 0 == erpProject.getId()){
            return RestResponse.failure("ID不能为空");
        }
        erpProjectService.updateErpProject(erpProject);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除项目表数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        ErpProject erpProject = erpProjectService.selectById(id);
        erpProject.setDelFlag(true);
        erpProjectService.updateById(erpProject);
        return RestResponse.success();
    }

}