package com.doglife.db.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.doglife.db.dao.ShopDao;
import com.doglife.db.dto.CartDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ProductFileDto;
import com.doglife.db.dto.ProductListDto;
import com.doglife.db.dto.ShopReplyDto;
import com.doglife.db.util.PagingUtil;

import lombok.extern.java.Log;

@Service
@Log
public class ShopService {

	@Autowired
	private ShopDao shopDao;

	private ModelAndView mv;
	
	private int listCnt = 5;//페이지 당 출력할 게시글 개수
	
	public ModelAndView toShopMain(ProductListDto productList, HttpSession session) {
		mv = new ModelAndView();
		
		int num = productList.getPageNum();
		productList.setPageNum((num) * listCnt);
		productList.setListCnt(listCnt);
				
		List<ProductDto> newList = shopDao.selectNewProductList(productList);
		List<ProductDto> bestList = shopDao.selectBestProductList(productList);
		
		
		mv.addObject("newList", newList);
		mv.addObject("bestList", bestList);
		
		//페이징 처리
		productList.setPageNum(num);
		String pageHtml = getPaging(productList);
		mv.addObject("paging", pageHtml);
		
		//세션에 페이지번호 저장(글쓰기 또는 글 상세보기 화면에서 목록 화면으로
		//돌아 갈 때 사용할 페이지 번호를 저장)
		session.setAttribute("pageNum", productList.getPageNum());
		if(productList.getColname() != null) {
			session.setAttribute("productList", productList);	
		}		
		else {//검색이 아닐 경우는 세션의 ListDto를 제거
			session.removeAttribute("productList");
		}
						
		mv.setViewName("shopMain");
		
		return mv;
	}
	
	public ModelAndView showProductList(ProductListDto productList, HttpSession session) {
		mv = new ModelAndView();
		
		//Dao에 보내는 데이터를 만들자. (검색 기능 추가로 코드 사용 안함)
		//Map<String, Integer> pmap = new HashMap<String, Integer>();
		//pmap.put("pnum", (pageNum - 1) * listCnt);
		//pmap.put("lcnt", listCnt);
		int num = productList.getPageNum();
		productList.setPageNum((num) * listCnt);
		productList.setListCnt(listCnt);
				
		List<ProductDto> pList = shopDao.selectProductList(productList);
		
		mv.addObject("pList", pList);
		
		//페이징 처리
		productList.setPageNum(num);
		String pageHtml = getPaging(productList);
		mv.addObject("paging", pageHtml);
		
		//세션에 페이지번호 저장(글쓰기 또는 글 상세보기 화면에서 목록 화면으로
		//돌아 갈 때 사용할 페이지 번호를 저장)
		session.setAttribute("pageNum", productList.getPageNum());
		if(productList.getColname() != null) {
			session.setAttribute("productList", productList);	
		}		
		else {//검색이 아닐 경우는 세션의 ListDto를 제거
			session.removeAttribute("productList");
		}
						
		mv.setViewName("productList");
		
		return mv;
	}
	
