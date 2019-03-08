package com.cnkrt.springbootmybatis.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author kick
 * @since 2019-03-08
 */
public class Log extends Model<Log> {

    private static final long serialVersionUID = 1L;

    /**
     * 日志主键自增长ID
     */
    @TableId(value = "log_id", type = IdType.AUTO)
    private Integer log_id;

    /**
     * 日志类型
     */
    private String log_type;

    /**
     * 日志创建时间
     */
    private Date log_time;

    /**
     * 工作地点
     */
    private String workspace;

    /**
     * 外出或者出差地点
     */
    private String workout;

    /**
     * 工作内容
     */
    private String job_content;

    public Integer getLog_id() {
        return log_id;
    }

    public void setLog_id(Integer log_id) {
        this.log_id = log_id;
    }
    public String getLog_type() {
        return log_type;
    }

    public void setLog_type(String log_type) {
        this.log_type = log_type;
    }
    public Date getLog_time() {
        return log_time;
    }

    public void setLog_time(Date log_time) {
        this.log_time = log_time;
    }
    public String getWorkspace() {
        return workspace;
    }

    public void setWorkspace(String workspace) {
        this.workspace = workspace;
    }
    public String getWorkout() {
        return workout;
    }

    public void setWorkout(String workout) {
        this.workout = workout;
    }
    public String getJob_content() {
        return job_content;
    }

    public void setJob_content(String job_content) {
        this.job_content = job_content;
    }

    @Override
    protected Serializable pkVal() {
        return this.log_id;
    }

    @Override
    public String toString() {
        return "Log{" +
        "log_id=" + log_id +
        ", log_type=" + log_type +
        ", log_time=" + log_time +
        ", workspace=" + workspace +
        ", workout=" + workout +
        ", job_content=" + job_content +
        "}";
    }
}
