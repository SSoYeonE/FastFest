<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<%@page import="com.woori.yourhome.member.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<%@include file="../include/nav.jsp" %>

<%
MemberDto dto = (MemberDto)request.getAttribute("memberDto");
%>
<form name="myform" id="myform">
	
   
<div class="container" style="margin-top:80px">
  <h1>회원가입</h1>

	<% if(dto.getUser_id().equals("")) {%>
  <div class="input-group mb-3">
     <input type="hidden" name="idcheck" id="idcheck" value="N"/>
    <input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id">
    <div class="input-group-append">
      <button class="btn btn-success" type="button" id="btnDuplicate">중복체크</button>  
     </div>
  </div>
  <%} else{%>

  <div class="input-group mb-3">
     <input type="hidden" name="idcheck" id="idcheck" value="Y"/>
    <input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id"
         value="<%=dto.getUser_id()%>"  readonly>
  </div>
  <%} %>
  
  <div class="input-group mb-3">
    <input type="password" class="form-control" name="user_password" id="user_password" placeholder="페스워드">
  </div>

  <div class="input-group mb-3">
    <input type="password" class="form-control" name="userpw2" id="userpw2" placeholder="패스워드확인">
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="이름" name="user_name" id="user_name" 
    value="<%=dto.getUser_name()%>">
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="email" name="user_mail" id="user_mail"
    value="<%=dto.getUser_mail()%>" >
  </div>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="전화번호" name="user_phone" id="user_phone"
    value="<%=dto.getUser_phone()%>">
  </div>


  <!-- 다음 우편 api :주소체계 번지 -> 길  -->
  
     <div class="container" style="text-align:right">
    
     <div class="btn-group">
       
       <button type="button" class="btn btn-primary" onclick="goWrite()">등록</button>&nbsp;&nbsp;
      
       <button type="button" class="btn btn-primary" onclick="goCancel()">취소</button>&nbsp;&nbsp;
     </div>
   </div>

</div>

</form>   

</body>
</html>

<script>
$(()=>{
      $("#btnDuplicate").click(()=>{
         $.ajax({
            url:"${commonURL}/member/isDuplicate", //요청 url정보
            data:{user_id:$("#user_id").val()},   //서버로 전달할 데이터정보: JSON형태
            dataType:"json",  //결과를 jSON으로 받겠다. 결과가 text로 온다
            type:"POST"
         })
         .done((data)=>{
            //데이터가 정상적으로 수신되면 done메서드 호출되면서 매개변수는 전달받은 값
            //값은 dataType 속성을 안주면 text로 온다.
            console.log(data.result);
           if(data.result == "true") //중복
           {
              alert("이미 사용중인 아이디입니다.")
           }
           else
           {
              alert("사용가능합니다.")
              $("#idcheck").val("Y");
              $("#user_id").prop("readonly", true);   //수정못하게 막는 기능
              
           }
         })
         .fail((error)=>{
            //통신에러, 오류에 관한 것
               console.log(error)
         })
      })
   })

function goWrite()
{
   var frmData = new FormData(document.myform);
   console.log(frmData);
   var user_id='<%=dto.getUser_id()%>';
   console.log(user_id);
   if (user_id =='')
   {
	   url="${commonURL}/member/insert";	 
	   msg="회원가입이 되었습니다.";
   }
   else
   {
	   url="${commonURL}/member/update";
	   msg="회원 정보가 수정되었습니다."
   }   
   $.ajax({
      url:url,
      data:frmData,
      contentType:false,
      processData:false,
      type:"POST",
   })
   .done( (result)=>{
      console.log(result);
      alert(msg);
      location.href="${commonURL}/"; //시작화면으로 이동하기
   })
   .fail( (error)=>{
      console.log(error);
   })
}

function goCancel()
{
	  var frm = document.myform;
	   frm.action="${commonURL}/member/login";
	   frm.submit();
}
</script>