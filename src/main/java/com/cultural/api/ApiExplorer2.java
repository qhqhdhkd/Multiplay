package com.cultural.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.cultural.model.vo.CulturalList;
import com.cultural.model.vo.CulturalDetail;

public class ApiExplorer2 {
	// KEY 본인꺼로 해주세요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public static final String KEY = "o0rmsAr3lo90ag1GrkQl6Kiy5BOwZwkfgkaqJ8t2JbG5y%2F9FFPMF%2Bg9Xd1YEb6D6UOVWLFm9Ls438M2dify3fQ%3D%3D";
	public static final String WEEKLY_CULTURAL_URL = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/";

	public static final SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
	public static final SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

	public static CulturalDetail callListByDetail(int InputSeq) throws IOException {
		CulturalDetail detail = null;

		StringBuilder urlBuilder = new StringBuilder(WEEKLY_CULTURAL_URL); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=o0rmsAr3lo90ag1GrkQl6Kiy5BOwZwkfgkaqJ8t2JbG5y%2F9FFPMF%2Bg9Xd1YEb6D6UOVWLFm9Ls438M2dify3fQ%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		urlBuilder.append("&" + URLEncoder.encode("seq", "UTF-8") + "=" + InputSeq);

		System.out.println(urlBuilder.toString());

		try {
			URL url1 = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url1.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			// 페이지 Parsing
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream()); // xml부를 가져와 파싱할 준비 완료!
			doc.normalizeDocument();

			System.out.println("-----------------------");
			System.out.println("");
			
			NodeList exhibitionList = doc.getElementsByTagName("perforInfo");
			for (int i = 0; i < exhibitionList.getLength(); i++) {
	  			  Node node = exhibitionList.item(i);
	  			  
	  			  if (node.getNodeType() == Node.ELEMENT_NODE) {
	  				  
	  				  try {
	  					Element eElement = (Element) node;
	    				  
	    				System.out.println("\n공연/전시 정보");
	    				System.out.println("제목 : " + eElement.getElementsByTagName("title").item(0).getTextContent());  				  
	    				int seq	= getIntData(eElement, "seq");  
	    				String title = getStrData(eElement, "title");
	    				Date startDate = getDateData(eElement, "startDate");
	    				Date endDate = getDateData(eElement, "endDate");
	    				String place = getStrData(eElement, "place");
	    				String realmName = getStrData(eElement, "realmName");
	    				String area = getStrData(eElement, "area");
	    				String subTitle = getStrData(eElement, "subTitle");
	    				String price = getStrData(eElement, "price");
	    				String contents1 = getStrData(eElement, "contents1");
	    				String contents2 = getStrData(eElement, "contents2");
	    				String url = getStrData(eElement, "url");
	    				String phone = getStrData(eElement, "phone");
	    				String imgUrl = getStrData(eElement, "imgUrl");
	    				Double gpsX = getDoubleData(eElement, "gpsX");
	    				Double gpsY = getDoubleData(eElement, "gpsY");
	    				String placeUrl = getStrData(eElement, "placeUrl");
	    				String placeAddr = getStrData(eElement, "placeAddr");
	    				int placeSeq = getIntData(eElement, "placeSeq");
	    				detail = new CulturalDetail(seq, title, startDate, endDate, 
	    						place, realmName, area, subTitle, price, contents1, contents2, 
	    						url, phone, imgUrl, gpsX, gpsY, placeUrl, placeAddr, placeSeq );
	    				
	    				
	    				
	    				
	  				  } catch (Exception e) {
	  					System.out.println("오류 : 데이터가 잘못되었습니다.");
	  					  
					  }
	  				  
	  				  
	  			  }
	  		  } 
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return detail;
	}

	private static int getIntData(Element eElement, String tagName) {
		try {
			return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	private static long getLogData(Element eElement, String tagName) {
		try {
			return Long.parseLong(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	private static double getDoubleData(Element eElement, String tagName) {
		try {
			return Double.parseDouble(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0.0;
		}
	}

	private static Date getDateData(Element eElement, String tagName) {
		try {
			System.out.println(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			Date date = sdf1.parse(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			System.out.println(date);
			return date;
		} catch (Exception e) {
			return null;
		}
	}

	private static String getStrData(Element eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}

	private static void URLSetting() {

	}

	public static void main(String[] args) throws IOException {
		CulturalDetail a = new ApiExplorer2().callListByDetail(203205);
		System.out.println(a);
	}

}
