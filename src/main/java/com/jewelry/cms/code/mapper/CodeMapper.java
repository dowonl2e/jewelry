package com.jewelry.cms.code.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;

@Mapper
public interface CodeMapper {
	
	int selectCodeListCount(CodeTO to);
	
	List<CodeVO> selectCodeList(CodeTO to);

	CodeVO selectCode(String cdid);
	
	int insertCode(CodeTO to) throws Exception;
	
	int updateCode(CodeTO to) throws Exception;
	
	int deleteCode(String cdid) throws Exception;
	
	List<CodeVO> selectCodeListByUpCdId(CodeTO to);
	
	List<CodeVO> selectCodeListByUpCdIdArr(CodeTO to);

	List<CodeVO> selectSubCodeList(CodeTO to);

}
