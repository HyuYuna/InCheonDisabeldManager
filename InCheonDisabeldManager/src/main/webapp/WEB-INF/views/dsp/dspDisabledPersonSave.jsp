﻿<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String layerName = request.getParameter("layerName");
%>
	
               <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1 class = "mainTitle">이용장애인 등록</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchDisPerSaveForm" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:12%">
                        <col style="width:21%">
                        <col style="width:12%">
                        <col style="width:21%">
                        <col style="width:12%">
                        <col style="width:21%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>장애인명</th>
                            <td>
                            	<input type="text" id="sehDspsnNm" name="sehDspsnNm" style="width: 100%" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)">
                            </td>
                            <th>장애유형</th>
                            <td>
                            	<select id="sehDisableTp" name="sehDisableTp" style="width: 100%; text-align-last : center" onkeypress="<%=layerName%>fn_pressSys(this.form);">
										<option value="">전체</option>
										<c:if test="${!empty disabledList}">
											<c:forEach var="list" items="${disabledList}">
												<option value="${list.disableTp}"><c:out
														value="${list.disableTpNm}" /></option>
											</c:forEach>
										</c:if>
								</select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </form>
                <!-- conditionTable : end -->


				<!-- layout table : start -->
				<form name="disabledForm" id="disabledForm" method="post" >
					<input type="hidden" id="saveMode"           name="saveMode"          value=""/>
					<input type="hidden" id="rowIndex"           name="rowIndex"          value=""/>
					<input type="hidden" id="picturePath"        name="picturePath"       value=""/>
					<input type="hidden" id="pictureNm"          name="pictureNm"         value=""/>
					<input type="hidden" id="pictureRealNm"      name="pictureRealNm"     value=""/>
					<!-- 장애인명 생년월일 연락처 변경시 상태값 : N  -->
					<input type="hidden" id="isValue"            name="isValue"           value=""/>
					<input type="hidden" id="isSaveValue"        name="isSaveValue"       value=""/>
					<input type="hidden" id="userGroupCd"        name="userGroupCd"       value="${userGroupCd}"/>
					
					<input type="hidden" id="checkdisableTp01" name="checkdisableTp01" value="0"/>
					<input type="hidden" id="checkdisableTp02" name="checkdisableTp02" value="0"/>
					<input type="hidden" id="checkdisableTp03" name="checkdisableTp03" value="0"/>
					<input type="hidden" id="checkdisableTp04" name="checkdisableTp04" value="0"/>
					<input type="hidden" id="checkdisableTp05" name="checkdisableTp05" value="0"/>
					<input type="hidden" id="checkdisableTp06" name="checkdisableTp06" value="0"/>
					<input type="hidden" id="checkdisableTp07" name="checkdisableTp07" value="0"/>
					<input type="hidden" id="checkdisableTp08" name="checkdisableTp08" value="0"/>
					<input type="hidden" id="checkdisableTp09" name="checkdisableTp09" value="0"/>
					<input type="hidden" id="checkdisableTp10" name="checkdisableTp10" value="0"/>
					<input type="hidden" id="checkdisableTp11" name="checkdisableTp11" value="0"/>
					<input type="hidden" id="checkdisableTp12" name="checkdisableTp12" value="0"/>
					<input type="hidden" id="checkdisableTp13" name="checkdisableTp13" value="0"/>
					<input type="hidden" id="checkdisableTp14" name="checkdisableTp14" value="0"/>
					<input type="hidden" id="checkdisableTp15" name="checkdisableTp15" value="0"/>
					
                <table class="layoutTable">
                    <colgroup>
                        <col style="width:350px;">
                        <col style="width:10px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tr>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">장애인 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <div id="<%=layerName%>grid_wrap" style="height: 658px;"></div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <!-- 2020-11-24 추가 : start -->
                            <div id="tabWrapper1" class="tabWrapper">
                                <div class="tabBtnWrap">
                                    <div class="tabBtnGroup">
                                        <div class="tabBtn active">기본정보</div>
                                        <div class="tabBtn">장애정보</div>
                                        <div class="tabBtn">기타정보</div>
                                    </div>
                                    <div class="submsg"><span>등록/수정시 장애인명 + 생년월일 + 연락처로 중복확인을 해야합니다.(연락처 없을 시 장애인명 + 생년월일)</span></div>
                                </div>
                                <div class="tabGroup">
                                    <div class="tabContents">
                                        <!-- tab contents : start -->
                                        <div class="subtitleGroup tabSubtitleGroup">
                                            <div class="subtitle">기본</div>
                                        </div>
                                        
                                        <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
                                            <colgroup>
                                                <col style="width:140px">
                                                <col style="width:300px">
                                                <col style="width:140px">
                                                <col style="width:auto">
                                                <col style="width:140px">
                                            </colgroup>
                                                <tr>
						                            <th>장애인코드</th>
						                            <td colspan="3">
						                            <input type="text" id="dspsnId" name="dspsnId" style="width:280px; text-align:left;" title="장애인코드"  tabindex="1" readonly>
						                            </td>
						                             <td rowspan="4">
						                            	<div class="image-container">
						                            		<img id="img-view" src=" ">
						                            	 </div>
						                            	  <label for="imgUpload">이미지업로드</label>
						                            	 <input type="file" id="imgUpload" name="imgUpload" accept="image/jpeg" />
						                            </td>
				                        		</tr>
				                        	<tr>
						                        <th><span class="essentialItem">장애인명</span></th>
					                            <td>
					                            	<input type="text" id="dspsnNm" name="dspsnNm" title="장애인명" style="width:100%;"  tabindex="1" onkeyup="checkByte(this, 40)" onchange="<%=layerName%>chgDspsnNm();">
					                            </td>
					                            <th><span class="essentialItem">생년월일</span></th>
					                            <td>
					                            	<input type="text" id="encBirthDd" name="encBirthDd"  style="width: 168px;" title="생년월일" tabindex="1" maxlength="8" onkeyup="removeChar(event);" onchange="<%=layerName%>chgEncBirthDd();">
					                            	<button type="button" class="normalBtn" onclick="<%=layerName%>chkData();">중복확인</button>
					                            </td>
				                        	</tr>
				                        	<tr>
				                        		<th>성별</span></th>
				                            	<td>
					                            	<select id="gender" name="gender" style="width: 280px; text-align-last : center;" title="성별" tabindex="1">
					                            	<option value=""></option>
													<c:if test="${!empty genderList}">
														<c:forEach var="list" items="${genderList}">
														<option value="${list.gender}"><c:out value="${list.genderNm}"/></option>
														</c:forEach>
													</c:if>
													</select>
				                            	</td>
				                            	<th>혈액형</th>
				                            	<td>
					                            	<select id="bloodTp" name="bloodTp" style="width: 252px; text-align-last : center;" title="혈액형" tabindex="1">
					                            	<option value=""></option>
													<c:if test="${!empty bloodTypeList}">
														<c:forEach var="list" items="${bloodTypeList}">
														<option value="${list.bloodTp}"><c:out value="${list.bloodNm}"/></option>
														</c:forEach>
													</c:if>
													</select>
				                            	</td>
				                        	</tr>
				                        	<tr>
				                    			<th>혼인관계</th>
				                            	<td>
				                            		<select id="marriageTp" name="marriageTp" style="width: 280px; text-align-last : center;" title="혼인관계" tabindex="1">
				                            		<option value=""></option>
													<c:if test="${!empty maritalStatsList}">
														<c:forEach var="list" items="${maritalStatsList}">
														<option value="${list.marriageTp}"><c:out value="${list.marriageNm}"/></option>
														</c:forEach>
													</c:if>
													</select>
				                           	 	</td>
				                            	<th>보장자격</span></th>
				                            	<td>
					                            	<select id="guaranteeFg" name="guaranteeFg" style="width: 252px; text-align-last : center;" title="보장자격" tabindex="1">
					                            	<option value=""></option>
													<c:if test="${!empty guaranteedList}">
														<c:forEach var="list" items="${guaranteedList}">
														<option value="${list.guaranteedFg}"><c:out value="${list.guaranteedNm}"/></option>
														</c:forEach>
													</c:if>
													</select>
				                            	</td>
				                    		</tr>
					                    	 <tr>
					                    		<th>학력</th>
					                            <td colspan="4">
					                            <input type="text" id="academicDetail" name="academicDetail" style="width:280px; text-align:left;" title="학력" tabindex="1" onkeyup="checkByte(this, 100)"> 
					                            </td>
					                    	</tr>
					                    	<tr>
					                    		<th>직업</th>
					                            <td colspan="4">
					                            <input type="text" id="dspsnJob" name="dspsnJob" style="width:280px; text-align:left;"  title="직업"tabindex="1" onkeyup="checkByte(this, 100)"> 
					                            </td>
					                    	</tr>
					                    	<tr>
					                    		<th>우편번호</span></th>
					                            <td colspan="4"><input type="text" id="zipCd" name="zipCd" style="width:280px; text-align:left;"  title="우편번호"  readonly>
					                            <button type="button" class="normalBtn" onclick="goPopup();">주소검색</button>
												
											</tr>
					                    	<tr>
					                    		<th>기본주소</span></th>
					                            <td colspan="4"><input type="text" id="addrBase" name="addrBase" style="width:100%;text-align:left;"  title="기본주소" onkeydown="<%=layerName%>EnterFilter('addrDetail');" readonly > </td>
					                    	</tr>
					                    	<tr>
					                    		<th>상세주소</span></th>
					                            <td colspan="4"><input type="text" id="encAddrDetail" name="encAddrDetail" style="width:100%;text-align:left;" tabindex="1" title="상세주소" onkeyup="checkByte(this, 500)"> </td>
					                    	</tr>
					                    	<tr>
					                    		<th>연락처</span></th>
					                            <td><input type="text" id="encPhoneNum" name="encPhoneNum" style="width:280px; text-align:left;" title="연락처" tabindex="1" maxlength="11" onkeyup="removeChar(event);" onchange="<%=layerName%>chgEncPhoneNum();"> </td>
					                            
					                            <th>사용여부</th>
					                            <td colspan="2">
					                            <select id="useFg" name="useFg" style="width: 100%; text-align-last : center;" title="사용여부" tabindex="1">
													<c:if test="${!empty useList}">
														<c:forEach var="list" items="${useList}">
														<option value="${list.useFg}"><c:out value="${list.useFgNm}"/></option>
														</c:forEach>
													</c:if>
												</select>
												</td>
					                    	</tr>
	                                </table>
                                
                                	
                                   <div class="subtitleGroup tabSubtitleGroup">
                                       <div class="subtitle">보호자</div>
                                   </div>
                                   <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
                                        <colgroup>
                                             <col style="width:140px">
                                             <col style="width:300px">
                                             <col style="width:140px">
                                             <col style="width:auto">
                                             <col style="width:140px">
                                        </colgroup>
                                        <tr>
				                    		<th>보호자명</th>
			                            	<td><input type="text" id="prtctorNm" name="prtctorNm" style="width:280px; text-align:left;" title="보호자명" tabindex="1" onkeyup="checkByte(this, 40)"></td>
				                       		<th>보호자 관계</th>
				                            <td colspan="2"><input type="text" id="prtctorRelation" name="prtctorRelation" style="width:100%; text-align:left;" title="보호자 관계" tabindex="1" onkeyup="checkByte(this, 50)"></td>
                                  		</tr>
		                    	   		<tr>
			                    			<th>보호자 연락처</th>
				                            <td><input type="text" id="encPrtctorPhoneNum" name="encPrtctorPhoneNum" style="width:280px; text-align:left;" title="보호자 연락처" tabindex="1" maxlength="11" onkeyup="removeChar(event)"></td>
				                        	<th>보호자 직업</th>
				                            <td colspan="2"><input type="text" id="prtctorJob" name="prtctorJob" style="width:100%; text-align:left;" title="보호자 직업" tabindex="1" onkeyup="checkByte(this, 50)"></td>
			                        	</tr>
		                           </table>
		                           </div>
		                             
		                                
		                            <div class="tabContents">
                                    <!-- tab contents : start -->
                                    <div class="subtitleGroup tabSubtitleGroup">
                                        <div class="subtitle">장애력</div>
                                    </div>
                                    <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
                                        <colgroup>
                                            <col style="width:140px">
                                            <col style="width:auto">
                                            <col style="width:140px">
                                            <col style="width:auto">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                    					<th><span class="essentialItem">장애유형</span></th>
				                            <td>
				                            	<select id="disableTp" name="disableTp" style="width: 100%; text-align-last : center;" title="장애유형" tabindex="1" onchange="<%=layerName%>setDisableGrade(this.value)">
				                            	<option value="" hidden ></option>
												<c:if test="${!empty disabledList}">
													<c:forEach var="list" items="${disabledList}">
													<option value="${list.disableTp}"><c:out value="${list.disableTpNm}"/></option>
													</c:forEach>
												</c:if>
												</select>
				                            </td>
			                            <th><span class="essentialItem">장애정도</span></th>
			                            <td>
			                            	<select id="disableDgreeFg" name="disableDgreeFg" style="width: 100%; text-align-last : center;" title="장애정도" tabindex="1">
			                            	<option value="" hidden ></option>
											<c:if test="${!empty disableDreeFgList}">
												<c:forEach var="list" items="${disableDreeFgList}">
												<option value="${list.disableDgreeFg}"><c:out value="${list.disableDgreeNm}"/></option>
												</c:forEach>
											</c:if>
										</select>
			                            </td>
			                            <th>장애등급</th>
			                            <td>
			                            	<select id="disableGrade" name="disableGrade" style="width: 100%; text-align-last : center;" title="장애등급" tabindex="1">
			                            	<option value=""></option>
			                            	<c:if test="${!empty disableGrade}">
												<c:forEach var="list" items="${disableGrade}">
												<option value="${list.disableGrade}"><c:out value="${list.disableGradeNm}"/></option>
												</c:forEach>
											</c:if>
										</select>
			                            </td>					                            
			                    	</tr> 
			                        <tr>
			                        	<th>기타장애</th>
			                            <td colspan="5">
			                        		<input type="checkbox" id="disableTp01" name="disableTp01"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />지체
											<input type="checkbox" id="disableTp02" name="disableTp02"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />시각
											<input type="checkbox" id="disableTp03" name="disableTp03"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />청각
											<input type="checkbox" id="disableTp04" name="disableTp04"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />언어
											<input type="checkbox" id="disableTp05" name="disableTp05"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />지적
											<input type="checkbox" id="disableTp06" name="disableTp06"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />뇌병련
											<input type="checkbox" id="disableTp07" name="disableTp07"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />자폐성
											<input type="checkbox" id="disableTp08" name="disableTp08"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />정신
											<input type="checkbox" id="disableTp09" name="disableTp09"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />신장
											<input type="checkbox" id="disableTp10" name="disableTp10"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />심장
											<input type="checkbox" id="disableTp11" name="disableTp11"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />호흡기
											<input type="checkbox" id="disableTp12" name="disableTp12"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />간
											<input type="checkbox" id="disableTp13" name="disableTp13"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />안면
											<input type="checkbox" id="disableTp14" name="disableTp14"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />장루.요루
											<input type="checkbox" id="disableTp15" name="disableTp15"  onclick="<%=layerName%>disableTpCheckBox(this)" tabindex="1" />뇌전증
			                        	</td>
			                        </tr>
			                    	<tr>
			                    		<th>발생시기</th>
			                            <td colspan="5">
			                            	<select id="outbreakTimeFg" name="outbreakTimeFg" style="width: 100%; text-align-last : center;" title="발생시기" tabindex="1">
											<c:if test="${!empty outbreakTimeFg}">
												<c:forEach var="list" items="${outbreakTimeFg}">
												<option value="${list.outbreakTimeFg}"><c:out value="${list.outbreakTimeNm}"/></option>
												</c:forEach>
											</c:if>
										</select>
			                            </td>
			                    	</tr>
			                    	<tr>
			                    		<th>발생사유</th>
			                            <td colspan="5">
			                            	<select id="outbreakRsnFg" name="outbreakRsnFg" style="width: 100%; text-align-last : center;" title="발생사유" tabindex="1">
											<c:if test="${!empty outbreakRsnFg}">
												<c:forEach var="list" items="${outbreakRsnFg}">
												<option value="${list.outbreakRsnFg}"><c:out value="${list.outbreakRsnNm}"/></option>
												</c:forEach>
											</c:if>
										</select>
			                            </td>
			                    	</tr>
			                                 </tbody>
			                             </table>
			                                    
			                            <div class="subtitleGroup tabSubtitleGroup">
			                                <div class="subtitle">건강상태</div>
			                            </div>
			                            <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
			                                <colgroup>
			                                    <col style="width:140px">
			                                    <col style="width:auto">
			                                    <col style="width:140px">
			                                    <col style="width:auto">
			                                </colgroup>
			                                <tbody>
			                                      <tr>
							                  		<th>청각문제</th>
							                          	<td colspan="5"><input type="text" id="healthSts01" name="healthSts01" style="width:100%;text-align:left;" title="청각문제" tabindex="1" onkeyup="checkByte(this, 100)"></td>
							                      	</tr>  
							                      	<tr>
							                  		<th>시각문제</th>
							                          	<td colspan="5"><input type="text" id="healthSts02" name="healthSts02" style="width:100%;text-align:left;" title="시각문제" tabindex="1" onkeyup="checkByte(this, 100)"></td>
							                      	</tr>
							                      	<tr>
							                  			<th>언어문제</th>
							                          <td colspan="5"><input type="text" id="healthSts03" name="healthSts03" style="width:100%;text-align:left;" title="언어문제" tabindex="1" onkeyup="checkByte(this, 100)"></td>
							                      	</tr>
							                      	<tr>
							                  			<th>질환</th>
							                          	<td colspan="5"><input type="text" id="healthSts06" name="healthSts06" style="width:100%;text-align:left;" title="질환" tabindex="1" onkeyup="checkByte(this, 100)"></td>
							                      	</tr>
			                              	</tbody>
			                          		</table>      
		                                </div>
		                                
		                                <div class="tabContents">
	                                    <div class="subtitleGroup tabSubtitleGroup">
	                                        <div class="subtitle">사례관리</div>
	                                    </div>
	                                	 <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
	                                      <colgroup>
	                                          <col style="width:140px">
	                                          <col style="width:auto">
	                                          <col style="width:140px">
	                                          <col style="width:auto">
	                                      </colgroup>
	                                      <tr>
				                    	  <th>사례관리대상</th>
					                      <td colspan="5">
					                           <select id="caseManageFg" name="caseManageFg" style="width:280px; text-align-last : center;" title="사례관리대상" tabindex="1">
					                         	    <option value=""></option>
													<c:if test="${!empty caseManageFgList}">
														<c:forEach var="list" items="${caseManageFgList}">
														<option value="${list.caseManageFg}"><c:out value="${list.caseManageNm}"/></option>
														</c:forEach>
													</c:if>
												</select>
					                       </td>
				                    	  </tr>
				                    	<tr>
				                      		<th>사례관리종료일</th>
				                      		<td>
											   <input type="text" id="caseManageEndDd" name="caseManageEndDd" style="width:280px;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkCaseManageEndDd(this.value)" tabindex="1">
											 </td>
				                    	</tr>
				                    	<tr>
				                    		<th>사례관리종료사유</th>
				                            <td>
				                            	<select id="caseManageEndRsn" name="caseManageEndRsn" style="width:150px; text-align-last : center;" title="사례관리종료사유" tabindex="1" onchange="<%=layerName%>fn_caseManageEndRsn(this.value)">
												<c:if test="${!empty caseManEndRsnList}">
													<c:forEach var="list" items="${caseManEndRsnList}">
													<option value="${list.caseManageEndRsn}"><c:out value="${list.caseManageEndRsnNm}"/></option>
													</c:forEach>
												</c:if>
												</select>
												<input type="text" id="caseManageEndDetail" name="caseManageEndDetail" style="width: 81.6%; text-align: left;" title="사유" onkeyup="checkByte(this, 100)" tabindex="1" readonly>
				                            </td>
				                    	</tr> 
			                         </table>
			                                    
			                    		<div class="subtitleGroup tabSubtitleGroup">
			                                  <div class="subtitle">최초 이용일</div>
			                            </div>
	                                    <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
	                                        <colgroup>
	                                            <col style="width:140px">
	                                            <col style="width:auto">
	                                            <col style="width:140px">
	                                            <col style="width:auto">
	                                        </colgroup>
	                                            <tr>
						                      		<th>복지관</th>
						                      		<td>
													   <input type="text" id="cmmrlctFirstUseDd" name="cmmrlctFirstUseDd"  style="width:280px;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkCmmrlctFirstUseDd(this.value)" tabindex="1">
													 </td>
						                    	</tr>
						                    	<tr>
						                    		<th>자립생활센터</th>
						                      		<td>
													   <input type="text" id="selfFirstUseDd"  name="selfFirstUseDd" style="width:280px;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkSelfFirstUseDd(this.value)" tabindex="1">
													</td>
						                    	</tr>
					                       	 </table> 
					                                     	
						                    <div class="subtitleGroup tabSubtitleGroup">
					                            <div class="subtitle">이용 희망시설</div>
					                        </div>
		                                    <table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
		                                        <colgroup>
		                                            <col style="width:140px">
		                                            <col style="width:auto">
		                                            <col style="width:140px">
		                                            <col style="width:auto">
		                                        </colgroup>
		                                        <tbody>
		                                            <tr>
						                    		<th>이용 희망시설</th>
						                            <td colspan="5"><input type="text" id="hopeFacility" name="hopeFacility" style="width:100%; text-align:left;" title="이용희망시설" tabindex="1" onkeyup="checkByte(this, 100)"></td>
						                        </tr>  
						                      	</tbody>
		                                    </table>  	  	
		                                </div>
			                      </div>
			                   </div>
			                 </td>
			              </tr>
			          </table>
			          </form>
			          <!-- layout table : end -->

