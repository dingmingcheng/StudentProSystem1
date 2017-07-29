<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>注册界面</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <script src="assets/js/jquery-3.2.1.js"></script>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>

<script type="text/javascript">
window.flag1=0;
window.flag2=0;
window.flag3=0;
window.flag4=0;
window.flag5=0;
window.flag6=0;
window.flag7=0;
$(function(){
	$("#loginbtn").click(function(){
		var s1=$("select[name='stusch']").val();
		if($("#username").val()=="" || $("#password").val()=="" || $("#stuname").val()=="" || $("select[name='stusch']").val()=="" || $("#stunum").val()=="" || $("#stupass").val()=="" || $("#stuemail").val()=="")
		{
			alert("信息不完整！");
			return;
		}
		s1 = encodeURI(s1);
		$.ajax({
			url: 'registeration.do',  
	        type: 'GET',
	        data:{"username":$("#username").val(),"password":$("#password").val(),"stuname":$("#stuname").val(),   "stunum":$("#stunum").val(),  "stupass":$("#stupass").val(),  "stusch":s1,  "stuemail":$("#stuemail").val()},                                 
	        success:function(data){
	        	if(data=="注册成功")
	        	{
	        		alert(data);
	        		window.location.href="blank.jsp";
	        	}
	        	else
	        	{
	        		alert(data);
	        	}
	        }
		})
	})
})
</script>
<script>
        alert(flag1);
        window.onload= function(){  
            var userName = document.getElementById("username");  
            var lableName = document.getElementById("lname");  
            var password1 = document.getElementById("password");  
            var password2 = document.getElementById("password1");  
            var labelPassword1 = document.getElementById("lpass1");  
            var labelPassword2 = document.getElementById("lpass2");
            var stunum=document.getElementById("stunum");
            var stupass=document.getElementById("stupass");
            var stuname=document.getElementById("stuname");
            var stuemail=document.getElementById("stuemail");
            var lstunum=document.getElementById("lstunum");
            var lstupass=document.getElementById("lstupass");
            var lstuname=document.getElementById("lstuname");
            var lstuemail=document.getElementById("lstuemail");
            userName.onblur = function(){  
                var nameValue = userName.value;  
                var pattern = /^[a-zA-Z_]\w{5,19}$/g;
                if(nameValue =="" || nameValue==null){  
                    lableName.innerHTML = "用户名不能为空!";flag1=0;
                }  
                else if(pattern.test(nameValue)){  
                    lableName.innerHTML = "正确!";flag1=1;
                }  
                else{  
                    lableName.innerHTML = "数字不能开头,长度在6-20位之间！";
                    flag1=0;
                }  
            }

            stunum.onblur = function(){  
                var nameValue = stunum.value;  
                if(nameValue =="" || nameValue==null){  
                	lstunum.innerHTML = "用户名不能为空!";  
                }  
                else{  
                	lstunum.innerHTML = "正确!";  
                }                  
            }
            stupass.onblur = function(){  
                var nameValue = stupass.value;  
                if(nameValue =="" || nameValue==null){  
                	lstupass.innerHTML = "密码不能为空!";  
                }  
                else{  
                	lstupass.innerHTML = "正确!";  
                }                  
            }
            stuname.onblur = function(){  
                var nameValue = stuname.value;  
                if(nameValue =="" || nameValue==null){  
                	lstuname.innerHTML = "姓名不能为空!";  
                }  
                else{  
                	lstuname.innerHTML = "正确!";  
                }                  
            }
            stuemail.onblur = function(){  
                var nameValue = stuemail.value;  
                if(nameValue =="" || nameValue==null){  
                	lstuemail.innerHTML = "邮箱不能为空!";  
                }  
                else{  
                	lstuemail.innerHTML = "正确!";  
                }                  
            }
            password1.onblur = function(){  
                var passValue = password1.value;  
                var pattern = /^\w{6,15}$/g;  
                if(pattern.test(passValue)){  
                    labelPassword1.innerHTML = "正确!";  
                }  
                else if(passValue =="" || passValue==null){  
                    labelPassword1.innerHTML = "密码不能为空!";  
                }  
                else{  
                    labelPassword1.innerHTML = "密码长度在6-15位之间！";  
                }  
            }  
            password2.onblur = function(){  
                var pass1Value = password1.value;  
                var pass2Value = password2.value;  
                if(pass2Value =="" || pass2Value==null){  
                    labelPassword2.innerHTML = "密码不能为空!";  
                }  
                else if(pass1Value == pass2Value){  
                    labelPassword2.innerHTML = "输入正确!";  
                }  
                else if(pass1Value!=pass2Value){  
                    labelPassword2.innerHTML = "两次密码输入不一致!";  
                }  
                else{  
                    labelPassword2.innerHTML = "密码长度在6-15位之间！";  
                }  
            }            
        }  
    </script>  
    <div class="container">
        <div class="row text-center  ">
            <div class="col-md-12">
                <br /><br />
                <h2> 注册</h2>
               
                <h5>(Join us)</h5>
                 <br />
            </div>
        </div>
         <div class="row">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                        <strong>用户注册信息</strong>  
                            </div>
                            <div class="panel-body">
                                <form role="form">
