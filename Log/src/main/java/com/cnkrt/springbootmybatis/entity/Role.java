package com.cnkrt.springbootmybatis.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author kick
 * @since 2019-03-08
 */
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色主键id，自增长
     */
    @TableId(value = "role_id", type = IdType.AUTO)
    private Integer roleId;

    /**
     * 角色代表名
     */
    private String roleName;

    public Integer getRole_id() {
        return roleId;
    }

    public void setRole_id(Integer roleId) {
        this.roleId = roleId;
    }
    public String getRole_name() {
        return roleName;
    }

    public void setRole_name(String roleName) {
        this.roleName = roleName;
    }

    @Override
    protected Serializable pkVal() {
        return this.roleId;
    }

    @Override
    public String toString() {
        return "Role{" +
        "roleId=" + roleId +
        ", roleName=" + roleName +
        "}";
    }
}
