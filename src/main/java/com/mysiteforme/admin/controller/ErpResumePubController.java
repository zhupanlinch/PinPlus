package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.ErpResumePub;
import com.mysiteforme.admin.service.ErpResumePubService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 公示板  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Controller
@RequestMapping("/admin/erpResumePub")
public class ErpResumePubController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ErpResumePubController.class);

    @Autowired
    private ErpResumePubService erpResumePubService;

    @GetMapping("list")
    @SysLog("跳转公示板列表")
    public String list(){
        return "/admin/erpResumePub/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求公示板列表数据")
    public LayerData<ErpResumePub> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpResumePub> layerData = new LayerData<>();
        EntityWrapper<ErpResumePub> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
        }
        Page<ErpResumePub> pageData = erpResumePubService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增公示板页面")
    public String add(){
        return "/admin/erpResumePub/add";
    }

    @PostMapping("add")
    @SysLog("保存新增公示板数据")
    @ResponseBody
    public RestResponse add(ErpResumePub erpResumePub){
        if(erpResumePub.getResumeId() == null){
            return RestResponse.failure("简历ID不能为空");
        }
        erpResumePubService.insert(erpResumePub);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑公示板页面")
    public String edit(Long id,Model model){
        ErpResumePub erpResumePub = erpResumePubService.selectById(id);
        model.addAttribute("erpResumePub",erpResumePub);
        return "/admin/erpResumePub/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑公示板数据")
    public RestResponse edit(ErpResumePub erpResumePub){
        if(null == erpResumePub.getId() || 0 == erpResumePub.getId()){
            return RestResponse.failure("ID不能为空");
        }
        if(erpResumePub.getResumeId() == null){
            return RestResponse.failure("简历ID不能为空");
        }
        erpResumePubService.updateById(erpResumePub);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除公示板数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        ErpResumePub erpResumePub = erpResumePubService.selectById(id);
        erpResumePub.setDelFlag(true);
        erpResumePubService.updateById(erpResumePub);
        return RestResponse.success();
    }

}