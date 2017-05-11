package com.sang.topic.controller.web;

import com.sang.topic.common.entity.Post;
import com.sang.topic.common.entity.Topic;
import com.sang.topic.common.entity.User;
import com.sang.topic.service.PostService;
import com.sang.topic.service.TopicService;
import com.sang.topic.service.UserService;
import com.sang.topic.common.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class TopicController {
    @Autowired
    PostService postService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private UserService userService;

    /*
	 * 主页面更新接口(点击全部帖子时接口)
	 * 
	 */
	@RequestMapping(value="/")
	public ModelAndView index(Integer p){
        Page page = new Page();
        if(p != null) page.setCurrentPage(p);
        page.setUrl("/?p=");

        List<Topic> topics = topicService.selectAllOpen();
        List<User> users = userService.selectOrderUsers();
        List<Post> posts = postService.getByPage(page);

        Map<String, Object> map = new HashMap<>();
        map.put("topics", topics);
        map.put("users", users);
        map.put("posts", posts);
        map.put("page", page);
        return new ModelAndView("topic/index", map);
	}
	
	/*
	 * 搜索帖子接口
	 * 
	 */
	@RequestMapping(value = "/t/search",consumes="application/json")
	@ResponseBody
	public ModelAndView search(@RequestBody String keywords,Integer p) {
        Page page = new Page();
        if(p != null) page.setCurrentPage(p);
        page.setUrl("/t/search?p=");
        List<Post> posts = postService.getByKeyWords(keywords,page);
        Map<String, Object> map = new HashMap<>();
        //map.put("posts", posts);
        map.put("page", page);
        return new ModelAndView("topic/search",map);
    }
	
	/*
	 * 点击其他几个话题接口
	 * 
	 */
	@RequestMapping(value="/t/{id}")
    public ModelAndView topic(@PathVariable Integer id, Integer p){
        Page page = new Page();
        if(p != null) page.setCurrentPage(p);
        page.setUrl("/t/"+id+"?p=");

        List<Topic> topics = topicService.selectAllOpen();
        List<Post> posts = postService.getByTopicAndPage(id, page);

        Map<String, Object> map = new HashMap<>();
        map.put("topics", topics);
        map.put("posts", posts);
        map.put("page", page);
        return new ModelAndView("topic/index", map);
    }
	
}
