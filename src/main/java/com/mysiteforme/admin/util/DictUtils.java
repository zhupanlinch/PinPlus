package com.mysiteforme.admin.util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.mysiteforme.admin.dao.DictDao;
import com.mysiteforme.admin.entity.Dict;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;
import java.util.Map;

/**
 * 字典工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class DictUtils {
	
	private static DictDao dictDao = SpringContextHolder.getBean(DictDao.class);

	public static String getDictLabel(String value, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && value.equals(dict.getValue())){
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}
	
	public static String getDictLabels(String values, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)){
			List<String> valueList = Lists.newArrayList();
			for (String value : StringUtils.split(values, ",")){
				valueList.add(getDictLabel(value, type, defaultValue));
			}
			return StringUtils.join(valueList, ",");
		}
		return defaultValue;
	}

	public static String getDictValue(String label, String type, String defaultLabel){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && label.equals(dict.getLabel())){
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}

	@Cacheable(value = "dictCache",key = "#type",unless = "#result == null or #result.size() == 0")
	public static List<Dict> getDictList(String type){
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = null;
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			EntityWrapper<Dict> wrapper = new EntityWrapper<>();
			wrapper.eq("del_flag",false);
			for (Dict dict : dictDao.selectList(wrapper)){
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;
	}

	@Cacheable(value = "dictCache",key = "#type",unless = "#result == null or #result.size() == 0")
	public static List<Dict> getDictList(String type, String remark){
		Map<String, List<Dict>> dictMap = null;
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			EntityWrapper<Dict> wrapper = new EntityWrapper<>();
			wrapper.eq("del_flag",false);
			for (Dict dict : dictDao.selectList(wrapper)){
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		List<Dict> dictListRet = Lists.newArrayList();
		for(int i=0; i< dictList.size(); i++){
			Dict temp = dictList.get(i);
			if(remark.equals(temp.getRemarks())){
				dictListRet.add(temp);
			}
		}
		return dictListRet;
	}
	
}
