/**
 * 
 */
package com.magicoh.springmvc.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magicoh.springmvc.dao.IUserMapperDao;
import com.magicoh.springmvc.dto.AddressVo;
import com.magicoh.springmvc.dto.CustomUser;
import com.magicoh.springmvc.dto.UserRole;
import com.magicoh.springmvc.dto.User;
import com.magicoh.springmvc.dto.UserSec;

import lombok.extern.slf4j.Slf4j;

/**
 * @author javateam
 *
 */
@Service
@Slf4j
public class AuthServiceImpl implements IAuthService {
	
	@Autowired
	//private SqlSession sqlSession;
	private IUserMapperDao userMapperDao;

	/**
	 * @see com.IAuthService.springSecuritySample1.service.AuthMyBatisService#hasUsername(java.lang.String)
	 */
	@Override
	public int hasUsername(String username) {

		log.info("AuthServiceImpl hasUsername() parmete : " + username);
		
		return userMapperDao.hasUsername(username);
	} 

	/**
	 * getUserByUsername
	 */
	public CustomUser getUserByUsername(String userName) {
		
		log.info("AuthServiceImpl getUserByUsername " + userName);
		
		CustomUser customUser = userMapperDao.getUserByUsername(userName);		

		//System.out.println("getUserByUsername getUserByUsername customUser.toString() : " + customUser.toString());
		
		return customUser;
	}

	/**
	 * getUserRole
	 */
	@Override
	public UserRole getUserRolesByUsername(String user_id) {
		UserRole userRole = userMapperDao.getUserRolesByUsername(user_id);
		//System.out.println("AuthServiceImpl getUserRolesByUsername() : " + role.toString());
		return userRole;
	}
	
	/**
	 * @see com.IAuthService.springSecuritySample1.service.AuthMyBatisService#insertUsers(com.javateam.springSecuritySample1.vo.Users, java.lang.String)
	 */
	@Override
	public void insertUserAndRole(CustomUser user, UserRole userRole) {

		log.info("AuthServiceImpl before insertUser() username is : " + user.getUser_id());
		
		//need transaction
		//insert user
		userMapperDao.insertUser(user);
		
		log.info("AuthServiceImpl userRole.getUser_id() : " + userRole.getUser_id());
		
		//insert user role
		userMapperDao.insertUserRole(userRole);

		log.info("AuthServiceImpl after insertRole()");
		
	}

	@Override
	public int getCountId(String id) {
		return userMapperDao.getCountIdById(id);
	}

	@Override
	public List<AddressVo> getAddressByDong(String dong) {
		List<AddressVo> AddressList = userMapperDao.getAddressByDong(dong);
		return AddressList;
	}

	@Override
	public CustomUser getMemberInfo(String user_id) {
		log.info("AuthServiceImpl getMemberInfo " + user_id);
		CustomUser customUser = userMapperDao.getUserByUsername(user_id);		
		return customUser;
	}

	


} 