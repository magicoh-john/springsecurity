package com.magicoh.springmvc.dao;

import java.util.List;

import com.magicoh.springmvc.dto.AddressVo;
import com.magicoh.springmvc.dto.CustomUser;
import com.magicoh.springmvc.dto.UserRole;
import com.magicoh.springmvc.dto.UserSec;

/**
 * mapper
 * @author javateam
 */
@MyMapper 
public interface IUserMapperDao {
	
	public CustomUser getUserByUsername(String userName);
	//public UserRole getUserRolesByUsername(String userName);
	public int hasUsername(String username);
	//public CustomUser loadUserByUsername(String userName);
	public UserRole getUserRolesByUsername(String user_id);
	public int getCountIdById(String userName);
	public void insertUser(CustomUser user);
	public void insertUserRole(UserRole userRole);
	public List<AddressVo> getAddressByDong(String dong);

}