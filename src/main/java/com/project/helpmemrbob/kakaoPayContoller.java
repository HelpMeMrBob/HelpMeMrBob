package com.project.helpmemrbob;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import item.ItemDAO;
import member.model.MemberVO;
import point.PointDAO;
import point.PointDTO;

@Controller
public class kakaoPayContoller {

	//결제성공
	@RequestMapping("/resultSuccess.do")
	public String payResultSuccess() {
		return "payResult/success";
	}
	//결제실패
	@RequestMapping("/resultFailure.do")
	public String payResultFailure() {
		return "payResult/failure";
	}
	//결제실패
	@RequestMapping("/resultCancel.do")
	public String payResultCancel() {
		return "payResult/cancel";
	}
	//결제선택
	@RequestMapping("/chargeBob.do")
	public String chargeBob() {
		return "payResult/chargeBob";
	}
	//전체에서 사용할 변수 여기서 선언!	
	String amount;
	//결제과정
	@RequestMapping("/chargeProcess.do")
	public String chargeProcess(HttpServletRequest request) {
		amount = request.getParameter("money");
		System.out.println("충전금액: "+amount);
		return "payResult/chargeProcess";
	}
	//oriKaKao.jsp에서 사용한 컨트롤러
	@RequestMapping("kakaopay2")
	@ResponseBody
	public String kakaopay2(HttpSession session) {
		boolean flag = false;
		PointDAO pdao = new PointDAO();
		PointDTO pdto = new PointDTO();
		
		pdto.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		try {
			
		URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
		
		HttpURLConnection connection = (HttpURLConnection) address.openConnection(); 
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Authorization", "KakaoAK 8d0ba42fb4ca1001d7004e52945fc844");
		connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		connection.setDoOutput(true);
						
		String parameter = "cid=TC0ONETIME" // 가맹점 코드
				+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
				+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
				+ "&item_name=rice" // 상품명
				+ "&quantity=1" // 상품 수량
				+ "&total_amount="+amount // 총 금액
				+ "&vat_amount=200" // 부가세
				+ "&tax_free_amount=0" // 상품 비과세 금액
				+ "&approval_url=http://localhost:8081/helpmemrbob/resultSuccess.do" // 결제 성공 시
				+ "&fail_url=http://localhost:8081/helpmemrbob/resultFailure.do" // 결제 실패 시
				+ "&cancel_url=http://localhost:8081/helpmemrbob/resultCancel.do";
		
		OutputStream out = connection.getOutputStream();	
		DataOutputStream data =new DataOutputStream(out);
		data.writeBytes(parameter);
			
		data.close();			
					
		int  result = connection.getResponseCode();
			
		InputStream in;
		if(result ==200) {
		in = connection.getInputStream();
		System.out.println("ajax 통신성공");
		}
		else {
			in = connection.getErrorStream();
			System.out.println("ajax 통신실패");
		}
		System.out.println("result값은 "+result);
			
		InputStreamReader inRead = new InputStreamReader(in); 
		BufferedReader change = new BufferedReader(inRead);
		System.out.println(parameter);
		flag = true;
		if(flag == true) {
			pdao.buyPonts(pdto, amount);
		}
		return change.readLine();
		} catch (MalformedURLException e) {
			
		e.printStackTrace();
		} catch (IOException e) {
		
		e.printStackTrace();
				}
			
		return "";
		}
}
