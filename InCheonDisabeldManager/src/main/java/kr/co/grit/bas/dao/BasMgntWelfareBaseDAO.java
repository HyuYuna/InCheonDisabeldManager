package kr.co.grit.bas.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("BasMgntWelfareBaseDAO")
public class BasMgntWelfareBaseDAO {

	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	/**
   	 * 복지시설 기초관리를 조회한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
	@SuppressWarnings("rawtypes")
	public List<EgovMap> selectBasMgntWelfareBaseList(final Map param){
		return sqlSession.selectList("BasMgntWelfareBaseDAO.selectBasMgntWelfareBaseList", param);
	}
	
	/**
   	 * 복지시설 기초관리를 입력한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
	@SuppressWarnings("rawtypes")
	public void insertMgntWelfareBase(final EgovMap param){
		sqlSession.insert("BasMgntWelfareBaseDAO.insertMgntWelfareBase", param);
	}
	/**
   	 * 복지시설 기초관리를 수정한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
	@SuppressWarnings("rawtypes")
	public void updateMgntWelfareBase(final EgovMap param){
		sqlSession.insert("BasMgntWelfareBaseDAO.updateMgntWelfareBase", param);
	}
	/**
   	 * 시설유형을 조회힌다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<EgovMap> selectTypeFacility(final EgovMap param){
    	
        return sqlSession.selectList("BasMgntWelfareBaseDAO.selectTypeFacility", param);
    }
    
    /**
   	 * 중복 체크한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public int selectUnqChk(final EgovMap param){
    	return sqlSession.selectOne("BasMgntWelfareBaseDAO.selectUnqChk", param);
    }
    
    /**
   	 * 복지시설을 조회 한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<EgovMap> searchWffcltyList(final EgovMap param){
		return sqlSession.selectList("BasMgntWelfareBaseDAO.selectWffcltyList", param);
	}
    
    /**
   	 * 운영단체를 조회 한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<EgovMap> searchOgnztList(final EgovMap param){
		return sqlSession.selectList("BasMgntWelfareBaseDAO.selectOgnztList", param);
	}
    
    /**
   	 * 복지시설 상세관리 카운트를 조회 한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public int countDetail(final EgovMap param){
		return sqlSession.selectOne("BasMgntWelfareBaseDAO.selectDetail", param);
	}
    /**
    * 복지시설 상세관리를 수정한다
  	 * @param param - 조회할 정보가 담긴 Map
  	 * @exception Exception
  	 */
	@SuppressWarnings("rawtypes")
	public void updateWffcltyDetail(final EgovMap param){
		sqlSession.insert("BasMgntWelfareBaseDAO.updateWffcltyDetail", param);
	}
	
    /**
   	 * 복지시설 상세관리 카운트를 조회 한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public int wffcltyCount(final String fcltyClsfcFg){
		return sqlSession.selectOne("BasMgntWelfareBaseDAO.wffcltyCount", fcltyClsfcFg);
	}

    /**
   	 * 복지시설 상세관리 삭제
   	 * @param param - 삭제 정보가 담긴 Map
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public void deleteSysAuthMgmt(EgovMap param){
		sqlSession.delete("BasMgntWelfareBaseDAO.deleteSysAuthMgmt", param);
	}
    
}
