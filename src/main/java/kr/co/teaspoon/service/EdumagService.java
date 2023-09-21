package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Edumag;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface EdumagService {
    public List<Edumag> edumagList(Page page) throws Exception;
    public int totalCount(Page page) throws Exception;
    public Edumag edumagDetail(int no) throws Exception;
    public void edumagInsert(Edumag dto) throws Exception;
    public void edumagDelete(int no) throws Exception;
    public void edumagEdit(Edumag dto) throws Exception;
}
