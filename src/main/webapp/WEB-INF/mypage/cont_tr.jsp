<%--
  Created by IntelliJ IDEA.
  User: ian
  Date: 2022-10-03
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .tr_container {
            display: grid;
            padding: 40px 20px 20px;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px 0px;
            justify-items: center;
        }

        div.tr-card {
            width: 270px;
            height: 170px;
            overflow: hidden;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
            padding: 0px 20px;
        }
        .tr-nm{
            text-align: center;
            font-size: 1.5rem;
            text-overflow:ellipsis;
            overflow: hidden;
            white-space: nowrap;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        div.tr-txt-area {
        }

        div.tr-txt-area:hover {
            cursor: pointer;
        }

        div.tr-txt{
            height:45px;
            word-wrap:break-word;
            display: -webkit-box;
            -webkit-line-clamp:2;
            -webkit-box-orient:vertical;
            overflow: hidden;
            font-size: 15px;
            margin-top: 5px;
        }


    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<%--bookmark == tr--%>
<div class="tr_container">
    <c:if test="${tr_cnt==0}">
        <div>
            <h4>참가 중인 투어가 없습니다</h4>
        </div>
    </c:if>
    <c:if test="${tr_cnt>0}">
        <c:forEach var="dto" items="${trlist}">
            <div class="tr-card">
                <div class=" tr-txt-area" onclick="location.href='${root}/comtour/detail?tr_id=${dto.tr_id}'">
                    <div class="tr-nm">${dto.tr_nm}</div>
                    <div class="tr-txt">${dto.tr_txt}</div>
                    <hr>
                    <div class="tr-cont-date"><i class="fa-regular fa-calendar"></i> &nbsp;${dto.s_date}~ ${dto.e_date}</div>
                    <fmt:formatDate var="u_date" value="${trdto.u_date}" pattern="yyyy/MM/dd"/>
                    <div class="tr-cont-bottom"><span>${u_date}</span></div>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

</body>
</html>
