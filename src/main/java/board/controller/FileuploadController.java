package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import board.model.BoardDTO;
import board.model.JDBCTemplateDAO;
import member.model.MemberVO;

@Controller
public class FileuploadController {
	
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}
		
	/*
	파일업로드 처리
		: 파일업로드는 Post방식으로 전송해야 하므로 매핑시 method, value두가지
		속성을 모두 기술해야 한다. 
	*/
	@RequestMapping(method=RequestMethod.POST, value="/reviewUploadAction.do")
	//파일업로드를 위한 객체를 매개변수로 선언한다. 
	public String uploadAction(Model model, HttpSession session, MultipartHttpServletRequest req) {
		
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		
		
		JDBCTemplateDAO dao=new JDBCTemplateDAO();
		BoardDTO dto = new BoardDTO();
		MemberVO vo=new MemberVO();
		
		
		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		MultipartFile mfile = null;
		//파일정보를 저장한 Map컬렉션을 2개이상 저장하기 위한 용도의 List컬렉션
		List<String> resultList = new ArrayList<String>();	
		try {
					
			//업로드폼의 file속성의 필드를 가져온다.(여기서는 2개임)
			Iterator itr = req.getFileNames();
			
			//int index=0;
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
				
				//dto.("setUserfile"+index)(saveFileName);
				//dto.setUserfile1(saveFileName);
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장
				mfile.transferTo(new File(path + File.separator + saveFileName));
				
				//폼값과 파일명을 저장할 Map컬렉션 생성
				Map<String, String> fileMap = new HashMap<String, String>();	
				
				//원본파일명, 저장된파일명, 제목을 저장한다. 
//				fileMap.put("originalName", originalName); 
//				fileMap.put("saveFileName", saveFileName); 
//				fileMap.put("tag", tag); 
//				fileMap.put("contents", contents);
//				fileMap.put("title", title);
//				fileMap.put("id", id);
				
				//하나의 파일정보를 저장한 Map을 List에 저장한다.(현재 파일 2개임)
				resultList.add(saveFileName);
				//fileMap.put("saveFileName","userfile"+index);
				//index++;
				//dao.reviewWrite(dto);				
			}
		}		 
		catch(Exception e) {
			e.printStackTrace();
		}
			
		//나머지 폼값 받기
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String tag = req.getParameter("tag");
		String id=req.getParameter("id");
		
		//폼값받아넣기
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setTag(tag);
		dto.setId(id);
		
		
		int exist = 1;
		for(String obj : resultList) {
			//dto.setUserfile1(resultList.get(0));
			
			if(exist==1) dto.setUserfile1(obj);
			else if(exist==2) dto.setUserfile2(obj);
			else if(exist==3) dto.setUserfile3(obj);
			else if(exist==4) dto.setUserfile4(obj);
			else if(exist==5) dto.setUserfile5(obj);
			
			exist++;
		}
		
		
		dao.reviewWrite(dto);
		
		model.addAttribute("resultList", resultList);	
		return "redirect:reviewList.do?nowPage=1";
	}
	
	
	
	
	
	//파일업로드를 위한 객체를 매개변수로 선언한다. 
	@RequestMapping(method=RequestMethod.POST, value="/reviewEditAction.do")
	public String reviewEditAction(Model model, MultipartHttpServletRequest req) {
		
		JDBCTemplateDAO dao=new JDBCTemplateDAO();
		BoardDTO dto = new BoardDTO();
		
		
		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		MultipartFile mfile = null;
		//파일정보를 저장한 Map컬렉션을 2개이상 저장하기 위한 용도의 List컬렉션
		List<String> resultList = new ArrayList<String>();	
		try {
					
			//업로드폼의 file속성의 필드를 가져온다.(여기서는 2개임)
			Iterator itr = req.getFileNames();
			
			//int index=0;
			//갯수만큼 반복
			while(itr.hasNext()) {
				//전송된 파일명을 읽어온다. 
				mfile = req.getFile(itr.next().toString());
				
				//한글깨짐방지 처리 후 전송된 파일명을 가져온다. 
				String originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				
				
				
				
					String editFile1=req.getParameter("editFile1");
					String editFile2=req.getParameter("editFile2");
					String editFile3=req.getParameter("editFile3");
					String editFile4=req.getParameter("editFile4");
					String editFile5=req.getParameter("editFile5");//에러x
					
					
					if(editFile1!=null)dto.setUserfile1(editFile1);
					if(editFile2!=null)dto.setUserfile2(editFile2);
					if(editFile3!=null)dto.setUserfile3(editFile3);
					if(editFile4!=null)dto.setUserfile4(editFile4);
					if(editFile5!=null)dto.setUserfile5(editFile5);
					
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
				
				resultList.add(saveFileName);
				
			}
			
			//나머지 폼값 받기
			String title = req.getParameter("title");
			String contents = req.getParameter("contents");
			String tag = req.getParameter("tag");
			String id=req.getParameter("id");
			model.addAttribute("idx", req.getParameter("idx"));
			String idx_1 = req.getParameter("idx");
			int idx=Integer.parseInt(idx_1);
			
			
			
			
			//폼값받아넣기
			dto.setTitle(title);
			dto.setContents(contents);
			dto.setTag(tag);
			dto.setId(id);
			dto.setIdx(idx);
			
			System.out.println("dto: "+dto.getTitle());
			System.out.println("dto: "+dto.getId());
			System.out.println("dto: "+dto.getContents());
			System.out.println("idx: "+dto.getIdx());
			System.out.println("dto: "+dto.getTag());
			//System.out.println("dto의 idx: "+idx);
			
			int exist = 1;
			for(String obj : resultList) {
				//dto.setUserfile1(resultList.get(0));
				
				if(exist==1) dto.setUserfile1(obj);
				else if(exist==2) dto.setUserfile2(obj);
				else if(exist==3) dto.setUserfile3(obj);
				else if(exist==4) dto.setUserfile4(obj);
				else if(exist==5) dto.setUserfile5(obj);
				
				exist++;
			}
			dao.reviewEditAction(dto);	
		}		 
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("resultList", resultList);	
		//return "redirect:reviewList.do?nowPage=1";
		return "redirect:reviewView.do"; 
	}
	
	
 
}
