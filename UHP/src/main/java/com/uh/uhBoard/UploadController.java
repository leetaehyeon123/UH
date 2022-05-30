package com.uh.uhBoard;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.PathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;




@Controller
public class UploadController {
	
	
	// 업로드된 파일이 저장될 위치 입니다.

		private final String PATH = "C:/Users/harry/OneDrive/바탕 화면/융프/UHP/UHP/src/main/webapp/resources/imgs/upload_img/";

		// json 데이터로 응답을 보내기 위한
		@Autowired
		MappingJackson2JsonView jsonView;

		@RequestMapping(value = "/uploadForm.do")
		public String uploadForm() throws Exception {
			return "uploadForm";
		}

		@RequestMapping(value = "/upload.do", method = RequestMethod.POST, produces = "text/plain")
		public ModelAndView upload(MultipartHttpServletRequest request) throws Exception {
			String PATH2 = request.getSession().getServletContext().getRealPath("/resources/imgs/upload_img/");
			File dir = new File(PATH); 
            File[] fileList =dir.listFiles();
			// 응답용 객체를 생성하고, jsonView 를 사용하도록 합니다.
			ModelAndView model = new ModelAndView();
			model.setView(jsonView);

			Iterator itr =  request.getFileNames();

			if (itr.hasNext()) {
				List mpf = request.getFiles((String) itr.next());
				// 임시 파일을 복사한다.
				for (int i = 0; i < mpf.size(); i++) {

					File file = new File(PATH + fileList.length+((MultipartFile) mpf.get(i)).getOriginalFilename());
					File file2 = new File(PATH2 + fileList.length+((MultipartFile) mpf.get(i)).getOriginalFilename());

					((MultipartFile) mpf.get(i)).transferTo(file);
					((MultipartFile) mpf.get(i)).transferTo(file2);

				}

				// 업로드된 파일이 있을경우 응답입니다.
				JSONObject json = new JSONObject();
				json.put("code", "true");
				model.addObject("result", json);
				return model;

			} else {

				// 파일이 없을 경우 응답 입니다.
				JSONObject json = new JSONObject();
				json.put("code", "false");
				model.addObject("result", json);
				return model;

			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	   @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	    public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) { 
	        //파일이 저장될 path 설정 
	        // String path = req.getSession().getServletContext().getRealPath("") + "\\resources";    // 웹프로젝트 경로 위치
	        String path = req.getSession().getServletContext().getRealPath("/resources/imgs/upload_img/");
	        String path2 =  "C:/Users/harry/OneDrive/바탕 화면/융프/UHP/UHP/src/main/webapp/resources/imgs/upload_img/";
	        
	        System.out.println("path : " + path);
	        
	        Map returnObject = new HashMap(); 
	        try { 
	            // MultipartHttpServletRequest 생성 
	            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
	            Iterator iter = mhsr.getFileNames(); 
	            MultipartFile mfile = null; 
	            String fieldName = ""; 
	            List resultList = new ArrayList(); 
	            
	            // 디레토리가 없다면 생성 
	            File dir = new File(path); 
	            File[] fileList =dir.listFiles();
	            if (!dir.isDirectory()) { 
	                dir.mkdirs(); 
	            } 
	        
	            
	            // 값이 나올때까지 
	            while (iter.hasNext()) { 
	                fieldName = (String) iter.next(); // 내용을 가져와서 
	                mfile = mhsr.getFile(fieldName); 
	                String origName; 
	                origName = fileList.length+ new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
	                
	                System.out.println("origName: " + origName);
	                // 파일명이 없다면 
	                if ("".equals(origName)) {
	                    continue; 
	                } 
	                
	                // 파일 명 변경(uuid로 암호화) 
//	                String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
//	                String saveFileName = getUuid() + ext;
	                String saveFileName = origName;
	                
	                System.out.println("saveFileName : " + saveFileName);
	                
	                // 설정한 path에 파일저장 
	                File serverFile = new File(path + File.separator + saveFileName);
	                mfile.transferTo(serverFile);
	                File serverFile2 = new File(path2 + File.separator + saveFileName);
	                mfile.transferTo(serverFile2);
	                Map file = new HashMap();
	                file.put("origName", origName); file.put("sfile", serverFile);
	                resultList.add(file);
	            }
	            
	            returnObject.put("files", resultList); 
	            returnObject.put("params", mhsr.getParameterMap()); 
	            } catch (UnsupportedEncodingException e) { 
	                // TODO Auto-generated catch block 
	                e.printStackTrace(); 
	            }catch (IllegalStateException e) { // TODO Auto-generated catch block 
	                e.printStackTrace();
	            } catch (IOException e) { // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        
	            return null;
	    }
	    
	    //uuid생성
	    public static String getUuid() { 
	        return UUID.randomUUID().toString().replaceAll("-", "");
	    }



}

