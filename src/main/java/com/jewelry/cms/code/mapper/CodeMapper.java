package com.jewelry.cms.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;

@Mapper
public interface CodeMapper {
	
	Integer selectCodeListCount(CodeTO to);
	
	List<CodeVO> selectCodeList(CodeTO to);

	CodeVO selectCode(String cdid);
	
	int insertCode(CodeTO to);
	
	int updateCode(CodeTO to);
	
	int deleteCode(String cdid);
	
	List<CodeVO> selectCodeListByUpCdId(CodeTO to);
	
	List<CodeVO> selectCodeListByUpCdIdArr(CodeTO to);

}
