package com.cnkrt.springbootmybatis.service.impl;

import com.cnkrt.springbootmybatis.entity.Employee;
import com.cnkrt.springbootmybatis.mapper.EmployeeMapper;
import com.cnkrt.springbootmybatis.service.IEmployeeService;
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
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements IEmployeeService {

}
