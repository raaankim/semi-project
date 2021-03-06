<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product, com.kh.order.model.vo.Cart" %>
<% 
	Product pro = (Product)request.getAttribute("p");
	ArrayList<Product> detailList = (ArrayList<Product>)request.getAttribute("detailList");
	ArrayList<Product> starList = (ArrayList<Product>)request.getAttribute("starlist");
	
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	
	int totalCount = 0;
	int totalPrice = 0;
	
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
    
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
	div{ box-sizing:border-box;}
	.wrapper, .content1, .content2, .content3{
		top: 0; left: 0; right: 0; bottom: 0; margin: auto;
	}
    .wrapper{
        width: 1000px;
        height: auto;
        margin-top: 50px;	
    }
	.content1{
		width: 80%;
		height: 100px;
		margin-bottom: -30px;
	}
	.content2{
		width: 90%;
		height: 33%;
	}
	.poster{
		width: 300px;
		height: 400px;
		float: left;
		margin-top: 20px;
		margin-left: 50px;
		margin-right: 40px;
	}
	#star1, #star2, #review{
		width: 25%;
		height: 50px;
		float: left;
		margin-top: 10px;
	}
	#star1{
		text-align: center;
		font-size: large;
		padding-top: 15px;
		margin-left: 30px;
	}
	#star2{
		text-align: center;
		font-size: xx-large;
		font-weight: bolder;
		padding-right: 15px;
	}
	#review{
		width: 100px;
		text-decoration: none;
		text-align: center;
		font-size: x-large;
		color: black;
		padding-top: 6px;
	}
	.info{
		width: 500px;
		float: left;
		margin-top: 20px;
		font-size: 16px;
		padding: 20px;
	}
	.info th{width: 100px; height: 60px;}
	.info td{width: 500px; height: 60px; padding: 20px}
	#pay th{width: 400px; height: 40px;}
	#pay{width: 500px; margin-left:  -10px;}
	#pay th{width: 80px; height: 40px;}
	#pay td{width: 30px; height: 40px;}
	#insertCart {width: 70px; background-color:rgb(203, 185, 153);}
	
	#order{
		width: 300px;
		background-color: whitesmoke;
		font-size: 20px;
		text-align: center;
		font-weight: border;
	}
	#total{
		width: 300px;
		background-color: whitesmoke;
		text-align: right; 
		font-size: 30px;
		padding-right: 30px;
	}
	.content3{
		width: 90%;
		height: 67%;
	}
	.content3>button{
		color: whitesmoke; 
		font-size: 18px; 
		font-weight: bolder; 
		margin:30px; 
		width:150px;
		margin-left: 200px;
		margin-top: 50px;
		margin-bottom: 10px;
	}
	.content4{
		margin: auto;
		margin-top: 100px;
		width: 80%;
	}
	.content5{
		margin: auto;
		margin-left: 100px;
		margin-top: 10px;
		width: 80%;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrapper">
		<% for(Product p : detailList){ %>
		<input type="hidden" id="pNo" name="pno" value="<%= p.getpNo() %>">
		<div class="content1">
			<div class="title" style="font-size: 30px; font-weight: bolder; margin-bottom: 7px;"><%= p.getTitle() %></div>
			<div class="date" style="font-size: 13px;"><%= p.getsDate() %> ~ <%= p.geteDate() %>&nbsp;&nbsp;&nbsp;<%= p.getArea() %>
			</div>
		</div>
		
		
		<hr class="my-2">
		<div class="content2" >
			<div class="poster">
				<img src="<%=request.getContextPath()%>/<%= p.getMainImg() %>" width="100%" height="100%">
				<% for(Product s : starList){ %>
					<% if(s.getStar() != null){ %>
						<div id="star1"> ?????? </div>
						<div id="star2"> <%= s.getStar() %> </div>
					<%}else { %>
						<div id="star1"> ?????? </div>
						<div id="star2"> - </div>
					<%} %>
				<%} %>
				<a id="review" href="<%=contextPath%>/review.pro?cpage=1">review </a>
			</div>
			<div class="info">
				<table id="info">
					<tr>
						<th>??????</th>
						<td><%= p.getsDate() %> ~ <%= p.geteDate() %></td>
					</tr>
					<tr>
						<th>??????</th>
						<td><a class="ls-modal btn btn-sm btn-outline-secondary" data-toggle="modal"
										href="area.pro" data-target="#modal"><%= p.getArea() %></a></td>
					</tr>
					<tr>
						<th>????????????</th>
						<td><%= p.getAge() %></td>
					</tr>
					<tr>
						<th>????????????</th>
						<td><%= p.getTime() %></td>
					</tr>
					<tr>
						<th>??????</th>
						<% if(p.getaPrice() == 0){ %>
							<td> ???????????? </td>
						<% } else{ %>
						<td>?????? : <%= p.getaPrice() %> / ????????? : <%= p.gettPrice() %> / ?????? : <%= p.getcPrice() %><br>
						</td>
						<% } %>
					</tr>
					<tr>
						<th>??????</th>
						<td><%= p.getEtc() %></td>
					</tr>
				</table>
				<hr class="my-2">
					
					<table id="pay">
						<tr>
							<th >????????????</th>
							<td>
								<select name="option" id="option" >
									<option value="A">??????</option>
									<option value="T">?????????</option>
									<option value="C">??????</option>
								</select>
							</td>
							<th>??????</th>
							<td><input type="number" id="count" style="width: 50px;"></td>
							<td><button class="btn" id="insertCart" onclick="insertCart();">??????</button></td>
						</tr>
					</table>
				
				<table id="result">
					<tr>
						<td id="order"></td>
						<th id="total"></th>
					</tr>
				</table>
			</div>
		</div>	
		

		<div class="content3">
			<button id="info1" class="btn btn-secondary" >????????????</button>
			<button id="info2" class="btn btn-secondary" >??????/????????????</button>
			<hr class="my-2">
		</div>
		
		<div class="content4">
			<div class="detail"><img id="detail" src="<%=contextPath%>/<%= p.getDetailImg()%>" width="100%" height="100%"></div>
        </div>
       <div class="content5"></div>
        <br><br><br><br><br>

		<script>
			
			$("#info1").click(function(){
				$.ajax({
					url:"ajaxImg.pro",
					data:{pno:$("#pNo").val()},
					success:function(result){
						let value = '<img src="' 
								   + '<%=contextPath%>/'
								   + result.detail
								   + '" width="100%" height="100%">';
						$(".detail").html(value);
						console.log(value);
						console.log(result);
					},error:function(){
						
					}
				})
			})
			

			$("#info2").click(function(){
				$.ajax({
					url : "<%=contextPath%>/views/product/detailCancelInfo.jsp",
					dataType: "html",
					success:function(result){
						$(".detail").html(result);
					},error:function(){
						
					}
				})
			})
			
			
			function insertCart(){
				
				$.ajax({
					url:"in.ca",
					data:{
					   pno: $("#pNo").val(),
					   count: $("#count").val(),
				       option: $("#option").val()
 						},
 					type:"post",
 		            success:function(list){
 		                console.log("ajax?????? ??????: " + list);
 		                alert("??????????????? ??????????????? ???????????????.");
 		                let totalCount = 0;
 		                let totalPrice = 0;
 		                let orderList = "";
 		                
 		                $.each(list, function(index, data){
 		                	totalCount += data.cartCount;
 		                	 if(data.aPrice != 0) {
 		                		totalPrice += data.cartCount * data.aPrice;
 		                		orderList = "??????";
 		                     }else if(ca.getCartOpt().equals("C")) {
 		                    	totalPrice += data.cartCount * data.tPrice;
 		                    	orderList = "?????????";
 		                     }else if(ca.getCartOpt().equals("T")){
 		                    	totalPrice += data.cartCount * data.cPrice;
 		                    	orderList = "??????";
 		                     }else {};
 		                });
 		                
 		                $("#order").html(orderList + totalCount + "???            " + totalPrice + "???");
 		                $("#total").html("??? " + totalPrice + "???");
 					 }, error : function(){
 		               console.log("ajax?????? ??????"); 
 		             }
				})
			}
		</script>
		<% } %>
		
	</div>
	
	
	<div class="modal fade" id="modal" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">????????? ??????</h4>
		        <button type="button" class="close" data-dismiss="modal">??</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
		      </div>
		
		    </div>
	  	</div>
	</div>
	
	<script type="text/javascript">
		$(".ls-modal").on('click', function(e){
			e.preventDefault();
			$('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
	
	</script>

	
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>