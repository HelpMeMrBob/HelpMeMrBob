package recommand.model;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface RecommandDAO {
	
	// 전체 메뉴 데이터를 가져온다.
	public ArrayList<RecommandDTO> allData(RecommandDTO recommandDTO);
	
	// 월드컵에 필요한 데이터를 가져온다. (food:음식이름, image:이미지 이름, recomndCnt:월드컵에서 우승한 횟수)
	public ArrayList<RecommandDTO> worldcupData(RecParameterDTO recParameterDTO);
}
