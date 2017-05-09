package com.sang.topic.service;

import com.sang.topic.common.constants.MessageConstants;
import com.sang.topic.common.model.ValidationResponse;
import com.sang.topic.dao.PostMapper;
import com.sang.topic.dao.UserMapper;
import com.sang.topic.common.entity.Post;
import com.sang.topic.util.MyBatisSession;
import com.sang.topic.common.model.Page;
import com.sang.topic.util.ResponseUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;
import java.util.List;

@Service(value = "postService")
public class PostService {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private UserMapper userMapper;

    public List<Post> getByPage(Page page) {
        try (SqlSession session = MyBatisSession.getSession()) {
            int rowNumber = session.getMapper(PostMapper.class).selectCount();
            page.setRowNumber(rowNumber);
            return session.selectList("selectPostByPage", null, page.toRowBounds());
        }
    }

    public List<Post> getByTopicAndPage(Integer topicId, Page page) {
        try (SqlSession session = MyBatisSession.getSession()) {
            int rowNumber = session.getMapper(PostMapper.class).selectCountByTopic(topicId);
            page.setRowNumber(rowNumber);
            return session.selectList("selectPostByTopicAndPage", topicId, page.toRowBounds());
        }
    }
    
    public List<Post> getByKeyWords(String keywords, Page page) {
        try (SqlSession session = MyBatisSession.getSession()) {
            int rowNumber = session.getMapper(PostMapper.class).selectCountByKeyWords(keywords);
            page.setRowNumber(rowNumber);
            return session.selectList("selectPostByKeyWords", keywords, page.toRowBounds());
        }
    }
    
    public List<Post> getByUserId(Integer UserId, Page page) {
        try (SqlSession session = MyBatisSession.getSession()) {
            int rowNumber = session.getMapper(PostMapper.class).selectCountByUserId(UserId);
            page.setRowNumber(rowNumber);
            return session.selectList("selectPostUserId", UserId, page.toRowBounds());
        }
    }

    public Post get(Integer id) {
        return postMapper.selectByPrimaryKey(id);
    }
    
    
    public void updatewatchNumberByPrimaryKey(Integer id) {
         postMapper.updatewatchNumberByPrimaryKey(id);
    }
    public void reduceAgree(Integer id) {
    	postMapper.reduceAgree(id);
    }
    
    public void addAgree(Integer id) {
    	postMapper.addAgree(id);
    }

    @Transactional
    public int insert(Post post) {
        post.setUserUsername(userMapper.selectByPrimaryKey(post.getUserId()).getUsername());
        post.setCreateTime(new Date());
        return postMapper.insertAndSelectID(post);
    }

    @Transactional
    public int update(Post post) {
        return postMapper.updateByPrimaryKeySelective(post);
    }

    /**
     * 发表帖子,并返回帖子ID
     *
     * @param post
     * @param userId
     * @return
     */
    @Transactional
    public ValidationResponse create(Post post, Integer userId) {
        post.setUserId(userId);
        post.setContent(HtmlUtils.htmlEscape(post.getContent()));
        int n = insert(post);
        if (n > 0) {
            ValidationResponse res = ResponseUtil.successValidation(MessageConstants.POST_CREATE_SUCCESS);
            res.addData("id", post.getId());
            return res;
        }
        return ResponseUtil.successValidation(MessageConstants.POST_CREATE_FAIL);
    }
}
