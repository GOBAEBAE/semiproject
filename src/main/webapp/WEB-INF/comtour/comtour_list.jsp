<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coffeewith</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.2.0/js/all.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <style type="text/css">

        div.flex {
            margin-top: 30px;
            margin-left: 110px;
        }
        div.cell {
            display: table-cell; vertical-align: middle;
        }

        ul.itemlist{
            display: flex;
        }
        ul.itemlist li{
            list-style: none;
            width: 300px;
            height: 330px;
            text-align: left;
            border: 0px solid gray;
            margin-right: 10px;
        }
        /*ul.itemlist li img{
            width: 230px;
            height: 260px;
            border: 4px solid pink;
        }*/
        div.detailbox{
            border: 1px solid #ffebb5;
            /*background-image: url("${root}/images/logo1.png");*/
            background-color: #ffeebb5;
            background-size: 250px 300px;
            border-right: 16px;
            box-shadow: inset 0 0 8px #deb13a;
            width: 300px;
            height: 330px;
        }
        div.detailbox:hover{
            background-color:lightpink;
            color:white;
            box-shadow: 5px 5px 5px gray;
            cursor: pointer;
        }
        /*tr-container*/
        div.tr-container{
            width: 1136px;
        }
        div.tr-cont-box{
            margin-left: 5px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            grid-template-rows: 410px 410px 410px 410px;
        }
        div.tr-card {
            width: 270px;
            height: 400px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
            margin-right: 10px;
        }
        div.tri-card {
            width: 270px;
            overflow: hidden;
            opacity: 0.7;
            background: 50% 50% no-repeat;
            padding: 10px 10px 10px 10px ;
            height: 270px;
            display: grid;
            grid-template-columns: 5fr 1fr ;
        }

        div.tr-cont-card{
            padding: 10px 10px 10px 10px;
        }

        span.tr-cont-tw-g{
            position: relative;
            top:7px;
            left:180px;
            text-align: center;
            padding: 15px 10px 10px 10px;
            width: 70px;
            height: 70px;
            border-radius: 100px;
            box-sizing: border-box;
            background-color: yellowgreen;
            opacity: 1;
            color: white;
            font-size: 15px;
        }
        span.tr-cont-tw-r{
            position: relative;
            top:7px;
            left: 180px;
            text-align: center;
            padding: 15px 10px 10px 10px;
            width: 70px;
            height: 70px;
            border-radius: 100px;
            box-sizing: border-box;
            background-color: orangered;
            opacity: 1;
            color: white;
            font-size: 15px;
        }
        .tr-cont-loc{
            position: absolute;
            margin-top: 5px;
            color: white;
            font-size: 0.8rem;
            margin-left: 3px;
            padding: 7px 10px 3px 7px;
            background-color: rgba(0,0,0,0.6);
            border-radius: 100px;
        }
        .tr-cont-loc i{
            color: white;
            font-size: 15px;
            opacity: 1;
        }
        .tr-cont-tit{
            text-align: center;
            font-size: 1.5rem;
            text-overflow:ellipsis;
            overflow: hidden;
            white-space: nowrap;
            margin-bottom: 15px;
        }

        img.tr-prf{
            width: 30px;
            height: 30px;
            border-radius: 50px;
        }
        div.tr-cont-ur{
            font-size: 1rem;
        }

        div.tr-cont-date{
            margin-top: 10px;
            font-size: 1rem;
        }
        div.tr-cont-txt{
            text-overflow:ellipsis;
            overflow: hidden;
            white-space: nowrap;
            display: block;
            font-size: 1rem;
            margin-bottom: 15px;
        }
        .tr-card-hr{
            margin: 5px 0 10px 0;
        }
        div.tr-cont-bottom{
            display: grid;
            grid-template-columns: 3fr 1fr;
        }
        div.tr-cont-bottom span{
            font-size: 1rem;
            color: gray;
        }
        div.tr-cont-bottom span svg{
            font-size: 1rem;
            color: gray;
        }
    </style>

    <script>

       var login_ok="<%=(String)session.getAttribute("login_ok")%>";
        //alert(login_ok);
        $(function (){
            //새글쓰기 모달창
            $("#btnform").click(function (){
                if(login_ok!=="yes"){
                    alert("로그인을 먼저 해주세요")
                }
                else {
                    $("#modalform").modal("toggle");
                    $("#modalform .modal-content").load("form");
                }
            }); // 새글쓰기 모달창 종료

        });//스크립트 전체 함수 영역
    </script>
</head>
<div class="flex">
    <form action="list">
            <div class="input-group" style="margin-left: 30px; width: 1000px;">
                <!--검색 영역-->
                <select name="searchcolumn" class="form-select" style=" width: 80px;">
                    <option value="tr_loc">투어도시</option>
                    <option value="s_date">출발날짜</option>
                </select>
                <input type="text" name="searchword" class="form-control" style="width: 400px;"
                       placeholder="여행친구를 만날 도시를 입력하고 출발일을 지정해 주세요!">

                <!--검색버튼-->
                   <button type="submit" class="btn">
                      <i class='fas fa-search' style='font-size:24px;'></i>
                   </button>
                <!--새글쓰기 영역-->
                   <a id="btnform">
                     <i class='far fa-plus-square' style='font-size:38px; margin-left: 10px;'></i>
                   </a>
            </div>
    </form><br>
