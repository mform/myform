package com.sang.topic.dao;

import com.sang.topic.common.entity.Topic;
import com.sang.topic.common.entity.User;

import java.util.List;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);

    List<Topic> selectAll();

    List<Topic> selectAllOpen();
    
    List<User> selectOrderUsers();
}