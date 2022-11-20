package com.jewelry.file.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.file.domain.FileTO;
import com.jewelry.file.domain.FileVO;

@Mapper
public interface FileMapper {

	Long insertFile(FileTO to) throws Exception;
	
	int updateFile(FileTO to);
	
	int updateFileToDelete(FileTO to);
	
	int updateFileToDeleteWithRef(FileTO to);
	
	List<FileVO> selectFileListByRefInfo(FileTO to);
	
	FileVO selectFileByRefInfo(FileTO to);
}
