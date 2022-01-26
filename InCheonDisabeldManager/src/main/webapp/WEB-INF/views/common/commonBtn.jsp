<%@page import="kr.co.grit.common.util.SessionUtil, java.util.Map, java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String layerName = request.getParameter("layerName");

	List<Map> sysGroupMenuBtn = (List<Map>) SessionUtil.getRequestAttributes("KSSM.sysGroupMenuBtn");

	//조회 || 신규 || 저장 || 삭제 || 엑셀 || 출력
	String btnAuth = "000000";
	Map m = null;

	if(sysGroupMenuBtn != null){
		for(int i=0; i < sysGroupMenuBtn.size(); i++){
			m = sysGroupMenuBtn.get(i);
			if(m.get("menuCd").equals(layerName)){
				btnAuth = (String)m.get("auth");
			}
		}
	}

	char btnAuthArr[] = btnAuth.toCharArray();
	
	Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
	String strCode = (String)userInfo.get("strCode");
	
%>

<!-- <div class="section-top"> -->
	<!-- btn-group -->
	<!-- <div class="btn-group">

	<% if(btnAuthArr[0] == '1'){%>
		<a href="#" class="btn-small-blue search" logBtn="Yes" jobFgCd="3" menuCd="<%=layerName%>"><span>조회</span></a>
	<%} %>
	<%if(btnAuthArr[1] == '1'){%>
		<a href="#" class="btn-small-blue new" logBtn="Yes" jobFgCd="4" menuCd="<%=layerName%>"><span>신규</span></a>
	<%} %>
	<%if(btnAuthArr[2] == '1'){%>
		<a href="#" class="btn-small-blue save" logBtn="Yes" jobFgCd="6" menuCd="<%=layerName%>"><span>저장</span></a>
	<%} %>
	<%if(btnAuthArr[3] == '1'){%>
		<a href="#" class="btn-small-blue delete" logBtn="Yes" jobFgCd="5" menuCd="<%=layerName%>"><span>삭제</span></a>
	<%} %>
	<%if(btnAuthArr[4] == '1'){%>
		<a href="#" class="btn-small-blue exel" logBtn="Yes" jobFgCd="7" menuCd="<%=layerName%>"><span>엑셀</span></a>
	<%} %>

		<a href="#" class="btn-small-blue close" logBtn="Yes" jobFgCd="8" menuCd="<%=layerName%>"><span>닫기</span></a>

	</div> -->
	<!-- //btn-group -->
<!-- </div> -->
	<div class="btnMainGroup">
	<%if(btnAuthArr[0] == '1'){%>
	    <button type="button" class="btnMain search" logBtn="Yes" jobFgCd="3" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconGlass.png" class="iconGlass"> 조회</button>
	<%} %>
	<%if(btnAuthArr[1] == '1'){%>	    
	    <button type="button" class="btnMain new" logBtn="Yes" jobFgCd="4" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconBtnPlus.png" class="iconBtnPlus"> 신규</button>
	<%} %>
	<%if(btnAuthArr[2] == '1'){%>	    
	    <button type="button" class="btnMain save" logBtn="Yes" jobFgCd="6" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconDownload.png" class="iconDownload"> 저장</button>
	<%} %>
	<%if(btnAuthArr[3] == '1'){%>
		<button type="button" class="btnMain delete" logBtn="Yes" jobFgCd="5" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconX.png" class="iconX"> 삭제</button>
	<%} %>
	<%if(btnAuthArr[4] == '1'){%>	    
	    <button type="button" class="btnMain exel" logBtn="Yes" jobFgCd="7" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconExcel.png" class="iconDownload"> 엑셀</button>
	<%} %>
	<%if(btnAuthArr[5] == '1'){%>
		<button type="button" class="btnMain print" logBtn="Yes" jobFgCd="9" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconExcel.png" class="iconDownload"> 출력</button>
	<%} %> 

	<button type="button" class="btnMain close" logBtn="No" jobFgCd="8" menuCd="<%=layerName%>"><img src="/resources/imagesV2/iconX.png" class="iconX"> 닫기</button>
  
	</div>
<script>
/*소스 변경중 로그 처리를 위해 남겨둠*/
$("a[logBtn='Yes'][menuCd='<%=layerName%>']").off("click").on("click", function(){
	sendBtnClickLog($(this).attr("jobFgCd"), $(this).attr("menuCd"));
});
$("button[logBtn='Yes'][menuCd='<%=layerName%>']").off("click").on("click", function(){
	sendBtnClickLog($(this).attr("jobFgCd"), $(this).attr("menuCd"));
});

//신규, 엑셀 등의 버튼 클릭시 로그 처리
function sendBtnClickLog(jobFgCd, menuCd){
	GRIT.tran.send({
		url: "/common/addUserMenuLog",
		sendData: {"menuCd" : menuCd, "jobFgCd" : jobFgCd},
		loading: false
	});
}

</script>