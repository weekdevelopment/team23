package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.*;
import kr.co.teaspoon.util.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/*")
public class adminController {
    private static final Logger logger = LoggerFactory.getLogger(adminController.class);

    @Autowired
    private MemberService memberService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private FreeService freeService;

    @Autowired
    private EdumagService edumagService;

    @Autowired
    private EdumagCommentService edumagCommentService;

    @Autowired
    private EventService eventService;

    @Autowired
    private FaqService faqService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private QnaService qnaService;

    @Autowired
    private WinnerService winnerService;

    @Autowired
    HttpSession session;

    @Autowired
    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @RequestMapping(value = "adminList.do", method = RequestMethod.GET)
    public String adminPageGET(Model model) {
        logger.info("메인 페이지 진입");

        // 모델에 데이터를 추가하려면 여기에 코드를 추가하세요.
        // 예를 들어, 모델에 today와 myName을 추가하는 코드는 다음과 같습니다.
        model.addAttribute("today", "오늘 날짜");
        model.addAttribute("myName", "내 이름");

        return "/admin/adminDashboard"; // main.jsp로 이동
    }

    // 관리자가 회원 리스트 View
    @RequestMapping(value = "memberList.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원 목록");
        return "/admin/member/memberList";
    }

    // 관리자가 회원 정보 View
    @RequestMapping(value = "memberDetail.do", method = RequestMethod.GET)
    public String memberDetail(@RequestParam String id, Model model) throws Exception {
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/admin/member/memberDetail";
    }

    // 회원 가입 폼 로딩 (GET 요청)
    @GetMapping("insert-form")
    public String getMemberInsertForm(Model model) {
        // 폼을 로딩하는 로직 추가
        return "/admin/member/memberInsert";
    }

    // 회원 가입 - 회원 가입 처리 (POST 요청)
    @PostMapping("memberInsert.do")
    public String memberWrite(Member member, Model model) throws Exception {
        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);
        memberService.memberInsert(member);
        return "redirect:/";
    }

    //회원정보 변경
    @RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
    public String memberUpdate(Member mem, Model model) throws Exception {
        String pwd = "";
        if(mem.getPw().length()<=16) {
            pwd = pwEncoder.encode(mem.getPw());
            mem.setPw(pwd);
        }
        memberService.memberEdit(mem);
        return "redirect:/";
    }

    //회원 탈퇴
    @RequestMapping(value="memberDelete.do", method = RequestMethod.GET)
    public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        return "redirect:/";
    }

    // 관리자가 공지사항 게시판 View
    @GetMapping("boardList.do")
    public String getBoardList(Model model) throws Exception {
        logger.info("관리자 게시판 페이지 진입");
        List<Board> boardList = boardService.boardList();
        model.addAttribute("boardList", boardList);
        return "/admin/board/boardList"; // 관리자 게시판 목록 뷰로 이동
    }


    @GetMapping("boardDetail.do")
    public String getBoardDetail(HttpServletRequest request, Model model) throws Exception {
        logger.info("관리자 게시판 페이지 진입");
        int seq = Integer.parseInt(request.getParameter("seq"));
        Board dto = boardService.boardDetail(seq);
        model.addAttribute("dto", dto);
        return "/admin/board/boardDetail"; // 관리자 게시판 상세보기 뷰로 이동
    }

    @GetMapping("boardInsert.do")
    public String boardInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/admin/board/boardInsert";
    }

    @PostMapping("boardInsert.do")
    public String boardInsert(HttpServletRequest request, Model model) throws Exception {
        Board dto = new Board();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.boardInsert(dto);
        return "redirect:boardList.do";
    }

    @GetMapping("boardDelete.do")
    public String boardDelete(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        boardService.boardDelete(seq);
        return "redirect:boardList.do";
    }

    @GetMapping("boardEdit.do")
    public String boardEditForm(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        Board dto = boardService.boardDetail(seq);
        model.addAttribute("dto", dto);
        return "/admin/board/boardEdit"; // 게시판 수정 폼 뷰로 이동
    }


    @PostMapping("boardEdit.do")
    public String boardEdit(HttpServletRequest request, Model model) throws Exception {
        int seq = Integer.parseInt(request.getParameter("seq"));
        Board dto = new Board();
        dto.setSeq(seq);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.boardEdit(dto);
        return "redirect:boardList.do"; // 수정 후 게시판 목록으로 리다이렉트
    }

    // 자유게시판 게시판 컨트롤러
    @GetMapping("freeList.do")
    public String getFreeList(Model model) throws Exception {
        // 임시 주석 처리
        //List<Free> freeList = freeService.freeList();
        //model.addAttribute("freeList", freeList);
        return "/admin/freeList"; // 관리자 자유게시판 목록 뷰로 이동
    }

    @GetMapping("freeDetail.do")
    public String getFreeDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Free dto = freeService.freeDetail(bno);
        model.addAttribute("dto", dto);
        return "/admin/freeDetail"; // 관리자 자유게시판 상세보기 뷰로 이동
    }

    @GetMapping("freeInsert.do")
    public String freeInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/free/freeInsert";
    }

    @PostMapping("freeInsert.do")
    public String freeInsert(HttpServletRequest request, Model model) throws Exception {
        Free dto = new Free();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        freeService.freeInsert(dto);
        return "redirect:freeList.do";
    }

    @GetMapping("freeDelete.do")
    public String freeDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        freeService.freeDelete(bno);
        return "redirect:freeList.do";
    }

    @GetMapping("freeEdit.do")
    public String freeEditForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Free dto = freeService.freeDetail(bno);
        model.addAttribute("dto", dto);
        return "/admin/free/freeEdit"; // 자유게시판 수정 폼 뷰로 이동
    }

    @PostMapping("freeEdit.do")
    public String freeEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Free dto = new Free();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        freeService.freeEdit(dto);
        return "redirect:freeList.do"; // 수정 후 자유게시판 목록으로 리다이렉트
    }

    // Edumag 게시판 컨트롤러
    @GetMapping("edumagList.do")
    public String getedumagList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        System.out.println(type + ", " + keyword + ", " + curPage);

        Page page = new Page();
        page.setPostCount(9);
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = edumagService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        List<Edumag> edumagList = edumagService.edumagList(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        //로그인 한 아이디
        model.addAttribute("edumagList", edumagList);
        return "/edumag/edumagList";
    }

    @GetMapping("edumagDetail.do")
    public String getedumagDetail(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        //에듀매거진 게시글 상세보기
        Edumag dto = edumagService.edumagDetail(no);
        //에듀매거진 게시글의 댓글 조회
        List<EdumagComment> edumagComments = edumagCommentService.edumagCommentList(no);
        model.addAttribute("dto", dto);
        model.addAttribute("edumagCommentList", edumagComments);
        return "/admin/edumag/edumagDetail";
    }

    @GetMapping("edumagInsert.do")
    public String edumagInsertForm() {
        return "/admin/edumag/edumagInsert"; // Edumag 게시판 글 작성 폼 뷰로 이동
    }

    @PostMapping("edumagInsert.do")
    public String edumagInsert(HttpServletRequest request, Model model) throws Exception {
        Edumag dto = new Edumag();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        edumagService.edumagInsert(dto);
        return "redirect:edumagList.do"; // 글 작성 후 Edumag 게시판 목록으로 리다이렉트
    }

    @GetMapping("edumagDelete.do")
    public String edumagDelete(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        edumagService.edumagDelete(no);
        return "redirect:edumagList.do";
    }

    @GetMapping("edumagEdit.do")
    public String edumagEditForm(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        Edumag dto = edumagService.edumagDetail(no);
        model.addAttribute("dto", dto);
        return "/admin/edumag/edumagEdit"; // Edumag 게시판 수정 폼 뷰로 이동
    }

    @PostMapping("edumagEdit.do")
    public String edumagEdit(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        Edumag dto = new Edumag();
        dto.setNo(no);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        edumagService.edumagEdit(dto);
        return "redirect:edumagList.do"; // 수정 후 Edumag 게시판 목록으로 리다이렉트
    }

    // Event 컨트롤러
    @GetMapping("eventList.do")
    public String getEventList(Model model) throws Exception {
        List<Event> eventList = eventService.eventList();
        model.addAttribute("eventList", eventList);
        return "/admin/event/eventList"; // 관리자 이벤트 게시판 목록 뷰로 이동
    }

    @GetMapping("eventDetail.do")
    public String getEventDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Event dto = eventService.eventDetail(bno);
        model.addAttribute("dto", dto);
        return "/admin/event/eventDetail"; // 관리자 이벤트 게시판 상세보기 뷰로 이동
    }

    @GetMapping("eventInsert.do")
    public String eventInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/admin/event/eventInsert";
    }

    @PostMapping("eventInsert.do")
    public String eventInsert(HttpServletRequest request, Model model) throws Exception {
        Event dto = new Event();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        eventService.eventInsert(dto);
        return "redirect:eventList.do";
    }

    @GetMapping("eventDelete.do")
    public String eventDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        eventService.eventDelete(bno);
        return "redirect:eventList.do";
    }

    @GetMapping("eventEdit.do")
    public String eventEditForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Event dto = eventService.eventDetail(bno);
        model.addAttribute("dto", dto);
        return "/admin/event/eventEdit"; // 이벤트 게시판 수정 폼 뷰로 이동
    }

    @PostMapping("eventEdit.do")
    public String eventEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Event dto = new Event();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        eventService.eventEdit(dto);
        return "redirect:eventList.do"; // 수정 후 이벤트 게시판 목록으로 리다이렉트
    }

    // Faq 컨트롤러
    @GetMapping("faqList.do") //faq/list.do
    public String getFaqList(Model model) throws Exception {
        List<Faq> faqList = faqService.faqList();
        model.addAttribute("faqList", faqList);
        return "/admin/faq/faqList";
    }

    // Notice 컨트롤러
    @GetMapping("noticeList.do") //notice/list.do
    public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Notice> noticeList = noticeService.noticeList(page);
        model.addAttribute("noticeList", noticeList);
        return "/notice/noticeList";
    }

    @GetMapping("noticeDetail.do")	//board/detail.do?seq=1
    public String getNoticeDetail(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = noticeService.noticeDetail(nno);
        model.addAttribute("dto", dto);
        return "/admin/notice/noticeDetail";
    }

    @GetMapping("noticeInsert.do")
    public String noticeInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "admin/notice/noticeInsert";
    }

    @PostMapping("noticeInsert.do")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception {
        Notice dto = new Notice();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        noticeService.noticeInsert(dto);
        return "redirect:noticeList.do";
    }

    @GetMapping("noticeDelete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        noticeService.noticeDelete(nno);
        return "redirect:noticeList.do";
    }

    @GetMapping("noticeEdit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = noticeService.noticeDetail(nno);
        model.addAttribute("dto", dto);
        return "/admin/notice/noticeEdit";
    }

    @PostMapping("noticeEdit.do")
    public String noticeEdit(HttpServletRequest request, Model model) throws Exception {
        int nno = Integer.parseInt(request.getParameter("nno"));
        Notice dto = new Notice();
        dto.setNno(nno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        noticeService.noticeEdit(dto);
        return "redirect:noticeList.do";
    }

    // qna 컨트롤러 View
    @GetMapping("qnaList.do") //notice/list.do
    public String getQnaList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = qnaService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Qna> qnaList = qnaService.qnaList(page);
        model.addAttribute("qnaList", qnaList);
        List<Qna> selectBest = qnaService.selectBest();
        model.addAttribute("selectBest",selectBest);
        List<Qna> selectVisit = qnaService.selectVisit();
        model.addAttribute("selectVisit",selectVisit);

        return "/qna/qnaList";
    }

    @GetMapping("qnaDetail.do")	//board/detail.do?seq=1
    public String getQnaDetail(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        Qna dto = qnaService.qnaDetail(qno);
        model.addAttribute("dto", dto);
        model.addAttribute("lev",lev);
        return "admin/qna/qnaDetail";
    }

    @GetMapping("qnaInsert.do")
    public String qnaInsertForm(HttpServletRequest request, Model model) throws Exception {
        int lev = Integer.parseInt(request.getParameter("lev"));
        model.addAttribute("lev", lev);
        int par = Integer.parseInt(request.getParameter("par"));
        model.addAttribute("par", par);
        return "/admin/qna/qnaInsert";
    }

    @PostMapping("qnaInsert.do")
    public String qnaInsert(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setLev(Integer.parseInt(request.getParameter("lev")));
        dto.setPar(Integer.parseInt(request.getParameter("par")));
        dto.setAuthor(request.getParameter("author"));

        qnaService.qnaInsert(dto);
        return "redirect:qnaList.do";
    }

        @GetMapping("qnaDelete.do")
    public String qnaDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        Qna dto = new Qna();
        dto.setQno(qno);
        dto.setLev(lev);
        qnaService.qnaDelete(dto);
        return "redirect:list.do";
    }

    @GetMapping("qnaEdit.do")
    public String qnaEditForm(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));
        Qna dto = qnaService.qnaDetail(qno);
        model.addAttribute("dto", dto);
        model.addAttribute("lev", lev);
        return "/admin/qna/qnaEdit";
    }

    @PostMapping("qnaEdit.do")
    public String qnaEdit(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        String author = request.getParameter("author");
        Qna dto = new Qna();
        dto.setQno(qno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor("author");
        qnaService.qnaEdit(dto);
        return "redirect:qnaList.do";
    }

    // Winner 컨트롤러 View
    @GetMapping("winnerList.do")		//winner/list.do
    public String getwinnerList(Model model) throws Exception {
        List<Winner> winnerList = winnerService.winnerList();
        model.addAttribute("winnerList", winnerList);
        return "/winner/winnerList";
    }

    @GetMapping("winnerDetail.do")	//winner/detail.do?bno=1
    public String getwinnerDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Winner dto = winnerService.winnerDetail(bno);
        model.addAttribute("dto", dto);
        return "/admin/winner/winnerDetail";
    }

    @GetMapping("winnerInsert.do")
    public String winnerInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "admin/winner/winnerInsert";
    }

    @PostMapping("winnerInsert.do")
    public String winnerInsert(HttpServletRequest request, Model model) throws Exception {
        Winner dto = new Winner();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        winnerService.winnerInsert(dto);
        return "redirect:winnerList.do";
    }

    @GetMapping("winnerDelete.do")
    public String winnerDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        winnerService.winnerDelete(bno);
        return "redirect:winnerList.do";
    }

    @GetMapping("winnerEdit.do")
    public String winnerEditForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Winner dto = winnerService.winnerDetail(bno);
        model.addAttribute("dto", dto);
        return "/admin/winner/winnerEdit";
    }

    @PostMapping("winnerEdit.do")
    public String winnerEdit(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Winner dto = new Winner();
        dto.setBno(bno);
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        winnerService.winnerEdit(dto);
        return "redirect:winnerList.do";
    }


    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value="imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "D:\\kim\\spring1\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
            //String path = request.getRealPath("/resource/uploadckImage/");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/pro3_war/free/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value="ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
            , @RequestParam(value="fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        //서버에 저장된 이미지 경로
        String path = "D:\\kim\\spring1\\pro31\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 저장된 이미지 경로
        //String path = request.getRealPath("/resource/uploadckImage/");
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}