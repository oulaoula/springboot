package com.cnkrt.springbootmybatis.service.impl;

import com.cnkrt.springbootmybatis.entity.Log;
import com.cnkrt.springbootmybatis.mapper.LogMapper;
import com.cnkrt.springbootmybatis.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author kick
 * @since 2019-03-08
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements ILogService {
    @Autowired
    LogMapper logMapper;
    @Override
    public List<Log> getLogById() {
        return logMapper.getLogById();
    }

    @Override
    public List<Log> getAllLogById() {
        return logMapper.getAllLogById();
    }

    @Override
    public List<Log> getAllLogReported() {
        return logMapper.getAllLogReported();
    }

    @Override
    public List<Log> getAllLogChecked() {
        return logMapper.getAllLogChecked();
    }

    @Override
    public int updateById(int id) {
        return logMapper.updateById(id);
    }

}
