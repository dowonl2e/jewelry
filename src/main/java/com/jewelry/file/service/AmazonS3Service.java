package com.jewelry.file.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.S3Object;
import com.jewelry.file.domain.FileTO;

public interface AmazonS3Service {
	
	FileTO upload(MultipartFile files, String path, String refinfo) throws IOException;

    S3Object download(String path, String fileName);
    
}
