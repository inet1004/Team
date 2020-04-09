<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	div.container { background-color: yellow; width: 100%; align:"center"; }
	div.formBody { background-color: yellowgreen; }
	.unit { display: inline-block; }
	label { display: inline-block; }
	input, select, textarea, label { font-size: 1.5em; }
</style>

<div class="container" align="center">
 <div><h3>이벤트 주문</h3></div>
 <div><h4>여기는 <code>회원 가입</code> 하는 곳입니다.</h4></div> 
 	<form action="orderInsert.do" class="order" id="orderInsert"
			name="order-insert" method="post" enctype="multipart/form-data" >
			
		<div id="formBody" class="formBody">
			<div><br/></div>
  
			<div class="memberName">
				<label for="name">회원명 :</label> 
				<input type="text" class="inputOrder" id="name" name="name">
			</div>
			
			<div><br/></div>
			
			<div class="memberId">
				<label for="id">회원 아이디 :</label> 
				<input type="text" class="inputOrder" id="id" name="id">
			</div>
			
			<div><br/></div>
			
			<div class="memberGrade">
				<label for="grade">회원 등급 :</label> 
				<input type="text" class="inputOrder" id="grade" name="grade">
			</div>
			
			<div><br/></div>
			
			<div class="writeDate">
				<label for="writeDate">작성 일자 :</label> 
				<input type="Date" class="inputOrder" id="writeDate" name="writeDate">
			</div>
			
			<div><br/></div>
			
			<div class="requestDate">
				<label for="requestDate">작성 일자 :</label> 
				<input type="Date" class="inputOrder" id="requestDate" name="requestDate">
			</div>
			
			<div><br/></div>
			
			<div class="requestPlace">
				<div class="unit">
				<label for="requestPlace">이벤트 신청장소 : </label>
				<input type="radio"	class="inputOrder" id="requestPlace" name="requestPlace" value="outside" Checked>출장 장소 
				<input type="radio"	class="inputOrder" id="requestPlace" name="requestPlace" value="inside">장소 임대
				</div>
				<div class="unit"> [ 가격: $('#id') 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="placeAddress">
				<div class="unit">
				<label for="placeAddress">신청장소의 주소: </label>
				<textarea class="inputOrder" id="rAddr" name="rAddr" placeholder="이벤트 장소의 주소 입력 "></textarea>
				</div>
				<div class="unit"> [ 가격: $('#id') 원 ] </div>
			</div>
			
			<div><br/></div>			
			
			<div class="requestDress">
				<div class="unit">
				<label for="requestDress">이벤트 의상 : </label>
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="notFull" Checked>기본 의상 
				<input type="radio"	class="inputOrder" id="dress" name="dress" value="full">풀 드레스
				</div>
				<div class="unit"> [ 가격: $('#id') 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventGoods">
				<div class="unit">
				<label for="eventGoods">이벤트 소품 : </label>
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="minGoods" Checked>기본 소품 
				<input type="radio"	class="inputOrder" id="goods" name="goods" value="maxGoods">풀 소품 
				</div>
				<div class="unit"> [ 가격: $('#id') 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div class="eventMc">
				<div class="unit">
				<label for="eventMc">이벤트 소품 : </label>
				<input type="radio"	class="inputOrder" id="mc" name="mc" value="noMc" Checked>사회자 불필요 
				<input type="radio"	class="inputOrder" id="mc" name="mc" value="Mc">사회자 요청
				</div>
				<div class="unit"> [ 가격: $('#id') 원 ] </div>
			</div>
			
			<div><br/></div>
			
			<div>
			파일 유첨 :
			<input type="file" id="filename" class="filename" 
  accept=".doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">
			</div>
			
			<div><br/></div>
			
			<div class="totalPrice">
				<label for="totalPrice">전체 가격 : </label>
				<span id="totalPrice" class="inputOrder">총합계<code id="codePrice"> [ 가격: $('#id') 원 ] </code>입니다.</span>
			</div>
			
			<div><br/></div>
			
			<div class="sendForm">
				<label for="sendForm">위의 사항을 확인하고 신청합니다.</label>
				<input type="button" class="inputOrder" id="mc" name="mc" value="신청하기">
			</div> 
			
			
			<div><br/></div>
			
		</div> 
 	</form>
</div>
 