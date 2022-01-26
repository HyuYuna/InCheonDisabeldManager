package kr.co.grit.common.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


public class CommonUserInfoVO  implements Serializable{

	
	private static final long serialVersionUID = 1L;

	private String userId;                // 사용자 아이디
	private String aspCode;                // asp 아이디
	private String noEmp;                // 구글인증아이디
	private String password;              // 패스워드
	private String newPassword = "";      // 새로운 패스워드
	private String userSe = "";                // 회원구분(기업회원, 개인회원)
	private String userSeNm;              // 사용자명
	private String userSttusSe;           // 회원상태(가입, 탈퇴)
	private String userSttusSeNm;         // 회원상태명(가입, 탈퇴)
	private String bsnmRegistNo = "";     // 사업자 등록 번호
	private String bsnmRegistNo1 = "";     // 사업자 등록 번호1
	private String bsnmRegistNo2 = "";     // 사업자 등록 번호2
	private String bsnmRegistNo3 = "";     // 사업자 등록 번호3
	private String hmpg = "";             // 홈페이지
	private String induty = "";           // 업종
	private String commnSalbizSttemntNo;  // 통신 판매업 신고 번호
	private String area = "";             // 지역
	private String nm;                    // 이름(성명)
	private String jobCode = "";               // 직업코드
	private String wrcNm = "";            // 직장명
	private String dept = "";             // 부서
	private String ofcps = "";            // 직위/직책
	private String userTlphonNo1;         // 사용자 전화 번호
	private String userTlphonNo2;         // 사용자 전화 번호2
	private String userTlphonNo3;         // 사용자 전화 번호3
	private String userMoblphonNo;       // 핸드폰 번호
	private String userMoblphonNo1;       // 핸드폰 번호
	private String userMoblphonNo2;       // 핸드폰 번호2
	private String userMoblphonNo3;       // 핸드폰 번호3
	private String userFaxNo1;            // 팩스 번호
	private String userFaxNo2;            // 팩스 번호2
	private String userFaxNo3;            // 팩스 번호3
	private String userEmail;             // 이메일
	private String userEmail1;            // 이메일1
	private String userEmail2;            // 이메일2
	/** 이메일 아이디 */
	private String userEmailId = "";
	/** 이메일 호스트 입력 */
	private String userEmailHostIn = "";
	/** 이메일 호스트 선택 */
	private String userEmailHost = "";

	private String spcltyRealm ="";           // 전문분야
	private String careerMatter;          // 경력 사항
	private String hffcCrtfId = "";       // 재직 증명서 (파일) 아이디
	private String fileId = "";           // 파일 아이디
	private String logoFileId="";                 // 로고 파일 아이디
	private String atchFileId="";                 // 첨부 파일 아이디
	private String bsnmCeregrtId;         // 사업자 등록증 (파일) 아이디
	private String fixesInfoCode;         // 맞춤 정보 코드
	private String fixesInfoValue;        // 맞춤 정보 값
	private String emailAt;               // 이메일 여부
	private String smsAt;                 // SMS 여부
	private String recomendEngn;          // 추천기관
	private String recomendEngnCode;          // 추천기관
	private String recomendEngnCnt;          // 추천기관
	private String secsnResn;             // 탈퇴사유
	private String passwordChangeDt = ""; // 패스워드 변경 일시
	private String passwordPstponeDt = "";// 패스워드 연기 일시
	private String confmSe;               // 승인 여부(미승인, 가입승인, 탈퇴승인)
	private String useAt;                 // 사용 여부
	private String registDt;              // 등록 일시(시작일자)
	private String regiEndDt;             // 등록 일시(종료일자)
	private String registerId;            // 등록자 아이디
	private String changeDt;              // 변경 일시
	private String changerId;             // 변경자 아이디
	private String hffcCrtfFileInfo = ""; // 재직 증명서 파일 정보 (JSON 형태)
	private String fileInfo = "";         // 파일 정보 (JSON 형태)
	private String delFileInfo = "";      // 삭제 파일 정보 (JSON 형태)

