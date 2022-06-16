<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//메시지 출력 부분
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
});
</script>
</head>
<body onload="init();">
	<div class="wrap">
		<header>

		</header>
		<h2 class="login-header">${productInfo.pname}</h2>
		<section>
			<div class="content">
				<div class="container bootdey">
					<div class="col-md-12">
						<section class="panel">
							<div class="panel-body">
								<div class="col-md-6">
									<div class="pro-img-details">
										<img src="https://via.placeholder.com/550x380/FFB6C1/000000"
											alt="">
									</div>
									<div class="pro-img-list">
										<%-- 
										<c:forEach var="productFile" items="${pfList}">
											<a href="#"> <img
												src="./download?oriname=${productFile.sysname}&oriname=${productFile.oriname}"
												alt="">
											</a>
											<a href="#"> <img
												src="https://via.placeholder.com/115x100/FF7F50/000000"
												alt="">
											</a>
											<a href="#"> <img
												src="https://via.placeholder.com/115x100/20B2AA/000000"
												alt="">
											</a>
											<a href="#"> <img
												src="https://via.placeholder.com/120x100/20B2AA/000000"
												alt="">
											</a>
										</c:forEach> --%>

										<a href="#"> <img
											src="https://via.placeholder.com/115x100/FF7F50/000000"
											alt="">
										</a> <a href="#"> <img
											src="https://via.placeholder.com/115x100/FF7F50/000000"
											alt="">
										</a> <a href="#"> <img
											src="https://via.placeholder.com/115x100/20B2AA/000000"
											alt="">
										</a> <a href="#"> <img
											src="https://via.placeholder.com/120x100/20B2AA/000000"
											alt="">
										</a>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>


				<div class="col-md-6">
					<h4 class="pro-d-title">
						<a href="#" class=""> ${productInfo.pname} </a>
					</h4>
					<div class="product_meta">
						<span class="posted_in"> <strong>Category: </strong>${productInfo.pcategory}</span>
					</div>
					<div class="m-bot15">
						<strong>Price : </strong> <span class="amount-old">${productInfo.pprice}원</span>
					</div>
					<form name="form" method="get">
						수량 : <input type=hidden name="price" value="${productInfo.pprice}">
						<input type="text" name="amount" value="1" size="3"
							onchange="change();"> <input type="button" value=" + "
							onclick="add();"> <input type="button" value=" - "
							onclick="del();"><br> 금액 : <input type="text"
							name="sum" size="11" readonly>원 <br> <input
							type=hidden name="point" value="${productInfo.ppoint}">
						적립 포인트 : <input type="text" name="totalpoint" size="11" readonly>포인트
					</form>

					<p>
						<button class="btn btn-round btn-danger" type="button">
							<i class="fa fa-shopping-cart"></i> Add to Cart
						</button>
						<button class="btn btn-round btn-danger" type="button">
							<i class="fa fa-shopping-cart"></i> Click to Buy
						</button>
					</p>
				</div>
			</div>
			<div>
				<section class="product_information">
					<div class="information_box">
						<p>${productInfo.pinfo}</p>
					</div>
				</section>
			</div>
		</section>



		<section>
			<div class="wrap">
				<h1>후기</h1>
				<form name="reviewform" class="reviewform" method="post"
					action="/save">
					<input type="hidden" name="rate" id="rate" value="0" />
					<p class="title_star">별점과 리뷰를 남겨주세요.</p>

					<div class="review_rating">
						<div class="warning_msg">별점을 선택해 주세요.</div>
						<div class="rating">
							<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
							<input type="checkbox" name="rating" id="rating1" value="1"
								class="rate_radio" title="1점"> <label for="rating1"></label>
							<input type="checkbox" name="rating" id="rating2" value="2"
								class="rate_radio" title="2점"> <label for="rating2"></label>
							<input type="checkbox" name="rating" id="rating3" value="3"
								class="rate_radio" title="3점"> <label for="rating3"></label>
							<input type="checkbox" name="rating" id="rating4" value="4"
								class="rate_radio" title="4점"> <label for="rating4"></label>
							<input type="checkbox" name="rating" id="rating5" value="5"
								class="rate_radio" title="5점"> <label for="rating5"></label>
						</div>
					</div>
					<div class="review_contents">
						<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
						<textarea rows="10" class="review_textarea"></textarea>
					</div>
					<div class="cmd">
						<input type="button" name="save" id="save" value="등록">
					</div>
				</form>
			</div>
		</section>
		<section>
			<!-- 댓글 목록 보기 -->
			<table style="width: 100%">
				<!-- 제목 테이블 -->
				<tr bgcolor="pink" align="center" height="30">
					<td width="20%">작성자</td>
					<td width="20%">후기제목</td>
					<td width="60%">후기내용</td>
				</tr>
			</table>
			<table id="reviewtable" style="width: 100%">
				<!-- 목록 테이블 -->
				<c:forEach var="review" items="${productReview}">
					<tr>
						<td width="20%">${review.customerID}</td>
						<td width="50%">${review.srtitle}</td>
						<td width="30%">${review.srcontent}</td>
					</tr>
				</c:forEach>
			</table>
		</section>
	</div>

	<footer> </footer>

