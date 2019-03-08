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
    private Integer deptNo;

    /**
     * 部门名称
     */
    private String deptName;

    public Integer getDept_no() {
        return deptNo;
    }

    public void setDept_no(Integer dept_no) {
        this.deptNo = dept_no;
    }
    public String getDept_name() {
        return deptName;
    }

    public void setDept_name(String dept_name) {
        this.deptName = dept_name;
    }

    @Override
    protected Serializable pkVal() {
        return this.deptNo;
    }

    @Override
    public String toString() {
        return "Dept{" +
        "deptNo=" + deptNo +
        ", deptName=" + deptName +
        "}";
    }
}
