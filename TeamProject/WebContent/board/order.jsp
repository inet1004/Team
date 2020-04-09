<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <h3>이벤트 주문</h3>
 <table border="1" align="center"> 
 	<tr><th colspan="3">이벤트 주문 신청</th></tr>
 	<tr><th>회원명</td><td colspan="2">회원명</td></tr>
 	<tr><th>회원 ID</td><td colspan="2">회원 ID</td></tr>
 	<tr><th>회원 등급</td><td colspan="2">회원 등급</td></tr>
 	<tr><th>작성일</td><td colspan="2"><input type="Date"></td></tr>
 	<tr><th>신청 날자</td><td colspan="2"><input type="Date"></td></tr>
 	<tr><th>신청 장소</td><td>
		<input type="radio" name="chk_place" value="siler" checked>Silver Room
		<input type="radio" name="chk_place" value="gold">Gold Room</td><td>100,000원</td></tr>
 	<tr><th>신청 의상</td><td>
 	      <label><input type="checkbox" name="color" value="blue" checked> 소품</label>
    	  <label><input type="checkbox" name="color" value="red"> 풀드레스</label></td><td>100,000원</td></tr>
 	<tr><th>신청 물품</td><td>
 	      <label><input type="checkbox" name="color" value="blue" checked> 이벤트</label>
    	  <label><input type="checkbox" name="color" value="red"> 기프트</label></td><td>100,000원</td></tr>
 	<tr><th>사회자 신청</td><td>
		<input type="radio" name="chk_mc" value="mc" checked>사회자 필요
		<input type="radio" name="chk_mc" value="nomc">사회자 신청안함</td><td>100,000원</td></tr>
 	<tr><th  colspan="3"> 전체 비용 (부가세 포함): &nbsp;&nbsp;&nbsp;  1,150,000 원 </th></tr>
 	<tr><th  colspan="3">신청하기 &nbsp;<input type="button" value="신청하기"></th></tr>
 </table>