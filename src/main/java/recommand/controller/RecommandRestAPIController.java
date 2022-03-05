package recommand.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberVO;
import recommand.model.FavCategoryDTO;
import recommand.model.RecParameterDTO;
import recommand.model.RecommandDAO;
import recommand.model.RecommandDTO;

@Controller
public class RecommandRestAPIController {

	// 월드컵(리액트)에서 사용할 랜덤한 메뉴를 rounds개수만큼 가져와서 DTO에 저장
	@Autowired
	private SqlSession sqlSession3;
	
	// 회원 - 대분류 선호도 총합
	private int totalFav;
	// 회원 - 대분류 선호도 내림차순 정렬한 Array
	JSONArray descFav;
	// 사용자가 선택한 메뉴 개수
	private int menuCount;
	// 사용자가 선택한 추가옵션 번호
	private int addOption;

	/*
	 * public RecommandRestAPIController() { test(); }
	 */
	
	/* 월드컵 라운드 수 매핑 */
	@RequestMapping("/worldcupRounds.do")
	public String worldcup_react_build8(Model model, HttpServletRequest req, RecParameterDTO recParameterDTO) {

		int rounds = Integer.parseInt(req.getParameter("rounds"));
		recParameterDTO.setRounds(rounds);
		ArrayList<RecommandDTO> menu = sqlSession3.getMapper(RecommandDAO.class).worldcupData(recParameterDTO);
		System.out.println("rounds : " + rounds);
		System.out.println("menu 개수 : " + menu.size());
		System.out.println("req.getParameter : " + req.getParameter("rounds"));
		System.out.println("RecParameterDTO : " + recParameterDTO.getRounds());

		return "redirect:resources/worldcup_react_build8/index.html?rounds=" + rounds;
	}

	/* 월드컵 화면 매핑 */
	@RequestMapping("/worldcup.do")
	public String worldcup(Model model) {
		return "recommand/worldcup";
	}

