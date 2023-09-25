package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.BookTalkDAO;
import kr.co.teaspoon.dao.FreeDAO;
import kr.co.teaspoon.dto.BookTalk;
import kr.co.teaspoon.dto.BookTalkComment;
import kr.co.teaspoon.dto.Reco;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookTalkServiceImpl implements BookTalkService {

    @Autowired
    private BookTalkDAO bookTalkDAO;

    @Override
    public List<BookTalk> bookTalkList(Page page) throws Exception {
        return bookTalkDAO.bookTalkList(page);
    }

    @Override
    public BookTalk bookTalkDetail(int bno) throws Exception {
        return bookTalkDAO.bookTalkDetail(bno);
    }

    @Override
    public void bookTalkInsert(BookTalk dto) throws Exception {
        bookTalkDAO.bookTalkInsert(dto);
    }

    @Override
    public void bookTalkDelete(int bno) throws Exception {
        bookTalkDAO.bookTalkDelete(bno);
    }

    @Override
    public void bookTalkEdit(BookTalk dto) throws Exception {
        bookTalkDAO.bookTalkEdit(dto);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return bookTalkDAO.totalCount(page);
    }

    @Override
    public List<BookTalk> bookTalkBestRecList() throws Exception {
        return bookTalkDAO.bookTalkBestRecList();
    }

    @Override
    public List<BookTalk> bookTalkBestCmtList() throws Exception {
        return bookTalkDAO.bookTalkBestCmtList();
    }

    @Override
    public List<BookTalkComment> bookTalkCommentList(int bno) throws Exception {
        return bookTalkDAO.bookTalkCommentList(bno);
    }

    @Override
    public void commentInsert(BookTalkComment dto) throws Exception {
        bookTalkDAO.commentInsert(dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        bookTalkDAO.commentDelete(cno);
    }

    @Override
    public List<BookTalk> commentCount() throws Exception {
        return bookTalkDAO.commentCount();
    }

    @Override
    public Reco findReco(int bno, String id) throws Exception {
        return bookTalkDAO.findReco(bno, id);
    }

    @Override
    public int insertReco(Reco reco) throws Exception {
        int result = 0;
        // 추천이 이미 있는지 확인하는 코드
        Reco find = bookTalkDAO.memberFindReco(reco);

        // find가 null이면 추천이 없는 상태이므로 정보 저장
        // find가 null이 아니면 추천이 있는 상태이므로 정보 삭제
        System.out.println("find:" + find);

        if (find == null) {
            result = bookTalkDAO.insertReco(reco);
            bookTalkDAO.increaseRec(reco);
        }
        return result;
    }
}
