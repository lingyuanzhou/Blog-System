package com.zhou.controller;

import com.zhou.model.BlogEntity;
import com.zhou.model.UserEntity;
import com.zhou.repository.BlogRepository;
import com.zhou.repository.RoleRepository;
import com.zhou.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    BlogRepository blogRepository;

    @Autowired
    RoleRepository roleRepository;

    @RequestMapping(value = "/user/index", method = RequestMethod.GET)
    public String userIndex(ModelMap modelMap, Principal principal) {
        // Get user name
        String userName = principal.getName();

        // Get user
        List<UserEntity> userList = userRepository.findOrderByNickname(userName);
        UserEntity activeUser = userList.get(0);

        // Get user's blogs
        List<BlogEntity> blogList = activeUser.getBlogById();

        // Pass information to index.jsp
        modelMap.addAttribute("userName", userName);
        modelMap.addAttribute("user", activeUser);
        modelMap.addAttribute("blogList", blogList);

        return "/user/index";
    }
}
