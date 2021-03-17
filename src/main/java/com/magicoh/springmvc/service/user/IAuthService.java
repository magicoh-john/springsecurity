/**
 * 
 */
package com.magicoh.springmvc.service.user;

import java.util.List;

import com.magicoh.springmvc.dto.AddressVo;
import com.magicoh.springmvc.dto.CustomUser;
import com.magicoh.springmvc.dto.UserRole;
import com.magicoh.springmvc.dto.User;

/**
 * 
 * @author admin
 *
 */
public interface IAuthService {
	
	int hasUsername(String username);
	void insertUserAndRole(CustomUser user, UserRole userRole);
	CustomUser getUserByUsername(String userName);
	UserRole getUserRolesByUsername(String user_id);
	int getCountId(String id);
	List<AddressVo> getAddressByDong(String dong);
	CustomUser getMemberInfo(String user_id);

} 