<%--<a href="list?searchcolumn=tr_id&searchword=${sessionScope.login_id}">내가쓴글</a><br><br>--%>

<%--헤터 부분 검색창 과 디테일 페이지 li 태그로 묶인 부분--%>
<h4>총 ${totalCount}개의 모임이 존재합니다.</h4><br>
    <h5>
    <label><input type="checkbox" id="ing"/> 모집중</label> &nbsp;&nbsp;
    <c:if test="${sessionScope.login_ok=='yes'}">
        <label><input type="checkbox" id="mytour"/> ${sessionScope.login_nick}님이 주최한 모임</label>
    </c:if>
    </h5>
    <br>
    <div class="tr-container">
        <c:set var="on_error" value="this.src='${root}/images/noprofile.jpg'"/>
        <div class="tr-cont-box">
            <c:forEach items="${trlist}" var="trdto">
            <div class="tr-card" ur_id="${trdto.ur_id}">
                    <c:set var="loc" value="${trdto.tr_loc}"/>
                <c:choose>
                    <c:when test="${fn:contains(loc, '서울' )}">
                    <div class="tri-card" style="background-image:url('${root}/images/서울.jpg')"></c:when>
                    <c:when test="${fn:contains(loc, '대구' )}">
                    <div class="tri-card" style="background-image:url('${root}/images/대구.jpg')"></c:when>
                    <c:when test="${fn:contains(loc, '부산' )}">
                    <div class="tri-card" style="background-image:url('${root}/images/부산.jpg')"></c:when>
                    <c:when test="${fn:contains(loc, '인천' )}">
                    <div class="tri-card" style="background-image:url('${root}/images/인천.jpg')"></c:when>
                    <c:when test="${fn:contains(loc, '제주' )}">
                    <div class="tri-card" style="background-image:url('${root}/images/제주.jpg')"></c:when>
                    <c:otherwise> <div class="tri-card" style="background-image:url('${root}/images/한국.jpg')"></c:otherwise>
                </c:choose>
                <span class="tr-cont-loc"><i class="bi bi-geo-alt-fill"></i>&nbsp;${trdto.tr_loc}</span>
                <c:choose>
                    <c:when test="${trdto.tw_cnt<trdto.tw_max}">
                        <span class="tr-cont-tw-g">모집중<br> ${trdto.tw_cnt}/${trdto.tw_max} </span>
                    </c:when>
                    <c:otherwise>
                        <span class="tr-cont-tw-r">모집완료 <br> ${trdto.tw_cnt}/${trdto.tw_max} </span>
                    </c:otherwise>
                </c:choose>
                </div>
                <a onclick="window.open('${root}/comtour/detail?tr_id=${trdto.tr_id}',
                        '_blank','width=1000,height=800,toolbars=no,scrollbars=no'); return false;">
                    <div class="tr-cont-card">

                        <div class="tr-cont-tit">${trdto.tr_nm}
                        </div>
                        <div class="tr-cont-ur"> <img class="tr-prf" src="${root}/res/prfimg/${trdto.ur_img}" onError="${on_error}"> ${trdto.ur_nk}</div>
                        <div class="tr-cont-date"><i class="fa-regular fa-calendar"></i> &nbsp;${trdto.s_date}~ ${trdto.e_date}</div>
                        <div class="tr-cont-show" style="display: none;">
                            <div class="tr-cont-txt"><i class="fa-regular fa-message"></i>&nbsp;${trdto.tr_txt}</div>
                            <hr class="tr-card-hr">
                            <fmt:formatDate var="u_date" value="${trdto.u_date}" pattern="yyyy/MM/dd"/>
                            <div class="tr-cont-bottom"><span><i class="fa-regular fa-comments"></i> &nbsp;${trdto.tm_cnt}개</span><span>${u_date}</span></div>
                        </div>
                    </div></a>
            </div>
            </c:forEach>
        </div>
    </div>
</div> <!--wrapper-->

    <%--새 글 모달 영역--%>
<div class="modal" id="modalform">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content"></div>
    </div>
</div>
<script>
    //tr
    $("div.tr-card").hover(function (){
        $(this).find("div.tri-card").css("height","200px");
        $(this).find("div.tr-cont-show").show();
    }, function (){
        $(this).find("div.tri-card").css("height","270px");
        $(this).find("div.tr-cont-show").hide();
    });//tr card hover
    //모집중클릭
    $("#ing").click(function (){
        if($(this).is(":checked")){
            $(".tr-cont-tw-r").parent().parent().hide();
        }else {
            $(".tr-cont-tw-r").parent().parent().show();
        }
    });
    //내가 주최한 모임
    $("#mytour").click(function (){
        if($(this).is(":checked")){
           $(".tr-card").each(function(){
               var did=$(this).attr("ur_id");
               if(did!="${sessionScope.login_id}"){
                   $(this).hide();
               }
           })
        }else {
            $(".tr-card").show();
        }
    });

</script>
</body>
</html>