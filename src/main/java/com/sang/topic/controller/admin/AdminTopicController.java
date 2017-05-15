package com.sang.topic.controller.admin;

import com.sang.topic.common.constants.MessageConstants;
import com.sang.topic.common.entity.Topic;
import com.sang.topic.service.TopicService;
import com.sang.topic.util.ResponseUtil;
import com.sang.topic.common.model.Page;
import com.sang.topic.common.model.ValidationResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value="/admin/topic")
public class AdminTopicController {
    @Autowired
    private TopicService topicService;

    @RequestMapping(value="", method = RequestMethod.GET)
    public ModelAndView index(Integer p) {
        Page page = new Page();
        if(p != null) page.setCurrentPage(p);
        page.setUrl("topic?p=");

        Map map = new HashMap<String, Object>();
        map.put("topics", topicService.getAll());
        map.put("page", page);
        return new ModelAndView("admin/topic/index", map);
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ValidationResponse create(@ModelAttribute Topic topic) {
        Map<String, Object> resultMap = new HashMap<>();
        int n = topicService.insert(topic);
        if(n > 0){
            resultMap.put("success", true);
        }
        return ResponseUtil.successValidation(MessageConstants.FIELD_VALIDATION_SUCCESS);
    }

   /* @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public Map<String, Object> update(@PathVariable Integer id, Integer discard){
        Map<String, Object> resultMap = new HashMap<>();
        if(id != null && discard != null ){
            Topic topic = topicService.get(id);
            topic.setClose(discard);
            if(topic != null){
                topicService.update(topic);
                resultMap.put("success", true);
                return resultMap;
            }
        }
        resultMap.put("success", false);
        resultMap.put("message", "失败");
        return resultMap;
    }*/
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ValidationResponse update(@PathVariable Integer id, Integer discard){
        Map<String, Object> resultMap = new HashMap<>();
        if(id != null && discard != null ){
            Topic topic = topicService.get(id);
            topic.setClose(discard);
            if(topic != null){
            	
                topicService.update(topic);
                resultMap.put("success", true);
                return ResponseUtil.successValidation(MessageConstants.FIELD_VALIDATION_SUCCESS);
            }
        }
        resultMap.put("success", false);
        resultMap.put("message", "失败");
        return ResponseUtil.failValidation(MessageConstants.FIELD_VALIDATION_FAIL);
    }

}
