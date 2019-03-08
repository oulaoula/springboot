package com.cnkrt.springbootmybatis.service.impl;

import com.cnkrt.springbootmybatis.entity.Role;
import com.cnkrt.springbootmybatis.mapper.RoleMapper;
import com.cnkrt.springbootmybatis.service.IRoleService;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

}
