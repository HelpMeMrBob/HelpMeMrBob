package recommand.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberVO;
import recommand.model.FavCategoryDTO;
import recommand.model.MyFoodDTO;
import recommand.model.RecParameterDTO;
import recommand.model.RecommandDAO;
import recommand.model.RecommandDTO;

@Controller
public class RecommandRestAPIController {

	// 월드컵(리액트)에서 사용할 랜덤한 메뉴를 rounds개수만큼 가져와서 DTO에 저장
	@Autowired
	private SqlSession sqlSession3;
	
	// 회원 - 대분류 선호도 내림차순 정렬한 Array
	JSONArray descFav;
	
	/** 월드컵 라운드 수 매핑 */
	@RequestMapping("/worldcupRounds.do")
	public String worldcup_react_build8(Model model, HttpServletRequest req, RecParameterDTO recParameterDTO) {

		int rounds = Integer.parseInt(req.getParameter("rounds"));
		recParameterDTO.setRounds(rounds);
		ArrayList<RecommandDTO> menu = sqlSession3.getMapper(RecommandDAO.class).worldcupData(recParameterDTO);
		System.out.println("rounds : " + rounds);
		System.out.println("menu 개수 : " + menu.size());
		System.out.println("req.getParameter : " + req.getParameter("rounds"));
		System.out.println("RecParameterDTO : " + recParameterDTO.getRounds());

		return "redirect:resources/worldcup_react_build64/index.html?rounds=" + rounds;
	}

	/** 월드컵 화면 매핑 */
	@RequestMapping("/worldcup.do")
	public String worldcup(Model model) {
		return "recommand/worldcup";
	}

	/** 룰렛 화면 매핑 */
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

