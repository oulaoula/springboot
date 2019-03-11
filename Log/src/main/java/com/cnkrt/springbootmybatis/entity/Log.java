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


    /**
     *
     * 日志状态。1：未上报2：已上报
     */
    private  int status;

    /**
     *
     * 审核状态。1：未审核2：已审核
     */
    private int flag;

    /**
     * 员工id
     */
    private int employeeId;

    public Integer getLog_id() {
        return logId;
    }

    public void setLog_id(Integer logId) {
        this.logId = logId;
    }
    public String getLog_type() {
        return logType;
    }

    public void setLog_type(String logType) {
        this.logType = logType;
    }
    public Date getLog_time() {
        return logTime;
    }

    public void setLog_time(Date logTime) {
        this.logTime = logTime;
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

    public void setJob_content(String jobContent) {
        this.jobContent = jobContent;
    }
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
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
        ", status=" + status +
        ", flag=" + flag +
        ", employeeId=" + employeeId +
        "}";
    }
}
