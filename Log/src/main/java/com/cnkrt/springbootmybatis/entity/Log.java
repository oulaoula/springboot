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
    private Integer logId;

    /**
     * 日志类型
     */
    private String logType;

    /**
     * 日志创建时间
     */
    private Date logTime;

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
    private String jobContent;

    public Integer getLog_id() {
        return logId;
    }

    public void setLog_id(Integer log_id) {
        this.logId = log_id;
    }
    public String getLog_type() {
        return logType;
    }

    public void setLog_type(String log_type) {
        this.logType = log_type;
    }
    public Date getLog_time() {
        return logTime;
    }

    public void setLog_time(Date log_time) {
        this.logTime = log_time;
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
        return jobContent;
    }

    public void setJob_content(String job_content) {
        this.jobContent = job_content;
    }

    @Override
    protected Serializable pkVal() {
        return this.logId;
    }

    @Override
    public String toString() {
        return "Log{" +
        "logId=" + logId +
        ", logType=" + logType +
        ", logTime=" + logTime +
        ", workspace=" + workspace +
        ", workout=" + workout +
        ", jobContent=" + jobContent +
        "}";
    }
}
