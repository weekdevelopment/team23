package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.SurveyDAO;
import kr.co.teaspoon.dto.Survey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SurveyServiceImpl implements SurveyService{
    @Autowired
    private SurveyDAO surveyDAO;

    @Override
    public List<Survey> surveyList() throws Exception {
        return surveyDAO.surveyList();
    }

    @Override
    public Survey surveyDetail(int sno) throws Exception {
        return surveyDAO.surveyDetail(sno);
    }

    @Override
    public void surveyInsert(Survey dto) throws Exception {
        surveyDAO.surveyInsert(dto);
    }

    @Override
    public void sanswerInsert(Survey dto) throws Exception {
        surveyDAO.sanswerInsert(dto);
    }

    @Override
    public void surveyDelete(int sno) throws Exception {
        surveyDAO.surveyDelete(sno);
    }

    @Override
    public void surveyEdit(Survey dto) throws Exception {
        surveyDAO.surveyEdit(dto);
    }
}
