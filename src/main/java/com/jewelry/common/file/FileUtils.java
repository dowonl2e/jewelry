package com.jewelry.common.file;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class FileUtils {
	/*
	public uploadFileToS3(MultipartFile[] multipartFileList) {
		for(MultipartFile multipartFile: multipartFileList) {
			String originalName = multipartFile.getOriginalFilename(); // 파일 이름
			long size = multipartFile.getSize(); // 파일 크기
			
			ObjectMetadata objectMetaData = new ObjectMetadata();
			objectMetaData.setContentType(multipartFile.getContentType());
			objectMetaData.setContentLength(size);
			
			// S3에 업로드
			amazonS3Client.putObject(
				new PutObjectRequest(S3Bucket, originalName, multipartFile.getInputStream(), objectMetaData)
					.withCannedAcl(CannedAccessControlList.PublicRead)
			);
			
			String imagePath = amazonS3Client.getUrl(S3Bucket, originalName).toString(); // 접근가능한 URL 가져오기
			imagePathList.add(imagePath);
		}
		
		return new ResponseEntity<Object>(imagePathList, HttpStatus.OK);
	}*/
}
