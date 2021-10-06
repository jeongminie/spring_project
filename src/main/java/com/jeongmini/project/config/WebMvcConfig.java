package com.jeongmini.project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:\\Users\\opooi\\OneDrive\\바탕 화면\\workspace\\Spring\\upload\\project\\images/");
		
		registry.addResourceHandler("/profile/**")
		.addResourceLocations("file:///C:\\Users\\opooi\\OneDrive\\바탕 화면\\workspace\\Spring\\upload\\project\\profile/");
	}
	

}
