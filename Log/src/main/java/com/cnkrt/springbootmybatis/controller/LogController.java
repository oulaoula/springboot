package com.cnkrt.springbootmybatis.controller;


import com.cnkrt.springbootmybatis.entity.Log;
import com.cnkrt.springbootmybatis.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author kick
 * @since 2019-03-08
 */
@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    ILogService logService;

    @RequestMapping("/allLogs")
    public  String getAllLogs(Model model){
        List<Log> logs = logService.getAllLogById();
        model.addAttribute("logList",logs);
        return "log";
    }

    @RequestMapping("/allLogsByMinister")
    public  String getAllLogsByMinister(Model model){
        List<Log> logs = logService.getAllLogReported();
        model.addAttribute("logList",logs);
        return "logByMinister";
    }

    @RequestMapping("/logDel")
    public String delLog(HttpServletRequest request, HttpServletResponse response)throws Exception{
        boolean flag = logService.removeById(Integer.parseInt(request.getParameter("id")));
        if (flag){
            return "/log/allLogs";
        }else{
            response.getWriter().println("<script>alert('Fail！');</script>");
            return "/log/allLogs";
        }
    }

    @RequestMapping("/logReport")
    public String logReport(HttpServletRequest request, HttpServletResponse response)throws Exception{
        int flag = logService.updateById(Integer.parseInt(request.getParameter("id")));
        if (flag==1){
            return "/log/allLogs";
        }else{
            response.getWriter().println("<script>alert('Fail！');</script>");
            return "/log/allLogs";
        }
    }

    @RequestMapping("/logAdd")
    public String logAdd(){
       return "logAdd";
    }

    @RequestMapping("/logDoAdd")
    public String logDoAdd(HttpServletRequest request, HttpServletResponse response,Log log)throws Exception{
        boolean flag = logService.save(log);
        if (flag){
            return "/log/allLogs";
        }else{
            response.getWriter().println("<script>alert('Fail！');</script>");
            return "/log/allLogs";
        }
    }
    @RequestMapping("/logUpdate")
    public  String logUpdate(Model model,HttpServletRequest request){

        return "";
    }
}
