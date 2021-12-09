<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>

    .wrap{
        width: 1200px;
    }

    .manage_head{
    width: 300px;
    height: 50px;
    float: left;
    font-size: 20px;
    margin-top: 70px;
    }

    #title{
        font-size: 25px;
    }

    .order_chart{    
        margin:auto;
        margin-top: 80px;
        width:800px; 
        height:80px;
        border-radius:10px;
        background-color: rgb(203, 185, 153);
    }

    .box{
        display: inline-block;
        height: 80px;
        width: 230px;
        padding-top: 3%;
        font-size: 20px;
        font-weight: 800;
    }

    .search_date{
        width: 800px;
        margin: auto;
        margin-top: 50px;
    }

    .search_date>.btn{
        background-color: rgba(149, 133, 99, 0.6);
        width: 70px;
        height: 30px;
        padding: 3px;
        font-size: 13px;
        margin-left: 15px;
    }
    
    .select_date{
        float: right;
    }

    .order_box{
        width: 800px;
        margin-top: 50px;
    }
    .search{
        float: right;
    }

    .order_box>.btn{
        width: 130px;
        font-size: 13px;
    }

    #cancle{
        background-color: rgb(203, 185, 153);

    }
    #check{
        color: white;
        background-color: rgba(78, 67, 44, 0.6);
    }

    #search{
        color: white;
        background-color: rgba(78, 67, 44, 0.6);
        width: 60px;
        font-size: 13px;
    }

    input::placeholder{
        font-size: 12px;
    }

    .chart{
        font-size: 13px;
        margin: auto;
        margin-top: 30px;
    }
    .chart_order{
        width: 800px;
    }
    td{
        border-bottom: 1px solid black;
        height: 100px;
    }
    .table_title{
        height: 40px;
        background-color: rgba(179, 165, 141, 0.829)
    }
</style>
<body>
    
   <%@ include file="../common/manageMenubar.jsp" %>

<!--메뉴 이름-->

<div class="wrap">
    <div class="manage_head">
        <p>현황 관리<b id="title"> > 취소 관리</b></p>
    </div>
        <br><br><br>
        <!--주문 현황-->
        <div class="order_chart" align="center">
           <div class="box new_order">
                취소요청&nbsp;&nbsp; 4
           </div>
           <div class="box com_order">
               취소거절&nbsp;&nbsp; 1
           </div>
           <div class="box wait_order">
                취소완료&nbsp;&nbsp; 3
           </div>
        </div>
        
        <!--조회기간 날짜 선택-->
        <div class="search_date">
            <b>조회기간</b> 
            <button class="btn">오늘</button>
            <button class="btn">일주일</button>
            <button class="btn">1개월</button>
            <div class="select_date">
                <input type="date"> <b>&nbsp;~&nbsp;</b> <input type="date">
            </div>
           
        <!--판매 리스트-->
        <div class="order_box">
            <button class="btn" id="cancle"><b>취소 승인</b></button>
            <button class="btn" id="check"><b>취소 거절</b></button>
            <div class="search">
                <input type="text" placeholder="구매자 ID, 이름, 주문번호">
                <button class="btn" id="search"><b>검색</b></button>
            </div>

            <!--판매 표-->
            <div class="chart">
                <table class="chart_order">
                    <tr align="center" class="table_title">
                        <th width="180" colspan="2">주문번호 / 시각</th>
                        <th width="220" colspan="2">주문상품</th>
                        <th width="180">취소사유 / 시각</th>
                        <th width="60">상태</th>
                        <th width="200">환불정보</th>
                    </tr>
                    <tr align="center" class="table_content">
                        <td><input type="checkbox"></td>
                        <td>user01 김아트<br>201223809342<br><small>2021-12-10 06:20</small></td>
                        <td width="60"><img src="<%=request.getContextPath()%>/resources/images/product/1M.gif" width="40px" height="40px"></td>
                        <td>A001<br>영국 테이트미술관 특별전</td>
                        <td>구매 의사 취소 <br> <small>2021-12-13 11:20</small></td>
                        <td>취소요청</td>
                        <td>총 결제금액 &nbsp; 28000￦ <br>
                            결제 방법 &nbsp; 무통장입금 <br>
                            총 환불 금액 &nbsp; 28000￦
                        </td>
                    </tr>
                    <tr align="center" class="table_content">
                        <td><input type="checkbox"></td>
                        <td>user01 김아트<br>201223809342<br><small>2021-12-10 06:20</small></td>
                        <td width="60"><img src="<%=request.getContextPath()%>/resources/images/product/1M.gif" width="40px" height="40px"></td>
                        <td>A001<br>영국 테이트미술관 특별전</td>
                        <td>상품 정보 상이 <br> <small>2021-12-13 11:20</small></td>
                        <td>취소승인</td>
                        <td>총 결제금액 &nbsp; 28000￦ <br>
                            결제 방법 &nbsp; 카드결제 <br>
                            총 환불 금액 &nbsp; 28000￦
                        </td>
                    </tr>
                    <tr align="center" class="table_content">
                        <td><input type="checkbox"></td>
                        <td>user01 김아트<br>201223809342<br><small>2021-12-10 06:20</small></td>
                        <td width="60"><img src="<%=request.getContextPath()%>/resources/images/product/1M.gif" width="40px" height="40px"></td>
                        <td>A001<br>영국 테이트미술관 특별전</td>
                        <td>상품 잘못 주문 <br> <small>2021-12-13 11:20</small></td>
                        <td>취소거절</td>
                        <td>총 결제금액 &nbsp; 28000￦ <br>
                            결제 방법 &nbsp; 무통장입금 <br>
                            총 환불 금액 &nbsp; 28000￦
                        </td>
                    </tr>
                </table>
            </div>    
        </div>    

       




        </div>
        <br><br><br><br><br><br>
<%@ include file="../common/footerbar.jsp" %>
</div>




</body>
</html>