	/* 룰렛 화면 매핑 */
	@RequestMapping("/roulette.do")
	public String roulette(Model model, HttpSession session, RecommandDTO recommandDTO, FavCategoryDTO favCategoryDTO,
			HttpServletRequest req) {
		
		// 순서가 뒤죽박죽 랜덤하게 섞여서 정렬된 전체 메뉴를 가져옴
		ArrayList<RecommandDTO> allData = sqlSession3.getMapper(RecommandDAO.class).allData(recommandDTO);
		model.addAttribute("allData", allData);

		// 각 대분류를 담을 객체 생성
		ArrayList<String> noodleList = new ArrayList<String>();
		ArrayList<String> riceList = new ArrayList<String>();
		ArrayList<String> soupList = new ArrayList<String>();
		ArrayList<String> meatList = new ArrayList<String>();
		ArrayList<String> seafoodList = new ArrayList<String>();
		ArrayList<String> etcList = new ArrayList<String>();
		
		for (int i = 0; i < allData.size(); i++) {
			String lGroup = allData.get(i).getLgroup();
			String food = allData.get(i).getFood();
			
			if (lGroup.equals("noodle")) {
				noodleList.add(food);
			} else if (lGroup.equals("rice")) {
				riceList.add(food);
			} else if (lGroup.equals("soup")) {
				soupList.add(food);
			} else if (lGroup.equals("meat")) {
				meatList.add(food);
			} else if (lGroup.equals("seafood")) {
				seafoodList.add(food);
			} else if (lGroup.equals("etc")) {
				etcList.add(food);
			}
		}
		System.out.println("noodleList : " + noodleList + "\n" + "noodleList.size() : " + noodleList.size());
		System.out.println("riceList : " + riceList + "\n" + "riceList.size() : " + riceList.size());
		System.out.println("soupList : " + soupList + "\n" + "soupList.size() : " + soupList.size());
		System.out.println("meatList : " + meatList + "\n" + "meatList.size() : " + meatList.size());
		System.out.println("seafoodList : " + seafoodList + "\n" + "seafoodList.size() : " + seafoodList.size());
		System.out.println("etcList : " + etcList + "\n" + "etcList.size() : " + etcList.size());

		model.addAttribute("noodleList", noodleList);
		model.addAttribute("riceList", riceList);
		model.addAttribute("soupList", soupList);
		model.addAttribute("meatList", meatList);
		model.addAttribute("seafoodList", seafoodList);
		model.addAttribute("etcList", etcList);
		
		/* 로그인 상태이면 회원의 대분류 선호도 값을 가져온다. */
		if (session.getAttribute("siteUserInfo") != null) {
			
			// 회원의 아이디를 넘겨서 대분류 선호도 값을 가져옴
			MemberVO dto = (MemberVO) session.getAttribute("siteUserInfo");
			FavCategoryDTO fav = sqlSession3.getMapper(RecommandDAO.class).favCategory(dto.getId());
			System.out.println("fav : " + fav);
			model.addAttribute("fav", fav);
			
			// 대분류별 선호도 값
			String prenoodle = fav.getPrenoodle();
			String prerice = fav.getPrerice();
			String presoup = fav.getPresoup();
			String premeat = fav.getPremeat();
			String preseafood = fav.getPreseafood();
			String preetc = fav.getPreetc();
			
			// 선호도 값의 총합
			totalFav =
				Integer.parseInt(prenoodle) + Integer.parseInt(prerice) + Integer.parseInt(presoup) +
				Integer.parseInt(premeat) + Integer.parseInt(preseafood) + Integer.parseInt(preetc);
			System.out.println("totalFav : "+ totalFav);

			//대분류별 JSON정보를 담을 Array 선언
			JSONArray favCategory = new JSONArray();
			
			// 대분류 하나의 정보가 들어갈 JSONObject 선언
			JSONObject preInfo = new JSONObject();
			// 정보 입력 - 면
			preInfo.put("name", "noodleList");
			preInfo.put("val", prenoodle);
			preInfo.put("arr", noodleList);
			// Array에 입력
			favCategory.put(preInfo);
			
			// 다음 대분류 정보가 들어갈 JSONObject 생성
			preInfo = new JSONObject();
			// 정보 입력 - 밥
			preInfo.put("name", "riceList");
			preInfo.put("val", prerice);
			preInfo.put("arr", riceList);
			// Array에 입력
			favCategory.put(preInfo);
			
			// 다음 대분류 정보가 들어갈 JSONObject 생성
			preInfo = new JSONObject();
			// 정보 입력 - 국/탕
			preInfo.put("name", "soupList");
			preInfo.put("val", presoup);
			preInfo.put("arr", soupList);
			// Array에 입력
			favCategory.put(preInfo);
			
			// 다음 대분류 정보가 들어갈 JSONObject 생성
			preInfo = new JSONObject();
			// 정보 입력 - 고기
			preInfo.put("name", "meatList");
			preInfo.put("val", premeat);
			preInfo.put("arr", meatList);
			// Array에 입력
			favCategory.put(preInfo);
			
			// 다음 대분류 정보가 들어갈 JSONObject 생성
			preInfo = new JSONObject();
			// 정보 입력 - 해산물
			preInfo.put("name", "seafoodList");
			preInfo.put("val", preseafood);
			preInfo.put("arr", seafoodList);
			// Array에 입력
			favCategory.put(preInfo);
			
			// 다음 대분류 정보가 들어갈 JSONObject 생성
			preInfo = new JSONObject();
			// 정보 입력 - 기타
			preInfo.put("name", "etcList");
			preInfo.put("val", preetc);
			preInfo.put("arr", etcList);
			// Array에 입력
			favCategory.put(preInfo);
			
			System.out.print("--정렬 before--\n"+"favCategory"+ favCategory);// 대분류별 JSON정보가 담긴 Array 확인

			JSONArray descFav = new JSONArray();
			List<JSONObject> jsonValues = new ArrayList<JSONObject>();
			
			for (int i=0; i<favCategory.length(); i++) {
				jsonValues.add(favCategory.getJSONObject(i));
				System.out.println(i+""+favCategory.getJSONObject(i));
			}
			Collections.sort(jsonValues, new Comparator<JSONObject>() {
				private static final String KEY_NUM = "val";             //JSON key 변수 선언 생성
				@Override
				public int compare(JSONObject a, JSONObject b) {
					int valA = 0;
					int valB = 0;
					try {
						valA = Integer.parseInt(a.getString(KEY_NUM));
						valB = Integer.parseInt(b.getString(KEY_NUM));
					}
					catch (JSONException e) {
						e.printStackTrace();
					}
					return Integer.compare(valB,valA);
				}
			});
			for (int i = 0; i < favCategory.length(); i++) {
				descFav.put(jsonValues.get(i));
			}
			System.out.println("--정렬 after--\n"+"descFav"+ descFav);// favCategory를 val값 기준으로 정렬한 Array 확인
			// 멤버변수에 저장
			this.descFav = descFav;
			
//			// 정렬된 대분류 Array를 모델에 저장
//			model.addAttribute("descFav", descFav);
			
//			
//			System.out.println("(JSONArray) : " + (JSONArray)descFav.getJSONObject(0).get("arr"));
//			System.out.println("아몰랑 0번인덱스 : " + (JSONArray)descFav.getJSONObject(0).get("arr"));
//			
//			
//			
//			
//			JSONArray index0Array = (JSONArray)descFav.getJSONObject(0).get("arr");
//			System.out.println();
//			JSONObject element;
//			Random generator = new Random();
//			int randomIndex = generator.nextInt(index0Array.length());
//			System.out.println("아몰랑에서 랜덤으로 : "+ Math.floor(Math.random() * index0Array.length()));
//			for (int i = 0; i < index0Array.length(); i++) {
//				element = (JSONObject) index0Array.opt(i);
//				System.out.println(element.optString("key"));
//				System.out.println(element.optString("value"));
//			}
//
//			
//			while(favList.size() < menuCount) {
//				
//				
////				favList.add
//				
//				
//				
////				for (int i=0; i<allData.size(); i++) {
////				}
//			}
//			
			
			
//		    while(favList.size() < menuCount) {
//		    	// 중복없이 랜덤으로 값 추출
//		    	favList.add((int)(Math.random() * 45 + 1));
//		    }
//       			var ranArr = copy[0].arr.splice(Math.floor(Math.random() * copy[0].arr.length), 1)[0]
//				favList.push(ranArr)
//       		}
			
		
		}// end of if (로그인 상태일 때)
		
		System.out.println("\n"+"allData 개수 : " + allData.size());
		
		return "recommand/roulette";
	}
	
