package com.learn.mycart.servlets;

import java.util.List;


import javax.validation.Valid;


import com.learn.mycart.entities.User;

public interface UserService {
	
//	User authenticateAdmin(String userName, String password);

	List<User> getAllUsers();

	void save(@Valid User user);

	List<User> findByName(String name);

	List<User> findByLoginName(String loginName);

	void changePassword(String userName, String currentPassword, String newPassword);

}