	public ModelAndView showClothesList(ProductListDto productList, HttpSession session) {
		mv = new ModelAndView();
		
		//Dao에 보내는 데이터를 만들자. (검색 기능 추가로 코드 사용 안함)
		//Map<String, Integer> pmap = new HashMap<String, Integer>();
		//pmap.put("pnum", (pageNum - 1) * listCnt);
		//pmap.put("lcnt", listCnt);
		int num = productList.getPageNum();
		productList.setPageNum((num) * listCnt);
		productList.setListCnt(listCnt);
				
		List<ProductDto> clothesList = shopDao.selectClothesList(productList);
		
		mv.addObject("clothesList", clothesList);
		
		//페이징 처리
		productList.setPageNum(num);
		String pageHtml = getPaging(productList);
		mv.addObject("paging", pageHtml);
		
		//세션에 페이지번호 저장(글쓰기 또는 글 상세보기 화면에서 목록 화면으로
		//돌아 갈 때 사용할 페이지 번호를 저장)
		session.setAttribute("pageNum", productList.getPageNum());
		if(productList.getColname() != null) {
			session.setAttribute("productList", productList);	
		}		
		else {//검색이 아닐 경우는 세션의 ListDto를 제거
			session.removeAttribute("productList");
		}

		mv.setViewName("shopClothesList");
		
		return mv;
	}
	
	
	
	
	
	
	private String getPaging(ProductListDto productList) {
		String pageHtml = null;
		
		//전체 글개수 구하기
		int maxNum = shopDao.bcntSelect(productList);
		//한 페이지 당 보여질 페이지 번호의 개수
		int pageCnt = 5;
		String listName = "productList?";
		
		//검색용 컬럼명과 검색어를 추가
		if(productList.getColname() != null) {
			listName += "colname="+productList.getColname()+"&keyword="+productList.getKeyword()+"&";
		}
		
		PagingUtil paging = new PagingUtil(maxNum, productList.getPageNum(), 
				listCnt, pageCnt, listName);
		
		pageHtml = paging.makePaging();
		
		return pageHtml;
	}

	public ModelAndView showProductInfo(Integer pnum) {
		mv = new ModelAndView();
		
		//글 내용 가져오기
		ProductDto productInfo = shopDao.selectProductInfo(pnum);
		
		//파일 목록 가져오기
		List<ProductFileDto> ProductFileList = shopDao.selectProductFile(pnum);
		
		//댓글 목록 가져오기
		List<ShopReplyDto> productReview = shopDao.selectProductReply(pnum);
		
		//조회수 수정 (1 증가)

		
		//해시태그 목록 가져오기

		
		//가져온 데이터를 mv에 추가
		mv.addObject("productInfo", productInfo);
		mv.addObject("ProductFileList", ProductFileList);
		mv.addObject("productReview", productReview);
		
		
		//보여질 페이지(jsp) 이름 지정
		mv.setViewName("productInfo");
		
		return mv;
	}

	
	public ModelAndView showCartList(String customerID) {
		mv = new ModelAndView();
		
		//카트 담긴 제품 리스트 가져오기
		List<CartDto> cartList = shopDao.selectCartList(customerID);
		
		
		
		
		
		
		//가져온 데이터를 mv에 추가
		mv.addObject("cartList", cartList);

		
		mv.setViewName("newcart");
		
		return mv;
		
		
	}
}


