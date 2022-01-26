package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.common.util.FileUtil;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.dao.WfcDetailDAO;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 복지시설 상세관리
 * @author JJS
 */
@Service("WfcDetailService")
public class WfcDetailServiceImpl implements WfcDetailService{
	
	/**
	 * DAO 선언
	 */
	@Resource(name="WfcDetailDAO")
	private transient WfcDetailDAO wfcDetailDAO;
	
	/**
	 * 시설유형
	 */
	private static final String A01 = "A01";
	private static final String A02 = "A02";
	private static final String A03 = "A03";
	private static final String A04 = "A04";
	private static final String C01 = "C01";
	private static final String C02 = "C02";
	private static final String C03 = "C03";
	private static final String B01 = "B01";
	private static final String B02 = "B02";
	private static final String B03 = "B03";
	private static final String B04 = "B04";
	private static final String B05 = "B05";
	private static final String B07 = "B07";
	private static final String B08 = "B08";
	private static final String D03 = "D03";
	private static final String D04 = "D04";
	private static final String D05 = "D05";
	private static final String D06 = "D06";
	
	/**
	 * 상태값
	 */
	private static final String INSERT = "I";
	private static final String UPDATE = "U";
	private static final String DELETE = "D";
	
	
	@Override
	public EgovMap selectWffcltyBaseList(EgovMap param) {
		return wfcDetailDAO.selectWffcltyBaseList(param);
	}
	
	@Override
	public List<EgovMap> selectWffcltyDetailList(EgovMap param) {
		return wfcDetailDAO.selectWffcltyDetailList(param);
	}
	
	@Override
	public List<EgovMap> selectwffcltyDisableTpList(EgovMap param) {
		return wfcDetailDAO.selectwffcltyDisableTpList(param);
	}
	
	@Override
	public List<EgovMap> selectwffcltyPictureList(EgovMap param) {
		return wfcDetailDAO.selectwffcltyPictureList(param);
	}
	
	@Override
	public List<EgovMap> selectWffcltyList(EgovMap param) {
		return wfcDetailDAO.selectWffcltyList(param);
	}

	
	@Override
	@Transactional
	@SuppressWarnings("unchecked")
    public EgovMap saveWfcDetail(JSONArray jsonArr) {
		EgovMap returnMap = new EgovMap();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		// jsonArr배열은 총 2건 가져온다.
		// jsonArr배열사이즈로 구분
		// 0 : 시설상세정보  1:서비스 장애
		Map<String, Object> wffDetailList = (Map) jsonArr.get(0);
		wffDetailList.put("register", userId);
		// I:신규저장   U:수정
		String  saveMode  =  (String)wffDetailList.get("saveMode");

		// 시설코드구분
		String  wffcltyTp =  (String)wffDetailList.get("wffcltyTp");

		List<Map<String,Object>> disableTpList = (List<Map<String,Object>>) jsonArr.get(1);

		try {
			// 시설구분:장애인거주시설, 공동생활가정, 단기거주시설 개인운영시설
			if(A01.equals(wffcltyTp) || A02.equals(wffcltyTp) || A03.equals(wffcltyTp) || A04.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail(wffDetailList);
				}
				
			// 시설구분:장애인근로사업장, 장애인보호작업장, 장애인 생산품판매시설	
			}else if(C01.equals(wffcltyTp) || C02.equals(wffcltyTp) || C03.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail2(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail2(wffDetailList);
				}
				
			// 시설구분: 장애인복지관	
			}else if(B01.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail3(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail3(wffDetailList);
				}
				
			// 시설구분: 장애인 주간보호 시설	
			}else if("B02".equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail4(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail4(wffDetailList);
				}
			
			// 시설구분: 장애인 자립생활 센터 		
			}else if(D03.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail5(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail5(wffDetailList);
				}
			
			// 시설구분: 장애인 생활이동지원센터 	 		
			}else if(B05.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail6(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail6(wffDetailList);
				}
			
			// 시설구분: 장애인 재활지원 센터, 지적장애인 자립지원센터	
			}else if(B07.equals(wffcltyTp) || B08.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail7(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail7(wffDetailList);
				}
			
			// 시설구분: 점자도서관	
			}else if(B04.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail8(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail8(wffDetailList);
				}
			
			// 시설구분: 수어통역센터
			}else if(B03.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail9(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail9(wffDetailList);
				}
			
			// 시설구분: 장애인보조기구 AS센터
			}else if(D04.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail10(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail10(wffDetailList);
				}
			
			// 시설구분: 장애인 편의증진 기술지원센터
			}else if(D05.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail11(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail11(wffDetailList);
				}
			
			// 시설구분: 장애인 편의시설설치 시민촉진단
			}else if(D06.equals(wffcltyTp)){
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail12(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail12(wffDetailList);
				}
			}else{
				if(INSERT.equals(saveMode)){
					wfcDetailDAO.insertWfcDetail13(wffDetailList);
				}else if(UPDATE.equals(saveMode)){
					wfcDetailDAO.updateWfcDetail13(wffDetailList);
				}
			}
			
			
			// 서비스 장애
			for (int i = 0; i < disableTpList.size(); i++) {
				String  stats =  (String)disableTpList.get(i).get("stats");
				disableTpList.get(i).put("register", userId);
				
				// 장애구분 신규입력
				if(INSERT.equals(stats)){
					wfcDetailDAO.insertDisableTp(disableTpList.get(i));
				}else if(UPDATE.equals(stats)){
					wfcDetailDAO.updateDisableTp(disableTpList.get(i));
				}else if(DELETE.endsWith(stats)){
					wfcDetailDAO.deleteDisableTp(disableTpList.get(i));
				}
				
			}
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		 return returnMap;
	}
	
	@Override
	@Transactional
    public EgovMap saveImg(List<Map<String, Object>> list) {
		EgovMap returnMap = new EgovMap();
		
		try {
			for (int i = 0; i < list.size(); i++) {
				String stats = (String) list.get(i).get("stats");
				if("I".equals(stats)){
					wfcDetailDAO.insertImg(list.get(i));
				}else if("U".equals(stats)){
					wfcDetailDAO.updateImg(list.get(i));
				}else if("D".equals(stats)){
					wfcDetailDAO.deleteImg(list.get(i));
				}
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		}catch (BadSqlGrammarException e) {
			// 실패시 사진 삭제
			for (int i = 0; i < list.size(); i++) {
				FileUtil.fileDelete("wfc",(String)list.get(i).get("pictureRealNm") , (String)list.get(i).get("wffcltyCd"));
			}
		}
		
		return returnMap;
	}
	
}
