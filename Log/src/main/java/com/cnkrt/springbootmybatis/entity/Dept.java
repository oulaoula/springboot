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
public class Dept extends Model<Dept> {

    private static final long serialVersionUID = 1L;

    /**
     * 部门id；自增长
     */
    @TableId(value = "dept_no", type = IdType.AUTO)
    private Integer dept_no;

    /**
     * 部门名称
     */
    private String dept_name;

    public Integer getDept_no() {
        return dept_no;
    }

    public void setDept_no(Integer dept_no) {
        this.dept_no = dept_no;
    }
    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    @Override
    protected Serializable pkVal() {
        return this.dept_no;
    }

    @Override
    public String toString() {
        return "Dept{" +
        "dept_no=" + dept_no +
        ", dept_name=" + dept_name +
        "}";
    }
}
