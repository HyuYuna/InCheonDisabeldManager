
package kr.co.grit.common.constants;

/**

 */
public interface Constants {

	/**
	 * URL PATH
	 */
	String ADMIN_URL = "/admin";

	
	String ADMIN_BST_BUSINESS_URL = ADMIN_URL + "/bst/business";
	String ADMIN_BST_APPLY_URL = ADMIN_URL + "/bst/apply";
	String ADMIN_BST_COACHG_URL = ADMIN_URL + "/bst/coachg";
	String ADMIN_BST_PURCHS_URL = ADMIN_URL + "/bst/purchs";
	String ADMIN_MAIN_URL     = ADMIN_URL+"/main";
	String ADMIN_EVL_MFCMM_REQST_URL     = ADMIN_URL+"/eval/mfcmm/reqst";
	String ADMIN_EVL_MFCMM_INFO_URL     = ADMIN_URL+"/eval/mfcmm/info";
	String ADMIN_EVL_MFCMM_RCRITINFO_URL     = ADMIN_URL+"/eval/mfcmm/rcritinfo";
	String ADMIN_SUCCESS_IMSTARS     = ADMIN_URL+"/bst/success/grit";
	String ADMIN_BST_INSTT = ADMIN_URL + "/bst/instt";
	String ADMIN_BST_STARINFO_URL = ADMIN_URL + "/bst/starinfo";
	String ADMIN_BST_UNITY_URL = ADMIN_URL + "/bst/unity";

	String COMMON_URL = "/common";
	String ADMIN_BAN_URL = "login.do";
	String ADMIN_MAIN_BAN_URL = "main.do";
	
	String MOBILE_URL="/mobile";

	/**
	 * 관리자 세션 아이디
	 */
	String ADMIN_SESSION_ID = "AdminUserSession";

	/**
	 * 포탈 세션 아이디
	 */
	String PORTAL_SESSION_ID = "PortalUserSession";

	/**
	 * 웹로그 쿠키
	 */
	String WEB_COOKIE_NM = "_TRK_IS_COOKIE";

	/**
	 * 사용여부 Y/YES/유 상수
	 */
	String Y = "Y";

	/**
	 * 사용여부 N/NO/무 상수
	 */
	String N = "N";

	/**
	 * 유무/여부 Y 텍스트 상수
	 */
	String Y_TEXT = "예";

	/**
	 * 유무/여부 N 텍스트 상수
	 */
	String N_TEXT = "아니요";

	/**
	 * 유무/체크박스 전체
	 */
	String ALL = "all";

	/**
	 * 체크박스 임시
	 */
	String TEMP = "temp";

	/**
	 * 성공 여부
	 */
	String FAIL = "FAIL";
	String SUCCESS = "SUCCESS";

	/**
	 * 결과 VO
	 */
	String EMPTY = "EMPTY";

	/**
	 * 세션 종료
	 */
	String REFUSED = "REFUSED";

	/**
	 * 존재정보
	 */
	String EXIST = "EXIST";

	/**
	 * jsonView
	 */
	String JSON_VIEW = "jsonView";

	


	/**
	 * 시스템 구분
	 */
	String SYSTEM_SE        = "system";
	String SYSTEM_PORTAL    = "system01";
	String SYSTEM_ADMIN     = "system02";
	String SYSTEM_CNSLT     = "system03";


	String SYSTEM_ADMIN_NM  = "관리자시스템";

	/**
	 * 회원상태구분 코드
	 */
	String USER_STTUS_SE          = "usrstts";
	String USER_STTUS_SE_JOIN     = "usrstts1"; //가입
	String USER_STTUS_SE_WITHDRAW = "usrstts2"; //탈퇴

	/**
	 * 예산관리 코드
	 */
	String BUDGET_CATEGORY_CODE = "budget";

	String BUDGET_BSNS_CODE = "BUDGET";


	/**
	 * 메뉴속성
	 */
	String HEAD_MENU            = "menu1000";
	String TOP_MENU             = "menu1001";

	String LEFT_CATEGORY_MENU   = "menu2001";
	String LEFT_DIVISION_MENU   = "menu2002";
	
