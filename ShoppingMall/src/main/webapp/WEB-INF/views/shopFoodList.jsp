<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doktok Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
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
<style type="text/css">
.search-area {
	text-align: right;
	padding: 5px;
	height: 50px;
	line-height: 50px;
}
</style>
</head>
<body>
	<div class="wrap">
		<header>
			<jsp:include page="shopHeader.jsp" />
		</header>
		<div class="search-area">
			<select id="sel">
				<option value="btitle" selected>제목</option>
				<option value="bcontents">내용</option>
				<option value="">제목+내용</option>
				<option value="mname">작성자</option>
			</select> <input type="text" id="keyword">
			<button id="search">검색</button>
		</div>
	</div>
	<div>
		<section>
			<div class="container">
				<div class="row clearfix">
					<c:if test="${empty pList}">nothing!!</c:if>
					<c:if test="${!empty pList}">
						<c:forEach var="product" items="${pList}">
							<div class="col-sm-4 col-md-3 box-product-outer">
								<div class="box-product">
									<div class="img-wrapper">
										<a href="./productInfo?pnum=${product.pnum}"> <img
											alt="Product"
											src="https://bootdey.com/img/Content/avatar/avatar1.png">
										</a>
										<div class="tags">
											<span class="label-tags"><span
												class="label label-danger">Sale</span></span>
										</div>
										<div class="option">
											<a href="#" data-toggle="tooltip" data-placement="bottom"
												title="" data-original-title="Add to Cart"><i
												class="ace-icon fa fa-shopping-cart"></i></a> <a href="#"
												data-toggle="tooltip" data-placement="bottom" title=""
												data-original-title="Compare"><i
												class="ace-icon fa fa-align-left"></i></a> <a href="#"
												data-toggle="tooltip" data-placement="bottom" title=""
												data-original-title="Wishlist"><i
												class="ace-icon fa fa-heart"></i></a>
										</div>
									</div>
									<h4>
										<a href="./productInfo?pnum=${product.pnum}">${product.pname}</a>
									</h4>
									<div class="price">
										<div>${product.pprice}원<span class="price-down">${product.ppoint}포인트</span>
										</div>
										<span class="price-old">$15.00</span>
									</div>
									<div class="rating">
										<i class="ace-icon fa fa-star"></i> <i
											class="ace-icon fa fa-star"></i> <i
											class="ace-icon fa fa-star"></i> <i
											class="ace-icon fa fa-star"></i> <i
											class="ace-icon fa fa-star-half-o"></i> <a href="#">${product.reviewCnt}</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

		</section>
	</div>
</body>
<style>
body {
	margin-top: 20px;
}

.box-product-outer {
	margin-bottom: 5px;
	padding-top: 15px;
	padding-bottom: 15px;
	display: inline-block;
}

.box-product-outer:hover {
	outline: 1px solid #aaa;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175)
}

.tab-content .box-product-outer {
	margin-bottom: 0
}

.box-product-slider-outer {
	padding: 10px
}

.box-product .img-wrapper {
	position: relative;
	overflow: hidden
}

.box-product .img-wrapper>:first-child {
	position: relative;
	display: block
}

.box-product .img-wrapper>a>img {
	width: 100%
}

.box-product .img-wrapper .tags {
	position: absolute;
	top: 0;
	right: 0;
	display: inline-block;
	overflow: visible;
	width: auto;
	height: auto;
	margin: 0;
	padding: 0;
	vertical-align: inherit;
	border-width: 0;
	background-color: transparent;
	direction: rtl
}

.box-product .img-wrapper .tags-left {
	left: 0;
	direction: ltr
}

.box-product .img-wrapper .tags>.label-tags {
	display: table;
	margin: 1px 0 0 0;
	text-align: left;
	opacity: .92;
	filter: alpha(opacity = 92);
	direction: ltr
}

.box-product .img-wrapper .tags>.label-tags:hover {
	opacity: 1;
	filter: alpha(opacity = 100)
}

.box-product .img-wrapper .tags>.label-tags a:hover {
	text-decoration: none
}

.box-product .img-wrapper>.option {
	position: absolute;
	top: auto;
	right: 0;
	bottom: -30px;
	left: 0;
	width: auto;
	height: 28px;
	-webkit-transition: all .2s ease;
	-o-transition: all .2s ease;
	transition: all .2s ease;
	text-align: center;
	vertical-align: middle;
	background-color: rgba(0, 0, 0, .55)
}

.box-product .img-wrapper .option>a {
	font-size: 18px;
	font-weight: normal;
	display: inline-block;
	padding: 0 4px;
	color: #fff
}

.box-product .img-wrapper:hover>.option {
	top: auto;
	bottom: 0
}

.box-product h6 a {
	line-height: 1.4
}

.price {
	margin-bottom: 5px;
	color: #f44336
}

.price .price-down {
	margin-left: 5px;
	padding: 2px 5px;
	color: #fff;
	background: #f44336
}

.price-old {
	position: relative;
	display: inline-block;
	margin-right: 7px;
	color: #666
}

.price-old:before {
	position: absolute;
	width: 100%;
	height: 60%;
	content: '';
	border-bottom: 1px solid #666
}

.rating i {
	color: #fc0
}

.product-sorting-bar {
	border: 1px solid #e5e5e5
}
</style>

<script type="text/javascript">
	
</script>
</html>

