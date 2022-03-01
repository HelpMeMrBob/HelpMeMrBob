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

import admin.model.AdVSTalkDAO;
import admin.model.AdVSTalkDTO;

@Controller
public class VSFileuploadController {
	
	@Autowired
	private AdVSTalkDAO dao;
	
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
	@RequestMapping(method=RequestMethod.POST, value="admin/uploadAction.do")
	//MultipartHttpServletRequest req : 파일 업로드를 위한 객체를 매개 변수로 선언한다.
	public String uploadAction(Model model, MultipartHttpServletRequest req) {
		
		System.out.println("파일 첨부 uploadAction 실행");
		
		//물리적 경로 얻어오기
		String path = req.getSession().getServletContext()
				.getRealPath("/resources/vsUpload");
		MultipartFile mfile =null;
		
		//파일 정보를 저장한 Map컬렉션을 2개 이상 저장하기 위한 용도의 리스트 컬렉션
		List<Object> resultList = new ArrayList<Object>();
		
		AdVSTalkDTO dto = new AdVSTalkDTO();
		String topic = req.getParameter("topic");
		String originalName = null, saveFileName = null; 
		
		try {
			
			//업로드 폼의 file속성의 필드를 가져온다. (여기서는 2개임)
			Iterator itr = req.getFileNames();
			//개수만큼 반복
			int num=1 ;
			while(itr.hasNext()) {
				//전송된 파일명을 읽어온다.
				mfile = req.getFile(itr.next().toString());
				//한글 깨짐 방지 처리 후 전송된 파일명을 가져온다. 
				originalName =
						new String(mfile.getOriginalFilename().getBytes(),
								"UTF-8");
				
				//originalName이 없다면 전송된 파일이 없다는 뜻.. 전송된 파일이 없다면 while문의 처음으로 돌아간다.
				if("".equals(originalName)) continue;

				//파일명이 제대로 확인이 됐다면..
				//파일명에서 확장자를 따낸다.
				String ext = originalName.substring(
						originalName.lastIndexOf('.'));
				//UUID를 통해 생성된 문자열과 확장자를 결합해 새로운 파일명을 완성. 
				saveFileName = getUuid() + ext;
				
				//물리적 경로에 새롭게 생성된 파일명으로 파일을 저장한다. 
				//separator : os별로 경로의 문자 처리를 하는..
				mfile.transferTo(new File(path+File.separator+saveFileName));
				
				//폼 값과 파일명을 저장할 Map컬렉션 생성
				Map<String, String> fileMap = new HashMap<String, String>();
				fileMap.put("originalName", originalName); //원본 파일명
				fileMap.put("saveFileName", saveFileName); //저장된 파일명
				fileMap.put("topic", topic); //제목 
				
				//하나의 파일 정보를 저장한 Map을 List에 저장한다. 
				resultList.add(fileMap);
				
				dto.setTopic(topic);
				
				for(Object r : resultList) {
					
					if(num ==1) {
					dto.setOfile1(originalName);
					dto.setSfile1(saveFileName);
					}
					else if(num ==2) {
					dto.setOfile2(originalName);
					dto.setSfile2(saveFileName);
					}
				}
				num++;
				System.out.println("topic:" + dto.getTopic());
				System.out.println("ofile1:" + dto.getOfile1());
				System.out.println("sfile1:" + dto.getSfile1());
				System.out.println("ofile2:" + dto.getOfile2());
				System.out.println("sfile2:" +dto.getSfile2());				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		dao.writeVS(dto);
		model.addAttribute("resultList", resultList);
		
		return "redirect:vsTalk.do?nowPage=1";
	}
	
	//수정 처리 
	@RequestMapping("/admin/editAction.do")
	public String editAction(MultipartHttpServletRequest req, 
							Model model, AdVSTalkDTO adVSTalkDTO) {
		
		System.out.println("vs수정을 위한 editAction 실행 ");
		
		/*
		 request 내장 객체와 수정 페이지에서 전송한 모든 폼 값을 저장한 
		 DTO객체를 Model에 저장한 후 서비스 객체로 전달한다. 
		 */
		model.addAttribute("req", req);
		model.addAttribute("adVSTalkDTO", adVSTalkDTO);

		//물리적 경로 얻어오기
		String path = req.getSession().getServletContext()
				.getRealPath("/resources/vsUpload");
			
		MultipartFile mfile = null;
		
		//파일 정보를 저장한 Map컬렉션을 2개 이상 저장하기 위한 용도의 리스트 컬렉션
		List<Object> resultList = new ArrayList<Object>();

		//String topic = req.getParameter("topic");
		String originalName = null, saveFileName = null; 
		
		try {
			//업로드 폼의 file속성의 필드를 가져온다. (여기서는 2개임)
			Iterator itr = req.getFileNames();

			//if문 이용
			int num=1 ;
			//개수만큼 반복
			while(itr.hasNext()) {
				//전송된 파일명을 읽어온다.
				mfile = req.getFile(itr.next().toString());
				//한글 깨짐 방지 처리 후 전송된 파일명을 가져온다. 
				originalName =
						new String(mfile.getOriginalFilename().getBytes(),
								"UTF-8");
				
				//originalName이 없다면 전송된 파일이 없다는 뜻.. 전송된 파일이 없다면 while문의 처음으로 돌아간다.
				if("".equals(originalName)) continue;

					//파일명이 제대로 확인이 됐다면..
					//파일명에서 확장자를 따낸다.
					String ext = originalName.substring(
							originalName.lastIndexOf('.'));
					//UUID를 통해 생성된 문자열과 확장자를 결합해 새로운 파일명을 완성. 
					saveFileName = getUuid() + ext;
					
					//물리적 경로에 새롭게 생성된 파일명으로 파일을 저장한다. 
					//separator : os별로 경로의 문자 처리를 하는..
					mfile.transferTo(new File(path+File.separator+saveFileName));
					
					//폼 값과 파일명을 저장할 Map컬렉션 생성
					Map<String, String> fileMap = new HashMap<String, String>();
					fileMap.put("originalName", originalName); //원본 파일명
					fileMap.put("saveFileName", saveFileName); //저장된 파일명
					//fileMap.put("topic", topic); //제목 
					
					//하나의 파일 정보를 저장한 Map을 List에 저장한다. 
					resultList.add(fileMap);
					//dto.setTopic(topic);
					
					for(Object r : resultList) {
						
						if(num ==1) {
						adVSTalkDTO.setOfile1(originalName);
						adVSTalkDTO.setSfile1(saveFileName);
						}
						else if(num ==2) {
						adVSTalkDTO.setOfile2(originalName);
						adVSTalkDTO.setSfile2(saveFileName);
						}
					}
					num++;
					
					System.out.println("topic:" + adVSTalkDTO.getTopic());
					System.out.println("ofile1:" + adVSTalkDTO.getOfile1());
					System.out.println("sfile1:" + adVSTalkDTO.getSfile1());
					System.out.println("ofile2:" + adVSTalkDTO.getOfile2());
					System.out.println("sfile2:" +adVSTalkDTO.getSfile2());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		dao.edit(adVSTalkDTO);
		
		//수정 후 상세 페이지로 이동
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		System.out.println(req.getParameter("nowPage"));
		
		return "redirect:vsView.do";
	}
}
