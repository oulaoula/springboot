package com.cnkrt.springbootmybatis.controller;

import com.cnkrt.springbootmybatis.entity.Employee;
import com.cnkrt.springbootmybatis.mapper.EmployeeMapper;
import com.cnkrt.springbootmybatis.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class PersonInfoController {
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    IEmployeeService iEmployeeService;
    //进入个人信息界面
    @RequestMapping("/PersonInfo")
    public String personInfo(Model model, HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.getById(id);
        model.addAttribute("personInfo",employee);
        return "personInfo";
    }
    //进入修改信息界面
    @RequestMapping("/PersonInfoUpdate")
    public String personInfoUpdate(Model model, HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.getById(id);
        model.addAttribute("personInfo",employee);
        return "personInfoUpdate";
    }
    //修改个人信息
    @RequestMapping("/PersonInfoDoUpdate")
    public String personInfoDoUpdate( HttpServletResponse response, HttpServletRequest request) throws  Exception{
        Employee employee =new Employee();
        int id = Integer.parseInt(request.getParameter("id"));//获取修改信息
        employee.setId(Integer.parseInt(request.getParameter("id")));
        employee.setName(request.getParameter("name"));
        employee.setPassword(request.getParameter("password"));
        employee.setRole(request.getParameter("role"));
        employee.setDeptName(request.getParameter("dept_name"));
        boolean flag = iEmployeeService.updateById(employee);
        if(flag) {//返回值为boolean类型，即为true时修改成功
            return "/PersonInfoUpdate?"+id;
        }else {
            response.getWriter().println("<script>alert('Fail！');</script>");
            return "/PersonInfoUpdate?"+id;
        }
    }
}
