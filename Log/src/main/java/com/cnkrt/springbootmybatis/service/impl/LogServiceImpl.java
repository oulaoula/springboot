package com.cnkrt.springbootmybatis.service.impl;

import com.cnkrt.springbootmybatis.entity.Log;
import com.cnkrt.springbootmybatis.mapper.LogMapper;
import com.cnkrt.springbootmybatis.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

}
