<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>아이디 중복 확인</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
</head>

<body bgcolor="#ffffff" text="#000000">

    <form name="detailForm" method="POST">

        <input type="hidden" name="name" value="" />

        <!-- 타이틀 시작 -->
        <table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="15" height="37"><img src="${pageContext.request.contextPath}/images/ct_ttl_img01.gif" width="15" height="37" /></td>
                <td background="${pageContext.request.contextPath}/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="93%" class="ct_ttl01">ID중복확인</td>
                            <td width="20%" align="right">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37" /></td>
            </tr>
        </table>
        <!-- 타이틀 끝 -->

        <!-- 검색결과 시작 -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="32" style="padding-left: 12px;">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 3px;">
                        <tr>
                            <td width="8" style="padding-bottom: 3px;"><img src="/images/ct_bot_ttl01.gif" width="4"
                                                                            height="7"></td>
                            <td class="ct_ttl02">${ userId }${ result ? "는 사용 가능합니다." : "는 사용이 불가능합니다." }</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td background="/images/ct_line_ttl.gif" height="1"></td>
            </tr>
        </table>
        <!-- 검색결과 끝 -->

        <!-- 등록 테이블시작 -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>
            <tr>
                <td width="104" class="ct_write">아이디 <img src="/images/ct_icon_red.gif" width="3" height="3"
                                                          align="absmiddle">
                </td>
                <td bgcolor="D6D6D6" width="1"></td>
                <td class="ct_write01">
                    <!-- 테이블 시작 -->
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="105"><c:choose>
                                    <c:when test="${ result }">
                                        <input type="text" name="userId" id="userId" value="${ userId }" class="ct_input_g"
                                            style="width: 100px; height: 19px" maxLength="20" />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="userId" id="userId" class="ct_input_g"
                                            style="width: 100px; height: 19px" maxLength="20" />
                                    </c:otherwise>
                                </c:choose></td>
                            <td>
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="4" height="21"><img src="/images/ct_btng01.gif" width="4" height="21">
                                        </td>
                                        <td align="center" background="/images/ct_btng02.gif" class="ct_btn"
                                            style="padding-top: 3px;"><a href="javascript:fncCheckDuplication();">중복확인</a>
                                        </td>
                                        <td width="4" height="21"><img src="/images/ct_btng03.gif" width="4" height="21">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table> <!-- 테이블 끝 -->
                </td>
            </tr>
            <tr>
                <td height="1" colspan="3" bgcolor="D6D6D6"></td>
            </tr>
        </table>
        <!-- 등록테이블 끝 -->

        <!-- 버튼 시작 -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
            <tr>
                <td align="center">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <c:if test="${ result }">
                                <td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
                                <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"><a
                                    href="javascript:fncUseId();">사용</a></td>
                                <td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
                            </c:if>
                            
                            <td width="30"></td>
                            <td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
                            <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;"><a
                                href="javascript:window.close();">닫기</a></td>
                            <td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <!-- 버튼 끝 -->

    </form>

</body>
</html>
