package recommand.model;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface RecommandDAO {
	// 월드컵에서 가져와야 할 데이터 (food:음식이름, image:이미지 이름, recomndCnt:월드컵에서 우승한 횟수)
	public ArrayList<RecommandDTO> listData(RecommandDTO RecommandDTO);
}
