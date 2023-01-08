package com.jewelry.cms.auth.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.cms.auth.domain.AuthMenuTO;
import com.jewelry.cms.auth.domain.AuthMenuVO;

@Mapper
public interface AuthMapper {
		
	List<AuthMenuVO> selectUserAuthMenuList(AuthMenuTO to);

	int insertUserAuthMenu(AuthMenuTO to) throws Exception;
	int insertUserAuthMenus(List<AuthMenuTO> to) throws Exception;

	Integer selectUserAuthMenuExistCnt(AuthMenuTO to);
	
	List<AuthMenuVO> selectUserAuthMenusWithUserId(String userId);
	
	int updateUserAuthMenu(AuthMenuTO to) throws Exception;
	int updateUserAuthMenus(List<AuthMenuTO> to) throws Exception;
	
	List<AuthMenuVO> selectUserAuthMenus(AuthMenuTO to);
}
