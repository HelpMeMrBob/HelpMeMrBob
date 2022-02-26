package com.project.helpmemrbob;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import item.ItemDAO;
import item.ItemDTO;
import member.model.MemberVO;
import point.JdbcTemplateConst;
import point.PointDAO;
import point.PointDTO;

@Controller
public class EmoticonController {
	private JdbcTemplate template;
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired -> JDBCTemplate 연결 성공");
		
		JdbcTemplateConst.template = this.template;
	}
	
	private PointDAO dao;
	
	//이모티콘 디스플레이 페이지
	@RequestMapping("/emoticon/displayEmoticon.do")
	public String displayEmoticon() {
		return "emoticon/display";
	}
	//이모티콘 디스플레이 페이지
		@RequestMapping("/shop.do")
		public String shop(HttpServletRequest req, Model model) {
			//물리적경로 얻어오기
			String path = req.getSession().getServletContext().getRealPath("/resources/upload");
			//경로를 기반으로 파일객체 생성
			File file = new File(path);
			//파일의 목록을 배열 형태로 얻어옴
			File[] fileArray = file.listFiles();
			//View로 전달할 파일목록 저장을 위해 Map컬렉션 생성
			Map<String, Integer> fileMap = new HashMap<String, Integer>();		
			for(File f : fileArray){
				//key와 value로 파일명과 파일용량을 저장한다. 
				fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
			}
			
			model.addAttribute("fileMap", fileMap);		
			return "emoticon/shop";
		}
		
		
	//
		@RequestMapping("/buyProcess.do")
		public String realBuyProcess(HttpServletRequest request,  Model model, HttpSession session) {
			String sticker = request.getParameter("sticker");
			PointDAO pdao = new PointDAO();
			PointDTO pdto = new PointDTO();

			ItemDTO idto = new ItemDTO();
			ItemDAO idao = new ItemDAO();
			//원래 sessionId를 넣어야할 자리에 임으로 ptest를 넣어줌
			pdto.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
			
			pdto.setSticker(sticker);
			idto.setTemOname(sticker);
			//구매실행 
			pdao.buySticker(pdto,idto);
			/*
			 해당 pdto아이디의 getTotalPoint를 얻어온 다음, 
			 이를 pdto.setPoint로 이용해서 구매 이후의 포인트를 화면에 뿌릴 수 있음.
			 */
			pdto.setPoint(pdao.getTotalPoint(pdto.getId()));
			
			System.out.println("보유포인트1은 "+pdao.getTotalPoint(pdto.getId()));
			System.out.println("보유포인트2는"+ pdto.getPoint());
			
			model.addAttribute("pdao",pdao);
			model.addAttribute("pdto",pdto);
			
			return "emoticon/buyProcess";
		}
	//이모티콘 디스플레이 페이지
		@RequestMapping("/displayEmoticon2.do")
		public String displayEmoticon2() {
			return "/display2";
		}
	//이모티콘 구매과정
	@RequestMapping("/emoticon/buyProcess.do")
	public String buyProcess(HttpServletRequest request, PointDTO pdto, Model model) {
		//String pr = request.getParameter("pr"); //여기까지는 pr이 넘어오지만, model을 통해서는 pr값을 넘길 수 없음.
		//String sticker = request.getParameter("sticker"); //PointDAO에 정의되어있기때문에 pr이 넘어감
	
		model.addAttribute("pdto",pdto);
		
		return "emoticon/buyProcess";
	}
	
	//카카오페이 실행 연습페이지
	@RequestMapping("/emoticon/practice.do")
	public String payPractice() {
		return "emoticon/practice";
	}
	
	//카카오페이 실행 연습페이지
	@RequestMapping("/imKakaopayPage.do")
	public String kakaopayPage() {
		return "emoticon/imKakaopay";
	}
	//카카오페이 실행 연습페이지
	@RequestMapping("/oriKakaopayPage.do")
	public String kakaopayPageOri() {
		return "emoticon/oriKakaoPay";
	}
	
	//파일 업로드폼 매핑
	@RequestMapping("/uploadForm.do")
	public String itemUpload() {
		return "itemUpload/uploadForm";
	}
	
	//파일업로드를 위한 디렉토리의 물리적 경로 확인하기
	@RequestMapping("/uploadPath.do")
	//request, response내장객체를 사용하기위해 매개변수로 선언
	public void uploadPath(HttpServletRequest req, 
			HttpServletResponse resp) throws IOException {
			
		//request내장객체를 통해 서버의 물리적 경로 얻어옴
		String path = req.getSession().getServletContext()
				.getRealPath("/resources/upload");
			//upload디렉토리는 정적파일을 저장하기 위한 resources하위에 생성한다.
			
			//response내장객체를 통해 MIME타입을 설정한다. 
			resp.setContentType("text/html; charset=utf-8");
			//View를 호출하지 않고 컨트롤러에서 즉시 출력한다. 
			PrintWriter pw = resp.getWriter();
			pw.print("/upload 디렉토리의 물리적경로 : "+ path);
		}
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/uploadAction.do")
	//파일업로드를 위한 객체를 매개변수로 선언한다. 
	public String uploadAction(Model model, MultipartHttpServletRequest req, final ItemDTO idto) {
		ItemDAO idao = new ItemDAO();
		
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
				idto.setTemOname(originalName);
				//서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. 
				if("".equals(originalName)) continue;
				
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				
				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다. 
				String saveFileName = getUuid() + ext;
				idto.setTemSname(saveFileName);
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장
				mfile.transferTo(new File(path + File.separator + originalName));
				
				//폼값과 파일명을 저장할 Map컬렉션 생성
				Map<String, String> fileMap = new HashMap<String, String>();	
				
				//원본파일명, 저장된파일명, 제목을 저장한다. 
				fileMap.put("originalName", originalName); 
				fileMap.put("saveFileName", saveFileName); 
				fileMap.put("title", title); 
				
				//하나의 파일정보를 저장한 Map을 List에 저장한다.(현재 파일 2개임)
				resultList.add(fileMap);
				idao.adimnItem(idto);
			}
		}		 
		catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("resultList", resultList);	
		return "itemUpload/uploadAction";
	}
	//파일목록보기
		@RequestMapping("/uploadList.do")
		public String uploadList(HttpServletRequest req, Model model){
			//물리적경로 얻어오기
			String path = req.getSession().getServletContext().getRealPath("/resources/upload");
			//경로를 기반으로 파일객체 생성
			File file = new File(path);
			//파일의 목록을 배열 형태로 얻어옴
			File[] fileArray = file.listFiles();
			//View로 전달할 파일목록 저장을 위해 Map컬렉션 생성
			Map<String, Integer> fileMap = new HashMap<String, Integer>();		
			for(File f : fileArray){
				//key와 value로 파일명과 파일용량을 저장한다. 
				fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
			}
			
			model.addAttribute("fileMap", fileMap);				
			return "itemUpload/uploadList";
		}
	
	

	
}
