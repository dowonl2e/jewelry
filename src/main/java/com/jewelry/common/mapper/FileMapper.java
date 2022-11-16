package com.jewelry.common.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.common.s3.domain.FileTO;

@Mapper
public interface FileMapper {
	
	Long insertFile(FileTO to) throws Exception;
	
	int updateFile(FileTO to);
	
	int updateFileToDelete(FileTO to);
	
	int updateFileToDeleteWithRef(FileTO to);
}
