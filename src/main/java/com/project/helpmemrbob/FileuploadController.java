package com.project.helpmemrbob;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileuploadController {
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}
		
	
	@RequestMapping(method=RequestMethod.POST, value="/fileUpload/uploadAndroid.do")
	@ResponseBody
	public List<Object> uploadAnroid(Model model, MultipartHttpServletRequest req) {
		
		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		MultipartFile mfile = null;
		//파일정보를 저장한 Map컬렉션을 2개이상 저장하기 위한 용도의 List컬렉션
		List<Object> resultList = new ArrayList<Object>();			
		
		try {
			String title = req.getParameter("title");
			
			//업로드폼의 file속성의 필드를 가져온다.(여기서는 2개임)
			Iterator itr = req.getFileNames();
			//갯수만큼 반복
			while(itr.hasNext()) {
				//전송된 파일명을 읽어온다. 
				mfile = req.getFile(itr.next().toString());
				
				//한글깨짐방지 처리 후 전송된 파일명을 가져온다. 
				String originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				
				//서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. 
				if("".equals(originalName)) continue;
				
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				
				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다. 
				String saveFileName = getUuid() + ext;
				
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장
				mfile.transferTo(new File(path + File.separator + saveFileName));
				
				//폼값과 파일명을 저장할 Map컬렉션 생성
				Map<String, String> fileMap = new HashMap<String, String>();	
				
				//원본파일명, 저장된파일명, 제목을 저장한다. 
				fileMap.put("originalName", originalName); 
				fileMap.put("saveFileName", saveFileName); 
				fileMap.put("title", title); 
				
				//하나의 파일정보를 저장한 Map을 List에 저장한다.(현재 파일 2개임)
				resultList.add(fileMap);
			}
		}		 
		catch(Exception e) {
			e.printStackTrace();
		}
		
	//	model.addAttribute("resultList", resultList);	
		return resultList;
	}

}