	/* 메뉴개수 ajax로 받아와서 저장 */
	@RequestMapping("/numOfMenuData.do")
	@ResponseBody
	public HashMap<String, Integer> numOfMenuData(Model model, HttpServletRequest req) {
		// 반환할 데이터를 담을 HashMap객체 생성
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		// 사용자가 선택한 메뉴개수를 요청 파라미터로 전달받아서 여기저기 저장
		int menuCount = Integer.parseInt(req.getParameter("menuCount"));
		map.put("menuCount", menuCount);// 반환할 map 객체에 저장
		model.addAttribute("menuCount", menuCount);// 모델객체에 저장
		this.menuCount = menuCount;// 멤버변수에 저장
		
		System.out.println("menuCount : "+ menuCount);
		
		return map;
	}
	
	/* 추가옵션 값 ajax로 받아와서 저장 */
	@RequestMapping("/addOptionData.do")
	@ResponseBody
	public HashMap<String, Integer> addOptionData(Model model, HttpServletRequest req) {
		// 반환할 데이터를 담을 HashMap객체 생성
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		// 사용자가 선택한 메뉴개수를 요청 파라미터로 전달받아서 여기저기 저장
		int addOption = Integer.parseInt(req.getParameter("addOption"));
		map.put("addOption", addOption);// 반환할 map 객체에 저장
		model.addAttribute("addOption", addOption);// 모델객체에 저장
		this.addOption = addOption;// 멤버변수에 저장
		
		System.out.println("addOption : "+ addOption);
		
		return map;
	}
	
