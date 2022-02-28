package recommand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import recommand.model.RecommandDAO;
import recommand.model.RecommandDTO;

@Controller
public class RecommandRestAPIController {
	
	@Autowired
	private SqlSession sqlSession3;
	
	@RequestMapping("/worldcupData.do")
	@ResponseBody
	public ArrayList<RecommandDTO> worldcupList(Model model, RecommandDTO recommandDTO) {
		
		ArrayList<RecommandDTO> menu64 = sqlSession3.getMapper(RecommandDAO.class)
				.listData(recommandDTO);
		
		System.out.println("menu64 개수 : "+ menu64.size());
		
		return menu64;
	}
	
	public void randomCreate(int[] arrParam) {
		
		//난수생성을 위한 씨드설정
		Random rnd = new Random();
		rnd.setSeed(System.currentTimeMillis());

		/*
		난수생성 방법1:
			1]난수 10개를 우선 생성한후 배열에 담아준다.
			2]배열 전체를 대상으로 중복확인을 한다.
			3]만약 중복되는 요소가 발견되면 다시 1번으로 돌아가서 난수를
			생성한다.
			4]중복되는 요소가 없다면 함수를 종료하고 메인으로 돌아간다.
		 */
		while(true) {

			//1.난수10개 생성후 배열담기
			for(int i=0 ; i<arrParam.length ; i++) {
				arrParam[i] = rnd.nextInt(99) + 1;//1~99까지의 정수 생성
			}

			//2.중복확인
			boolean rndFlag = false;/*중복체크를 위한 변수(false라면 중복된
				난수가 없는경우이고, 중복된 난수가 발견된다면 true로
				값을 변경할것임 */

			for(int i=0 ; i<arrParam.length ; i++) {
				for(int j=0 ; j<arrParam.length ; j++) {
					/*
					비교의 조건은 인덱스i와 인덱스j가 서로 다를때이다.
					인덱스가 동일하다면 같은숫자일테니까...
					 */
					if(i!=j && arrParam[i]==arrParam[j]) {
						//중복된 값이 발견된다면 true로 값을 변경
						rndFlag = true;
					}
				}
			}

			//3.중복된값이 없다면 break로 while루프 탈출하기
			if(rndFlag==false) break;

		}//end of while
	}//
	
	// 룰렛 화면 매핑
	@RequestMapping("/roulette.do")
	public String roulette(Model model) {
		return "recommand/roulette";
	}
	
	// 월드컵 화면 매핑
	@RequestMapping("/worldcup.do")
	public String worldcup(Model model) {
		return "recommand/worldcup";
	}
}
