package com.jeongmini.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jeongmini.project.common.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:\\Users\\opooi\\OneDrive\\바탕 화면\\workspace\\Spring\\upload\\project\\images/");
		
		registry.addResourceHandler("/profile/**")
		.addResourceLocations("file:///C:\\Users\\opooi\\OneDrive\\바탕 화면\\workspace\\Spring\\upload\\project\\profile/");
	}
	
	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		registry.addInterceptor(interceptor).addPathPatterns("/**")
		.excludePathPatterns("/static/**", "/user/sign_out", "/user/myPage", "/user//mypet_view");
	}

}
