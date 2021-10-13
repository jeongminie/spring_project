package com.jeongmini.project.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	private final String FILE_UPLOAD_PATH = "C:\\Users\\opooi\\OneDrive\\바탕 화면\\workspace\\Spring\\upload\\project\\images/";
//	private final String PROFILE_UPLOAD_PATH = "C:\\Users\\opooi\\OneDrive\\바탕 화면\\workspace\\Spring\\upload\\project\\profile/";
	
	private final String FILE_UPLOAD_PATH = "/home/ec2-user/upload_images/";
	private final String PROFILE_UPLOAD_PATH = "/home/ec2-user/upload_images/";
	
	public String saveFile(int userId, MultipartFile file) {
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			logger.error("[FileManagerService saveFile] 디렉토리 생성 실패");
			return null;
		}
		
		byte[] bytes;
		try {
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			logger.error("[FileManagerService saveFile] 파일 생성 실패");
			e.printStackTrace();
			return null;
		}
		
		
		return "/images/" + directoryName + file.getOriginalFilename();
	}
	
	public String saveProfile(int userId, MultipartFile file) {
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = PROFILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			logger.error("[FileManagerService saveFile] 디렉토리 생성 실패");
			return null;
		}
		
		byte[] bytes;
		try {
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			logger.error("[FileManagerService saveFile] 파일 생성 실패");
			e.printStackTrace();
			return null;
		}
		
		
		return "/profile/" + directoryName + file.getOriginalFilename();
	}
	
	
	public void removeFile(String filePath) {
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		
		Path path = Paths.get(realFilePath);

		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[FileManagerService removeFile] 파일 삭제 실패");
				e.printStackTrace();
			}
		}
		
		path = path.getParent(); 
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[FileManagerService removeFile] directory delete fail");
				e.printStackTrace();
			}
		}
			
	}
}

