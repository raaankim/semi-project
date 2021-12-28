<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.kh.common.model.vo.PageInfo, com.kh.cscenter.model.vo.Guide" %>
    
<% PageInfo pi = (PageInfo)request.getAttribute("pi");
    ArrayList<Guide> list = (ArrayList<Guide>)request.getAttribute("list");
    
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>
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

    #outer>a{
        color:rgb(64, 64, 64);
    }
    .search-button{width:100%; height:40px; position:relative;}
    .search-button>div{float:left;}
    .search button{
        background-color:rgb(151, 138, 116);
        color:white;
    }
    .button{
        position:absolute;
        right:0;
    }

    #enroll, #deleteCancel{
        background-color:rgb(203, 185, 153);
        color:rgb(64, 64, 64);
        font-weight:600;
    }
    #delete, #deleteCheck, #modalClose{
        background-color:rgb(151, 138, 116);
        color:white;
    }
    
    #list-area{
        text-align:center;
    }

    thead{
        background:rgb(207, 206, 206);
    }

    .no-tb{
        background:white;
        font-size:14px;
    }
    
    #list-area>tbody>tr:hover{
    	background:rgb(240, 239, 239);
    	cursor:pointer;
    }
    
    #myModal, #myModal2{
    	padding-top:150px;
    }


    


</style>
</head>
<body>

	<%@ include file="../../common/manageMenubar_2.jsp" %>
		
		<div id="outer">
            <br><br>
			<h4 style="font-weight: bolder;">이용안내 관리</h4>
            
            <br>
            <hr>
            
            <div class="search-button">
                <div class="search" width="50%">
                    <form action="adminSearch.gu">
                        <input type="text" name="keyword" placeholder="키워드를 입력해주세요" required>
                        <input type="hidden" name="cpage" value="1">
                        <button type="submit" class="btn btn-sm">검색</button>
                    </form>
                </div>
                <div class="button" width="50%">
                    <a href="<%= contextPath %>/enrollForm.gu" class="btn btn-sm" id="enroll">등록</a>
                    <a href="" class="btn btn-sm" id="delete" data-toggle="modal" data-target="#myModal" type="button">선택 삭제</a>
                </div>
            </div>
            <br>
            <div>
                <table align="center" id="list-area" class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="allCheck"></th>
                            <th width="40">번호</th>
                            <th width="280">제목</th>
                            <th width="60">작성자</th>
                            <th width="100">등록일</th>
                            <th width="50">상태</th>
                        </tr>
                    </thead>
                    <tbody class="no-tb">
                    	<% if(list.isEmpty()) { %>
	                        <tr>
	                            <td colspan="6">게시글이 없습니다.</td>
	                        </tr>
                        <% }else { %>
                        	<%for(Guide g : list) { %>
		                        <tr>
                                    <td><input type="checkbox" class="deleteCheck" name="checkNo" value="<%=g.getGuideNo()%>"></td>
		                            <td><%=g.getGuideNo() %></td>
		                            <td class="clickTitle"><%=g.getGuideTitle() %></td>
		                            <td><%=g.getGuideWriter() %></td>
		                            <td><%=g.getCreateDate() %></td>
		                            <td>
		                            	<%if(g.getStatus().equals("Y")) {%>
		                            		게시중
		                            	<%}else { %>
		                            		숨김
		                            	<% } %>
		                            </td>
		                            
		                        </tr>
                        	<% } %>
                        <% } %>
                    </tbody>
                </table>
                <script>
                	$(function(){
                		$(".clickTitle").click(function(){
                			location.href='<%=contextPath%>/detailAndUpdate.gu?gno=' + $(this).prev().text();
                		})
                		
                		$("#allCheck").click(function(){
                			$(".deleteCheck").prop("checked", $(this).prop("checked"));
                		})
                	})
                </script>
                <div class="paging-area" align="center">
                	<% if(currentPage != 1) {%>
                    	<button class="btn" onclick="location.href='<%=contextPath%>/adminList.gu?cpage=<%=currentPage-1%>';">&lt;</button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                    	<% if(p == currentPage) { %>
                    		<button class="btn" disabled><%=p %></button>
                    	<% }else { %>
                    		<button class="btn" onclick="location.href='<%=contextPath %>/adminList.gu?cpage=<%=p%>';"><%=p %></button>
                    	<% } %>
                    <% } %>
                    <% if(currentPage != maxPage) {%>
                    <button class="btn" onclick="location.href='<%=contextPath%>/adminList.gu?cpage=<%=currentPage+1%>';">&gt;</button>
                    <% } %>
                </div>
            </div>
            
        </div>
        
        <!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		
		      <!-- Modal body -->
		      <div class="modal-body" align="center">
		        	삭제하시겠습니까?
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button id="deleteCancel" type="button" class="btn" data-dismiss="modal">취소</button>
		      	<button id ="deleteCheck" type="button" class="btn" data-dismiss="modal" onclick="checkDelete();" name="checkDelete">확인</button>
			  </div>	
		    </div>
		  </div>
		</div>
		
		<!-- The Modal -->
		<div class="modal" id="myModal2">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		
		      <!-- Modal body -->
		      <div class="modal-body" align="center">
		        	선택된 게시글이 없습니다.
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button id="modalClose" type="button" class="btn" data-dismiss="modal">닫기</button>
			  </div>	
		    </div>
		  </div>
		</div>
		<script>
			function checkDelete(){
	            var checkArr = [];
	            $("input:checkbox[class='deleteCheck']:checked").each(function(){
	                checkArr.push($(this).val());
	            })
	            console.log(checkArr);
	            if(checkArr != "") {	            		            	
	            	location.href = "/damoart/checkDelete.gu?arr=" + checkArr
	            }else {
	            	$("#myModal2").modal();
	            }
	            
			}    
		</script>
</body>
</html>