<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
<BODY>
<H1>1.최종 주문 내역서</H1>
<TABLE class="list_view">
  <TBODY align=center>
  <tr style="background: #33ff00">
    <td>주문번호</td>
    <td colspan=2 class="fixed">주문상품명</td>
    <td>수량</td>
    <td>주문금액</td>
    <td>배송비</td>
    <td>예상적립금</td>
    <td>주문금액합계</td>
  </tr>
  <TR>
    <c:forEach var="item" items="${myOrderList }">
    <td> ${item.orderId }</td>
    <TD class="goods_image">
      <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">
        <IMG width="75" alt=""
             src="${contextPath}/thumbnails.do?goods_id=${item.goodsId}&fileName=${item.goodsFileName}">
      </a>
    </TD>
    <TD>
      <h2>
        <A href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">${item.goodsTitle }</A>
      </h2>
    </TD>
    <td>
      <h2>${item.orderGoodsQty }개<h2>
    </td>
    <td><h2>${item.orderGoodsQty *item.goodsSalesPrice}원 (10% 할인)</h2></td>
    <td><h2>0원</h2></td>
    <td><h2>${1500 *item.orderGoodsQty }원</h2></td>
    <td>
      <h2>${item.orderGoodsQty *item.goodsSalesPrice}원</h2>
    </td>
  </TR>
  </c:forEach>
  </TBODY>
</TABLE>
<DIV class="clear"></DIV>
<form name="form_order">
  <br>
  <br>
  <H1>2.배송지 정보</H1>
  <DIV class="detail_table">
    
    <TABLE>
      <TBODY>
      <TR class="dot_line">
        <TD class="fixed_join">배송방법</TD>
        <TD>
          ${myOrderInfo.deliveryMethod }
        </TD>
      </TR>
      <TR class="dot_line">
        <TD class="fixed_join">받으실 분</TD>
        <TD>
          ${myOrderInfo.receiverName }
        </TD>
      </TR>
      <TR class="dot_line">
        <TD class="fixed_join">휴대폰번호</TD>
        <TD>
          ${myOrderInfo.receiverHp1}-${myOrderInfo.receiverHp2}-${myOrderInfo.receiverHp3}
        </TD>
      </TR>
      <%--				<TR class="dot_line">--%>
      <%--					<TD class="fixed_join">유선전화(선택)</TD>--%>
      <%--					<TD>--%>
      <%--					   ${myOrderInfo.receiver_tel1}-${myOrderInfo.receiver_tel2}-${myOrderInfo.receiver_tel3}</TD>--%>
      <%--					</TD>--%>
      <%--				</TR>--%>
      
      
      <TR class="dot_line">
        <TD class="fixed_join">주소</TD>
        <td>
          ${myOrderInfo.deliveryAddress}
        </td>
        >
      </TR>
      <TR class="dot_line">
        <TD class="fixed_join">배송 메시지</TD>
        <TD>
          ${myOrderInfo.deliveryMessage}
        </TD>
      </TR>
      <TR class="dot_line">
        <TD class="fixed_join">선물 포장</TD>
        <td>
          ${myOrderInfo.giftWrapping}
        </td>
      </TR>
      </TBODY>
    </TABLE>
  
  </DIV>
  <div>
    <br><br>
    <h2>주문고객</h2>
    <table>
      <TBODY>
      <tr class="dot_line">
        <td><h2>이름</h2></td>
        <td>
          <input type="text" value="${orderer.memberName}" size="15" disabled/>
        </td>
      </tr>
      <tr class="dot_line">
        <td><h2>핸드폰</h2></td>
        <td>
          <input type="text" value="${orderer.memberHp1}-${orderer.memberHp2}-${orderer.memberHp3}" size="15" disabled/>
        </td>
      </tr>
      <tr class="dot_line">
        <td><h2>이메일</h2></td>
        <td>
          <input type="text" value="${orderer.memberEmail1}@${orderer.memberEmail2}" size="15" disabled/>
        </td>
      </tr>
      </TBODY>
    </table>
  </div>
  <DIV class="clear"></DIV>
  <br>
  <br>
  <br>
  <H1>3.결제정보</H1>
  <DIV class="detail_table">
    <table>
      <TBODY>
      <TR class="dot_line">
        <TD class="fixed_join">결제방법</TD>
        <TD>
          ${myOrderInfo.payMethod }
        </TD>
      </TR>
      <TR class="dot_line">
        <TD class="fixed_join">결제카드</TD>
        <TD>
          ${myOrderInfo.cardComName}
        </TD>
      </TR>
      <TR class="dot_line">
        <TD class="fixed_join">할부기간</TD>
        <TD>
          ${myOrderInfo.cardPayMonth }
        </TD>
      </TR>
      </TBODY>
    </table>
  </DIV>
</form>
<DIV class="clear"></DIV>
<br>
<br>
<br>
<center>
  <br>
  <br>
  <a href="${contextPath}/main/main.do">
    <IMG width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
  </a>
  <DIV class="clear"></DIV>
	
			
			
