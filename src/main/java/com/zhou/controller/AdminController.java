package com.zhou.controller;

import com.zhou.model.BlogEntity;
import com.zhou.model.RoleEntity;
import com.zhou.model.UserEntity;
import com.zhou.repository.BlogRepository;
import com.zhou.repository.RoleRepository;
import com.zhou.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    BlogRepository blogRepository;

    @Autowired
    RoleRepository roleRepository;

    // Main view for admin
    @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
    public String adminIndex(ModelMap modelMap, Principal principal) {
        // Get the user list
        List<UserEntity> userList = userRepository.findAll();

        // Get the blog list
        List<BlogEntity> blogList = blogRepository.findAll();

        // Get the admin name
        String adminName = principal.getName();

        // Pass user list, and blog listto index.jsp
        modelMap.addAttribute("userList", userList);
        modelMap.addAttribute("blogList", blogList);

        // Pass admin name to index.jsp
        modelMap.addAttribute("adminName", adminName);

        return "/admin/index";
    }

    // Add user
    @RequestMapping(value = "/admin/users/add", method = RequestMethod.GET)
    public String addUser() {
        return "/admin/addUser";
    }

    @RequestMapping(value = "/admin/users/addPost", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {
        userRepository.saveAndFlush(userEntity);

        List<UserEntity> lastone = userRepository.findOrderByNickname(userEntity.getNickname());

        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setAuth(userEntity.getAuthUser());
        roleEntity.setUserInRoleByUserId(lastone.get(0));

        roleRepository.saveAndFlush(roleEntity);

        return "redirect:/admin/index";
    }

    // Add blog
    @RequestMapping(value = "/admin/blogs/add", method = RequestMethod.GET)
    public String addBlog(ModelMap modelMap) {
        List<UserEntity> userList = userRepository.findAll();
        modelMap.addAttribute("userList", userList);
        return "/admin/addBlog";
    }

    @RequestMapping(value = "/admin/blogs/addPost", method = RequestMethod.POST)
    public String addBlogPost(@ModelAttribute("blog") BlogEntity blogEntity) {
        blogRepository.saveAndFlush(blogEntity);

        return "redirect:/admin/index";
    }

    // Delete user
    @RequestMapping(value = "/admin/users/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer userId) {
        userRepository.delete(userId);

        userRepository.flush();
        return "redirect:/admin/index";
    }

    // Delete blog
    @RequestMapping(value = "/admin/blogs/delete/{id}", method = RequestMethod.GET)
    public String deleteBlog(@PathVariable("id") Integer blogId) {
        blogRepository.delete(blogId);

        blogRepository.flush();
        return "redirect:/admin/index";
    }

    // Show user information
    @RequestMapping(value = "/admin/users/detail/{id}", method = RequestMethod.GET)
    public String detailUser(@PathVariable("id") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);

        modelMap.addAttribute("user", userEntity);
        return "/admin/userDetail";
    }

    // Show blog information
    @RequestMapping(value = "/admin/blogs/detail/{id}", method = RequestMethod.GET)
    public String detailBlog(@PathVariable("id") Integer blogId, ModelMap modelMap) {
        BlogEntity blogEntity = blogRepository.findOne(blogId);

        modelMap.addAttribute("blog", blogEntity);
        return "/admin/blogDetail";
    }

    // Update user information
    @RequestMapping(value = "/admin/users/update/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findOne(userId);

        modelMap.addAttribute("user", userEntity);
        return "/admin/updateUser";
    }

    @RequestMapping(value = "/admin/users/updatePost", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("userP") UserEntity user) {
        userRepository.updateUser(user.getNickname(), user.getFirstName(),
                user.getLastName(), user.getPassword(), user.getAuthUser(), user.getId());
        roleRepository.updateRole(user.getAuthUser(), user.getId());

        roleRepository.flush();
        userRepository.flush();
        return "redirect:/admin/index";
    }

    // Update blog information
    @RequestMapping(value = "/admin/blogs/update/{id}", method = RequestMethod.GET)
    public String updateBlog(@PathVariable("id") Integer blogId, ModelMap modelMap) {
        BlogEntity blogEntity = blogRepository.findOne(blogId);
        List<UserEntity> userList = userRepository.findAll();

        modelMap.addAttribute("blog", blogEntity);
        modelMap.addAttribute("userList", userList);
        return "/admin/updateBlog";
    }

    @RequestMapping(value = "/admin/blog/updatePost", method = RequestMethod.POST)
    public String updateBlogP(@ModelAttribute("blogP") BlogEntity blogEntity){
        blogRepository.updateBlog(blogEntity.getTitle(), blogEntity.getUserInBlogByUserId().getId(),
                blogEntity.getContent(), blogEntity.getPubDate(), blogEntity.getId());
        blogRepository.flush();
        return "redirect:/admin/index";
    }
}
