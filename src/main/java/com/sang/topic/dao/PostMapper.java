package com.sang.topic.dao;

import com.sang.topic.common.entity.Post;

public interface PostMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);
    
    void updatewatchNumberByPrimaryKey(Integer id);


    int selectCount();

    int selectCountByTopic(Integer id);

    int insertAndSelectID(Post record);
    
    int selectCountByKeyWords(String keywords);

    int updateCommentsNumberByPrimaryKey(Integer id);
    
    void reduceAgree(Integer id);
    
    void addAgree(Integer id);
    
    
}