	private String lastConectDt;          //최종 접속 일시(최종 로그인 성공일)
	private String conectCtrdDt;          //접속 시도 일시(로그인 시도 일시)
	private String conectFailrCo;         //접속 실패 횟수(로그인 실패 횟수)
	private String conectIpBegin;         //접속 아이피 시작
	private String conectIpEnd;           //접속 아이피 끝

	private String authorId = "";         //권한 아이디
	private String pwInit;                // 비번초기화
	private String rnum;                // 비번초기화
	private String seq;                // 비번초기화
	private String codeNm;                // 비번초기화

	private String rprsntvNm;                // 담당자명
	private String histBtn;                // 기존이력버튼
	private String cmpnyNm;                // 기존이력버튼

	private String rglmmbAt = "";         // MD 정/준 회원 구분

	private String recomendrId="";                      // 추천인 아이디
	private String recomendrNm="";						// 추천인명

	private String ownhomAdres="";                      // 자택주소
	private String ownhomDetailAdres="";                      // 자택상세주소

	private String nttId="";                      // 공통사용자별알림
	private String policyAgreAt="";                      // 정책동의여부

	private String oldConfmSe = "";
	private String popupAt = "";

	private String damoPassword = "";	// SHA256 암호화 패스워드
	private String encptApplcAt = "";	// SHA256 암호화 여부

	private String snsId= "";				//sns 연동 아이디
	private String snsTy= "";				//sns 타입
	private String snsKey = "";				//sns 연동 고유키
	private String isNewSns = "";				//sns 기존/신규 연동 여부
	private String drmncyYn = "";				//휴면 여부

	

	public String getNoEmp() {
		return noEmp;
	}

	public String getAspCode() {
		return aspCode;
	}

	public void setAspCode(String aspCode) {
		this.aspCode = aspCode;
	}

	public void setNoEmp(String noEmp) {
		this.noEmp = noEmp;
	}
	
	public String getDrmncyYn() {
		return drmncyYn;
	}

	public void setDrmncyYn(String drmncyYn) {
		this.drmncyYn = drmncyYn;
	}

	public String getSnsTy() {
		return snsTy;
	}

	public void setSnsTy(String snsTy) {
		this.snsTy = snsTy;
	}

	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	public String getIsNewSns() {
		return isNewSns;
	}

	public void setIsNewSns(String isNewSns) {
		this.isNewSns = isNewSns;
	}

	public String getSnsKey() {
		return snsKey;
	}

	public void setSnsKey(String snsKey) {
		this.snsKey = snsKey;
	}

	public String getDamoPassword() {
		return damoPassword;
	}

	public void setDamoPassword(String damoPassword) {
		this.damoPassword = damoPassword;
	}

	public String getEncptApplcAt() {
		return encptApplcAt;
	}

	public void setEncptApplcAt(String encptApplcAt) {
		this.encptApplcAt = encptApplcAt;
	}

	public String getPopupAt() {
		return popupAt;
	}

	public void setPopupAt(String popupAt) {
		this.popupAt = popupAt;
	}

	public String getLogoFileId() {
		return logoFileId;
	}

