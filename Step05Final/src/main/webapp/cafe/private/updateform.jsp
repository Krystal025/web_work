<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 글의 번호를 얻어옴
	int num = Integer.parseInt(request.getParameter("num"));
	//2. 번호를 이용하여 DB에 저장된 제목과 내용정보를 얻어옴
	CafeDto dto = CafeDao.getInstance().getData(num);
	//3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>작성글 수정</h1>
		<form action="update.jsp" method="post">		
			<div class="mb-2">
				<a href="${pageContext.request.contextPath}/cafe/list.jsp">목록보기</a>
			<div class="mb-2">
		  		<label class="form-label" for="num">번호</label>
		  		<input class="form-control" type="text" name="num" id="num" value="<%=dto.getNum()%>" readonly/>
		  	</div>
			<div class="mb-2">
		  		<label class="form-label" for="title">제목</label>
		  		<input class="form-control" type="text" name="title" id="title" value="<%=dto.getTitle()%>"/>
		  	</div>
		  	<div class="mb-2">
		  		<label class="form-label" for="content">내용</label>
		  		<textarea class="form-control" name="content" id="content" rows="10">
		  		<%=dto.getContent() %>
		  		</textarea>
		  	</div>
		  	<button onclick="submitContents(this)" class="btn btn-primary" type="submit">수정</button>
		  	<button class="btn btn-warning" type="reset">Reset</button>
		</form>
	</div>
	 <script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
   <script>
      var oEditors = [];
      
      //추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
      
      nhn.husky.EZCreator.createInIFrame({
         oAppRef: oEditors,
         elPlaceHolder: "content",
         sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
         htParams : {
            bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function(){
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function(){
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator: "createSEditor2"
      });
      
      function pasteHTML() {
         var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
         oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
      }
      
      function showHTML() {
         var sHTML = oEditors.getById["content"].getIR();
         alert(sHTML);
      }
         
      function submitContents(elClickedObj) {
         //SmartEditor 에 의해 만들어진(작성한글) 내용이 textarea 의 value 가 되도록 한다. 
         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
         
         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
         
         try {
            //폼 제출하기 
            elClickedObj.form.submit();
         } catch(e) {}
      }
      
      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
      }
   </script>   
</body>
</html>