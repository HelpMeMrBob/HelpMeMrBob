package board.command;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface LikeDAOImpl {
	
	public int create (
			@Param("lno") String lno,
			@Param("idx") String idx,
			@Param("id") String id);
	
	public int delete(@Param("id") String id, @Param("idx") String idx);

	public int count(@Param("id") String id,@Param("idx") String idx);

}
