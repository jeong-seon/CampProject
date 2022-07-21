package com.githrd.camp24.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.githrd.camp24.dao.TradeDao;
import com.githrd.camp24.util.FileUtil;
import com.githrd.camp24.vo.BoardVO;
import com.githrd.camp24.vo.FileVO;

public class TradeService {
	
	@Autowired
	TradeDao tDao;
	
	// 단일 파일 업로드 처리함수
		public FileVO uploadProc(MultipartFile file/*, String dir*/) {
			/*
				이 함수가 파일을 업로드 하기 위해서는
				컨트롤러에서 업로드할 파일의 정보를 받아와야 한다.
				
				여러개의 파일 중 이 함수에서는 한개의 파일만 처리하도록 하자.
			 */
			
			// 반환값 변수
			FileVO fVO = new FileVO();
			// 저장 경로를 기억할 변수
			String path = this.getClass().getResource("").getPath();
			path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources/upload";
//			path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources" + dir;
			// 저장 경로
			fVO.setIdir("/camp24/upload/");
//			fVO.setDir("/www" + dir);
			
			// 파일 크기
			long len = file.getSize();
			fVO.setIlen(len);
			
			// 파일의 원 이름을 꺼내오고
			String oldName = file.getOriginalFilename();
			if(oldName == null) {
				return fVO;
			}
			
			fVO.setIoriname(oldName);
			
			// 저장이름 만들고
			String rename = FileUtil.rename(path, oldName);
			
			fVO.setIsavename(rename);
			fVO.setImageno(fVO.getTno());
			fVO.setIcode("T");
			// 파일 업로드하고
			try {
				File f = new File(path, rename);
				
				file.transferTo(f);		// 파일 내용 기록...
			} catch (Exception e) {
				e.printStackTrace();
			}
			return fVO;
		}
		
		// 다중 파일 업로드 기능 처리함수
		public ArrayList<FileVO> uploadProc(MultipartFile[] file) {
			ArrayList<FileVO> list = new ArrayList<FileVO>();
			
			for(MultipartFile f : file) {
				list.add(uploadProc(f));
			}
			return list;
		}
		
		// 데이터베이스 입력작업 전담 처리함수
		@Transactional
		public void addBoardData(BoardVO bVO) {
			// 할일
			// 게시판 테이블에 데이터 입력하고
			tDao.addBoard(bVO);
			
			if(bVO.getFile() != null) {
				// 파일 정보 테이블에 파일정보들을 입력하고(반복작업 필요)
				ArrayList<FileVO> list = uploadProc(bVO.getFile());
				// bno 를 꺼내서 FileVO 들에 채워주고
				for(FileVO f : list) {
					f.setTno(bVO.getTno());
				}
				
				// 데이터 입력작업을 파일 갯수만큼 반복해준다.
				for(FileVO f : list) {
					tDao.addFile(f);
				}
			}
		}
		
		// 게시글 수정 데이터베이스 작업 처리함수
		@Transactional
		public void editBoard(BoardVO bVO) {
			if(bVO.getTitle() != null || bVO.getBody() != null) {
				tDao.editBoard(bVO);
			}
			// 파일정보테이블에 파일정보들 입력하고(반복)
			if(bVO.getFile() != null) {
				ArrayList<FileVO> list = uploadProc(bVO.getFile());
				// bno를 꺼내서 FileVO들에 채워주고
				for(FileVO f : list) {
					f.setTno(bVO.getTno());
				}
		
				// 데이터 입력작업을 파일 갯수만큼 반복해준다.\
				for(FileVO f : list) {
					tDao.addFile(f);
				}
			}
		}
		// 조회수 클릭 업
		public int click(int tno) {
			return tDao.clickUp(tno);
		}
		
	}