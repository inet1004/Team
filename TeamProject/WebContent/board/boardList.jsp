<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <h3>이벤트 주문</h3>
 <table border="1">
 	<tr><th colspan="3">이벤트 주문 신청</th></tr>
 	<tr><th>회원명</th><td colspan="2">회원명</td></tr>
 	<tr><th>회원ID</th><td colspan="2">회원ID</td></tr>
 	<tr><th>회원 등급</th><td colspan="2">회원ID</td></tr>
 	<tr><th>작성일</th><td colspan="2"><input type="Date"></td></tr>
 	<tr><th>신청 날자</th><td colspan="2"><input type="Date"></td></tr>
 	<tr><th>신청 장소</th><td>f
 		<input type="radio" name="chk_info" value="std">Standard Room
		<input type="radio" name="chk_info" value="siler" checked>Silver Room
		<input type="radio" name="chk_info" value="gold">Gold Room</td><td>100,000원</td></tr>
 	<tr><th>신청 의상</th><td>
 	      <label><input type="checkbox" name="color" value="blue"> 소품</label>
    	  <label><input type="checkbox" name="color" value="red"> 풀드레스</label></td><td>100,000원</td></tr>
 	<tr><th>신청 물품</th><td>
 	      <label><input type="checkbox" name="color" value="blue"> 이벤트</label>
    	  <label><input type="checkbox" name="color" value="red"> 기프트</label></td><td>100,000원</td></tr>
 	<tr><th>사회자 신청</th><td>
		<input type="radio" name="chk_info" value="mc" checked>사회자 필요
		<input type="radio" name="chk_info" value="nomc">사회자 신청안함</td><td>100,000원</td></tr>
 	<tr><th  colspan="3"> 전체 비용 (부가세 포함):   1,150,000 원 </th></tr>
 	<tr><th  colspan="3">신청하기 &nbsp;<input type="button" value="신청하기"></th></tr>
 </table>