package com.sang.topic.controller.admin;

import com.sang.topic.service.UserService;
import com.sang.topic.util.ResponseUtil;
import com.sang.topic.common.constants.MessageConstants;
import com.sang.topic.common.entity.Topic;
import com.sang.topic.common.entity.User;
import com.sang.topic.common.model.Page;
import com.sang.topic.common.model.ValidationResponse;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/admin/user")
public class AdminUserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView userIndex(Model model, Integer p) {
        Page page = new Page();
        if (p != null) page.setCurrentPage(p);
        page.setUrl("user?p=");

        model.addAttribute("users", userService.getByPage(page));
        model.addAttribute("page", page);
        new ModelAndView();
        return new ModelAndView("admin/user/index");
    }
    @RequestMapping(value = "/d/{id}", method = RequestMethod.DELETE)
    public ValidationResponse update(@PathVariable Integer id){
    	System.out.println("iiiiiiiiiiiiii:"+id);
    	User user = userService.get(id);
    	
        if(user != null ){
          userService.deleteUser(id);
         return ResponseUtil.successValidation(MessageConstants.DELETE_USER_SUCCESS);
           
        }
        return ResponseUtil.failValidation(MessageConstants.DELETE_USER_FAIL);
    }
}
