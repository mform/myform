package com.sang.topic.dao;

import com.sang.topic.common.entity.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int selectCount();

    List<User> selectByUsername(String username);

    List<User> selectByUsernameAndPassword(User record);
}