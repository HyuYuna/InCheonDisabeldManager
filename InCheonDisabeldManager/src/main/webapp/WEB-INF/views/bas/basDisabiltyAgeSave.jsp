<%@ page import="kr.co.grit.common.util.SessionUtil"%>
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
                    <h1>장애인연령별 현황 등록</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
                 <div class="subtitleGroup">
                    <div class="subtitle">장애인연령별 현황</div>
                 <div class="subBtnGroup">
                      <form id="excelUploadAgeForm" name="excelUploadAgeForm" action="post" enctype="multipart/form-data">
                        <label class="upload-label" for="excelAgeUpload" ><img src="/resources/imagesV2/iconExcelBlue.png" class="subBtnImg">엑셀업로드</label>
						<input type="file" id="excelAgeUpload" name="excelAgeUpload"  accept=".xls,.xlsx"/>
                        <button type="button" class="subBtn" id="excelAgeformDownload" name="excelAgeformDownload" onclick="<%=layerName%>excelDownload();"><img src="/resources/imagesV2/iconExcelBlue.png" class="subBtnImg"> 엑셀양식다운로드</button>
                        <button type="button" class="subBtn" id="excelAgeConfirm" name="excelAgeConfirm" onclick="<%=layerName%>excelAgeConfirm();" ><img src="/resources/imagesV2/iconCheck.png"     class="subBtnImg">확정</button>
                       </form> 
                    </div>
                </div>
                <div id="<%=layerName%>grid_wrap" style="height: 707px; "></div>
                	
<div id="<%=layerName%>grid_Excelwrap" style="height: 675px; width: 100%; display: none;"></div>
<div id="<%=layerName%>grid_ExcelErrorwrap" style="height: 675px; width: 100%; display: none;"></div>


<style>
	
	/* input type="file" CSS  */
	.subBtnGroup .upload-label { 
		background-color: white;
	    font-size: 14px;
	    color: #334d77;
	    border-radius: 5px;
	    border: 1px solid #ccc;
	    height: 27px;
	    cursor: pointer;
	    display: inline-block;
	    padding: .2em .8em;
	    margin-right: 0px;
    }
    
    /* 파일 필드 숨기기 */
	.subBtnGroup input[type="file"] { 
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip:rect(0,0,0,0);
			border: 0; 
	}
</style>
<script type="text/javascript">
//닫기
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
mFnc.tabMenuClose('<%=layerName%>');
});

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var <%=layerName%>myGridID2;

