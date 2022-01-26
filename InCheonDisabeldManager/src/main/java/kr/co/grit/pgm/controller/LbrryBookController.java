package kr.co.grit.pgm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.pgm.service.LbrryBookService;

/**
 * 도서 관리
 * @author PKH
 */
@Controller
public class LbrryBookController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(LbrryBookController.class);
		
	/**
	 * 서비스 선언
	 */
	@Resource(name="LbrryBookService")
	private transient LbrryBookService lbrryBookService;
	
	/**
	 * constructor
	 */
	public LbrryBookController() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 도서 분류 화면
	 * @return
	 */
	@RequestMapping( "/pgm/lbrryBookCatalog")
	public String lbrryBookCatalog() {
		return "/pgm/lbrryBookCatalog";
	}
	
	/**
	 * 도서 분류 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/pgm/lbrryBookCatalogList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap lbrryBookCatalogList(@RequestBody final EgovMap param) {

		final EgovMap result = new EgovMap();
		
		try {
			final List<EgovMap> list = lbrryBookService.selectLbrryBookCatalog(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 도서 분류 저장
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/pgm/lbrryBookCatalogSave", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap lbrryBookCatalogSave(@RequestBody final EgovMap param) {

		final EgovMap result = new EgovMap();
		try {
			lbrryBookService.saveLbrryBookCatalog(param);
			result.put("result", "success");
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 도서 유형 화면
	 * @return
	 */
	@RequestMapping("/pgm/lbrryBookType")
	public String lbrryBookType() {
		
		return "/pgm/lbrryBookType";
	}
	
	/**
	 * 도서 유형 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/pgm/lbrryBookTypeList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap lbrryBookTypeList(@RequestBody final EgovMap param) {

		final EgovMap result = new EgovMap();
		
		try {
			final List<EgovMap> list = lbrryBookService.selectLbrryBookType(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 도서 유형 저장
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/pgm/lbrryBookTypeSave", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap lbrryBookTypeSave(@RequestBody final EgovMap param) {

		final EgovMap result = new EgovMap();

		try {
			lbrryBookService.saveLbrryBookType(param);
			result.put("result", "success");
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 도서 목록 화면
	 * @return
	 */
	@RequestMapping("/pgm/lbrryBook")
	public String lbrryBook() {
		return "/pgm/lbrryBook";
	}
	
	/**
	 * 도서목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/pgm/lbrryBookList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap lbrryBookList(@RequestBody final EgovMap param) {

		final EgovMap result = new EgovMap();
		
		try {
			final List<EgovMap> list = lbrryBookService.selectLbrryBook(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 도서목록 저장
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/pgm/lbrryBookSave", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap lbrryBookSave(@RequestBody final EgovMap param) {

		final EgovMap result = new EgovMap();

		try {
			lbrryBookService.saveLbrryBook(param);
			result.put("result", "success");
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
}
