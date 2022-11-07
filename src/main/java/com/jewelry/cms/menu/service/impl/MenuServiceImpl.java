package com.jewelry.cms.menu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.cms.menu.domain.MenuTO;
import com.jewelry.cms.menu.domain.MenuVO;
import com.jewelry.cms.menu.mapper.MenuMapper;
import com.jewelry.cms.menu.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<MenuVO> getMenuList(MenuTO to) {
		return menuMapper.selectMenuList(to);
	}
	
}