/*


@Service
@Log
public class BoardService {
	@Autowired
	private BoardDao bDao;
	@Autowired
	private MemberDao mDao;
	//게시글 작성한 사용자의 point 증가 및 등급 변경 내용 출력 시 활용.
	//(세션에 다시 저장)
	
	private ModelAndView mv;
	
	private int listCnt = 5;//페이지 당 출력할 게시글 개수
	
	public ModelAndView getBoardList(ListDto list, 
			HttpSession session) {
		mv = new ModelAndView();
		
		//Dao에 보내는 데이터를 만들자. (검색 기능 추가로 코드 사용 안함)
		//Map<String, Integer> pmap = new HashMap<String, Integer>();
		//pmap.put("pnum", (pageNum - 1) * listCnt);
		//pmap.put("lcnt", listCnt);
		int num = list.getPageNum();
		list.setPageNum((num - 1) * listCnt);
		list.setListCnt(listCnt);
				
		List<BoardDto> bList = bDao.boardListSelect(list);
		
		mv.addObject("bList", bList);
		
		//페이징 처리
		list.setPageNum(num);
		String pageHtml = getPaging(list);
		mv.addObject("paging", pageHtml);
		
		//세션에 페이지번호 저장(글쓰기 또는 글 상세보기 화면에서 목록 화면으로
		//돌아 갈 때 사용할 페이지 번호를 저장)
		session.setAttribute("pageNum", list.getPageNum());
		if(list.getColname() != null) {
			session.setAttribute("list", list);	
		}		
		else {//검색이 아닐 경우는 세션의 ListDto를 제거
			session.removeAttribute("list");
		}
		mv.setViewName("boardList");
		
		return mv;
	}

	private String getPaging(ListDto list) {
		String pageHtml = null;
		
		//전체 글개수 구하기
		int maxNum = bDao.bcntSelect(list);
		//한 페이지 당 보여질 페이지 번호의 개수
		int pageCnt = 5;
		String listName = "list?";
		
		//검색용 컬럼명과 검색어를 추가
		if(list.getColname() != null) {
			listName += "colname="+list.getColname()+"&keyword="+list.getKeyword()+"&";
		}
		
		PagingUtil paging = new PagingUtil(maxNum, list.getPageNum(), 
				listCnt, pageCnt, listName);
		
		pageHtml = paging.makePaging();
		
		return pageHtml;
	}
	
	@Transactional
	public String boardWrite(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		//세션에 들어가 있는 접속자의 정보를 갱신해야 함.
		HttpSession session = multi.getSession();
		
		//multi에서 데이터를 추출(게시글의 텍스트 부분)
		String id = multi.getParameter("bid");
		String title = multi.getParameter("btitle");
		String content = multi.getParameter("bcontents");
		String fcheck = multi.getParameter("fileCheck");
		
		//textarea는 실제 데이터의 앞뒤에 공백(노이즈)이 발생하는 경우가
		//종종 있음. -> trim() 활용
		content = content.trim();
		
		//추출한 데이터를 dto에 삽입.
		BoardDto board = new BoardDto();
		board.setBid(id);
		board.setBtitle(title);
		board.setBcontents(content);
		
		try {
			//1. 게시글을 DB에 저장
			bDao.boardInsert(board);//이 문장 실행 후 b_num 필드에 입력한 게시글의 번호가 저장.
			log.info("삽입 후 bnum : " + board.getBnum());
			
			//2. 업로드 파일이 있을 경우 파일 저장 및 DB에 정보 저장
			if(fcheck.equals("1")) {
				fileUpload(multi, board.getBnum());
			}
			
			//3. 회원의 포인트 정보 변경 및 세션 데이터 변경
//			@Override
//		    public void updatePoint(String m_name, int m_point) throws Exception {
//		    Map<String, Object> map = new HashMap<String, Object>();
//		    map.put("m_name", m_name);
//		    map.put("m_point", m_point);
//		    session.update(namespace + ".updatePoint", map);
//		    }
//			
//			updatePoint(String m_name, int m_point);
//			
			
			
			
			//해시태그 등록
			HashTagProcess htp = new HashTagProcess();
			List<TagDto> tList = htp.addTagWord(content, board.getBnum());
			
			int cntHashTag = 0;
			for(int i = 0; i < tList.size(); i++) {
				TagDto td = tList.get(i);
				String type = td.getT_type();
				if(type.equals("NNG") || type.equals("NNP") || type.equals("NNB")) {
					bDao.tagInsert(td);
					cntHashTag++; 
				}
				if(cntHashTag > 5) {
					break;
				}
			}
			
			view = "redirect:/list?pageNum=1";//목록의 첫페이지로 이동
			msg = "글 작성 성공";
		} catch (Exception e) {
			e.printStackTrace();
			
			view = "redirect:/writeF";
			msg = "글 작성 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	private void fileUpload(MultipartHttpServletRequest multi, 
			int bnum) throws Exception {
		//request의 서버 정보에서 프로젝트 폴더의 절대 위치 정보 구하기.
		String realPath = multi.getServletContext()
				.getRealPath("/");
		
		//파일을 저장할 경로를 절대경로에 추가
		realPath += "resources/upload/";
		log.info(realPath);
		
		//upload 폴더가 없을 경우 새로 생성.
		File folder = new File(realPath);
		if(folder.isDirectory() == false) {
			//isDirectory() : 폴더의 존재 유무 및 
			//				폴더인지 파일인지의 여부 확인 메소드
			folder.mkdir();//폴더 생성 메소드
		}
		
		//1. 파일 정보를 DB(boardfile) 테이블에 저장(글번호, 원래이름, 변경이름)
		//파일 정보는 HashMap을 사용하여 저장.
		Map<String, String> fmap = new HashMap<String, String>();
		fmap.put("bnum", String.valueOf(bnum));
		
		//multi에서 file 태그의 name 값 꺼내기
		Iterator<String> files = multi.getFileNames();
		
		while(files.hasNext()) {
			String fn = files.next();
			
			//multiple 선택 파일 처리 -> 파일 목록 가져오기
			List<MultipartFile> fList = multi.getFiles(fn);
			
			//각각의 파일을 처리(파일명 추출, 파일을 폴더에 저장)
			for(int i = 0; i < fList.size(); i++) {
				MultipartFile mf = fList.get(i);
				
				//파일명 추출
				String oriname = mf.getOriginalFilename();
				
				//변경할 이름 생성
				String sysname = System.currentTimeMillis()
					+ oriname.substring(oriname.lastIndexOf("."));
				
				fmap.put("oriname", oriname);
				fmap.put("sysname", sysname);
				
				//upload 폴더 파일 저장
				File ff = new File(realPath + sysname);
				mf.transferTo(ff);
				
				//DB에 파일정보 저장
				bDao.fileInsert(fmap);
			}
		}
	}
	
	public ModelAndView getContent(Integer bnum) {
		mv = new ModelAndView();
		
		//글 내용 가져오기
		BoardDto board = bDao.boardSelect(bnum);
		
		//파일 목록 가져오기
		List<BfileDto> fList = bDao.fileSelect(bnum);
		
		//댓글 목록 가져오기
		List<ReplyDto> rList = bDao.replySelect(bnum);
		
		//조회수 수정 (1 증가)
		bDao.addViews(bnum);
		
		//해시태그 목록 가져오기
		List<TagDto> tList = bDao.tagSelect(bnum);
		
		//가져온 데이터를 mv에 추가
		mv.addObject("board", board);
		mv.addObject("fList", fList);
		mv.addObject("rList", rList);
		mv.addObject("tList", tList);
		
		
		//보여질 페이지(jsp) 이름 지정
		mv.setViewName("boardContent");
		
		return mv;
	}
	
	@Transactional
	public Map<String, List<ReplyDto>> replyInsert(ReplyDto reply){
		Map<String, List<ReplyDto>> rmap = null;
		
		try {
			//댓글 삽입
			bDao.replyInsert(reply);
			//댓글 목록 불러오기 및 rmap에 추가
			List<ReplyDto> rList = bDao.replySelect(reply.getR_bnum());
						
			rmap = new HashMap<String, List<ReplyDto>>();
			rmap.put("rList", rList);
			
		} catch(Exception e) {
			e.printStackTrace();
			rmap = null;
		}					
		return rmap;
	}

	public void fileDownload(BfileDto bfile, HttpServletResponse response, HttpSession session) {
		//파일 저장 폴더까지의 실제 경로 구하기
		String realPath = session.getServletContext().getRealPath("/");
		realPath += "resources/upload/";
		
		//경로 + 파일 이름 (sysname) 
		realPath += bfile.getBf_sysname();
		log.info(realPath);
		
		//서버 파일 폴더에서 파일을 가지고 오는 통로(InputStream)
		InputStream inStream = null;
		OutputStream outStream = null;
		
		try {
			//파일명 인코딩(한글 깨짐 방지)
			String downfName = URLEncoder.encode(bfile.getBf_oriname(), "UTF-8");
			
			File file = new File(realPath);
			inStream = new FileInputStream(file);
			
			//인터넷을 통해 전달하기 위한 설정
			response.setContentType("application/octet-stream");
			response.setHeader("content-Disposition", "attachment; filename=\"" + downfName + "\"");
			//attachment; filename="그림1.jpg"
			
			//보내는 통로 생성
			outStream = response.getOutputStream();
			
			//파일 전송(byte 단위로 전송)
			byte[] buffer = new byte[1024];//1kb
			int length;
			while((length = inStream.read(buffer)) != -1) {
				//inputstream의 read 메소드는 버퍼의 크기만큼 데이터를 읽어와서 읽어온 크기를 알려주는 메소드
				//파일에서 읽어올 데이터가 없을 경우 -1을 알려줌
				
				//읽어온 데이터를 바로 사용자 컴퓨터로 보내 줌
				outStream.write(buffer);
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				outStream.flush();
				outStream.close();
				inStream.close();
			} catch (IOException ie) {
				ie.printStackTrace();
			}
		}
		
		//사용자 컴퓨터로 파일을 보내는 통로(OutputStream)
		
		//파일이름을 원래이름으로 변경
		
	}

	public ModelAndView updateFrm(int bnum) {
		mv = new ModelAndView();
		
		//게시글 내용 가져오기(DB)
		BoardDto board = bDao.boardSelect(bnum);
		
		//파일 목록 가져오기(DB)
		List<BfileDto> fList = bDao.fileSelect(bnum);
		
		//mv에 위 내용 추가
		mv.addObject("board", board);
		mv.addObject("fList", fList);
		
		//화면(jsp) 이름 지정
		mv.setViewName("updateF");
		
		return mv;
	}

	@Transactional
	public Map<String, List<BfileDto>> fileDelete(String sysname, int bnum, HttpSession session) {

		Map<String, List<BfileDto>> fMap = null;
		
		//파일 삭제(실제 파일 + 파일 정보 DB 삭제)
		//실제 파일 경로
		String realPath = session.getServletContext().getRealPath("/");
		realPath += "resources/upload/" + sysname;
		log.info(realPath);
		
		try {
			bDao.fileDelete(sysname);
			
			File file = new File(realPath);
			
			if(file.exists()) { //파일이 있을 경우
				if(file.delete()) {//파일 삭제 성공한 경우
					//파일 목록 다시 가져오기
					List<BfileDto> fList = bDao.fileSelect(bnum);
					fMap = new HashMap<String, List<BfileDto>>();
					//파일 목록 맵에 삽입
					fMap.put("fList", fList);
				}
				else {
					fMap = null;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			fMap = null;
		}
		return fMap;
	}
	
	@Transactional
	public String boardUpdate(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		int bnum = Integer.parseInt(multi.getParameter("bnum"));
		
		//multi에서 데이터 추출 및 dto에 삽입
		BoardDto board = new BoardDto();
		board.setBnum(bnum);
		board.setBtitle(multi.getParameter("btitle"));
		board.setBcontents(multi.getParameter("bcontents"));
		String check = multi.getParameter("fileCheck");
		
		try {
			bDao.boardUpdate(board);
			
			if(check.equals("1")) {
				fileUpload(multi, bnum);
			}
			
			view= "redirect:/contents?bnum="+bnum;
			msg = "수정 성공";
			
		} catch(Exception e) {
			e.printStackTrace();
			view= "redirect:/updateF?bnum=" + bnum;
			msg = "수정 실패";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;		
	}
	
	@Transactional
	public String deleteBoard(int bnum, RedirectAttributes rttr) {
		log.info("deleteBoard()");
		
		String view = null;
		String msg = null;
		
		try {
			//댓글 삭제
			bDao.replyDelete(bnum);
			//파일 목록(정보) 삭제
			bDao.fListDelete(bnum);
			//파일 (실제)들 삭제(file.delete사용) --- 나중에 시도해볼것!
			
			//해시태그 삭제
			bDao.tagDelete(bnum);
			//게시글 삭제
			bDao.boardDelete(bnum);
			
			view = "redirect:/list?pageNum=1";
			msg = "Successfully deleted";
			
		} catch(Exception e) {
			e.printStackTrace();
			view = "redirect:/contents?bnum=" + bnum;
			msg = "Failed to delete";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}



	
}//class end



*/