<br/>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-circle-o-notch"  ></i></span>
                                            <input id="username" type="text" class="form-control" placeholder="用户名" />                                            
                                        </div>
                                        &nbsp;<label id="lname"></label>
                                      <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                            <input id="password" type="password" class="form-control" placeholder="输入密码" />
                                        	
                                        </div>&nbsp;<label id="lpass1"></label>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                            <input id="password1" type="password" class="form-control" placeholder="请再次输入密码" />
                                        	
                                        </div>&nbsp;<label id="lpass2"></label>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                                            <select class="form-control" name="stusch" id="stusch">
				                               <option>浙江财经大学</option>
				                               <option>浙江农林大学暨阳学院</option>
				                               <option>上海电机学院</option>    
				                               <option>中央财经大学</option> 
				                               <option>华中农业大学</option> 
				                               <option>天津医科大学临床医学院</option>  
				                               <option>宁波工程学院</option>
				                               <option>广东工业大学</option>
				                               <option>广东财经大学华商学院</option>
				                               <option>成都师范学院</option>
				                               <option>济南大学</option>
				                               <option>温州医科大学</option>
				                               <option>湖南师范大学</option>
				                               <option>西安理工大学</option>  
				                               <option>重庆工商大学</option>
				                               <option>重庆师范大学</option>  
				                               <option>青岛滨海学院</option>                        
	                           				</select>
                                        </div>
                                        <label id="lstusch"></label>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                                            <input id="stunum" type="text" class="form-control" placeholder="教务管理系统用户名" />
                                        	
                                        </div>&nbsp;<label id="lstunum"></label>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                                            <input id="stupass" type="text" class="form-control" placeholder="教务管理系统密码" />
                                        	
                                        </div>&nbsp;<label id="lstupass"></label>
                                         <div class="form-group input-group">
                                            <span class="input-group-addon">@</span>
                                            <input id="stuemail" type="text" class="form-control" placeholder="Email地址" />
                                        	
                                        </div>&nbsp;<label id="lstuemail"></label>
                                     	<div class="form-group input-group">
                                            <span class="input-group-addon">@</span>
                                            <input id="stuname" type="text" class="form-control" placeholder="请输入姓名" />
                                        	
                                        </div>&nbsp;<label id="lstuname"></label>
                                        <br>
                                     <a id="loginbtn" class="btn btn-success " disabled="true">完成</a>
                                    <hr />
                                    已有帐号？ <a href="login.jsp" >请点击这里！</a>
                                    </form>
                            </div>
                           
                        </div>
                    </div>
                
                
        </div>
    </div>


     <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
   
</body>
</html>