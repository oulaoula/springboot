package com.cnkrt.springbootmybatis.service.impl;

import com.cnkrt.springbootmybatis.entity.Dept;
import com.cnkrt.springbootmybatis.mapper.DeptMapper;
import com.cnkrt.springbootmybatis.service.IDeptService;
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
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

}
