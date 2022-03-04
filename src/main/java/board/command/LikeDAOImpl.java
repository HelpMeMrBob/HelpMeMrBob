package board.command;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import board.model.LikeVO;

@Service
public interface LikeDAOImpl {
	
	//////////////////////좋아요입니당///////////////////////////////
	public int create (
			@Param("lno") String lno,
			@Param("idx") String idx,
			@Param("id") String id);
	
	public int delete(@Param("id") String id, @Param("idx") String idx);

	public int count(@Param("id") String id,@Param("idx") String idx,@Param("lno") String lno);
	
	//////////////////스크랩입니당///////////////////////
	
	public int scrap_create (
			@Param("scrapNo") String scrapNo,
			@Param("idx") String idx,
			@Param("id") String id);
	
	public int scrap_delete(@Param("id") String id, @Param("idx") String idx);

	public int scrap_count(@Param("id") String id,@Param("idx") String idx,@Param("scrapNo") String scrapNo);
	
	public int checkLike(String id, String idx);
	public int checkScrap(String id, String idx);
}
