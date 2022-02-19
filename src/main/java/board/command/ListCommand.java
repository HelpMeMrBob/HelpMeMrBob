
package board.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.model.BoardDTO;
import board.model.JDBCTemplateDAO;
import board.util.EnvFileReader;
import board.util.PagingUtil;


public class ListCommand implements BbsCommandImpl{

	@Override
	public void execute(Model model) {

		System.out.println("ListCommand>execute()호출");
	
		Map<String, Object> paramMap=model.asMap();
		//현재 Object형으로 저장된 request객체를 원래의 형으로 형변환해준다. 
		HttpServletRequest req=
				(HttpServletRequest)paramMap.get("req");
		
		//DAO객체 생성
		JDBCTemplateDAO dao = new JDBCTemplateDAO();
		
		//검색어 처리
		String addQueryString="";
		//request내장객체를 통해 폼값을 받아온다.
		String searchColumn=req.getParameter("searchColumn");
		String searchWord=req.getParameter("searchWord");
		if(searchWord!=null){
			//검색어가 있는 경우 쿼리스트링 추가
			addQueryString = String.format("searchColumn=%s"
					+"&searchWord=%s&", searchColumn, searchWord);
			
			//DAO로 전달할 데이터를 Map컬렉션에 저장
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}
		
		//전체 레코드 수 카운트하기
		int totalRecordCount=dao.getTotalCount(paramMap);
		/*************페이징 추가코드*************/
		int pageSize=Integer.parseInt(
				EnvFileReader.getValue("SpringBbsInit.properties",
						"springBoard.pageSize"));
		int blockPage=Integer.parseInt(
				EnvFileReader.getValue("SpringBbsInit.properties",
						"springBoard.blockPage"));
		//전체 페이지수를 계산
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
		//현재 페이지번호. 첫진입일때는 무조건 1페이지로 지정
		int nowPage=req.getParameter("nowPage")==null? 1 :
			Integer.parseInt(req.getParameter("nowPage"));
		//리스트에 출력할 게시물의 구간을 계산(select절의 between에 사용)
		int start=(nowPage-1)*pageSize+1;
		int end=nowPage*pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);

		/*********페이징추가코드 E***************/
		
		//페이징 적용된 쿼리문을 통한 select(페이징O)
		ArrayList<BoardDTO> listRows=dao.listPage(paramMap);
	
		//목록에 출력할 게시물의 가상번호 계산하여 부여하기
		int virtualNum=0;
		int countNum=0;
		for(BoardDTO row: listRows) {
			
			/****************가상번호 계산 추가코드 S**********************/
			virtualNum=totalRecordCount
					-(((nowPage-1)*pageSize)+countNum++);
			row.setVirtualNum(virtualNum);
			/****************가상번호 계산 추가코드 E**********************/

			//가상번호를 setter를 통해 저장
			row.setVirtualNum(virtualNum);
		}
		//위에서 처리한 목록의 모든 처리결과를 Model객체에 저장한다.
		model.addAttribute("listRows",listRows);
		/***************페이징 처리 코드S*****************/
		String pagingImg=PagingUtil.pagingImg(totalRecordCount,
				pageSize, blockPage,nowPage,
				req.getContextPath()+"/reviewList.do?"+addQueryString);
		
		model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("totalPage",totalPage);//전체페이지수
		model.addAttribute("nowPage",nowPage);//현재페이지번호
		/***************페이징 처리 코드E*****************/

		//JdbcTemplate을 사용할 때는 자원반납은 하지 않는다.
		//dao.close();
	}
}
