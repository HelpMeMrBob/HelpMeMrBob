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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import point.JdbcTemplateConst;
import point.PointDAO;
import point.PointDTO;

@Controller
public class EmoticonController {
	private JdbcTemplate template;
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired -> JDBCTemplate 연결 성공");
		
		JdbcTemplateConst.template = this.template;
	}
	
	private PointDAO dao;
	
	//이모티콘 디스플레이 페이지
		@RequestMapping("/displayEmoticon.do")
		public String displayEmoticon2() {
			return "emoticon/display";
		}
	//이모티콘 구매과정
	@RequestMapping("/buyProcess.do")
	public String buyProcess(HttpServletRequest request, PointDTO pdto, Model model) {
		//String pr = request.getParameter("pr"); //여기까지는 pr이 넘어오지만, model을 통해서는 pr값을 넘길 수 없음.
		//String sticker = request.getParameter("sticker"); //PointDAO에 정의되어있기때문에 pr이 넘어감
		model.addAttribute("pdto",pdto);
		
		return "emoticon/buyProcess";
	}
	
	//카카오페이 실행 연습페이지
	@RequestMapping("/emoticon/practice.do")
	public String payPractice() {
		return "emoticon/practice";
	}
	
	//카카오페이 실행 연습페이지
	@RequestMapping("/imKakaopayPage.do")
	public String kakaopayPage() {
		return "emoticon/imKakaopay";
	}
	//카카오페이 실행 연습페이지
	@RequestMapping("/oriKakaopayPage.do")
	public String kakaopayPageOri() {
		return "emoticon/oriKakaoPay";
	}
	
	
	
	
	

	
}