</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<!-- 수량 변경용 스크립트 -->
<script language="JavaScript">
var price;
var amount;
var point;

function init () {
	price = document.form.price.value;
	amount = document.form.amount.value;
	point = document.form.point.value;
	document.form.sum.value = price;
	document.form.totalpoint.value = point;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	totalpoint = document.form.totalpoint;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * price;
	totalpoint.value = parseInt(hm.value) * point;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
	totalpoint = document.form.totalpoint;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * price;
			totalpoint.value = parseInt(hm.value) * point;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;
	totalpoint = document.form.totalpoint;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * price;
	totalpoint.value = parseInt(hm.value) * point;
}  


</script>
<!-- 댓글 전송 및 댓글 목록 새로고침용 스크립트 -->
<script type="text/javascript">
function replyInsert(pnum){
	console.log(pnum);
	
	var replyF = $("#rFrm").serializeObject();
	replyF.r_bnum = bnum;//게시글 번호 추가
	replyF.r_id = "${memb.m_id}";
	console.log(replyF);
	
	//controller에 ajax로 전송
	$.ajax({
		url: "./replyIns",
		type: "post",
		data: replyF,
		dataType: "json",
		success: function(result){
			var listStr = "";
			var rlist = result.rList;//json 객체에서 rList 꺼내기
			console.log(rlist);
			
			//목록 반복 처리
			for(var i = 0; i < rlist.length; i++){
				listStr += "<tr>" 
						+ "<td width='20%'>" + rlist[i].r_id + "</td>" 
						+ "<td width='50%'>" + rlist[i].r_contents + "</td>"
						+ "<td width='30%'>" + rlist[i].r_date + "</td>"
						+ "</tr>";
			}
			$("#rtable").html(listStr);
			$("#comment").val("");
			
		},
		error: function(error){
			console.log(error);
			alert("댓글 입력 실패");
		}
	});
	
}

function deleteProductInfo(pnum)){
	var conf = confirm("삭제하시겠습니까?");
	
	if(conf == true){
		location.href="./delete?pnum=" + pnum;			
	}
}



//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

//상품평 작성 글자수 초과 체크 이벤트 리스너
document.querySelector('.review_textarea').addEventListener('keydown',function(){
    //리뷰 400자 초과 안되게 자동 자름
    let review = document.querySelector('.review_textarea');
    let lengthCheckEx = /^.{400,}$/;
    if(lengthCheckEx.test(review.value)){
        //400자 초과 컷
        review.value = review.value.substr(0,400);
    }
});

//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
    //리뷰 5자 미만이면 메시지 표시
    if(document.querySelector('.review_textarea').value.length < 5){
        rating.showMessage('review');
        return false;
    }
    //폼 서밋
});
Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}
  
  
});
</script>
<style type="text/css">
/*panel*/
.panel {
	border: none;
	box-shadow: none;
}

.panel-heading {
	border-color: #eff2f7;
	font-size: 16px;
	font-weight: 300;
}

.panel-title {
	color: #2A3542;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 0;
	margin-top: 0;
	font-family: 'Open Sans', sans-serif;
}
/*product information*/
.product_information {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.information_box {
	display: block;
}

.col-md-6 {
	display: inline-block;
}

/* rating stars */
.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 30px;
	height: 30px;
	background-image: url("./resources/images/starrate.png");
	background-repeat: no-repeat;
	background-size: 30px 30px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

/* 레이아웃 외곽 너비 400px 제한*/
.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 30px;
	height: 30px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 30px;
	height: 30px;
	background-image: url("./resources/images/starrate.png");
	background-repeat: no-repeat;
	background-size: 30px 30px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
}

/* review area */
.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}
</style>


</html>




