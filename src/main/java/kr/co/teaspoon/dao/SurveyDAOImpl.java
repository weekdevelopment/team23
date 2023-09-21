package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Survey;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SurveyDAOImpl implements SurveyDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Survey> surveyList() throws Exception {
        return sqlSession.selectList("survey.surveyList");
    }

    @Override
    public Survey surveyDetail(int sno) throws Exception {
        sqlSession.update("survey.visitCount", sno);
        return sqlSession.selectOne("survey.surveyDetail", sno);
    }

    @Override
    public void surveyInsert(Survey dto) throws Exception {
        sqlSession.insert("survey.surveyInsert", dto);
    }

    @Override
    public void sanswerInsert(Survey dto) throws Exception {
        sqlSession.insert("survey.sanswerInsert", dto);
    }

    @Override
    public void surveyDelete(int sno) throws Exception {
        sqlSession.delete("survey.surveyDelete", sno);
    }

    @Override
    public void surveyEdit(Survey dto) throws Exception {
        sqlSession.update("survey.surveyEdit", dto);
    }
}