	String CONTENTS_MENU        = "menu3001";

	/**
	 * 캐쉬 아이디
	 */
	String CACHE_ID_CODE            = "cache_code";
	String CACHE_ID_CODE_TREE       = "cache_code_tree";

	String CACHE_ID_MENU            = "cache_menu";
	String CACHE_ID_MENU_TREE       = "cache_menu_tree";

	String CACHE_ID_CATEGORY        = "cache_categroy";
	String CACHE_ID_CATEGORY_TREE   = "cache_categroy_tree";

	String CACHE_ID_ADMIN_MAIN_STAT = "cache_admin_main_stat";


	/**
	 * 썸네일 변경 Suffix
	 */
	String THUMBNAILE_SUFFIX = "_thumb";

	/**
	 * DATE PATTERN yyyy.MM.dd, yyyy-MM-dd etc
	 */
	String DB_DATE_TIME_FORMAT_PATTERN = "yyyy-MM-dd HH:mm:ss";
	String ADMIN_DATE_TIME_FORMAT_PATTERN = "yyyy-MM-dd HH:mm";
	String TIME_FORMAT_PATTERN = "HH:mm:ss";
	String TIME_FORMAT_PATTERN2 = "HH:mm";
	String ADMIN_GRID_DATE_FORMAT_PATTERN = "yyyy-MM-dd";

	String PORTAL_DATE_FORMAT_PATTERN = "yyyy-MM-dd";
	String PORTAL_DATE_FORMAT_PATTERN_KO = "yyyy년 MM월 dd일";
	String DATEPICKER_DATE_FORMAT_PATTERN = "yyyyMMdd";
	String DATEPICKER_DATE_TIME_FORMAT_PATTERN = "yyyyMMddHHmmss";

	String YEAR_MONTH_DATE_FORMAT_PATTERN = "yyyy-MM";
	String DATEPICKER_YM_FORMAT_PATTERN = "yyyyMM";

	String DATE_MIN = "MM-dd";

	// 게시판 아이디

	/**
	 * 공지사항
	 */
	String BBS_ID_NTC = "00002";
	
	
	/**
	 * 자료실
	 */
	String BBS_ID_RECSROOM = "00006";




	/**
	 * 아이프레임 keys
	 */
	String IFRAMEKEYS = "code,menu,category";

	String MENU_PRE_CREATE = "create";

	String MENU_PRE_UPDATE = "update";

	String MENU_PRE_DELETE = "delete";

	String MENU_PRE_SORT = "sort";

	String MENU_POST_VIEW = "View";

	String MENU_POST_MAPPING = "Mapping";

	String MENU_PRE_EXCEL = "excel";

	String MENU_PRE_MEMO = "memo";

	
	/**
	 * 접미사 키워드
	 */
	String PREFIX_KEYWORD = "/";

	/**
	 * 테마키워드 팝업 모드
	 */
	String CREATE_MODE = "create";
	String UPDATE_MODE = "update";

	/**
	 * 평가 통보 선정
	 */
	String DSPTH_SLCTN = "slctn";
	/**
	 * 평가 통보 게시판
	 */
	String DSPTH_KND_BBS = "bbs";
	/**
	 * 평가 통보 MMS
	 */
	String DSPTH_KND_MMS = "mms";
	/**
	 * 평가 통보 EMAIL
	 */
	String DSPTH_KND_EMAIL = "email";
	
	/**
	 * 공통 사용자별 알림
	 */
	String CMMN_USERACCTO_NTCN_SE_CODE_NTCN = "0001";

	

	/** userSeCode == USER_SE_CMPNY */
	String USER_SE_A = "A";
	/** userSeCode == USER_SE_GRPNAGNCY */
	String USER_SE_B = "B";
	/** userSeCode == USER_SE_PREP */
	String USER_SE_C = "C";
	/** userSeCode == USER_SE_MD */
	String USER_SE_D = "D";
	/** userSeCode == USER_SE_EVL_MFCMM */
	String USER_SE_E = "E";

	
	String GET = "GET";
	String POST = "POST";

	
	
}