		/** 로그인 상태이면 회원의 대분류 선호도 값을 가져온다. */
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
		}// end of if (로그인 상태일 때)
		System.out.println("\n"+"allData 개수 : " + allData.size());
		
		return "recommand/roulette";
	}
	
	
	/** ajax로 요청받음 - addOption 값에 따라 다른 메뉴목록을 return */
	@RequestMapping("/addOption.do")
	@ResponseBody
	public HashMap<String, ArrayList<String>> addOption(HttpServletRequest req, HttpSession session) {
		
		// 세션영역에 기존에 저장되어있던 데이터를 지운다.
		session.removeAttribute("menuCount");
		session.removeAttribute("addOption");
		session.removeAttribute("favList");
		session.removeAttribute("menuList");
		
		// 반환할 객체 선언
		HashMap<String, ArrayList<String>> map = null;
		JSONArray resultArr = null;
		
		// 사용자가 선택한 메뉴개수를 요청 파라미터로 전달받음
		int menuCount = Integer.parseInt(req.getParameter("menuCount"));
		// 사용자가 선택한 추가옵션 값을 요청 파라미터로 전달받음
		int addOption = Integer.parseInt(req.getParameter("addOption"));
		
		System.out.println("--- addOption.do 호출됨 ------------------------------------");
		System.out.println("menuCount : "+ menuCount);
		System.out.println("addOption : "+ addOption);
		
		
		// 선호도를 반영한 메뉴 목록을 담을 HashSet객체 선언 (중복방지)
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
		
		// 선호도 순위에 따라 메뉴 개수를 다르게 가져온다.
		while(favList.size() < menuCount) {
			// 선호도 1위 메뉴 : 60프로
			for(int i=0; i<menuCount*0.6; i++) {
				favList.add((String)first.get(i));
			}
			// 선호도 2위 메뉴 : 30프로
			for(int i=0; i<menuCount*0.3; i++) {
				favList.add((String)second.get(i));
			}
			// 선호도 3위 메뉴 : 20프로
			for(int i=0; i<menuCount*0.2; i++) {
				favList.add((String)third.get(i));
			}
			// 선호도 4위 메뉴 : 10프로
			for(int i=0; i<menuCount*0.1; i++) {
				favList.add((String)fourth.get(i));
			}
			// 선호도 5위 메뉴 : 10프로
			for(int i=0; i<menuCount*0.1; i++) {
				favList.add((String)fifth.get(i));
			}
			// 선호도 6위 메뉴 : 10프로
			for(int i=0; i<menuCount*0.1; i++) {
				favList.add((String)sixth.get(i));
			}
		}
		System.out.println("favList : " + favList + "\n" + "favList.size() : " + favList.size());
		
		/******************************************************************** 공통 **/
		/** 선호도만 반영 */
		if (addOption == 10) {
			// 반환할 맵 객체에 선호도 순위를 반영한 favList를 저장
			map = new HashMap<String, ArrayList<String>>();
			map.put("arr", favList);
			System.out.println("favList 반환 맵 : "+ map.get("arr"));
			
			// 리퀘스트 영역에 저장 (jstl에서 사용하기 위함)
			session.setAttribute("menuCount", menuCount);
			session.setAttribute("addOption", addOption);
			session.setAttribute("favList", favList);
			
			// 확인용
			System.out.println("session.getAttribute(\"menuCount\")"+ session.getAttribute("menuCount"));
			System.out.println("session.getAttribute(\"addOption\")"+ session.getAttribute("addOption"));
			System.out.println("session.getAttribute(\"favList\")"+ session.getAttribute("favList"));
		}
		/** 탭 + 선호도 반영 */
		else if (addOption == 1) {
			
			// 현재 접속중인 사용자의 ID 얻어오기
			String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
			// 사용자가 선택한 탭에 해당하는 음식목록을 배열에 담기
			ArrayList<MyFoodDTO> myfood = sqlSession3.getMapper(RecommandDAO.class).myfoodTab(id, addOption);
			
			// 탭 목록 확인용
			System.out.print("myfood : ");
			for (int i = 0; i < myfood.size(); i++) {
				System.out.print(myfood.get(i).getMyfood() + " ");
			}
			System.out.println();
			
			// 탭의 메뉴 목록 + 선호도 메뉴 목록을 담을 객체 생성
			HashSet<String> menuList = new HashSet<String>();
			
			if (myfood.size() < menuCount) {// 탭의 메뉴개수가 사용자가 선택한 메뉴개수보다 적으면...
				// (전체 메뉴 개수) - (탭 메뉴 개수) 
				int temp = menuCount - myfood.size();
				/** [2번 for문] favList에서 마지막으로 가져온 메뉴의 인덱스를 저장할 변수 */
				int favIndex = 0;
				// favIndex에 저장하기 전에 한번 거칠 변수
				int before = 0;
				System.out.println("temp : "+ temp);
				
				// 먼저 탭의 메뉴를 모두 넣음
				for (int i=0; i<myfood.size(); i++) {
					menuList.add(myfood.get(i).getMyfood());
				}
				// 결과 목록의 개수가 사용자가 선택한 메뉴개수보다 적으면...
				while (menuList.size() < menuCount) {
					/** [2번 for문] 선호도 순위가 반영된 favList에서 부족한 만큼 순서대로 가져온다. */
					for (int i=favIndex; i<(favIndex+temp); i++) {
						menuList.add(favList.get(i));
						System.out.println("favList.get(i) : "+ favList.get(i));
						before = i;
						// 결과목록의 개수와 사용자가 선택한 메뉴개수가 같으면 for문을 탈출
						if (menuList.size() == menuCount) break;
					}
					favIndex = before;
				}
			}
			else {// 같으면 (탭의 최대 메뉴개수는 10개, 사용자 지정 최소 메뉴개수는 10개이므로 더 많은 경우는 없음)
				for (int i = 0; i < myfood.size(); i++) {
					menuList.add(myfood.get(i).getMyfood());
				}
			}
			/** 반환할 map에 담을 JSONArray ************************************************/
			//대분류별 JSON정보를 담을 객체 생성
			resultArr = new JSONArray();
			// 대분류 하나의 정보가 들어갈 JSONObject 선언
			JSONObject resultRow = null;
			// menuList를 ArrayList로 변환
			ArrayList<String> copyMenuList = new ArrayList<String>();
			copyMenuList.addAll(menuList);
			
			for (int i=0; i<copyMenuList.size(); i++) {
				resultRow = new JSONObject();
				// 정보 입력 - 면
				resultRow.put("fillStyle", "#ed6a5a");
				resultRow.put("text", copyMenuList);
				// Array에 입력
				resultArr.put(resultRow);
			}
			/*******************************************************************************/
			map = new HashMap<String, ArrayList<String>>();
			map.put("arr", copyMenuList);
			System.out.println("[탭+선호도 반영] 최종 메뉴 목록 : "+ map.get("arr"));
			System.out.println("사이즈 : "+ map.get("arr").size());
			
			// 리퀘스트 영역에 저장 (jstl에서 사용하기 위함)
			session.setAttribute("menuCount", menuCount);
			session.setAttribute("addOption", addOption);
			session.setAttribute("menuList", menuList);
			
			// 확인용
			System.out.println("session.getAttribute(\"menuCount\")"+ session.getAttribute("menuCount"));
			System.out.println("session.getAttribute(\"addOption\")"+ session.getAttribute("addOption"));
			System.out.println("session.getAttribute(\"menuList\")"+ session.getAttribute("menuList"));
		}//end of if(addOption==1)
		
		return map;
	}
}
