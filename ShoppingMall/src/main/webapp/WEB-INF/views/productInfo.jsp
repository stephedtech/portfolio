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
	$(function() {
		//메시지 출력 부분
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

	});
</script>
</head>
<body onload="init();">
	<div class="wrap">
		<header> </header>
		<h2 class="login-header">${productInfo.pname}</h2>
		<section class="content-item" id="comments">
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
			</section>
			<section class="content-item" id="comments">
				<div>
					<section class="product_information">
						<div class="information_box">
							<p>${productInfo.pinfo}</p>
						</div>
					</section>
				</div>
			</section>

			<section class="content-item" id="comments">
				<div class="container">
					<div class="row">
						<div class="col-sm-8">
							<h3>4 Comments</h3>

							<!-- COMMENT 1 - START -->
							<c:forEach var="review" items="${productReview}">
								<div class="media">
									<a class="pull-left" href="#"><img class="media-object"
										src="https://bootdey.com/img/Content/avatar/avatar1.png"
										alt=""></a>
									<div class="media-body">
										<h4 class="media-heading">${review.customerID}</h4>
										<p>${review.srtitle}
											<span class="gig-rating text-body-2"> <svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792"
													width="15" height="15">
                                    <path fill="currentColor"
														d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                </svg> ${review.productRate}
											</span>
										</p>
										<p>${review.srcontent}Loremipsum dolor sit amet,
											consectetur adipiscing elit. Lorem ipsum dolor sit amet,
											consectetur adipiscing elit. Lorem ipsum dolor sit amet,
											consectetur adipiscing elit. Lorem ipsum dolor sit amet,
											consectetur adipiscing elit. Lorem ipsum dolor sit amet,
											consectetur adipiscing elit. Lorem ipsum dolor sit amet,
											consectetur adipiscing elit.</p>
										<ul class="list-unstyled list-inline media-detail pull-left">
											<li><i class="fa fa-calendar"></i>${review.regDate}</li>
											<li><i class="fa fa-thumbs-up"></i>${review.productRate}</li>
										</ul>
									</div>
								</div>
							</c:forEach>
							<!-- COMMENT 1 - END -->

						</div>
					</div>
				</div>
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

	function init() {
		price = document.form.price.value;
		amount = document.form.amount.value;
		point = document.form.point.value;
		document.form.sum.value = price;
		document.form.totalpoint.value = point;
		change();
	}

	function add() {
		hm = document.form.amount;
		sum = document.form.sum;
		totalpoint = document.form.totalpoint;
		hm.value++;

		sum.value = parseInt(hm.value) * price;
		totalpoint.value = parseInt(hm.value) * point;
	}

	function del() {
		hm = document.form.amount;
		sum = document.form.sum;
		totalpoint = document.form.totalpoint;
		if (hm.value > 1) {
			hm.value--;
			sum.value = parseInt(hm.value) * price;
			totalpoint.value = parseInt(hm.value) * point;
		}
	}

	function change() {
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

/* Reply */
body {
	margin-top: 20px;
}

.content-item {
	padding: 30px 0;
	background-color: #FFFFFF;
}

.content-item.grey {
	background-color: #F0F0F0;
	padding: 50px 0;
	height: 100%;
}

.content-item h2 {
	font-weight: 700;
	font-size: 35px;
	line-height: 45px;
	text-transform: uppercase;
	margin: 20px 0;
}

.content-item h3 {
	font-weight: 400;
	font-size: 20px;
	color: #555555;
	margin: 10px 0 15px;
	padding: 0;
}

.content-headline {
	height: 1px;
	text-align: center;
	margin: 20px 0 70px;
}

.content-headline h2 {
	background-color: #FFFFFF;
	display: inline-block;
	margin: -20px auto 0;
	padding: 0 20px;
}

.grey .content-headline h2 {
	background-color: #F0F0F0;
}

.content-headline h3 {
	font-size: 14px;
	color: #AAAAAA;
	display: block;
}

#comments {
	box-shadow: 0 -1px 6px 1px rgba(0, 0, 0, 0.1);
	background-color: #FFFFFF;
}

#comments form {
	margin-bottom: 30px;
}

#comments .btn {
	margin-top: 7px;
}

#comments form fieldset {
	clear: both;
}

#comments form textarea {
	height: 100px;
}

#comments .media {
	border-top: 1px dashed #DDDDDD;
	padding: 20px 0;
	margin: 0;
}

#comments .media>.pull-left {
	margin-right: 20px;
}

#comments .media img {
	max-width: 100px;
}

#comments .media h4 {
	margin: 0 0 10px;
}

#comments .media h4 span {
	font-size: 14px;
	float: right;
	color: #999999;
}

#comments .media p {
	margin-bottom: 15px;
	text-align: justify;
}

#comments .media-detail {
	margin: 0;
}

#comments .media-detail li {
	color: #AAAAAA;
	font-size: 12px;
	padding-right: 10px;
	font-weight: 600;
}

#comments .media-detail a:hover {
	text-decoration: underline;
}

#comments .media-detail li:last-child {
	padding-right: 0;
}

#comments .media-detail li i {
	color: #666666;
	font-size: 15px;
	margin-right: 10px;
}
</style>


</html>




