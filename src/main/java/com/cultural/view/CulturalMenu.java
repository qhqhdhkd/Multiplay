package com.cultural.view;

import java.io.IOException;

import com.cultural.common.Util;
import com.cultural.controller.CulturalController;

public class CulturalMenu {
	
	public void mainMenu() throws IOException {
		CulturalController culturalController = new CulturalController();

		while (true) {
			boolean isLogin = false;
			String menu = "========== Boxoffice Project Main ===========\n"
						+ "1. 공연/전시 목록 DB 초기화\n"
						+ "2. 공연/전시 상세정보 DB 초기화\n"
						+ "3. 공연/전시 테이블 초기화\n"
						+ "0.프로그램 끝내기\n"
						+ "---------------------------------------------\n"
						+ "선택 : "; 

			while(true) {
				
				System.out.print(menu);
				int choice = Util.readIntForConsol();
				switch(choice) {
					case 1: 
						culturalController.initCulturalList();
						System.out.println("완료되었습니다!!");
						break;
					case 2: 
						culturalController.initDetail();
						System.out.println("완료되었습니다!!");
						break;
					case 3:
						culturalController.initCultural();
						System.out.println("완료되었습니다!!");
						break;
						
					case 0: 
						System.out.print("정말로 끝내시겠습니까?(y/n) : ");
						if(Util.readStrForConsol().charAt(0) == 'y')
							return;
						break;
					default: 
						System.out.println("잘못 입력하셨습니다.");
				}
			}
		}
		
	}
	
	

}
