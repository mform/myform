package com.sang.topic.common.entity;


import com.sang.topic.common.format.annotation.TopicDateFormat;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
    private Integer id;

    @Size(max = 16, min = 3)
    private String username;

    @Size(max = 16, min = 5, message = "密码长度应该为{min}-{max}")
    private String password;

    @Pattern(regexp = "^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+", message = "请填写正确的邮箱号:123@qq.com")
    private String email;
    
    @Pattern(regexp = "^[\\d-]*$", message = "请填写正确的手机号")
    private String phone;

    private String photo;

    private Integer roleId;

    private Integer ban;
    
    private Integer scores;
    
    private String status;
    
    @TopicDateFormat
    private Date changepwdtime;

    @TopicDateFormat
    private Date registertime;

    
	private Role role;

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhoto() {
        return photo;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Role getRole() {
        return role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getBan() {
        return ban;
    }

    public void setBan(Integer ban) {
        this.ban = ban;
    }
    
    public Integer getScores() {
		return scores;
	}

	public void setScores(Integer scores) {
		this.scores = scores;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getChangepwdtime() {
		return changepwdtime;
	}

	public void setChangepwdtime(Date changepwdtime) {
		this.changepwdtime = changepwdtime;
	}

	public Date getRegistertime() {
		return registertime;
	}

	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}

}