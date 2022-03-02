package admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdFoodDAO;
import admin.model.AdFoodDTO;
import admin.model.AdVSTalkDAO;
import admin.model.AdVSTalkDTO;

@Controller
public class FoodUploadController {
	
	@Autowired
	private AdFoodDAO dao;
	
	/*
	 UUID(Universally Unique Identifier)
	 	: 범용고유식별자. randomUUID()를 통해 문자열을 생성하면
	 	하이픈이 4개 포함된 32자의 랜덤하고 유니한 문자열이 생성된다.
	 	JDK에서 기본 클래스로 제공된다.
	 */
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된UUID-1:"+ uuid);
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}
	
	/*
	 파일 업로드 처리 
	 	: 파일 업로드는 Post방식으로 전송해야 하므로 매핑 시 method, value 두가지
	 	속성을 모두 기술해야 한다. 
	 */
	@RequestMapping(method=RequestMethod.POST, value="admin/foodAction.do")
	//MultipartHttpServletRequest req : 파일 업로드를 위한 객체를 매개 변수로 선언한다.
	public String foodAction(Model model, MultipartHttpServletRequest req) {
		
		System.out.println("파일 첨부 foodAction 실행");
		
		//물리적 경로 얻어오기
		String path = req.getSession().getServletContext()
				.getRealPath("/resources/foodUpload");
		
		//폼 값과 파일명을 저장할 Map컬렉션 생성
		Map<String, String> fileMap = new HashMap<String, String>();
		
		MultipartFile mfile =null;
		
		AdFoodDTO dto = new AdFoodDTO();
		
		String food = req.getParameter("food");
		String Lgroup = req.getParameter("Lgroup");
		String originalName = null, saveFileName = null;
		
		try {
				Iterator itr = req.getFileNames();
				
				//전송된 파일명을 읽어온다.
				mfile = req.getFile(itr.next().toString());
				//한글 깨짐 방지 처리 후 전송된 파일명을 가져온다. 
				originalName =
						new String(mfile.getOriginalFilename().getBytes(), "UTF-8");


				String ext = originalName.substring(originalName.lastIndexOf('.'));
				saveFileName = getUuid() + ext;
				
				mfile.transferTo(new File(path+File.separator+saveFileName));
			
				fileMap.put("originalName", originalName); //원본 파일명
				fileMap.put("saveFileName", saveFileName); //저장된 파일명
				fileMap.put("food", food); //음식 이름
				
				dto.setFood(food);
				dto.setImage(saveFileName);
				dto.setLgroup(Lgroup);
				
				System.out.println("dto:" + dto.getFood());
				System.out.println(dto.getImage());
				System.out.println(dto.getLgroup());								
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		dao.foodWrite(dto);
		model.addAttribute("fileMap", fileMap);
		
		return "redirect:food.do?nowPage=1";
	}
	
}
