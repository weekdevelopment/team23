package kr.co.teaspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    // 메인 페이지 이동
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainPageGET(Model model) {
        logger.info("메인 페이지 진입");

        // 모델에 데이터를 추가하려면 여기에 코드를 추가하세요.
        // 예를 들어, 모델에 today와 myName을 추가하는 코드는 다음과 같습니다.
        model.addAttribute("today", "오늘 날짜");
        model.addAttribute("myName", "내 이름");

        return "/main"; // main.jsp로 이동
    }
}
