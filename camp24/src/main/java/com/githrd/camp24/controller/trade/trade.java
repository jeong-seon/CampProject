package com.githrd.camp24.controller.trade;
/**
 * @author	김희승
 * @since	2022.06.19
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 
 * 				2022.06.17	-	담당자 : 김희승
 * 				
 * 									로그인처리 로그아웃 처리
 *
 */




import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
import java.util.logging.Logger;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.camp24.util.PageUtil;
import com.githrd.camp24.vo.*;
import com.githrd.camp24.vo.FileVO;
import com.githrd.camp24.vo.BoardVO;
import com.githrd.camp24.dao.TradeDao;
import com.githrd.camp24.service.TradeService;

@Controller
@RequestMapping("/trade")
public class trade {
	@Autowired
	TradeDao tDao;
	@Autowired
	TradeService tSrvc;

	@RequestMapping("/trade.cmp")
	public ModelAndView boardList(ModelAndView mv, PageUtil page, BoardVO bVO) {
//		System.out.println("########## nowPage : " + page.getNowPage());
		// 할일
		// 1. 총 게시글 수 가져오고
		int total = tDao.getTotal();
		// 2. 해당페이지의 페이지 정보 만들고
		page.setPage(total);
		// 3. 해당페이지의 글 목록 가져오고...
		List<BoardVO> list = tDao.getList(page);
		List<BoardVO> list2 = tDao.getCateList(bVO);
		List<BoardVO> image = tDao.imgList();
		// 4. 데이터 심고

	
		mv.addObject("LIST", list);
		mv.addObject("LIST2", list2);
		mv.addObject("IMAGE", image);
		mv.addObject("PAGE", page);

		// 5. 뷰 부르고
		mv.setViewName("trade/trade");
		// 6. mv 반환하고
		return mv;
	}
	
	@RequestMapping("/tradeWrite.cmp")
	public ModelAndView boardWrite(ModelAndView mv) {
		mv.setViewName("trade/tradeWrite");
		return mv;
	}
	
	// 물품 등록 처리
		@RequestMapping("/tradeWriteProc.cmp")
		public ModelAndView boardWriteProc(ModelAndView mv, BoardVO bVO, String nowPage) {
			String view = "/camp24/trade/trade.cmp";
			
			try {
				tSrvc.addBoardData(bVO);

				bVO.setResult("OK");
				nowPage = "1";
			} catch(Exception e) {

				bVO.setResult("NO");
				view = "/camp24/trade/tradeWrite.cmp";
				System.out.println(bVO);
				e.printStackTrace();
			}
			mv.addObject("NOWPAGE", nowPage);
			mv.addObject("VIEW", view);
			
			mv.setViewName("trade/redirect");
			return mv;
		}
		
		// 첨부파일 삭제 요청 처리함수
		@RequestMapping(path="/fileDel.json", method=RequestMethod.POST, params="ino")
		@ResponseBody
		public HashMap<String, String> fileDel(FileVO fVO){
			HashMap<String, String> map = new HashMap<String, String>();
			String result = "OK";
			
			int cnt = tDao.delFile(fVO.getIno());
			if(cnt != 1) {
				result = "NO";
			}
			
			map.put("result", result);
			
			return map;
		}
		
		// 게시글 수정 요청 처리함수
		@RequestMapping("/tradeEditProc.cmp")
		public ModelAndView boardEditProc(ModelAndView mv, BoardVO bVO, String nowPage) {
			String view = "/camp24/trade/tradeDetail.cmp";
			try {
				tSrvc.editBoard(bVO);
			} catch(Exception e) {
				e.printStackTrace();
				view = "/camp24/trade/tradeEdit.cmp";
			}
			
			mv.addObject("VIEW", view);
			mv.addObject("NOWPAGE", nowPage);
			
			mv.setViewName("trade/redirect");
			return mv;
		}
		
		// 게시글 수정폼 보기 요청 처리함수
				@RequestMapping(path="/tradeEdit.cmp", method=RequestMethod.POST, params= {"nowPage", "tno"})
				public ModelAndView boardEdit(ModelAndView mv, BoardVO bVO) {
					
					List<FileVO> image = tDao.imagenoList(bVO.getTno());
					
					// 게시글 상세 정보 조회
					bVO = tDao.getDetail(bVO.getTno());
					
					// 데이터 심고
					mv.addObject("DATA", bVO);
					mv.addObject("LIST", image);
					
					mv.setViewName("trade/tradeEdit");
					return mv;
				}
		
		// 게시글 삭제 요청 처리함수
		@RequestMapping("/tradeDel.cmp")
		public ModelAndView delBoard(ModelAndView mv, BoardVO bVO, String nowPage) {
			int cnt = tDao.delBoard(bVO.getTno());
			String view = "/camp24/trade/trade.cmp";
			if(cnt != 1) {
				view = "/camp24/trade/tradeDetail.cmp";
			}
			
			mv.addObject("VIEW", view);
			
			mv.addObject("NOWPAGE", nowPage);
			
			// 뷰 정하고
			mv.setViewName("trade/redirect");
			return mv;
		}
		
	
		// 게시글 상세보기 요청 처리함수
		@RequestMapping(path="/tradeDetail.cmp", 
				method=RequestMethod.POST, params={"tno", "nowPage"})
		public ModelAndView tradeDetail(ModelAndView mv, BoardVO bVO) {
				List<FileVO> list = tDao.getFileList(bVO.getTno());
				
				List<BoardVO> list2 = tDao.gettradeList2(bVO);
				
				
				int cnt = tSrvc.click(bVO.getTno());
				
				if(cnt == 1) {
					bVO = tDao.getDetail(bVO.getTno());
				}
				
				// 데이터 심고
				mv.addObject("DATA", bVO);
				mv.addObject("LIST", list);
				mv.addObject("LIST2", list2);
				// 뷰 정하고
				mv.setViewName("trade/tradeDetail");
				return mv;
		}
		
		@RequestMapping("/cateList.json")
		@ResponseBody
		public List<BoardVO> cateList(BoardVO bVO){
			List<BoardVO> list = tDao.getCateList(bVO);
			return list;
		}
		// 상품 리스트 요청 전담 처리함수
		@RequestMapping("/tradelist.json")
		@ResponseBody
		public List<BoardVO> tradeList(BoardVO bVO){
			
		List<BoardVO> list = tDao.gettradeList(bVO);
			
				
				return list;
		}
		
		
		
		@RequestMapping("/kakaopay.json")
		@ResponseBody
		public ModelAndView kakaopay(ModelAndView mv,BoardVO bVO) {
			List<BoardVO> list2 = tDao.gettradeList2(bVO);
			
			mv.addObject("LIST2", list2);
			return mv;
		}
}

//"cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=data.id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost/camp24/main.cmp&fail_url=http://localhost/camp24/trade.cmp&cancel_url=http://localhost/camp24/trade/trade.cmp";
