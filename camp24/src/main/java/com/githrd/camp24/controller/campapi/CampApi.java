package com.githrd.camp24.controller.campapi;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.ApiVO;

/**
 * 캠핑장정보 api 페이지를 보기위한 클래스
 * @author	정선우
 *
 */

@Controller
@RequestMapping("/campapi")
public class CampApi {
	
	@RequestMapping("/campApi.cmp")
	public ModelAndView campApi(ModelAndView mv, PageUtil page, String pageno) {
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		int total = 3039;
		String ServiceKey = "6pAoN9O3ycxlmS7o5f7MvnwrkdKT8wZaKFSsUoVgnrgvUk8%2FqN3dGhpsRYTTGJ63LFtj%2F0kBFwzjL%2Fy5pFa6xA%3D%3D";
        String numOfRows = "3";
        String pageNo = pageno;
        String MobileOS = "ETC";
        String MobileApp = "appName";
        
        // PageUtil 셋팅
        page.setPage(Integer.parseInt(pageno), total);
		
        try {
        	// xml 문서를 파싱할 수 있는 dom parser 를 생성
        	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        	// inputstream 객체의 형태로 파싱할 정보를 넘겨줌
        	// 파싱할 InputStream 생성
        	// 1. 웹서버를 제공하는 url 에 연결해서 데이터 가져오기
        	// 1) 접속할 url 정보 정의
        	StringBuffer pharm_url = new StringBuffer();
        	pharm_url.append("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=");
        	pharm_url.append(ServiceKey);
        	pharm_url.append("&numOfRows=" + numOfRows);
        	pharm_url.append("&pageNo=" + pageNo);
        	pharm_url.append("&MobileOS=" + MobileOS);
        	pharm_url.append("&MobileApp=" + MobileApp);
        	
        	
        	
        	// 2) 웹서버 접속
        	URL url = new URL(pharm_url.toString());
        	
        	// 3) 접속해서 response 되는 데이터를 읽어오기
        	// 읽어온 데이터를 저장
        	BufferedInputStream xmldata = new BufferedInputStream(url.openStream());
        	
        	// InputStream 객체의 형태로 파싱할 정보를 넘겨줌
        	Document document = dBuilder.parse(xmldata);
        	Element root = document.getDocumentElement();
        	NodeList list = root.getElementsByTagName("item");
        	
        	ArrayList<ApiVO> jlist = new ArrayList<ApiVO>();
        	
        	for(int i = 0; i < list.getLength(); i++) {
        		Node node = list.item(i);
        		
        		NodeList item_childlist = node.getChildNodes();
        		
        		ApiVO apiVO = new ApiVO();
        		for (int j = 0; j < item_childlist.getLength(); j++) {
        			Node item_child = item_childlist.item(j);
        			String txt = item_child.getNodeName();
        			switch(txt) {
        			case "facltNm":
    					apiVO.setFacltNm(item_child.getTextContent());
        				break;
        			case "addr1":
        				apiVO.setAddr1(item_child.getTextContent());
        				break;
        			case "lctCl":
        				apiVO.setLctCl(item_child.getTextContent());
        				break;
        			case "eqpmnLendCl":
        				apiVO.setEqpmnLendCl(item_child.getTextContent());
        				break;
        			case "firstImageUrl":
        				apiVO.setFirstImageUrl(item_child.getTextContent());
        				break;
        			case "tel":
        				apiVO.setTel(item_child.getTextContent());
        				break;
        			case "mapX":
        				apiVO.setMapX(item_child.getTextContent());
        				break;
        			case "mapY":
        				apiVO.setMapY(item_child.getTextContent());
        				break;
        			case "animalCmgCl":
        				apiVO.setAnimalCmgCl(item_child.getTextContent());
        				break;
        			case "homepage":
        				apiVO.setHomepage(item_child.getTextContent());
        				break;
        			case "induty":
        				apiVO.setInduty(item_child.getTextContent());
        				break;
        			}
        		}
        		
        		jlist.add(apiVO);
        		
        		mv.addObject("LIST", jlist);
        		
        	}
        	
        } catch (Exception e) {}
        
        mv.addObject("PAGE", page);
		mv.setViewName("campapi/campApi");
		return mv;
	}

}