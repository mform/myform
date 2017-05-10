package com.sang.topic.controller.web;

import com.sang.topic.common.entity.Post;
import com.sang.topic.common.entity.User;
import com.sang.topic.common.constants.MessageConstants;
import com.sang.topic.service.PostService;
import com.sang.topic.service.UserService;
import com.sang.topic.util.SecurityUtil;
import com.sang.topic.common.model.Page;
import com.sang.topic.common.model.ValidationResponse;
import com.sang.topic.util.ResponseUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/u")
//@SessionAttributes(names = "sessionUser")
public class UserController {
	@Autowired
    PostService postService;
    @Autowired
    private UserService userService;
    Logger logger = Logger.getLogger(UserController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("user/login");
    }
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public ModelAndView user(@PathVariable Integer id, HttpServletResponse response) {
    	 User user = userService.get(id);
         if (user == null)
			try {
				response.sendError(404);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        return new ModelAndView("user/user","user", user);
    }
    
    @RequestMapping(value = "/user/forget-pwd", method = RequestMethod.GET)
    public ModelAndView forgetPassword() {
        return new ModelAndView("user/forget-pwd");
    }
    @RequestMapping(value = "/user/waiting-email", method = RequestMethod.GET)
    public ModelAndView waitingEmail() {
    	
        return new ModelAndView("user/waiting-email");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpSession httpSession) {
        httpSession.removeAttribute("sessionUser");
        httpSession.invalidate();
        return new ModelAndView("user/logout");
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView editNew() {
        ModelAndView modelAndView = new ModelAndView("user/editNew");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView show(@PathVariable Integer id, HttpServletResponse response)
            throws IOException {
        User user = userService.get(id);
        if (user == null)
            response.sendError(404);
        return new ModelAndView("user/show", "user", user);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        return new ModelAndView("user/edit", "user", user);
    }

    @RequestMapping(value = "/edit/photo", method = RequestMethod.GET)
    public ModelAndView editPhoto(HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        return new ModelAndView("user/edit-photo", "user", user);
    }
    @RequestMapping(value = "/edit/msg", method = RequestMethod.GET)
    public ModelAndView editMsg(HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        return new ModelAndView("user/edit-msg", "user", user);
    }
    @RequestMapping(value = "/edit/topic", method = RequestMethod.GET)
    public ModelAndView editTopic(HttpSession session,Integer p) {
        User user = (User) session.getAttribute("sessionUser");
        int id=user.getId();
        System.out.println("aaaaaaaaaaaa:"+id);
        Page page = new Page();
        if(p != null) page.setCurrentPage(p);
        page.setUrl("/edit/topic?p=");
        
        
        List<Post> posts = postService.getByUserId(id,page);

        Map<String, Object> map = new HashMap<>();
        map.put("posts", posts);
        map.put("page", page);
        return new ModelAndView("user/edit-topic", "user", user);
    }

    @RequestMapping(value = "/edit/password", method = RequestMethod.GET)
    public ModelAndView editPassword(HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        return new ModelAndView("user/edit-password", "user", user);
    }
    
    /**
     * 注册用户
     */
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ValidationResponse create(@ModelAttribute @Valid User user, BindingResult bindingResult, HttpSession httpSession) {
        if (bindingResult.hasErrors()) {
            return ResponseUtil.failFieldValidation(bindingResult.getFieldErrors());
        }
        ValidationResponse res = userService.create(user);
        if (res.success()) {
            User u = userService.getByUsername(user.getUsername());
            httpSession.setAttribute("sessionUser", u);
        }
        return res;
    }

    /**
     * 验证用户名和密码
     */
    @RequestMapping(value = "/valid", method = RequestMethod.POST)
    public ValidationResponse valid(String username, String password, HttpSession httpSession) {
        User u = userService.getByUsernameAndPassword(username, SecurityUtil.MD5(password));
        int userId=userService.getIDByUserName(username);
        if (u != null) {
            httpSession.setAttribute("sessionUser", u);
            if(userId==1){
            	return ResponseUtil.successValidation(MessageConstants.USER_LOGIN_ADMIN);
            }else{
            	return ResponseUtil.successValidation(MessageConstants.USER_LOGIN_SUCCESS);
            }
            
        }
        return ResponseUtil.failValidation(MessageConstants.USER_LOGIN_FAIL);
    }

    /**
     * 修改用户信息
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ValidationResponse update(@PathVariable Integer id, @Valid User user,
                                     BindingResult bindingResult, HttpSession httpSession) {
        if (bindingResult.hasErrors()) {
            return ResponseUtil.failFieldValidation(bindingResult);
        } else {
            ValidationResponse res = userService.save(user, httpSession);
            if (res.success()) {
                httpSession.setAttribute("sessionUser", userService.get(id));
            }
            return res;
        }
    }

    /**
     * 修改用户密码
     * @param id
     * @param user
     * @param oldPassword
     * @return
     */
    @RequestMapping(value = "/{id}/password", method = RequestMethod.PUT)
    public ValidationResponse updatePassword(@PathVariable Integer id, @ModelAttribute @Valid User user,
                                             BindingResult bindingResult, String oldPassword, HttpSession httpSession) {
        if (bindingResult.hasErrors()) {
            return ResponseUtil.failFieldValidation(bindingResult);
        } else {
            return userService.savePassword(user, oldPassword, httpSession);
        }
    }

    @RequestMapping(value = "/loginMessage", method = RequestMethod.GET)
    public ValidationResponse loginMessage() {
        return ResponseUtil.failValidation(MessageConstants.USER_LOGIN_REQUIRE);
    }
}
