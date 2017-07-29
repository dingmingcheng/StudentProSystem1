package com.system.dao;

import java.util.List;

import com.system.bean.User;

public interface UserDao {
	public int insertintoUser(User x);
	public User selectbyname(String username);
}
