package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdPlaceDAO;
import admin.model.AdPlaceDTO;

@Service
public class AdPlcWriteCommand implements AdminCommandImpl{
	
	@Autowired
	AdPlaceDAO dao;
	public AdPlcWriteCommand() {
		System.out.println("AdPlcWriteCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");

		AdPlaceDTO adPlaceDTO = (AdPlaceDTO)paramMap.get("adPlaceDTO");
		String address = req.getParameter("address");
		String address1 = req.getParameter("address_detail");
		System.out.println("address:" + address);
		System.out.println("address1:" + address1);
		
		adPlaceDTO.setAddress(address + "@" + address1);
		
		//폼 값 확인용
		System.out.println("adPlaceDTO.place=" + adPlaceDTO.getPlace());
		
		//DAO객체 생성 및 쓰기 처리
		int affected = dao.plcWrite(adPlaceDTO);
		System.out.println("입력된 결과:"+affected);
		//dao.close();
		
	}
}
