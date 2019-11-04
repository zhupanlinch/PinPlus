package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.ErpTag;
import com.mysiteforme.admin.service.ErpTagService;
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
 * 人力标签  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-10-26
 */
@Controller
@RequestMapping("/admin/erpTag")
public class ErpTagController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ErpTagController.class);

    @Autowired
    private ErpTagService erpTagService;

    @GetMapping("list")
    @SysLog("跳转人力标签列表")
    public String list(){
        return "/admin/erpTag/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求人力标签列表数据")
    public LayerData<ErpTag> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpTag> layerData = new LayerData<>();
        EntityWrapper<ErpTag> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

        }
        Page<ErpTag> pageData = erpTagService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增人力标签页面")
    public String add(){
        return "/admin/erpTag/add";
    }

    @PostMapping("add")
    @SysLog("保存新增人力标签数据")
    @ResponseBody
    public RestResponse add(ErpTag erpTag){
        erpTagService.insert(erpTag);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑人力标签页面")
    public String edit(Long id,Model model){
        ErpTag erpTag = erpTagService.selectById(id);
        model.addAttribute("erpTag",erpTag);
        return "/admin/erpTag/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑人力标签数据")
    public RestResponse edit(ErpTag erpTag){
        if(null == erpTag.getId() || 0 == erpTag.getId()){
            return RestResponse.failure("ID不能为空");
        }
        erpTagService.updateById(erpTag);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除人力标签数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        ErpTag erpTag = erpTagService.selectById(id);
        erpTag.setDelFlag(true);
        erpTagService.updateById(erpTag);
        return RestResponse.success();
    }

}