package com.cultural.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.cultural.api.ApiExplorer;
import com.cultural.api.ApiExplorer2;
import com.cultural.model.service.CulturalService;
import com.cultural.model.vo.Cultural;
import com.cultural.model.vo.CulturalDetail;
import com.cultural.model.vo.CulturalList;

public class CulturalController {
	private CulturalService culturalService = new CulturalService();
	
	
	public void initCulturalList() throws IOException {
		Calendar cal1 = new GregorianCalendar(2022, 0, 1);
		Calendar cal2 = new GregorianCalendar(2022, 0, 8);
		Calendar today = Calendar.getInstance();
		
		while (true) {
			System.out.println(cal1.getTime());
			if(cal1.after(today) == true) {
				break;
			}
			
			List<CulturalList> list = ApiExplorer.callListByPeriod(cal1.getTime(), cal2.getTime());
			cal1.add(Calendar.DATE, 7);
			cal2.add(Calendar.DATE, 7);
			
			if (list == null || list.isEmpty()) {
				continue;
			}
			
			for (CulturalList culturalList : list) {
				System.out.println(culturalList);
				culturalService.insert(culturalList);
			}
			
		}	
	}
	
	public void initDetail() throws IOException {
		List<Integer> list = culturalService.selectBySeq();
		
		for (int seq : list) {
			CulturalDetail elem = ApiExplorer2.callListByDetail(seq);
			System.out.println(elem);
			culturalService.insertDetail(elem);
		}	
	}
	
	public void initCultural() throws IOException {
		List<Cultural> list = culturalService.selectByJoin();
		
		for (Cultural c : list) {
			culturalService.insertCultural(c);
		}
	}
	
	
	public static void main(String[] args) throws IOException {
		CulturalController controller = new CulturalController();
//		controller.initCultural();
//		controller.initDetail();
		controller.initCultural();
		System.out.println("파싱 완료!");
	}

}
