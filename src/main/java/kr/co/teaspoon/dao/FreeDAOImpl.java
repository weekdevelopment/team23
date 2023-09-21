package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Free;
import kr.co.teaspoon.dto.Reco;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FreeDAOImpl implements FreeDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Free> freeList() throws Exception {
        return sqlSession.selectList("free.freeList");
    }

    @Transactional
    @Override
    public Free freeDetail(int bno) throws Exception {
        sqlSession.update("free.visitCount", bno);
        return sqlSession.selectOne("free.freeDetail", bno);
    }

    @Override
    public void freeInsert(Free dto) throws Exception {
        sqlSession.insert("free.freeInsert", dto);
    }

    @Override
    public void freeDelete(int bno) throws Exception {
        sqlSession.delete("free.freeDelete", bno);
    }

    @Override
    public void freeEdit(Free dto) throws Exception {
        sqlSession.update("free.freeEdit", dto);
    }

    @Override
    public List<Free> freeBestRecList() throws Exception {
        return sqlSession.selectList("free.freeBestRecList");
    }

    @Override
    public Reco findReco(int bno, String id) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("bno", bno);
        map.put("id", id);
        return sqlSession.selectOne("free.findReco",map);
    }

    @Override
    public Reco memberFindReco(Reco reco) throws Exception {
        return sqlSession.selectOne("free.memberFindReco", reco);
    }

    @Override
    public int insertReco(Reco reco) throws Exception {
        return sqlSession.insert("free.insertReco", reco);
    }

    @Override
    public void deleteReco(Reco reco) throws Exception {
        sqlSession.delete("free.deleteReco", reco);
    }

    @Override
    public void increaseRec(Reco reco) throws Exception {
        sqlSession.update("free.increaseRec", reco);
    }

    @Override
    public void decreaseRec(Reco reco) throws Exception {
        sqlSession.update("free.decreaseRec", reco);
    }


}
