package infomation.model;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface InfomationDAOInter {
	public ArrayList<InfomationDTO> keyword(String search);
	public int favorite(FavoriteDTO favoriteDTO);
	public ArrayList<FavoriteDTO> favoriteList(String id);
	public int favoriteModify(String memo, String idx);
	public int favoriteDelete(String idx);
	public ArrayList<InfomationDTO> detailView(String place);
	public ArrayList<ReviewDTO> review(String place);
}