<style type="text/css" >
	
	.image-container{
        width: 100%;
        height: 150px;
    }
    
    #img-view {
     	width: 100%;
     	height: 100%;
    }
    
    
    label { 
		display: inline-block;
		color: #fff;
		font-size: inherit;
		vertical-align: middle;
		background-color: #5a6e8f;
		cursor: pointer;
		border-bottom-color: #e2e2e2;
		border-radius: .25em;
		text-align: center;
		width: 100%;
     }
      
     /* 파일 필드 숨기기 */
	 input[type="file"] {
		 position: absolute;
		 width: 1px;
		 height: 1px;
		 padding: 0;
		 margin: -1px;
	  	 overflow: hidden;
	   	 clip:rect(0,0,0,0);
	     border: 0;
     }
     
     .submsg span{color: #FF0000;}
</style>

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_disabledInfo();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [ 
        {dataField : "dspsnId"     ,headerText : "장애인코드"   ,width : "40%"}
       ,{dataField : "dspsnNm"     ,headerText : "성명"       ,width : "35%", style : "my-column-left"}
       ,{dataField : "disableTpNm" ,headerText : "장애유형"    ,width : "25%", style : "my-column-left"} 
       ];
	
	$(function () {	
		$(".<%=layerName%> .datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        yearRange: year_range,
	        showOn: "both",
	        buttonImage: "/resources/images/btn_cal.png",
	        buttonImageOnly: true,
	        buttonText: "선택하세요",
	        inline: true,
	        duration: 300,
	        showAnim: "slideDown"
	    });
		
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		// 초기화 
		<%=layerName%>fn_DisablePersonInfo();
		//tab button
	    $(".tabBtn").on("click", function () {
	        var tabIndex = $(this).index();
	        $(this).siblings().removeClass("active");
	        $(this).addClass("active");
	        $(this).parents(".tabWrapper").find(".tabContents").hide();
	        $(this).parents(".tabWrapper").find(".tabContents").eq(tabIndex).show();
	    });
		
		$(function() {
            $("#imgUpload").on('change', function(){
            	<%=layerName%>readURL(this);
            });
            
            
        });
		
		if($(".<%=layerName%> #userGroupCd").val() == "C"){
			$(".<%=layerName%> .mainTitle").text("이용장애인 수정");
		}
	});
	
	

	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			noDataMessage : "조회된 내용이 없습니다.",
			rowHeight : 38,
			headerHeight : 38
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
		
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
			//$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		});
		
		// 그리드 ready 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
	}

	// 그리드 ready 이벤트 핸들러
	function <%=layerName%>auiGridCompleteHandler(event) {
		var rowIndex = $(".<%=layerName%> #rowIndex").val();
		
		if (rowIndex != ""){
			AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, rowIndex); // 선택한 셀 선택되도록 지정
		}else{
			AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0, 0); // 첫번째 셀 선택되도록 지정
		}
	};
	
	// 셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
	function <%=layerName%>setFieldToFormWindow(primeCell, item) {
		
		
		var Ipath = item.picturePath;
		var INm   = item.pictureNm;
		
		if(typeof Ipath != "undefined" && typeof INm != "undefined"){
			<%=layerName%>setViewImg(Ipath,INm);
		}else{
			$('#img-view').attr('src'," ");
		}
		
		//기본정보
		$(".<%=layerName%> #dspsnId").val(item.dspsnId);
		$(".<%=layerName%> #encBirthDd").val(item.encBirthDd);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
		$(".<%=layerName%> #gender").val(item.gender);
		$(".<%=layerName%> #bloodTp").val(item.bloodTp);
		$(".<%=layerName%> #marriageTp").val(item.marriageTp);
		$(".<%=layerName%> #guaranteeFg").val(item.guaranteeFg);
		$(".<%=layerName%> #academicDetail").val(item.academicDetail);
		$(".<%=layerName%> #dspsnJob").val(item.dspsnJob);
		$(".<%=layerName%> #zipCd").val(item.zipCd);
		$(".<%=layerName%> #addrBase").val(item.addrBase);
		$(".<%=layerName%> #encAddrDetail").val(item.encAddrDetail);
		
		var encPhoneNum = item.encPhoneNum;
		if(typeof encPhoneNum != "undefined"){
			$(".<%=layerName%> #encPhoneNum").val(chk_tel(item.encPhoneNum));	
		}else{
			$(".<%=layerName%> #encPhoneNum").val("");
		}
		
		$(".<%=layerName%> #picturePath").val(item.picturePath);
		$(".<%=layerName%> #pictureNm").val(item.pictureNm);
		$(".<%=layerName%> #pictureRealNm").val(item.pictureRealNm);
		$(".<%=layerName%> #useFg").val(item.useFg);
		$(".<%=layerName%> #prtctorNm").val(item.prtctorNm);
		$(".<%=layerName%> #prtctorRelation").val(item.prtctorRelation);
		
		var encPrtctorPhoneNum = item.encPrtctorPhoneNum;
		if(typeof encPrtctorPhoneNum != "undefined"){
			$(".<%=layerName%> #encPrtctorPhoneNum").val(chk_tel(item.encPrtctorPhoneNum));	
		}else{
			$(".<%=layerName%> #encPrtctorPhoneNum").val("");
		}
		
		$(".<%=layerName%> #prtctorJob").val(item.prtctorJob);
		
		
		//장애정보
		$(".<%=layerName%> #disableTp").val(item.disableTp);
		//<%=layerName%>setDisableGrade(item.disableTp);
		$(".<%=layerName%> #disableDgreeFg").val(item.disableDgreeFg);
		$(".<%=layerName%> #disableGrade").val(item.disableGrade);
		// 기타장애 값에 따라 체크
		<%=layerName%>setDisableTp(item.disableTp01, item.disableTp02, item.disableTp03, item.disableTp04 ,item.disableTp05
				                 , item.disableTp06, item.disableTp07, item.disableTp08, item.disableTp09 ,item.disableTp10
				                 , item.disableTp11 ,item.disableTp12, item.disableTp13, item.disableTp14, item.disableTp15);
		$(".<%=layerName%> #outbreakTimeFg").val(item.outbreakTimeFg);
		$(".<%=layerName%> #outbreakRsnFg").val(item.outbreakRsnFg);
		$(".<%=layerName%> #healthSts01").val(item.healthSts01);
		$(".<%=layerName%> #healthSts02").val(item.healthSts02);
		$(".<%=layerName%> #healthSts03").val(item.healthSts03);
		$(".<%=layerName%> #healthSts06").val(item.healthSts06);
		
		
		//기타정보
		$(".<%=layerName%> #caseManageFg").val(item.caseManageFg);
		$(".<%=layerName%> #caseManageEndRsn").val(item.caseManageEndRsn);
		var caseManageEndRsn = item.caseManageEndRsn;
		 if(caseManageEndRsn == "E"){
				$(".<%=layerName%> #caseManageEndDetail").attr('readonly', false);
				$(".<%=layerName%> #caseManageEndDetail").val(item.caseManageEndDetail);
			}else{
				$(".<%=layerName%> #caseManageEndDetail").attr('readonly', true);
				$(".<%=layerName%> #caseManageEndDetail").val("");
			} 
		$(".<%=layerName%> #hopeFacility").val(item.hopeFacility);
		$(".<%=layerName%> #selfFirstUseDd").val(item.selfFirstUseDd);
		$(".<%=layerName%> #cmmrlctFirstUseDd").val(item.cmmrlctFirstUseDd);
		$(".<%=layerName%> #caseManageEndDd").val(item.caseManageEndDd);
		
		
		// 상태값
		$(".<%=layerName%> #disabledForm").find("#saveMode").val("U");
		$(".<%=layerName%> #isValue").val("Y");
		$(".<%=layerName%> #isSaveValue").val("Y");
	}
	

	
	//조회
	function <%=layerName%>loadData () {			
		<%=layerName%>fn_DisablePersonInfo();
		
		var sendData = {"dspsnNm"      : <%=layerName%>searchDisPerSaveForm.sehDspsnNm.value
				       ,"disableTp"    : <%=layerName%>searchDisPerSaveForm.sehDisableTp.value};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/dsp/selectDisablePersonList",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				
				showHideTab("#tabWrapper1", 0); 
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("장애인리스트 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_DisablePersonInfo();
		}
	}
	
	//초기화
	function <%=layerName%>fn_DisablePersonInfo() {
		
		$(".<%=layerName%> #dspsnNm").focus();
		
		// 기본정보
		$(".<%=layerName%> #dspsnId").val("");
		$(".<%=layerName%> #encBirthDd").val("");
		$(".<%=layerName%> #dspsnNm").val("");
		$(".<%=layerName%> #gender").val("");
		$(".<%=layerName%> #bloodTp").val("");
		$(".<%=layerName%> #marriageTp").val("");
		$(".<%=layerName%> #guaranteeFg").val("");
		$(".<%=layerName%> #academicDetail").val("");
		$(".<%=layerName%> #dspsnJob").val("");
		$(".<%=layerName%> #zipCd").val("");
		$(".<%=layerName%> #addrBase").val("");
		$(".<%=layerName%> #encAddrDetail").val("");
		$(".<%=layerName%> #picturePath").val("");
		$(".<%=layerName%> #pictureNm").val("");
		$(".<%=layerName%> #pictureRealNm").val("");
		$(".<%=layerName%> #encPhoneNum").val("");
		$(".<%=layerName%> #useFg").val("1");
		$(".<%=layerName%> #prtctorNm").val("");
		$(".<%=layerName%> #prtctorRelation").val("");
		$(".<%=layerName%> #encPrtctorPhoneNum").val("");
		$(".<%=layerName%> #prtctorJob").val("");
		$('#img-view').attr('src'," ");
		
		//장애정보
		$(".<%=layerName%> #disableTp").val("");
		$(".<%=layerName%> #disableDgreeFg").val("");
		$(".<%=layerName%> #disableGrade").val("");
		$(".<%=layerName%> #outbreakTimeFg").val("");
		$(".<%=layerName%> #outbreakRsnFg").val("");
		$(".<%=layerName%> #disableTp01").prop('checked', false);
		$(".<%=layerName%> #disableTp02").prop('checked', false);
		$(".<%=layerName%> #disableTp03").prop('checked', false);
		$(".<%=layerName%> #disableTp04").prop('checked', false);
		$(".<%=layerName%> #disableTp05").prop('checked', false);
		$(".<%=layerName%> #disableTp06").prop('checked', false);
		$(".<%=layerName%> #disableTp07").prop('checked', false);
		$(".<%=layerName%> #disableTp08").prop('checked', false);
		$(".<%=layerName%> #disableTp09").prop('checked', false);
		$(".<%=layerName%> #disableTp10").prop('checked', false);
		$(".<%=layerName%> #disableTp11").prop('checked', false);
		$(".<%=layerName%> #disableTp12").prop('checked', false);
		$(".<%=layerName%> #disableTp13").prop('checked', false);
		$(".<%=layerName%> #disableTp14").prop('checked', false);
		$(".<%=layerName%> #disableTp15").prop('checked', false);
		$(".<%=layerName%> #checkdisableTp01").val('0');
		$(".<%=layerName%> #checkdisableTp02").val('0');
		$(".<%=layerName%> #checkdisableTp03").val('0');
		$(".<%=layerName%> #checkdisableTp04").val('0');
		$(".<%=layerName%> #checkdisableTp05").val('0');
		$(".<%=layerName%> #checkdisableTp06").val('0');
		$(".<%=layerName%> #checkdisableTp07").val('0');
		$(".<%=layerName%> #checkdisableTp08").val('0');
		$(".<%=layerName%> #checkdisableTp09").val('0');
		$(".<%=layerName%> #checkdisableTp10").val('0');
		$(".<%=layerName%> #checkdisableTp11").val('0');
		$(".<%=layerName%> #checkdisableTp12").val('0');
		$(".<%=layerName%> #checkdisableTp13").val('0');
		$(".<%=layerName%> #checkdisableTp14").val('0');
		$(".<%=layerName%> #checkdisableTp15").val('0');
		$(".<%=layerName%> #healthSts01").val("");
		$(".<%=layerName%> #healthSts02").val("");
		$(".<%=layerName%> #healthSts03").val("");
		$(".<%=layerName%> #healthSts06").val("");
		
		// 기타정보
		$(".<%=layerName%> #caseManageFg").val("");
		$(".<%=layerName%> #caseManageEndRsn").val("");
		$(".<%=layerName%> #caseManageEndDetail").val("");
		$(".<%=layerName%> #hopeFacility").val("");
		$(".<%=layerName%> #selfFirstUseDd").val("");
		$(".<%=layerName%> #cmmrlctFirstUseDd").val("");
		$(".<%=layerName%> #caseManageEndDd").val("");
		
		
		// 상태값
		$(".<%=layerName%> #disabledForm").find("#saveMode").val("I");
		$(".<%=layerName%> #isValue").val("N");
		$(".<%=layerName%> #isSaveValue").val("N");
	}
	
	//저장 체크
	function <%=layerName%>fn_disabledInfo() {
		
		
		
		if ( $(".<%=layerName%> #dspsnNm").val() == "" ) {
			showHideTab("#tabWrapper1", 0); 
			$(".<%=layerName%> #dspsnNm").focus();
			GRIT.msg.alert("[장애인명]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #encBirthDd").val() == "" ) {
			showHideTab("#tabWrapper1", 0); 
			$(".<%=layerName%> #encBirthDd").focus();
			GRIT.msg.alert("[생년월일]는 필수 항목입니다."); return;
		}
		
		
		if ( $(".<%=layerName%> #encAddrDetail").val() != "" ) {
			if ( $(".<%=layerName%> #zipCd").val() == "") {
				showHideTab("#tabWrapper1", 0); 
				GRIT.msg.alert("[상세주소] 입력시 [우편번호]를 입력해야 합니다."); return;
			}
		}
		
		if($(".<%=layerName%> #encPhoneNum").val() != "" ){
			if ( $(".<%=layerName%> #encPhoneNum").val().length < 8 ) {
				showHideTab("#tabWrapper1", 0); 
				$(".<%=layerName%> #encPhoneNum").focus();
				GRIT.msg.alert("[연락처]는 최소 8자리를 입력해야 합니다."); return;
			}
			
			if(!checkPhoneNum($(".<%=layerName%> #encPhoneNum").val())){
				showHideTab("#tabWrapper1", 0);
				$(".<%=layerName%> #encPhoneNum").focus();
				GRIT.msg.alert("[연락처] 형식이 잘못 되었습니다."); return;
			} 
		}
		
		
		
		if($(".<%=layerName%> #encPrtctorPhoneNum").val() != "" ){
			if ( $(".<%=layerName%> #encPrtctorPhoneNum").val().length < 8 ) {
				showHideTab("#tabWrapper1", 0); 
				$(".<%=layerName%> #encPrtctorPhoneNum").focus();
				GRIT.msg.alert("[보호자 연락처]는  최소 8자리를 입력해야 합니다."); return;
			}
			
			 if(!checkPhoneNum($(".<%=layerName%> #encPrtctorPhoneNum").val())){
				showHideTab("#tabWrapper1", 0);
				$(".<%=layerName%> #encPrtctorPhoneNum").focus();
				GRIT.msg.alert("[보호자 연락처] 형식이 잘못 되었습니다."); return;
			} 
		}
		
		if ($(".<%=layerName%> #disableTp").val() == "" ) {
			showHideTab("#tabWrapper1", 1); 
			$(".<%=layerName%> #disableTp").focus();
			GRIT.msg.alert("[장애유형]는 필수 항목입니다."); return;
		}
		
		if ($(".<%=layerName%> #disableDgreeFg").val() == "" ) {
			showHideTab("#tabWrapper1", 1); 
			$(".<%=layerName%> #disableDgreeFg").focus();
			GRIT.msg.alert("[장애정도]는 필수 항목입니다."); return;
		}
		
		if($(".<%=layerName%> #cmmrlctFirstUseDd").val() != "" ){
		var cmmrlctYYYYMMDD = $(".<%=layerName%> #cmmrlctFirstUseDd").val().replace(/\-/g,'');
			if (cmmrlctYYYYMMDD.length != 8) {
				showHideTab("#tabWrapper1", 2); 
				GRIT.msg.alert("[복지관] 날짜형식이 잘못되었습니다."); return;
			}
		}
		
		if($(".<%=layerName%> #selfFirstUseDd").val() != "" ){
		var selfYYYYMMDD = $(".<%=layerName%> #selfFirstUseDd").val().replace(/\-/g,'');
			if (selfYYYYMMDD.length != 8) {
				showHideTab("#tabWrapper1", 2);
				GRIT.msg.alert("[자립센생활센터] 날짜형식이 잘못되었습니다."); return;
			}
		}
			
		if($(".<%=layerName%> #caseManageEndDd").val() != ""){
		var caseYYYYMMDD = $(".<%=layerName%> #caseManageEndDd").val().replace(/\-/g,'');
			if (caseYYYYMMDD.length != 8) {
				showHideTab("#tabWrapper1", 2); 
				GRIT.msg.alert("[사례관리종료일] 날짜형식이 잘못되었습니다."); return;
			}
		}
		
		
	   if($(".<%=layerName%> #isValue").val() == "N"){
			showHideTab("#tabWrapper1", 0); 
			GRIT.msg.alert("생년월일 중복확인 후 저장 해야합니다."); return;
		}
		
	  	if($(".<%=layerName%> #isSaveValue").val() == "N"){
	  		showHideTab("#tabWrapper1", 0); 
	  		if(!confirm("등록된 정보들이 있습니다. 그래도 저장 하시겠습니까?")){
	  			return false;
	  		}else{
	  			<%=layerName%>fn_save();
	  		}
	  		
		}else{
			if(confirm("저장 하시겠습니까?")){
				<%=layerName%>fn_save();
		    }	
		}  
		
		 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		// 저장 배열
		var disableData = new Array();
		
		var tempData = $(".<%=layerName%> form[name=disabledForm]").serializeObject();
		var imgFile = $("#imgUpload")[0].files[0];
		disableData.push(tempData);
		
		var formData = new FormData();
		formData.append("imgFile",imgFile);
		formData.append("disableData",JSON.stringify(disableData));
		
		   $.ajax({
	        type: "POST",
	        url: "/dsp/saveDisablePersonInfo",
			data: formData,
			processData: false,
	        contentType: false,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});    
	}
	
	
	function goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="jusoPopup";
		
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/pop/jusoPop","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(addrBase, zipCd){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.disabledForm.zipCd.value = zipCd;
		document.disabledForm.addrBase.value = addrBase;
	}
	
	// 이미지 미리보기
	function <%=layerName%>readURL(input) {
		var file = input.files[0];
		if(file == null){
			return;
		}
		
		if(file.size > 2048000) {
			GRIT.msg.alert("이미지파일은 2MB 를 초과해선 안됩니다.");
			return;
		}
		
	  	if(!/\.(jpg|jpeg)$/i.test(file.name)){
			GRIT.msg.alert("이미지파일은 jpg, jpeg만 업로드 할 수 있습니다.")
			$(".<%=layerName%> #imgUpload").val("");
			return;
		} 
		
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
              $('#img-view').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }
    }
	
	
	// 장애유형으로 장애등급 조회
	function <%=layerName%>setDisableGrade(value){
		var grade = "";
		
		if(value == "01"){
			grade = "DG01";
		}else if(value == "02"){
			grade = "DG03";
		}else if(value == "03"){
			grade = "DG04";
		}else if(value == "04"){
			grade = "DG05";
		}else if(value == "05"){
			grade = "DG13";
		}else if(value == "06"){
			grade = "DG02";
		}else if(value == "07"){
			grade = "DG14";
		}else if(value == "08"){
			grade = "DG15";
		}else if(value == "09"){
			grade = "DG07";
		}else if(value == "10"){
			grade = "DG08";
		}else if(value == "11"){
			grade = "DG10";
		}else if(value == "12"){
			grade = "DG09";
		}else if(value == "13"){
			grade = "DG06";
		}else if(value == "14"){
			grade = "DG11";
		}else if(value == "15"){
			grade = "DG12";
		}
		
		var sendData = {"grade" : grade};
		
		GRIT.tran.send({
			url: "/dsp/selectDisableGradeList",
			sendData: sendData,
			success: function(result){
				$('#disableGrade option').remove();
				$('#disableGrade').append("<option value="+""+"></option>");
				 for(var i=0; i<result.disableGradeList.length; i++){
					$('#disableGrade').append("<option value="+result.disableGradeList[i].disableGrade+"> "+result.disableGradeList[i].disableGradeNm+ "</option>");	
				} 
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("장애등급 조회 문제가 발생했습니다.");
			},
			loading : false
		});
	}
	
	// 기타장애 체크 박스 클릭시
	function <%=layerName%>disableTpCheckBox(obj){
		
		var valId = obj.id; 
		
		if(valId == "disableTp01"){
			if($(".<%=layerName%> input:checkbox[id='disableTp01']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp01").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp01").val('0');
	 		} 
		}
		
		if(valId == "disableTp02"){
			if($(".<%=layerName%> input:checkbox[id='disableTp02']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp02").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp02").val('0');
	 		} 
		}
		
		if(valId == "disableTp03"){
			if($(".<%=layerName%> input:checkbox[id='disableTp03']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp03").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp03").val('0');
	 		} 
		}
		
		if(valId == "disableTp04"){
			if($(".<%=layerName%> input:checkbox[id='disableTp04']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp04").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp04").val('0');
	 		} 
		}
		
		if(valId == "disableTp05"){
			if($(".<%=layerName%> input:checkbox[id='disableTp05']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp05").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp05").val('0');
	 		} 
		}
		
		if(valId == "disableTp06"){
			if($(".<%=layerName%> input:checkbox[id='disableTp06']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp06").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp06").val('0');
	 		} 
		}
		
		if(valId == "disableTp07"){
			if($(".<%=layerName%> input:checkbox[id='disableTp07']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp07").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp07").val('0');
	 		} 
		}
		
		if(valId == "disableTp08"){
			if($(".<%=layerName%> input:checkbox[id='disableTp08']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp08").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp08").val('0');
	 		} 
		}
		
		if(valId == "disableTp09"){
			if($(".<%=layerName%> input:checkbox[id='disableTp09']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp09").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp09").val('0');
	 		} 
		}
		
		if(valId == "disableTp10"){
			if($(".<%=layerName%> input:checkbox[id='disableTp10']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp10").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp10").val('0');
	 		} 
		}
		
		if(valId == "disableTp11"){
			if($(".<%=layerName%> input:checkbox[id='disableTp11']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp11").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp11").val('0');
	 		} 
		}
		
		if(valId == "disableTp12"){
			if($(".<%=layerName%> input:checkbox[id='disableTp12']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp12").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp12").val('0');
	 		} 
		}
		
		if(valId == "disableTp13"){
			if($(".<%=layerName%> input:checkbox[id='disableTp13']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp13").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp13").val('0');
	 		} 
		}
		
		if(valId == "disableTp14"){
			if($(".<%=layerName%> input:checkbox[id='disableTp14']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp14").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp14").val('0');
	 		} 
		}
		
		if(valId == "disableTp15"){
			if($(".<%=layerName%> input:checkbox[id='disableTp15']").is(':checked') == true){
	 			$(".<%=layerName%> #checkdisableTp15").val('1');
	 		}else{
	 			$(".<%=layerName%> #checkdisableTp15").val('0');
	 		} 
		}
	}
	
	// 기타장애 1:check, 0:unchek
	 function <%=layerName%>setDisableTp(disableTp01,disableTp02,disableTp03,disableTp04,disableTp05
			                            ,disableTp06,disableTp07,disableTp08,disableTp09,disableTp10
			                            ,disableTp11,disableTp12,disableTp13,disableTp14,disableTp15){
		 
		if(disableTp01 == "1"){
 			$(".<%=layerName%> #disableTp01").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp01").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp01").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp01").val('0');
 		}
		
		if(disableTp02 == "1"){
 			$(".<%=layerName%> #disableTp02").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp02").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp02").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp02").val('0');
 		}
 		
		if(disableTp03 == "1"){
 			$(".<%=layerName%> #disableTp03").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp03").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp03").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp03").val('0');
 		}
		
		if(disableTp04 == "1"){
 			$(".<%=layerName%> #disableTp04").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp04").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp04").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp04").val('0');
 		}
		
		if(disableTp05 == "1"){
 			$(".<%=layerName%> #disableTp05").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp05").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp05").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp05").val('0');
 		}
		
		if(disableTp06 == "1"){
 			$(".<%=layerName%> #disableTp06").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp06").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp06").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp06").val('0');
 		}
		
		if(disableTp07 == "1"){
 			$(".<%=layerName%> #disableTp07").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp07").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp07").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp07").val('0');
 		}
		
		if(disableTp08 == "1"){
 			$(".<%=layerName%> #disableTp08").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp08").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp08").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp08").val('0');
 		}
		
		if(disableTp09 == "1"){
 			$(".<%=layerName%> #disableTp09").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp09").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp09").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp09").val('0');
 		}
		
		if(disableTp10 == "1"){
 			$(".<%=layerName%> #disableTp10").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp10").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp10").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp10").val('0');
 		}
		
		
		if(disableTp11 == "1"){
 			$(".<%=layerName%> #disableTp11").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp11").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp11").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp11").val('0');
 		}
		
		if(disableTp12 == "1"){
 			$(".<%=layerName%> #disableTp12").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp12").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp12").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp12").val('0');
 		}
		
		if(disableTp13 == "1"){
 			$(".<%=layerName%> #disableTp13").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp13").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp13").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp13").val('0');
 		}
		
		if(disableTp14 == "1"){
 			$(".<%=layerName%> #disableTp14").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp14").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp14").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp14").val('0');
 		}
		
		if(disableTp15 == "1"){
 			$(".<%=layerName%> #disableTp15").prop('checked', true);
 			$(".<%=layerName%> #checkdisableTp15").val('1');
 		}else{
 			$(".<%=layerName%> #disableTp15").prop('checked', false);
 			$(".<%=layerName%> #checkdisableTp15").val('0');
 		}
	}
	 
	// 자립생활센터 날짜체크
 	function <%=layerName%>checkSelfFirstUseDd(obj){
 		
 		var yyyymmdd = obj.replace(/\-/g,'');
 		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #selfFirstUseDd").val("");
			$(".<%=layerName%> #selfFirstUseDd").focus();
		}
 	}
 	
 	// 복지관 날짜체크
 	function <%=layerName%>checkCmmrlctFirstUseDd(obj){
 		
 		var yyyymmdd = obj.replace(/\-/g,'');
 		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #cmmrlctFirstUseDd").val("");
			$(".<%=layerName%> #cmmrlctFirstUseDd").focus();
		}
 	}
 	
 	// 사례관리종료일 날짜체크
 	function <%=layerName%>checkCaseManageEndDd(obj){
 		
 		var yyyymmdd = obj.replace(/\-/g,'');
 		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #caseManageEndDd").val("");
			$(".<%=layerName%> #caseManageEndDd").focus();
		}
 	}
 	
 	// 사례관리종료사유가 기타(E)일때
 	function <%=layerName%>fn_caseManageEndRsn(value){
		var caseManageEndRsn = value;
		
		 if(caseManageEndRsn == "E"){
			$(".<%=layerName%> #caseManageEndDetail").attr('readonly', false);
		}else{
			$(".<%=layerName%> #caseManageEndDetail").attr('readonly', true);
			$(".<%=layerName%> #caseManageEndDetail").val("");
		} 
	}
 	
    // 생년월일 변경
 	function <%=layerName%>chgEncBirthDd(){
 		$(".<%=layerName%> #isValue").val("N");
 	}
 	
 	// 장애인명 변경
 	function <%=layerName%>chgDspsnNm(){
 		$(".<%=layerName%> #isValue").val("N");
 	}
 	
 	// 연락처 변경
 	function <%=layerName%>chgEncPhoneNum(){
 		$(".<%=layerName%> #isValue").val("N");
 	}
 	
 	
 	// 생년월일 중복체크
 	function <%=layerName%>chkData(){
 		
 		var isValue     = $(".<%=layerName%> #isValue").val();
 		
 		var birthDd = $(".<%=layerName%> #encBirthDd").val();
 		var dspsnNm = $(".<%=layerName%> #dspsnNm").val();
 		var encPhoneNum = $(".<%=layerName%> #encPhoneNum").val();
 		
 		if(dspsnNm == "" || dspsnNm == null){
 			$(".<%=layerName%> #dspsnNm").focus();
 			GRIT.msg.alert ("중복 확인 전 장애인명 입력은 필수 항목입니다");   
 			return false;
 		} 
 		
 		if(birthDd == "" || birthDd == null){
 			$(".<%=layerName%> #encBirthDd").focus();
 			GRIT.msg.alert ("중복 확인 전 생년월일 입력은 필수 항목입니다");   
 			return false;
 		}
 		
 		if(birthDd.length != "8"){
 			$(".<%=layerName%> #encBirthDd").focus();
			GRIT.msg.alert("[생년월일]는 8자리 입니다."); 
			return false;
 		}
 		
 		if(encPhoneNum != ""){
			if ( $(".<%=layerName%> #encPhoneNum").val().length < 8 ) {
				$(".<%=layerName%> #encPhoneNum").focus();
				GRIT.msg.alert("[연락처]는  최소 8 자리를 입력해야 합니다."); return;
			}
		}
 		
 	    if(isValue == "Y"){
 			GRIT.msg.alert("장애인명,생년월일,연락처 변경후 확인할수있습니다.");
 			return false;
 		}
 		
 		var sendData = {"encBirthDd"   : birthDd
 				       , "dspsnNm"     : dspsnNm
 				       , "encPhoneNum" : encPhoneNum.replace(/\-/g,'')};
 		
 		GRIT.tran.send({
			url: "/dsp/selectencBirthDd",
			sendData: sendData,
			success: function(result){
				
				if(result.data.length == 0){
					GRIT.msg.alert("사용 가능한 생년월일 입니다.");
					$(".<%=layerName%> #isValue").val("Y");
					$(".<%=layerName%> #isSaveValue").val("Y");
					
					return false;
				}else if(result.data.length != 0){
					GRIT.msg.alert("사용 불가능한 생년월일 입니다.");
					$(".<%=layerName%> #isValue").val("N");
					$(".<%=layerName%> #isSaveValue").val("N");
					return false;
				}
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("중복확인 문제가 발생했습니다.");
			},
			loading : false
		});
 	}
	
	
	function <%=layerName%>setViewImg(Ipath,INm){
		var ImgPathNm = Ipath+"/"+INm;
		$('#img-view').attr('src',ImgPathNm);
	}
	
	// 원하는 tab 보이기
	// target : tab wrapper ID 나 class
	// index: tab 순서번호(0, 1, 2 ...)
	function showHideTab(target, index) {
	    $(target).find(".tabBtn").removeClass("active");
	    $(target).find(".tabBtn").eq(index).addClass("active");

	    $(target).find(".tabContents").hide();
	    $(target).find(".tabContents").eq(index).show();
	}
	
	
	
</script>

