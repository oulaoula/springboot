package com.cnkrt.springbootmybatis.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cnkrt.springbootmybatis.entity.Employee;
import com.cnkrt.springbootmybatis.mapper.EmployeeMapper;
import com.cnkrt.springbootmybatis.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Wrapper;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    EmployeeMapper employeeMapper;

    //初始进入登录页面
    @RequestMapping("/")
    public String login(){
        return "/login";
    }

    //跳转进入login界面
    @RequestMapping("/login")
    public String loginIn(){
        return "login";
    }

    //登入进入index页面时的欢迎页面
    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }

    //登录验证
    @RequestMapping("/loginIn")
    public String loginCheck(Model model, HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        QueryWrapper<Employee> queryWrapper = new QueryWrapper<Employee>();
        queryWrapper.lambda().eq(Employee::getName,username).eq(Employee::getPassword,password);
        Employee employee = employeeMapper.selectOne(queryWrapper);
        if (employee == null){
            return "login";
        }else{
            model.addAttribute("activeUser",employee);
            return "index";
        }
    }


}
