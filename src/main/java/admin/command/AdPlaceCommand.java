package admin.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdPlaceDAO;
import admin.model.AdPlaceDTO;
import util.EnvFileReader;
import util.PagingUtil;

@Service
public class AdPlaceCommand implements AdminCommandImpl{
	
	@Autowired
	AdPlaceDAO dao;
	public AdPlaceCommand() {
		System.out.println("AdPlaceCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("AdPlaceCommand -> execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		//검색어 처리
		String addQueryString = "";
		//request내장객체를 통해 폼 값을 받아온다.
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord!=null) {//검색어가 있는 경우..
			//쿼리스트링 추가
			addQueryString = String.format("searchColumn=%s", "&searchWord=%s&", searchColumn, searchWord);
			
			//DAO쪽으로 전달할 데이터를 Map컬렉션에 저장한다. 
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}
		
		//전체 게시물의 개수 카운트
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		/***페이징 추가 코드 start***/
		int pageSize = Integer.parseInt(
				EnvFileReader.getValue("AdmemberList.properties", "memberList.pageSize"));
		int blockPage = Integer.parseInt(
				EnvFileReader.getValue("AdmemberList.properties", "memberList.blockPage"));
		
		//전체 페이지 수를 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//현재 페이지 번호. 첫 진입일 때는 무조건 1페이지로 지정
		int nowPage = 
			(req.getParameter("nowPage")== null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//리스트에 출력할 게시물의 구간을 계산(select절의 between에 사용)
		int start = (nowPage-1) * pageSize + 1 ;
		int end = nowPage * pageSize;
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		/***페이징 추가 코드 end***/
		
		//페이징 적용된 쿼리문을 통한 select(페이징O)
		ArrayList<AdPlaceDTO> lists = dao.placeList(paramMap);
		
		//목록에 출력할 게시물의 가상 번호 계산 후 부여하기
		int virtualNum=0;
		int countNum=0;
		for(AdPlaceDTO row : lists) {
			//전체 게시물의 개수에서 하나씩 차감하며 가상 번호를 부여한다.(페이징x)
			//virtualNum = totalRecordCount--;
			
			/***가상번호 계산 추가 코드 start***/
			virtualNum=totalRecordCount
					-(((nowPage-1)*pageSize)+countNum++);
			/***가상번호 계산 추가 코드 end***/
			
			//가상 번호를 setter를 통해 저장
			row.setVirtualNum(virtualNum);
						
			String pagingImg = PagingUtil.pagingImg(totalRecordCount,
					pageSize, blockPage, nowPage,
					req.getContextPath()+"/admin/place.do?");
			
			model.addAttribute("pagingImg", pagingImg);
			model.addAttribute("totalPage", totalPage); //전체 페이지 수 
			model.addAttribute("nowPage", nowPage); //현재 페이지 번호
			
			//위에서 처리한 목록의 모든 처리결과를 Model객체에 저장한다.
			model.addAttribute("lists", lists);
		
		}
	}
}
