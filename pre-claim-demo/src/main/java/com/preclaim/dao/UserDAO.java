package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.UserDetails;
import com.preclaim.models.UserList;
import com.preclaim.models.UserRole;

public interface UserDAO {
	
	String create_user(UserDetails user);
	List<UserList> user_list();
	String deleteAdminUser(int user_id);
	String create_role(UserRole role);
	List<UserRole> role_lists();
	String updateUserRole(UserRole role);	
	String delete_role(UserRole role);
	String updateUserStatus(int user_id, int user_status);
	UserDetails getUserDetails(int user_id);
	String updateUserDetails(UserDetails user_details);
	List<String>	retrievePermission(int roleID);
	String addPermission(List<String> role_permission, int roleID);
	String accountValidate(String username);
	String updateProfile(UserDetails user_details);
	void activity_log(String moduleName,int moduleId,String moduleAction,int userId,String ip_address);
	String getUserRole(int roleId);
}
