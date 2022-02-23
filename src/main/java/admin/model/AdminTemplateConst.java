package admin.model;

import org.springframework.jdbc.core.JdbcTemplate;

public class AdminTemplateConst {
	/*
	 Spring 프로젝트 전체에서 해당 변수를 사용하기 위해 static타입으로 생성한다
	 static타입의 변수는 프로그램 내에서 딱 하나만 생성되고,
	 객체 생성없이 클래스명으로 직접 접근할 수 있는 공유객체가 된다.
	 */
	public static JdbcTemplate template;
}