	/* 룰렛 만들기 */
	@RequestMapping("/addOption10.do")
	@ResponseBody
	public HashMap<String, ArrayList<String>> addOption10(Model model, HttpServletRequest req) {
		
		// 선호도를 반영한 메뉴 목록을 담을 HashSet객체 선언
		ArrayList<String> favList = new ArrayList<String>();
		JSONArray first = (JSONArray)descFav.getJSONObject(0).get("arr");
		JSONArray second = (JSONArray)descFav.getJSONObject(1).get("arr");
		JSONArray third = (JSONArray)descFav.getJSONObject(2).get("arr");
		JSONArray fourth = (JSONArray)descFav.getJSONObject(3).get("arr");
		JSONArray fifth = (JSONArray)descFav.getJSONObject(4).get("arr");
		JSONArray sixth = (JSONArray)descFav.getJSONObject(5).get("arr");
		
		System.out.println("descFav.getJSONObject(0).get(\"arr\")"+ first);
		System.out.println("descFav.getJSONObject(1).get(\"arr\")"+ second);
		System.out.println("descFav.getJSONObject(2).get(\"arr\")"+ third);
		System.out.println("descFav.getJSONObject(3).get(\"arr\")"+ fourth);
		System.out.println("descFav.getJSONObject(4).get(\"arr\")"+ fifth);
		System.out.println("descFav.getJSONObject(5).get(\"arr\")"+ sixth);
		
		int count = 0;
		
//		while(favList.size() < menuCount) {
			// 총 메뉴 개수에 따라 순위별 메뉴 개수를 다르게 가져온다.
			if (menuCount == 10) {
				// 선호도 1위 메뉴 : 3개
				for(int i=0; i<3; i++) {
//					String food = (String)first.get(i);
					favList.add((String)first.get(i));
				}
				// 선호도 2위 메뉴 : 2개
				for(int i=0; i<2; i++) {
//					String food = (String)second.get(i);
					favList.add((String)second.get(i));
				}
				// 선호도 3위 메뉴 : 2개
				for(int i=0; i<2; i++) {
//					String food = (String)third.get(i);
					favList.add((String)third.get(i));
				}
				// 선호도 4위 메뉴 : 1개
				for(int i=0; i<1; i++) {
//					String food = (String)fourth.get(i);
					favList.add((String)fourth.get(i));
				}
				// 선호도 5위 메뉴 : 1개
				for(int i=0; i<1; i++) {
//					String food = (String)fifth.get(i);
					favList.add((String)fifth.get(i));
				}
				// 선호도 6위 메뉴 : 1개
				for(int i=0; i<1; i++) {
//					String food = (String)sixth.get(i);
					favList.add((String)sixth.get(i));
				}
			}
			
			
//		}
		System.out.println("favList : " + favList + "\n" + "favList.size() : " + favList.size());
		
		
		HashMap<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		map.put("arr", favList);
		model.addAttribute("favList", favList);
		
		return map;
	}


//	// 보류 - 난수생성
//	public void randomCreate(int[] arrParam) {
//		
//		//난수생성을 위한 씨드설정
//		Random rnd = new Random();
//		rnd.setSeed(System.currentTimeMillis());
//
//		/*
//		난수생성 방법1:
//			1]난수 10개를 우선 생성한후 배열에 담아준다.
//			2]배열 전체를 대상으로 중복확인을 한다.
//			3]만약 중복되는 요소가 발견되면 다시 1번으로 돌아가서 난수를
//			생성한다.
//			4]중복되는 요소가 없다면 함수를 종료하고 메인으로 돌아간다.
//		 */
//		while(true) {
//
//			//1.난수191개 생성후 배열담기
//			for(int i=0 ; i<arrParam.length ; i++) {
//				arrParam[i] = rnd.nextInt(191) + 1;//1~191까지의 정수 생성
//			}
//
//			//2.중복확인
//			boolean rndFlag = false;/*중복체크를 위한 변수(false라면 중복된
//				난수가 없는경우이고, 중복된 난수가 발견된다면 true로
//				값을 변경할것임 */
//
//			for(int i=0 ; i<arrParam.length ; i++) {
//				for(int j=0 ; j<arrParam.length ; j++) {
//					/*
//					비교의 조건은 인덱스i와 인덱스j가 서로 다를때이다.
//					인덱스가 동일하다면 같은숫자일테니까...
//					 */
//					if(i!=j && arrParam[i]==arrParam[j]) {
//						//중복된 값이 발견된다면 true로 값을 변경
//						rndFlag = true;
//					}
//				}
//			}
//
//			//3.중복된값이 없다면 break로 while루프 탈출하기
//			if(rndFlag==false) break;
//
//		}//end of while
//	}//
}
