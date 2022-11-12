package com.jewelry.vender;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.vender.service.VenderService;

@RestController
@RequestMapping("/api/vender")
public class VenderApiController {

	@Autowired
	private VenderService venderService;
	
	@Autowired
	private HttpSession session;
	
}
