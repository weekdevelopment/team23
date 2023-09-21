package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Free;
import kr.co.teaspoon.dto.Reco;

import java.util.List;

public interface FreeService {
    public List<Free> freeList() throws Exception;

    public Free freeDetail(int bno) throws Exception;

    public void freeInsert(Free dto) throws Exception;

    public void freeDelete(int bno) throws Exception;

    public void freeEdit(Free dto) throws Exception;

    public List<Free> freeBestRecList() throws Exception;


    public Reco findReco(int bno, String id) throws Exception;
    public int insertReco(Reco like) throws Exception;
}