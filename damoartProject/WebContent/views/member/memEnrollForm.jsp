<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.mail.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

         <!-- jQuery library -->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     
         <!-- Popper JS -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
     
         <!-- Latest compiled JavaScript -->
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        @font-face {
            font-family: 'IBMPlexSansKR-Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body{
            background:#e1d5bf;
            font-family: 'IBMPlexSansKR-Regular'; 
        }
        .outer{
            margin:auto;
            margin-top:70px;
            height:1400px;
        }
        .enrollList{margin-left:36%;}
        .enrollList li{
            list-style:none;
            float:left;  
            padding:15px;
            margin:auto;
            font-size:20px;
            font-weight:bold
        }
        .enrollList-1, .enrollList-3{
            color:rgb(104, 102, 102);
        }
        .enrollForm table{
            background:rgba(255, 255, 255, 0.45);
            margin:auto;
            border-radius:3px;
        }
    
        .enrollForm table tr th{
            padding-left:60px;
            padding-bottom:50px;
        }
        .enrollForm table tr td{padding-bottom:50px;}
        .enrollForm input{
            border:none;
            margin:auto;
            padding:10px;
            background:rgba(255, 255, 255, 0.45);
            width:300px;
        }
        .btn-mem{
            width:200px;
            height:40px;
            border:none;
            border-radius:3px;
            font-weight:bold;
            margin:30px;
        }
        .btn-mem.back{background:rgb(203, 185, 153);}
        .btn-mem.enroll{
            background:rgba(78, 67, 44, 0.6);
            color:white;
        }
        .check{
            width:90px;
            height:40px;
            font-size:14px;
            border:none;
            background:rgba(78, 67, 44, 0.6);
            color:white;
            border-radius:3px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">

        <br>
        <h2 align="center" style="font-weight:bold">????????????</h2><br>   
        <ul class="enrollList">
            <li class="enrollList-1" >01 ????????????</li>
            <li class="enrollList-2">02 ????????????</li>
            <li class="enrollList-3">03 ????????????</li>
        </ul>
        <br><br>
        <hr style="width:50%;">
        <form action="insert.me"  method="post" id="enrollForm" class="enrollForm">
            <br><br><br>
            <table>
                <tr>
                    <td colspan="3" height="50" style="color:red; padding:40px;"> * ????????? ???????????????????????????. </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <th width="250" height="70">* ?????????</th>
                    <td width="600">
                        <input type="text" name="memId" id="memId" placeholder="??????, ??????  5~20??? " minlength="5" required>
                        &nbsp;&nbsp;&nbsp;
                        <button type="button" class="check id" onclick="idCheck();">????????????</button>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th height="70">* ????????????</th>
                    <td>
                        <input type="password" name="memPwd" id="memPwd" placeholder="??????+??????  8~20???  ('~!@'????????????)" minlength="8" maxlength="20" required>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th height="70">* ??????????????????</th>
                    <td>
                        <input type="password" name="checkPwd" id="checkPwd" minlength="8" maxlength="20" required>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th height="70">* ??????</th>
                    <td>
                        <input type="text" name="memName" id="memName" placeholder="2?????? ??????" minlength="2" required>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th height="70">* ?????????</th>
                    <td>
                        <input type="text" name="nickname" id="nickName" placeholder="??????, ??????, ???????????? 2~14???" minlength="2" maxlength="14" required>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th height="70">* ?????????</th>
                    <td>
                        <input type="text" name="emailId" id="emailId" style="width:170px;"required>
                        &nbsp;
                        <select id="emailDomain" name="emailDomain" class="email_select"> 
	                        <option value="">????????????</option> 
	                        <option value="@naver.com">@naver.com</option> 
	                        <option value="@gmail.com">@gmail.com</option> 
	                        <option value="@daum.net">@daum.net</option> 
	                        <option value="@nate.com">@nate.com</option> 
                    	</select> &nbsp;&nbsp;
                        <button type="button" class="check email" onclick="sendMail();" data-toggle="modal" data-target="#myModal">???????????????</button>
              			
              			<!-- The Modal -->
						<div class="modal" id="myModal">
							<div class="modal-dialog">
						    	<div class="modal-content">
						  
							        <!-- Modal body -->
							        <div class="modal-body">
							            <p>???????????? ????????? ?????????????????????. <br> ???????????? ??????????????????. <br> </p>
							            <input type="number" placeholder="?????? 6?????? ??????"> 
							        </div>
							  
							        <!-- Modal footer -->
							        <div class="modal-footer">
							            <p>??????????????? ?????? ???????????????? <a href="">?????????</a></p>
							          <button type="button" class="btn btn-danger" onclick="checkMail();" data-dismiss="modal">??????</button>
							        </div>
						  
						      	</div>
						    </div>
						 </div>
              					  
                        <script>
							function sendMail(){
							    <%
								MailSend ms = new MailSend();
								ms.MailSend();
								%>
							}
							
							function checkMail(){
								alert("????????? ????????? ?????????????????????.");
							}
						</script>
                    </td>
                    <td>
                    	
                    </td>
                </tr>
                <tr>
                    <th height="70">* ????????????</th>
                    <td>
                        <input type="text" name="phone" placeholder="'-' ???????????? ??????" required>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th height="70">&nbsp;&nbsp;&nbsp;????????????</th>
                    <td>
                        <script>
	                        var today = new Date();
	                        var toyear = parseInt(today.getFullYear ());
	                        var start = toyear;
	                        var end = toyear -90;
	
	                        document.write("<select name=birth1> ");
	                        document.write("<option value='' selected>");
	                        for (i=start; i>=end; i--) document.write("<option>"+i);
	                        document.write("</select>???  ");
	
	                        document.write("<select name=birth2>");
	                        document.write("<option value='' selected>");
	                        for (i=1; i<=12; i++) document.write("<option>"+i);
	                        document.write("</select>???  ");
	
	                        document.write("<select name=birth3>");
	                        document.write("<option value='' selected>");
	                        for (i=1; i<=31; i++) document.write("<option>"+i);
	                        document.write("</select>???  </font>");
	                        
                    	</script>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td height="50"></td>
                </tr>
            </table>

            <br><br>

            <div align="center">
                <button class="btn-mem back" onclick="mainPage();">??????</button>
                <button type="submit" class="btn-mem enroll" onclick="return validate();" disabled>????????????</button>
            </div>
            
            <br><br>

        </form>
        
        <script>
        	// ???????????? ?????????
        	function mainPage(){
        		location.href = "<%=contextPath%>/views/common/mainPage.jsp";
        	}
        	
        	// ????????? ????????????
	    	function idCheck(){
	    		
        		// ???????????????
	    		const idInput = document.getElementById("memId");
	    		const $idInput = $("#enrollForm input[name=memId]");
	    		// ????????? "??????, ??????  5~20???"
	            let regExp = /^[a-z][a-z\d]{4,19}$/;
	            if(!regExp.test(idInput.value)){
	                alert("????????? ????????? ???????????? ??????????????????.");
	                idInput.select();
	                return false;
	            }
	    		
	            // ????????????
	    		$.ajax({
	    			url:"idCheck.me",
	    			data:{checkId:$idInput.val()},
	    			success:function(result){
	    				//console.log(result);
	    				if(result == 'NNNNN'){ // ???????????????
	    					alert("?????? ??????????????? ????????? ????????? ??????????????????.");
	    					$idInput.focus();
	    				}else{ // ????????????
	    					if(confirm("??????????????? ??????????????????. ?????????????????????????")){
	    						$("#enrollForm :submit").removeAttr("disabled");
	    						$idInput.attr("readonly", true);
	    					}else{
	    						$idInput.focus();
	    					}
	    				}
	    			},
	    			error:function(){
	    				console.log("????????? ??????????????? ajax ????????????");
	    			}
	    		})
	    		
	    	}
        	
        	// ????????? ??????
        	function validate() {
	            const pwdInput1 = document.getElementById("memPwd");
	            const pwdInput2 = document.getElementById("checkPwd");
	            const nameInput = document.getElementById("memName");
	            const nickInput = document.getElementById("nickname");
	            const phoneInput = document.getElementById("phone");
	    
	            // ???????????? "??????+??????  8~20???  ('~!@'????????????)"
	            regExp = /^[a-z\d~!@]{8,20}$/i;
	            if(!regExp.test(pwdInput1.value)){
	                alert("????????? ???????????? ???????????? ??????????????????.");
	                pwdInput1.value = "";
	                pwdInput1.focus();
	                return false;
	            }
	            
	            // ???????????? ??????
	            if(pwdInput1.value != pwdInput2.value){
	                alert("??????????????? ???????????? ????????????.");
	                pwdInput2.value = "";
	                pwdInput2.focus();
	                return false;
	            }
	            
	            // ?????? "2?????? ??????"
	            regExp = /^[???-???a-z\d]{2,}$/;
	            if(!regExp.test(nameInput.value)){
	                alert("????????? ????????? ??????????????????.");
	                nameInput.select();
	                return false;
	            }
	            
	            // ????????? "??????, ??????, ???????????? 2~14???"
	            regExp = /^[\D]{2,14}$/;
	            if(!regExp.test(nickInput.value)){
	                alert("????????? ???????????? ??????????????????.");
	                nickInput.select();
	                return false;
	            }
        	}
        	
        </script>
        
    </div>

    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>