package kr.co.grit.pgm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface PgmOpStsService {

	@SuppressWarnings("rawtypes")
	EgovMap savePgmOpStsReg(HashMap<String, ArrayList<Object>> param) throws Exception;

	@SuppressWarnings("rawtypes")
	List<EgovMap> selectPgmOpStsReg(EgovMap param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<EgovMap> selectWffcltyListD(EgovMap param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<EgovMap> selectPgmOpStsSch(EgovMap param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<EgovMap> selectPgmOpStsChart(EgovMap param) throws Exception;
	
	
}
