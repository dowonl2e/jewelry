package com.jewelry.file;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/file")
public class FileController {
	
	@GetMapping("/image/display")
	public ResponseEntity<byte[]> getFile(String fileName){

	    ResponseEntity<byte[]> result = null;
	    
	    /*
	    try{
	        String srcFileName = URLDecoder.decode(fileName,"UTF-8");
	        log.info("filename : "+srcFileName);
	        File file = new File(uploadPath + File.separator + srcFileName);
	        log.info("file : "+file);
	        HttpHeaders header = new HttpHeaders();
	
	        //MIME 타입 처리
	        header.add("Content-Type", Files.probeContentType(file.toPath()));
	        //File객체를 Path로 변환하여 MIME 타입을 판단하여 HTTPHeaders의 Content-Type에  값으로 들어갑니다.
	
	        //파일 데이터 처리 *FileCopyUtils.copy 아래에 정리
	        //new ResponseEntity(body,header,status)
	        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
	        
	    }catch (Exception e){
	        log.error(e.getMessage());
	        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	    */
	    
	    return result;
    }
	    
}
