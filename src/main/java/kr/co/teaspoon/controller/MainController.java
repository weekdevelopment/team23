package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Notice;
import kr.co.teaspoon.service.NoticeService;
import kr.co.teaspoon.util.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private NoticeService noticeService;

    // 메인 페이지 이동
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainPageGET(Model model) throws Exception {
        logger.info("메인 페이지 진입");

        // 모델에 데이터를 추가하려면 여기에 코드를 추가하세요.
        // 예를 들어, 모델에 today와 myName을 추가하는 코드는 다음과 같습니다.
        model.addAttribute("today", "오늘 날짜");
        model.addAttribute("myName", "내 이름");

        List<Notice> newNotice = noticeService.newNotice();
        model.addAttribute("newNotice", newNotice);
        return "/main"; // main.jsp로 이동
    }

}
