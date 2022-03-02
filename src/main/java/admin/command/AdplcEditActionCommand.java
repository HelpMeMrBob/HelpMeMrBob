package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdPlaceDAO;
import admin.model.AdPlaceDTO;

@Service
public class AdplcEditActionCommand implements AdminCommandImpl{
	
	@Autowired
	AdPlaceDAO dao;
	public AdplcEditActionCommand() {
		System.out.println("AdplcEditActionCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		AdPlaceDTO adPlaceDTO = (AdPlaceDTO)map.get("adPlaceDTO");
		
		//DTO객체를 DAO로 전달한다.
		dao.plcEdit(adPlaceDTO);		
	}
}
