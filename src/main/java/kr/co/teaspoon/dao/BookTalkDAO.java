package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.BookTalk;
import kr.co.teaspoon.dto.BookTalkComment;
import kr.co.teaspoon.dto.Reco;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface BookTalkDAO {

    public List<BookTalk> bookTalkList(Page page) throws Exception;

    public BookTalk bookTalkDetail(int bno) throws Exception;

    public void bookTalkInsert(BookTalk dto) throws Exception;

    public void bookTalkDelete(int bno) throws Exception;

    public void bookTalkEdit(BookTalk dto) throws Exception;

    public int totalCount(Page page) throws Exception;

    public List<BookTalk> bookTalkBestRecList() throws Exception;

    public List<BookTalk> bookTalkBestCmtList() throws Exception;

    public List<BookTalkComment> bookTalkCommentList(int bno) throws Exception;

    public void commentInsert(BookTalkComment dto) throws Exception;

    public void commentDelete(int cno) throws Exception;

    public List<BookTalk> commentCount() throws Exception;


    public Reco findReco(int bno, String id) throws Exception;

    public Reco memberFindReco(Reco reco) throws Exception;

    public int insertReco(Reco reco) throws Exception;

    public void deleteReco(Reco reco) throws Exception;

    public void increaseRec(Reco reco) throws Exception;

    public void decreaseRec(Reco reco) throws Exception;
}
