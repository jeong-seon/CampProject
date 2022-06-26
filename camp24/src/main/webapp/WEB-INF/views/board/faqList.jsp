<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp24 FAQ 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/faq.css">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/w3.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/faq.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/header.js"></script>

</head>
<script>
jQuery(function($){
    // Frequently Asked Question
    var article = $('.faq>.faqBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    article.eq(0).find('.a').hide();
    $('.faq>.faqBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.faq>.faqHeader>.showAll').click(function(){
        var hidden = $('.faq>.faqBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
});
</script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey">

<div class="w3-container">
<h2 class="w3-green w3-padding-16 w3-center">FAQ 게시판</h2>
<div class="faq">
    <div class="faqHeader ">
    </div>
    <ul class="faqBody">
        <li class="article w3-padding  id="a1">
            <p class="q"><a href="#a1">질문 : 전국에 캠핑장이 몇개가 있나요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : 약 3000개 이상이 운영중입니다.</p>
        </li>
        <li class="article w3-padding  id="a2">
            <p class="q"><a href="#a2">질문 : 캠핑장 예약은 어떻게 하나요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : 캠핑장을 검색하여 이미지를 클릭하면 해당 홈페이지 또는 예약페이지로 이동합니다.</p>
        </li>
        <li class="article w3-padding  id="a3">
            <p class="q"><a href="#a3">질문 : 날씨 정보는 실시간인가요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : ?시간 기준으로 받아올 예정입니다.</p>
        </li>
        <li class="article w3-padding id="a4">
            <p class="q"><a href="#a4">질문 : 캠핑장비 대여나 구매는 안되나요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : 중고거래 게시판 구현중입니다.</p>
        </li>
        <li class="article w3-padding id="a5">
            <p class="q"><a href="#a5">질문 : 중고거래는 어떻게 하나요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : 중고거레 게시판 작성글에 대한 가격에 따라 카카오페이로 결제되는 시스템입니다.</p>
        </li>
        <li class="article w3-padding id="a6">
            <p class="q"><a href="#a5">질문 : 중고거래 중 사기를 당하게되면 어떻게하나요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : 고소하세요.</p>
        </li>
        <li class="article w3-padding id="a7">
            <p class="q"><a href="#a5">질문 : 방문후기는 어떻게 작성하나요?</a></p>
            <p class="a w3-padding w3-margin-left" >답변 : 검색게시판에서 해당 캠핑장을 검색 후 리뷰를 작성하시면 방문후기 게시판에 등록됩니다.</p>
        </li>
    </ul>
</div>

</div>
</body>
</html>
<%@ include file="../footer.jsp" %>