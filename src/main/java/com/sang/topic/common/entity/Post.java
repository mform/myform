package com.sang.topic.common.entity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sang.topic.common.format.annotation.TopicDateFormat;

import javax.validation.constraints.Size;
import java.util.Date;

public class Post {
    private Integer id;

    @Size(min = 5, max = 50, message = "标题长度应该为{min}-{max}")
    private String title;

    @Size(min = 8, max = 50000, message = "内容长度应该为{min}-{max}")
    private String content;

    private Integer userId;

    private Integer topicId;

    private Integer discard;

    private String userUsername;

    private Integer commentsNumber;

    @TopicDateFormat
    private Date createTime;

    @TopicDateFormat
    private Date lastTime;
    
    private String keywords;
    
    private String userphoto;
    
    private String topictag;
    
    private Integer watchnumber;
    
    @TopicDateFormat
    private Date lastwatchtime;
    
    private Integer agree;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getDiscard() {
        return discard;
    }

    public void setDiscard(Integer discard) {
        this.discard = discard;
    }

    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    public Integer getCommentsNumber() {
        return commentsNumber;
    }

    public void setCommentsNumber(Integer commentsNumber) {
        this.commentsNumber = commentsNumber;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }
    

    public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getUserphoto() {
		return userphoto;
	}

	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}

	public String getTopictag() {
		return topictag;
	}

	public void setTopictag(String topictag) {
		this.topictag = topictag;
	}

	public Integer getWatchnumber() {
		return watchnumber;
	}

	public void setWatchnumber(Integer watchnumber) {
		this.watchnumber = watchnumber;
	}

	public Date getLastwatchtime() {
		return lastwatchtime;
	}

	public void setLastwatchtime(Date lastwatchtime) {
		this.lastwatchtime = lastwatchtime;
	}
	
	
	public Integer getAgree() {
		return agree;
	}

	public void setAgree(Integer agree) {
		this.agree = agree;
	}

	@Override
    public String toString() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }
}