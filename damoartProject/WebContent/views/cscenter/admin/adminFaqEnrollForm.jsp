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
<style>
    div{ box-sizing:border-box;}
    

    #outer{
		/* border:1px solid black; */
        width:1000px; 
        height:auto; 
        padding:20px;
        margin:auto;
        margin-top:150px;
        margin-left:230px;
    }

    #inner{
        width:100%;
        margin-top:40px;
    }

    #enroll-form input, #enroll-form textarea{
        width:100%;
        box-sizing:border-box;
    }
    th{
        height:40px;
        background:rgb(203, 185, 153);
    }

    #button{
        width:83%;
    }

    #cancel{
        background-color:rgb(203, 185, 153);
        color:rgb(64, 64, 64);
        font-weight:600;
    }

    #insert{
        background-color:rgb(151, 138, 116);
        color:white;
    }

    #enroll-tb{
        border:1px solid rgb(173, 157, 128);
    }


</style>
</head>
<body>
	<%@ include file="../../common/manageMenubar_2.jsp" %>

    <div id="outer">
        <br><br>
        <h4 style="font-weight: bolder;">FAQ 관리</h4>
        
        <br>
        <hr>
        <div id="inner" align="center">
            <form id="enroll-form" action="<%=contextPath%>/insert.fa" method="post">
            	<input type="hidden" name="adminNo" value="<%=loginUser.getMemNo()%>"> 
                <table id="enroll-tb" border="1">
                    <tr >
                        <th width="120">&nbsp;&nbsp;&nbsp;제목</th>
                        <td width="700"><input type="text" size="80" required name="title"></td>
                    </tr>
                    <tr style="border-bottom:1px solid rgb(173, 157, 128); border-top:1px solid rgb(173, 157, 128)">
                        <th>&nbsp;&nbsp;&nbsp;분류</th>
                        <td colspan="3">
                            <select name="category" required>
                            	<option value="">--선택--</option>
                                <option value="Q1">[티켓]</option>
                                <option value="Q2">[취소/환불]</option>
                                <option value="Q3">[주문/결제]</option>
                                <option value="Q4">[상품]</option>
                                <option value="Q5">[기타]</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;&nbsp;&nbsp;내용</th>
                        <td><textarea name="content" rows="20" required style="resize:none;"></textarea></td>
                    </tr>
                </table>
                <br>
                <div id="button" align="right">
                    <a href="<%=contextPath%>/adminList.fa?cpage=1" class="btn btn-sm" id="cancel">취소하기</a>
                    <button type="submit" class="btn btn-sm" id="insert">등록하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>