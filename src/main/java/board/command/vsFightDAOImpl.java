package board.command;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import admin.model.AdVSTalkDTO;
import board.model.vsFight1VO;
import board.model.ParameterDTO;
/*
해당 인터페이스는 컨트롤러와 DAO 사이에서 매개역할을 하는 서비스객체로 사용된다.
@Service 어노테이션은 빈을 자동으로 생성하기 위한 용도이지만
여기서는 단순히 역할을 명시적으로 표현하기 위해 사용되었다.
따라서 필수 사항은 아니다.
 */
@Service
public interface vsFightDAOImpl {

	

	///////cate='fight2'/////////
	public int delete2(String rno, String id);
	public int getTotalCount2();//파라미터 없음
	public ArrayList<vsFight1VO> listPage2(int s, int e, int idx);//파라미터 2개 있음
	public int write2(@Param("_contents") String contents,
			@Param("_idx") int idx,
			@Param("_id") String id);
	
	
	/*
	방명록 1차 버전에서 사용하는 메서드
	게시물수 카운트와 목록에 출력할 게시물 가져오기
	 */
	//public int getTotalCount1();//파라미터 없음
	public int getTotalCount1();//파라미터 없음
	public ArrayList<vsFight1VO> listPage1(int s, int e, int idx);//파라미터 2개 있음
	
	
	/*
	 방명록 2차 버전에서 사용할 메서드
	 파라미터를 저장한 DTO객체를 매개변수로 사용한다.
	 즉, Mapper로 DTO를 통해 파라미터를 전달한다.
	 */
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<vsFight1VO> listPageSearch(ParameterDTO parameterDTO);
	/*
	 @Param 어노테이션을 통해 파라미터를 전달하면 Mapper에서는 별칭을 통해
	 인파라미터 처리를 할 수 있다.
	 */
	public int write1(@Param("_contents") String contents,
			@Param("_idx") int idx,
			@Param("_id") String id);
	//기존 게시물의 내용을 읽어오기 위한 메서드
	//public vsFight1VO view(ParameterDTO parameterDTO);
	public vsFight1VO view(@Param("rno") String rno,
			@Param("user_id") String id);
	//수정처리
	public int modify(vsFight1VO vsFight1VO);
	//삭제처리
	public int delete1(String rno, String id);
	
	//Map컬렉션 사용을 위한 추상메서드
	public ArrayList<vsFight1VO> hashMapUse(Map<String, String> hMap);
	//List컬렉션 사용을 위한 추상메서드
	public ArrayList<vsFight1VO> arrayListUse(List<String> aList);

	
	public int count(int idx);
	public int count2(int idx);
	
	//사진꽂기
	public ArrayList<AdVSTalkDTO> adList();
}
