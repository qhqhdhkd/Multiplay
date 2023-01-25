package com.cultural.api;

/* Java 1.8 샘플 코드 */


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.cultural.model.vo.CulturalList;
// 한국문화정보원_공연전시정보조회서비스
public class ApiExplorer {
	// KEY 본인꺼로 해주세요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public static final String KEY = "o0rmsAr3lo90ag1GrkQl6Kiy5BOwZwkfgkaqJ8t2JbG5y%2F9FFPMF%2Bg9Xd1YEb6D6UOVWLFm9Ls438M2dify3fQ%3D%3D";
	public static final String WEEKLY_CULTURAL_URL  = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period";
	
	public static final SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
	public static final SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	
//    public static void main(String[] args) {
//    	callListByPeriod("20221225");
//    	callListByDetail("169503");
//    	System.out.println("------------------------------------");
//        
//    }
    // 기간별 조회
    public static List<CulturalList> callListByPeriod(Date fromDate, Date toDate) throws IOException {
    	String dateStr1 = sdf1.format(fromDate);
    	String dateStr2 = sdf1.format(toDate);
		List<CulturalList> list = new ArrayList<>();
		
		StringBuilder urlBuilder = new StringBuilder(WEEKLY_CULTURAL_URL); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + KEY); /*Service Key*/          
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*1:등록일, 2:공연명, 3:지역*/
        urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode("" + dateStr1, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode("" + dateStr2, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*3~100*/
        urlBuilder.append("&" + URLEncoder.encode("place","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("gpsxfrom","UTF-8") + "=" + URLEncoder.encode("124", "UTF-8")); /*경도 범위검색 중 하한*/
        urlBuilder.append("&" + URLEncoder.encode("gpsyfrom","UTF-8") + "=" + URLEncoder.encode("32", "UTF-8")); /*위도 범위검색 중 하한*/
        urlBuilder.append("&" + URLEncoder.encode("gpsxto","UTF-8") + "=" + URLEncoder.encode("133", "UTF-8")); /*경도 범위검색 중 상한*/
        urlBuilder.append("&" + URLEncoder.encode("gpsyto","UTF-8") + "=" + URLEncoder.encode("43", "UTF-8")); /*위도 범위검색 중 상한*/
        
        System.out.println(urlBuilder.toString());
    	    	
    	try {
          
          URL url = new URL(urlBuilder.toString());
          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
          conn.setRequestMethod("GET");
          conn.setRequestProperty("Content-type", "application/xml");
          System.out.println("Response code: " + conn.getResponseCode());
          BufferedReader rd;
          
          if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
  		  
  		  NodeList exhibitionList = doc.getElementsByTagName("perforList");
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
    				String thumbnail = getStrData(eElement, "thumbnail");
    				Double gpsX = getDoubleData(eElement, "gpsX");
    				Double gpsY = getDoubleData(eElement, "gpsY");
    				CulturalList cultural = new CulturalList(0, seq, title, startDate, endDate, place, realmName, area, thumbnail, gpsX, gpsY);
					list.add(cultural);
    				
  				  } catch (Exception e) {
  					System.out.println("오류 : 데이터가 잘못되었습니다.");
  					  
				  }
  				  
  				  
  			  }
  		  } 		  
  		  
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return list;
    }
    
    
    private static int getIntData(Element eElement, String tagName){
		try {
			return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}
    
    private static long getLogData(Element eElement, String tagName){
		try {
			return Long.parseLong(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}
    
    private static double getDoubleData(Element eElement, String tagName){
		try {
			return Double.parseDouble(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0.0;
		}
	}
    
    private static Date getDateData(Element eElement, String tagName){
		try {
			System.out.println(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			Date date = sdf1.parse(eElement.getElementsByTagName(tagName).item(0).getTextContent());
			System.out.println(date);
			return date;
		} catch (Exception e) {
			return null;
		}
	}
    
    private static String getStrData(Element eElement, String tagName){
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}
    
    private static void URLSetting() {
    	
    	
    }
}