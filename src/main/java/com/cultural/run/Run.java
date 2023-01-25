package com.cultural.run;

import java.io.IOException;

import com.cultural.view.CulturalMenu;

public class Run {
	// com.cultural.api 패키지에 있는 ApiExplorer들 KEY 본인꺼로 해주세요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public static void main(String[] args) throws IOException {
		new CulturalMenu().mainMenu();
		System.out.println("---- 프로그램 종료 ----");
	}

}
