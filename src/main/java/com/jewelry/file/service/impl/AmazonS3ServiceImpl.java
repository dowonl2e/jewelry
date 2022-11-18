package com.jewelry.file.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.S3Object;
import com.jewelry.file.domain.FileTO;
import com.jewelry.file.service.AmazonS3Service;

@Service
public class AmazonS3ServiceImpl implements AmazonS3Service {

	@Autowired
    private AmazonS3Client amazonS3Client;

    @Value("${cloud.aws.s3.bucket}")
    private String bucketname;
    
	@Override
	public FileTO upload(MultipartFile file, String path, String refinfo) throws IOException, SdkClientException, AmazonServiceException {
		FileTO fileto = new FileTO();
		if(file != null) {
			ObjectMetadata objectMetadata = new ObjectMetadata();
			
			Map<String, String> metadata = new HashMap<>();
	        metadata.put("Content-Type", file.getContentType());
	        metadata.put("Content-Length", String.valueOf(file.getSize()));
	        
	        String bucketpath = String.format("%s/%s", bucketname, path);
	        String originalname = String.format("%s", file.getOriginalFilename() == null ? "" : file.getOriginalFilename());
	        String filename = String.format("%s", UUID.randomUUID());
	        String fileext = originalname.substring(originalname.lastIndexOf(".") + 1);
	        
	        if(!ObjectUtils.isEmpty(originalname)) {
		        Optional.of(metadata).ifPresent(map -> {
		            if (!map.isEmpty()) {
		                map.forEach(objectMetadata::addUserMetadata);
		            }
		        });
				
		        // Uploading file to s3
		        PutObjectResult putObjectResult = amazonS3Client.putObject(bucketpath, filename, file.getInputStream(), objectMetadata);
				
		        fileto.setFile_path(path);
		        fileto.setOrigin_nm(originalname);
		        fileto.setFile_nm(filename);
		        fileto.setFile_ext(fileext);
		        fileto.setFile_ord(1);
		        fileto.setRef_info(refinfo);
		        fileto.setFile_size(file.getSize());
		        if(putObjectResult != null && putObjectResult.getMetadata() != null)
		        	fileto.setVersion_id(putObjectResult.getMetadata().getVersionId());
	        }
		}
        return fileto;
    }

	@Override
	public S3Object download(String path, String fileName) {
//		FileMeta fileMeta = fileMetaRepository.findById(id).orElseThrow(() -> new EntityNotFoundException());
//        return amazonS3Service.download(fileMeta.getFilePath(),fileMeta.getFileName());
        return amazonS3Client.getObject(path, fileName);
	}
	

}