// AUIGrid 칼럼 설정
var <%=layerName%>columnLayout = [ 
     {dataField : "yyyymm"            ,headerText : "기준년월"    ,width : "10%"}
    ,{dataField : "guCd"              ,headerText : "군구"       ,width : "8%"}
    ,{dataField : "age"               ,headerText : "나이"       ,width : "8%"}
    ,{dataField : "disableTp1"        ,headerText : "지체"       ,width : "10%",
    	children : [ {
 			dataField : "maleCnt1",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt1",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp2"       ,headerText : "시각"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt2",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt2",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp3"       ,headerText : "청각"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt3",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt3",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp4"       ,headerText : "언어"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt4",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt4",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp5"       ,headerText : "지적"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt5",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt6",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp6"       ,headerText : "뇌병변"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt6",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt6",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp7"       ,headerText : "자폐성"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt7",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt7",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp8"       ,headerText : "정신"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt8",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt8",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp9"       ,headerText : "신장"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt9",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt9",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp10"       ,headerText : "심장"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt10",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt10",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp11"       ,headerText : "호흡기"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt11",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt11",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp12"       ,headerText : "간"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt12",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt12",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp13"       ,headerText : "안면"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt13",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt13",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp14"       ,headerText : "장루.요루"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt14",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt14",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp15"       ,headerText : "뇌전증"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt15",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt15",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ];


//AUIGrid 칼럼 설정 엑셀 샘플
var <%=layerName%>columnLayout2 = [ 
     {dataField : "yyyymm"             ,headerText : "기준년월"    ,width : 150}
     ,{dataField : "guCd"              ,headerText : "군구"       ,width : 100}
     ,{dataField : "age"               ,headerText : "나이"       ,width : 100}
     ,{dataField : "total"             ,headerText : "합계"       ,width : "10%",
 		children : [ {
  			dataField : "",
  			headerText : "합계",
  			width : 100,
  			dataType : "numeric",
  			style: "my-column-right"
  		},{
  			dataField : "",
  			headerText : "남성",
  			width : 100,
  			dataType : "numeric",
  			style: "my-column-right"
  		}, {
  			dataField : "",
  			headerText : "여성",
  			width : 100,
  			dataType : "numeric",
  			style: "my-column-right"
  		} ]
      }
     ,{dataField : "disableTp1"       ,headerText : "지체"    ,width : "10%",
    		children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt1",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt1",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp2"       ,headerText : "시각"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt2",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt2",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp3"       ,headerText : "청각"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt3",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt3",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp4"       ,headerText : "언어"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt4",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt4",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp5"       ,headerText : "지적"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt5",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt6",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp6"       ,headerText : "뇌병변"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt6",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt6",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp7"       ,headerText : "자폐성"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt7",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt7",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp8"       ,headerText : "정신"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt8",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt8",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp9"       ,headerText : "신장"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt9",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt9",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp10"       ,headerText : "심장"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt10",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt10",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp11"       ,headerText : "호흡기"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt11",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt11",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp12"       ,headerText : "간"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt12",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt12",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp13"       ,headerText : "안면"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt13",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt13",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp14"       ,headerText : "장루.요루"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt14",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt14",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ,{dataField : "disableTp15"       ,headerText : "뇌전증"    ,width : "10%",
         	children : [ {
     			dataField : "",
     			headerText : "소계",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		},{
     			dataField : "maleCnt15",
     			headerText : "남성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		}, {
     			dataField : "femaleCnt15",
     			headerText : "여성",
     			width : 100,
     			dataType : "numeric",
     			style: "my-column-right"
     		} ]
         }
         ];
//AUIGrid 칼럼 설정 에러 엑셀
var <%=layerName%>columnLayout3 = [ 
    {dataField : "yyyymm"            ,headerText : "기준년월"    ,width : "10%"}
    ,{dataField : "guCd"              ,headerText : "군구"       ,width : "8%"}
    ,{dataField : "age"               ,headerText : "나이"       ,width : "8%"}
    ,{dataField : "disableTp1"        ,headerText : "지체"       ,width : "10%",
    	children : [ {
 			dataField : "maleCnt1",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt1",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp2"       ,headerText : "시각"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt2",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt2",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp3"       ,headerText : "청각"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt3",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt3",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp4"       ,headerText : "언어"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt4",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt4",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp5"       ,headerText : "지적"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt5",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt6",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp6"       ,headerText : "뇌병변"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt6",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt6",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp7"       ,headerText : "자폐성"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt7",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt7",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp8"       ,headerText : "정신"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt8",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt8",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp9"       ,headerText : "신장"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt9",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt9",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp10"       ,headerText : "심장"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt10",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt10",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp11"       ,headerText : "호흡기"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt11",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt11",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp12"       ,headerText : "간"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt12",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt12",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp13"       ,headerText : "안면"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt13",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt13",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp14"       ,headerText : "장루.요루"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt14",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt14",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
     ,{dataField : "disableTp15"       ,headerText : "뇌전증"    ,width : "10%",
     	children : [ {
 			dataField : "maleCnt15",
 			headerText : "남성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		}, {
 			dataField : "femaleCnt15",
 			headerText : "여성",
 			width : 100,
 			dataType : "numeric",
 			style: "my-column-right"
 		} ]
     }
    ,{dataField : "checkError"        ,headerText : "에러"             ,width : 350 , dataType : "string"}
    ];

// 페이지 로딩 되면 실행
$(function () {
	// AUIGrid 그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
	<%=layerName%>createAUIGrid3(<%=layerName%>columnLayout3);
	
	$("#excelAgeUpload").on("change", function(evt){
		
		var file = evt.target.files[0];
		
		if(!/\.(xlsx|xls)$/i.test(file.name)){
			GRIT.msg.alert("엑셀파일은 xlsx, xls만 업로드 할 수 있습니다.")
			return;
		}
		
		
		var f = new FormData(document.getElementById('excelUploadAgeForm'));
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
				
		$.ajax({
            url: "/bas/basDisabiltyAgeExcelFile",
            data: f,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(result){
               if(result.resultMap.rtnCode == "0"){
            	    alert(result.resultMap.message);
            	   AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
            	// 로더 제거
   				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
            	   
               }else if(result.resultMap.rtnCode == "-1"){
            	   alert(result.resultMap.message);
            	   AUIGrid.setGridData(<%=layerName%>myGridID3, result.data);
            	   
            	   // 에러 엑셀
            	   AUIGrid.exportToXlsx(<%=layerName%>myGridID3, {
            			exportWithStyle : true,
            			fileName  : "장애인연령별_ERROR_Excel"
            		});
            		// 로더 제거
      				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
            	   
               }else{
            	   alert(result.resultMap.message);
            		// 로더 제거
      				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
               }
               
            }
        })
        $(".<%=layerName%> #excelAgeUpload").val("");
	});
	
	
});

//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid(columnLayout) {
	var <%=layerName%>auiGridProps = {
		// 체크박스
		showRowCheckColumn : false,
		selectionMode : "singleCell",
		fixedColumnCount : 3,
		noDataMessage : "조회된 내용이 없습니다."
		
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
}


//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid2(columnLayout) {
	var <%=layerName%>auiGridProps = {
		// 체크박스
		showRowCheckColumn : false,
		showRowNumColumn : false
		
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_Excelwrap", columnLayout, <%=layerName%>auiGridProps);
}

//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid3(columnLayout) {
	var <%=layerName%>auiGridProps = {
		// 체크박스
		showRowCheckColumn : false,
		showRowNumColumn : false
		
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID3 = AUIGrid.create("#<%=layerName%>grid_ExcelErrorwrap", columnLayout, <%=layerName%>auiGridProps);
}


function <%=layerName%>excelDownload(){
	AUIGrid.exportToXlsx(<%=layerName%>myGridID2, {
		exportWithStyle : true,
		fileName  : "장애인연령별_양식_Excel"
	});
}


//확정
function <%=layerName%>excelAgeConfirm(){
			
	   var sendData = AUIGrid.getGridData(<%=layerName%>myGridID);
	   
	   if(sendData == null || sendData == ""){
		   GRIT.msg.alert("확정할 데이터가 없습니다.");
		   return;
	   }
	   
	   if(!confirm("확정 하시겠습니까?")){
			return false;
       }
	   
	  // ajax 요청 전 그리드에 로더 표시
	  
	  AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	  
	  setTimeout(function(){
		  GRIT.tran.send({
				url: "/bas/confirmDisableAge",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						GRIT.msg.alert(result.message);
						AUIGrid.setGridData(<%=layerName%>myGridID, []);
						 $(".<%=layerName%> #excelAgeUpload").val("");
					}else if(result.rtnCode == "-1"){
						GRIT.msg.alert(result.message);
						AUIGrid.setGridData(<%=layerName%>myGridID, []);
						$(".<%=layerName%> #excelAgeUpload").val("");
					}else{
						GRIT.msg.alert(result.message);
					}
					
					// 로더 제거
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				},
					loadingTarget: "<%=layerName%>"
				});  
	  }, 20);
}



</script>
