package com.mysiteforme.admin.controller;

import com.mysiteforme.admin.base.BaseController;
import com.mysiteforme.admin.entity.ErpResume;
import com.mysiteforme.admin.entity.User;
import com.mysiteforme.admin.service.ErpResumeService;
import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.ErpTeamMember;
import com.mysiteforme.admin.service.ErpTeamMemberService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.NumberFormat;
import java.util.Calendar;
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
 * 管理小组  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-11-06
 */
@Controller
@RequestMapping("/admin/erpTeamMember")
public class ErpTeamMemberController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ErpTeamMemberController.class);

    @Autowired
    private ErpTeamMemberService erpTeamMemberService;

    @Autowired
    private ErpResumeService erpResumeService;

    @GetMapping("list")
    @SysLog("跳转管理小组列表")
    public String list(){
        return "/admin/erpTeamMember/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求管理小组列表数据")
    public LayerData<ErpTeamMember> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<ErpTeamMember> layerData = new LayerData<>();
        EntityWrapper<ErpTeamMember> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
        }
        Page<ErpTeamMember> pageData = erpTeamMemberService.selectPage(new Page<>(page,limit),wrapper);
        for(ErpTeamMember tm : pageData.getRecords()){
            User u = userService.selectById(tm.getUserId());
            tm.setTeamMember(u);
            EntityWrapper<ErpResume> resumeWrapper = new EntityWrapper<>();
            resumeWrapper.eq("del_flag",false);
            resumeWrapper.gt("job_status", 1);  // 成交的简历
            resumeWrapper.eq("update_by", tm.getUserId());
            int finish = erpResumeService.selectCount(resumeWrapper);
            tm.setFinish(finish);
            NumberFormat numberFormat = NumberFormat.getInstance();
            // 设置精确到小数点后2位
            numberFormat.setMaximumFractionDigits(2);
            String result = numberFormat.format((float)finish/(float)tm.getTarget()*100);
            result += "%";
            tm.setProgress(result);
        }
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增管理小组页面")
    public String add(Model model){
        // 所有人员
        EntityWrapper<User> userEntityWrapper = new EntityWrapper<>();
        List<User> userList = userService.selectList(userEntityWrapper);
        model.addAttribute("userList", userList);
        return "/admin/erpTeamMember/add";
    }

    @PostMapping("add")
    @SysLog("保存新增管理小组数据")
    @ResponseBody
    public RestResponse add(ErpTeamMember erpTeamMember){
        erpTeamMemberService.insert(erpTeamMember);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑管理小组页面")
    public String edit(Long id,Model model){
        ErpTeamMember erpTeamMember = erpTeamMemberService.selectById(id);
        model.addAttribute("erpTeamMember",erpTeamMember);
        // 所有人员
        EntityWrapper<User> userEntityWrapper = new EntityWrapper<>();
        List<User> userList = userService.selectList(userEntityWrapper);
        model.addAttribute("userList", userList);
        return "/admin/erpTeamMember/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑管理小组数据")
    public RestResponse edit(ErpTeamMember erpTeamMember){
        if(null == erpTeamMember.getId() || 0 == erpTeamMember.getId()){
            return RestResponse.failure("ID不能为空");
        }
        erpTeamMemberService.updateById(erpTeamMember);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除管理小组数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        ErpTeamMember erpTeamMember = erpTeamMemberService.selectById(id);
        erpTeamMember.setDelFlag(true);
        erpTeamMemberService.updateById(erpTeamMember);
        return RestResponse.success();
    }

    @GetMapping("myProgress")
    @SysLog("跳转我的进度页面")
    public String myProgress(Model model){
        LayerData<ErpTeamMember> layerData = new LayerData<>();
        EntityWrapper<ErpTeamMember> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        wrapper.eq("user_id", getCurrentUser().getId());
        List<ErpTeamMember> tms = erpTeamMemberService.selectList(wrapper);
        ErpTeamMember tm = new ErpTeamMember();
        if(tms.size()>0){
            tm = tms.get(0);
        }
        EntityWrapper<ErpResume> resumeWrapper = new EntityWrapper<>();
        resumeWrapper.eq("del_flag",false);
        resumeWrapper.gt("job_status", 1);  // 成交的简历
        resumeWrapper.eq("update_by", tm.getUserId());
        int finish = erpResumeService.selectCount(resumeWrapper);
        tm.setFinish(finish);
        NumberFormat numberFormat = NumberFormat.getInstance();
        // 设置精确到小数点后2位
        numberFormat.setMaximumFractionDigits(2);
        String result = numberFormat.format((float)finish/(float)tm.getTarget()*100);
        result += "%";
        tm.setProgress(result);
        model.addAttribute("data", tm);

        Calendar c = Calendar.getInstance();
        int day = c.get(Calendar.DATE);
        model.addAttribute("day", day);
        int value = c.getActualMaximum(Calendar.DAY_OF_MONTH);
        c.set(Calendar.DAY_OF_MONTH, value);
        int days = c.get(Calendar.DAY_OF_MONTH);
        model.addAttribute("days", days);

        return "/admin/erpTeamMember/myProgress";
    }

}