	public void setLogoFileId(String logoFileId) {
		this.logoFileId = logoFileId;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getPolicyAgreAt() {
		return policyAgreAt;
	}

	public void setPolicyAgreAt(String policyAgreAt) {
		this.policyAgreAt = policyAgreAt;
	}

	public String getNttId() {
		return nttId;
	}

	public void setNttId(String nttId) {
		this.nttId = nttId;
	}
	/** 사번 */
	private String empno = "";

	

	/** 검색조건 */
	private String searchMode;
	private String searchText;

	
	/** firstIndex */
	private String firstIndexStr = "";

	/** lastIndex */
	private String lastIndexStr = "";
	
	private int pageIndexCmpny = 1;

	/** 페이지갯수 */
	private int pageUnitCmpny = 2;

	/** 페이지사이즈 */
	private int pageSizeCmpny = 2;

	/** firstIndex */
	private String firstIndexStrCmpny = "";

	/** lastIndex */
	private String lastIndexStrCmpny = "";

	/** firstIndex */
	private int firstIndexCmpny = 1;

	/** lastIndex */
	private int lastIndexCmpny = 1;

	/** recordCountPerPage */
	private int recordCountPerPageCmpny = 2;

	/** 인증 수단 */
	private String crtfcMn = "";

	/** 중복가입확인값 */
	private String dplctCnfirmValue = "";

	/** 회원 구분 코드 */
	private String userSeCode = "";

	/** 회원 상태 코드 */
	private String userSttusCode = "";

	/** 승인 여부 */
	private String confmAt = "";

	public String getUserMoblphonNo() {
		return userMoblphonNo;
	}

	public void setUserMoblphonNo(String userMoblphonNo) {
		this.userMoblphonNo = userMoblphonNo;
	}

	public String getOwnhomAdres() {
		return ownhomAdres;
	}

	public void setOwnhomAdres(String ownhomAdres) {
		this.ownhomAdres = ownhomAdres;
	}

	public String getOwnhomDetailAdres() {
		return ownhomDetailAdres;
	}

	public void setOwnhomDetailAdres(String ownhomDetailAdres) {
		this.ownhomDetailAdres = ownhomDetailAdres;
	}

	/**
	 * 
	 */
	public CommonUserInfoVO() {}

	public String getRecomendrId() {
		return recomendrId;
	}

	public void setRecomendrId(String recomendrId) {
		this.recomendrId = recomendrId;
	}

	/**
	 * @param bsnmRegistNo
	 */
	public CommonUserInfoVO(String bsnmRegistNo) {
		this.bsnmRegistNo = bsnmRegistNo;
	}


	

	/**
	 * @param userId
	 * @param password
	 */
	public CommonUserInfoVO(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}

	public String getCmpnyNm() {
		return cmpnyNm;
	}
	public void setCmpnyNm(String cmpnyNm) {
		this.cmpnyNm = cmpnyNm;
	}
	public int getPageIndexCmpny() {
		return pageIndexCmpny;
	}
	public void setPageIndexCmpny(int pageIndexCmpny) {
		this.pageIndexCmpny = pageIndexCmpny;
	}
	public int getPageUnitCmpny() {
		return pageUnitCmpny;
	}
	public void setPageUnitCmpny(int pageUnitCmpny) {
		this.pageUnitCmpny = pageUnitCmpny;
	}
	public int getPageSizeCmpny() {
		return pageSizeCmpny;
	}
	public void setPageSizeCmpny(int pageSizeCmpny) {
		this.pageSizeCmpny = pageSizeCmpny;
	}
	public String getFirstIndexStrCmpny() {
		return firstIndexStrCmpny;
	}
	public void setFirstIndexStrCmpny(String firstIndexStrCmpny) {
		this.firstIndexStrCmpny = firstIndexStrCmpny;
	}
	public String getLastIndexStrCmpny() {
		return lastIndexStrCmpny;
	}
	public void setLastIndexStrCmpny(String lastIndexStrCmpny) {
		this.lastIndexStrCmpny = lastIndexStrCmpny;
	}
	public int getFirstIndexCmpny() {
		return firstIndexCmpny;
	}
	public void setFirstIndexCmpny(int firstIndexCmpny) {
		this.firstIndexCmpny = firstIndexCmpny;
	}
	public int getLastIndexCmpny() {
		return lastIndexCmpny;
	}
	public void setLastIndexCmpny(int lastIndexCmpny) {
		this.lastIndexCmpny = lastIndexCmpny;
	}
	public int getRecordCountPerPageCmpny() {
		return recordCountPerPageCmpny;
	}
	public void setRecordCountPerPageCmpny(int recordCountPerPageCmpny) {
		this.recordCountPerPageCmpny = recordCountPerPageCmpny;
	}
	public String getRprsntvNm() {
		return rprsntvNm;
	}
	public void setRprsntvNm(String rprsntvNm) {
		this.rprsntvNm = rprsntvNm;
	}
	public String getHistBtn() {
		return histBtn;
	}
	public void setHistBtn(String histBtn) {
		this.histBtn = histBtn;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getRecomendEngnCnt() {
		return recomendEngnCnt;
	}
	public void setRecomendEngnCnt(String recomendEngnCnt) {
		this.recomendEngnCnt = recomendEngnCnt;
	}
	public String getRecomendEngnCode() {
		return recomendEngnCode;
	}
	public void setRecomendEngnCode(String recomendEngnCode) {
		this.recomendEngnCode = recomendEngnCode;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String resultMsg = "";

	public String getFirstIndexStr() {
		return firstIndexStr;
	}
	public void setFirstIndexStr(String firstIndexStr) {
		this.firstIndexStr = firstIndexStr;
	}
	public String getLastIndexStr() {
		return lastIndexStr;
	}
	public void setLastIndexStr(String lastIndexStr) {
		this.lastIndexStr = lastIndexStr;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the newPassword
	 */
	public String getNewPassword() {
		return newPassword;
	}

	/**
	 * @param newPassword the newPassword to set
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getUserSe() {
		return userSe;
	}
	public void setUserSe(String userSe) {
		this.userSe = userSe;
	}

	public String getUserSttusSeNm() {
		return userSttusSeNm;
	}
	public void setUserSttusSeNm(String userSttusSeNm) {
		this.userSttusSeNm = userSttusSeNm;
	}
	public String getUserSeNm() {
		return userSeNm;
	}
	public void setUserSeNm(String userSeNm) {
		this.userSeNm = userSeNm;
	}
	public String getUserSttusSe() {
		return userSttusSe;
	}
	public void setUserSttusSe(String userSttusSe) {
		this.userSttusSe = userSttusSe;
	}
	public String getBsnmRegistNo() {
		return bsnmRegistNo;
	}
	public void setBsnmRegistNo(String bsnmRegistNo) {
		this.bsnmRegistNo = bsnmRegistNo;
	}
	public String getBsnmRegistNo1() {
		return bsnmRegistNo1;
	}
	public void setBsnmRegistNo1(String bsnmRegistNo1) {
		this.bsnmRegistNo1 = bsnmRegistNo1;
	}
	public String getBsnmRegistNo2() {
		return bsnmRegistNo2;
	}
	public void setBsnmRegistNo2(String bsnmRegistNo2) {
		this.bsnmRegistNo2 = bsnmRegistNo2;
	}
	public String getBsnmRegistNo3() {
		return bsnmRegistNo3;
	}
	public void setBsnmRegistNo3(String bsnmRegistNo3) {
		this.bsnmRegistNo3 = bsnmRegistNo3;
	}
	public String getHmpg() {
		return hmpg;
	}
	public void setHmpg(String hmpg) {
		this.hmpg = hmpg;
	}
	
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	public String getCommnSalbizSttemntNo() {
		return commnSalbizSttemntNo;
	}
	public void setCommnSalbizSttemntNo(String commnSalbizSttemntNo) {
		this.commnSalbizSttemntNo = commnSalbizSttemntNo;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getWrcNm() {
		return wrcNm;
	}
	public void setWrcNm(String wrcNm) {
		this.wrcNm = wrcNm;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getOfcps() {
		return ofcps;
	}
	public void setOfcps(String ofcps) {
		this.ofcps = ofcps;
	}
	public String getUserTlphonNo1() {
		return userTlphonNo1;
	}
	public void setUserTlphonNo1(String userTlphonNo1) {
		this.userTlphonNo1 = userTlphonNo1;
	}
	public String getUserTlphonNo2() {
		return userTlphonNo2;
	}
	public void setUserTlphonNo2(String userTlphonNo2) {
		this.userTlphonNo2 = userTlphonNo2;
	}
	public String getUserTlphonNo3() {
		return userTlphonNo3;
	}
	public void setUserTlphonNo3(String userTlphonNo3) {
		this.userTlphonNo3 = userTlphonNo3;
	}
	public String getUserMoblphonNo1() {
		return userMoblphonNo1;
	}
	public void setUserMoblphonNo1(String userMoblphonNo1) {
		this.userMoblphonNo1 = userMoblphonNo1;
	}
	public String getUserMoblphonNo2() {
		return userMoblphonNo2;
	}
	public void setUserMoblphonNo2(String userMoblphonNo2) {
		this.userMoblphonNo2 = userMoblphonNo2;
	}
	public String getUserMoblphonNo3() {
		return userMoblphonNo3;
	}
	public void setUserMoblphonNo3(String userMoblphonNo3) {
		this.userMoblphonNo3 = userMoblphonNo3;
	}

	public String getUserFaxNo1() {
		return userFaxNo1;
	}
	public void setUserFaxNo1(String userFaxNo1) {
		this.userFaxNo1 = userFaxNo1;
	}
	public String getUserFaxNo2() {
		return userFaxNo2;
	}
	public void setUserFaxNo2(String userFaxNo2) {
		this.userFaxNo2 = userFaxNo2;
	}
	public String getUserFaxNo3() {
		return userFaxNo3;
	}
	public void setUserFaxNo3(String userFaxNo3) {
		this.userFaxNo3 = userFaxNo3;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getSpcltyRealm() {
		return spcltyRealm;
	}
	public void setSpcltyRealm(String spcltyRealm) {
		this.spcltyRealm = spcltyRealm;
	}
	public String getCareerMatter() {
		return careerMatter;
	}
	public void setCareerMatter(String careerMatter) {
		this.careerMatter = careerMatter;
	}
	public String getHffcCrtfId() {
		return hffcCrtfId;
	}
	public void setHffcCrtfId(String hffcCrtfId) {
		this.hffcCrtfId = hffcCrtfId;
	}
	
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getBsnmCeregrtId() {
		return bsnmCeregrtId;
	}
	public void setBsnmCeregrtId(String bsnmCeregrtId) {
		this.bsnmCeregrtId = bsnmCeregrtId;
	}
	public String getFixesInfoCode() {
		return fixesInfoCode;
	}
	public void setFixesInfoCode(String fixesInfoCode) {
		this.fixesInfoCode = fixesInfoCode;
	}
	public String getFixesInfoValue() {
		return fixesInfoValue;
	}
	public void setFixesInfoValue(String fixesInfoValue) {
		this.fixesInfoValue = fixesInfoValue;
	}
	public String getEmailAt() {
		return emailAt;
	}
	public void setEmailAt(String emailAt) {
		this.emailAt = emailAt;
	}
	public String getSmsAt() {
		return smsAt;
	}
	public void setSmsAt(String smsAt) {
		this.smsAt = smsAt;
	}
	public String getRecomendEngn() {
		return recomendEngn;
	}
	public void setRecomendEngn(String recomendEngn) {
		this.recomendEngn = recomendEngn;
	}
	/**
	 * @return the secsnResn
	 */
	public String getSecsnResn() {
		return secsnResn;
	}
	/**
	 * @param secsnResn the secsnResn to set
	 */
	public void setSecsnResn(String secsnResn) {
		this.secsnResn = secsnResn;
	}
	/**
	 * @return the passwordChangeDt
	 */
	public String getPasswordChangeDt() {
		return passwordChangeDt;
	}
	/**
	 * @param passwordChangeDt the passwordChangeDt to set
	 */
	public void setPasswordChangeDt(String passwordChangeDt) {
		this.passwordChangeDt = passwordChangeDt;
	}

	/**
	 * @return the passwordPstponeDt
	 */
	public String getPasswordPstponeDt() {
		return passwordPstponeDt;
	}
	/**
	 * @param passwordPstponeDt the passwordPstponeDt to set
	 */
	public void setPasswordPstponeDt(String passwordPstponeDt) {
		this.passwordPstponeDt = passwordPstponeDt;
	}

	public String getConfmSe() {
		return confmSe;
	}

	public void setConfmSe(String confmSe) {
		this.confmSe = confmSe;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getRegistDt() {
		return registDt;
	}
	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}
	public String getRegiEndDt() {
		return regiEndDt;
	}
	public void setRegiEndDt(String regiEndDt) {
		this.regiEndDt = regiEndDt;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	public String getChangeDt() {
		return changeDt;
	}
	public void setChangeDt(String changeDt) {
		this.changeDt = changeDt;
	}
	public String getChangerId() {
		return changerId;
	}
	public void setChangerId(String changerId) {
		this.changerId = changerId;
	}
	public String getHffcCrtfFileInfo() {
		return hffcCrtfFileInfo;
	}
	public void setHffcCrtfFileInfo(String hffcCrtfFileInfo) {
		this.hffcCrtfFileInfo = hffcCrtfFileInfo;
	}
	
	public String getFileInfo() {
		return fileInfo;
	}
	public void setFileInfo(String fileInfo) {
		this.fileInfo = fileInfo;
	}

	public String getDelFileInfo() {
		return delFileInfo;
	}
	public void setDelFileInfo(String delFileInfo) {
		this.delFileInfo = delFileInfo;
	}
	/**
	 * @return the lastConectDt
	 */
	public String getLastConectDt() {
		return lastConectDt;
	}
	/**
	 * @param lastConectDt the lastConectDt to set
	 */
	public void setLastConectDt(String lastConectDt) {
		this.lastConectDt = lastConectDt;
	}
	/**
	 * @return the conectCtrdDt
	 */
	public String getConectCtrdDt() {
		return conectCtrdDt;
	}
	/**
	 * @param conectCtrdDt the conectCtrdDt to set
	 */
	public void setConectCtrdDt(String conectCtrdDt) {
		this.conectCtrdDt = conectCtrdDt;
	}
	/**
	 * @return the conectFailrCo
	 */
	public String getConectFailrCo() {
		return conectFailrCo;
	}
	/**
	 * @param conectFailrCo the conectFailrCo to set
	 */
	public void setConectFailrCo(String conectFailrCo) {
		this.conectFailrCo = conectFailrCo;
	}
	/**
	 * @return the conectIpBegin
	 */
	public String getConectIpBegin() {
		return conectIpBegin;
	}
	/**
	 * @param conectIpBegin the conectIpBegin to set
	 */
	public void setConectIpBegin(String conectIpBegin) {
		this.conectIpBegin = conectIpBegin;
	}
	/**
	 * @return the conectIpEnd
	 */
	public String getConectIpEnd() {
		return conectIpEnd;
	}
	/**
	 * @param conectIpEnd the conectIpEnd to set
	 */
	public void setConectIpEnd(String conectIpEnd) {
		this.conectIpEnd = conectIpEnd;
	}

	/**
	 * @return the authorId
	 */
	public String getAuthorId() {
		return authorId;
	}
	/**
	 * @param authorId the authorId to set
	 */
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getPwInit() {
		return pwInit;
	}
	public void setPwInit(String pwInit) {
		this.pwInit = pwInit;
	}

	public String getUserEmail1() {
		return userEmail1;
	}
	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}

	public String getSearchMode() {
		return searchMode;
	}

	public void setSearchMode(String searchMode) {
		this.searchMode = searchMode;
	}

	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public String getRglmmbAt() {
		return rglmmbAt;
	}
	public void setRglmmbAt(String rglmmbAt) {
		this.rglmmbAt = rglmmbAt;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	public String getUserEmailId() {
		return userEmailId;
	}
	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}
	public String getUserEmailHostIn() {
		return userEmailHostIn;
	}
	public void setUserEmailHostIn(String userEmailHostIn) {
		this.userEmailHostIn = userEmailHostIn;
	}
	public String getUserEmailHost() {
		return userEmailHost;
	}
	public void setUserEmailHost(String userEmailHost) {
		this.userEmailHost = userEmailHost;
	}
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getCrtfcMn() {
		return crtfcMn;
	}

	public void setCrtfcMn(String crtfcMn) {
		this.crtfcMn = crtfcMn;
	}

	public String getDplctCnfirmValue() {
		return dplctCnfirmValue;
	}

	public void setDplctCnfirmValue(String dplctCnfirmValue) {
		this.dplctCnfirmValue = dplctCnfirmValue;
	}

	public String getRecomendrNm() {
		return recomendrNm;
	}

	public void setRecomendrNm(String recomendrNm) {
		this.recomendrNm = recomendrNm;
	}

	public String getUserSeCode() {
		return userSeCode;
	}

	public void setUserSeCode(String userSeCode) {
		this.userSeCode = userSeCode;
	}

	public String getUserSttusCode() {
		return userSttusCode;
	}

	public void setUserSttusCode(String userSttusCode) {
		this.userSttusCode = userSttusCode;
	}

	public String getConfmAt() {
		return confmAt;
	}

	public void setConfmAt(String confmAt) {
		this.confmAt = confmAt;
	}

	public String getOldConfmSe() {
		return oldConfmSe;
	}

	public void setOldConfmSe(String oldConfmSe) {
		this.oldConfmSe = oldConfmSe;
	}

}
