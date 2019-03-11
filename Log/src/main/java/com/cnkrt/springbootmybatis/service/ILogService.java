package com.cnkrt.springbootmybatis.service;

import com.cnkrt.springbootmybatis.entity.Log;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author kick
 * @since 2019-03-08
 */
public interface ILogService extends IService<Log> {
    //查询出未上报的日志
    public List<Log> getLogById();
    //查询出该员工已上报但未审核的日志
    public  List<Log> getAllLogById();
    //查询出所有员工已上报但未审核的日志
    public  List<Log> getAllLogReported();
    //查询出已审核的日志
    public  List<Log> getAllLogChecked();
    //上报日志
    public int updateById(int id);
}
