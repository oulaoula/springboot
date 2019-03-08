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
    private Integer role_id;

    /**
     * 角色代表名
     */
    private String role_name;

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }
    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    @Override
    protected Serializable pkVal() {
        return this.role_id;
    }

    @Override
    public String toString() {
        return "Role{" +
        "role_id=" + role_id +
        ", role_name=" + role_name +
        "}";
    }
}
