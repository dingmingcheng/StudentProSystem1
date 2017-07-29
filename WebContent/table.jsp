<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>成绩查看</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <script src="assets/js/jquery-3.2.1.js"></script>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<body>
<%
String x="";
Object obj=session.getAttribute("userNow");
x=(String)obj;
String x1="blank.jsp";
String x2="table.jsp";
String x3="timetable.jsp";
%>
<script type="text/javascript">
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
</script>
<script type="text/javascript" >
$(function () {
	$("#okay").click(function () {
		var s1=$("select[name='stuyear']").val();
		var s2=$("select[name='stuterm']").val();
		var s3="<%=x%>";
		alert(s3);
	    $.ajax({
	        url: 'querygrade.do',  
	        type: 'POST',
	        data:{"stuyear":s1,"stuterm":s2,"username":s3},
	        success:function(data){
	        	var json=eval("("+data+")");
	        	var flag=0;
	        	var tableData =new Array(json.list.length);
	        	if(tableData==0)
	        	{
	        		alert("无成绩");
	        		return;
	        	}
	        	for(var i in json.list)
	        	{
	        		var arrary = new Array(5);
	        		arrary[0]=json.list[i].stuyear;
	        		arrary[1]=json.list[i].stuterm;
	        		arrary[2]=json.list[i].courname;
	        		arrary[3]=json.list[i].courgrade;
	        		arrary[4]=json.list[i].courpoint;
	        		tableData[i]=arrary;
	        		//$("tbody").append(tr);
	        	}
	        	$('#dataTables-example').dataTable().fnClearTable();
	        	$('#dataTables-example').dataTable().fnAddData(tableData);
	        }
	    })
	    });
	});
</script>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=<%=x1 %> >首页</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="login.jsp" class="btn btn-danger square-btn-adjust">登出</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					 <li  >
                        <a   href=<%=x1 %>><i class="fa fa-square-o fa-3x"></i>通知界面</a>
                    </li>	
                    
                      <li  >
                        <a class="active-menu"  href=<%=x2 %>><i class="fa fa-table fa-3x"></i>成绩查询</a>
                    </li>
					 <li>
                        <a  href=<%=x3 %>><i class="fa fa-table fa-3x"></i>课程表查询</a>
                    </li>                   
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h3>欢迎使用成绩查询板块 </h3>
                       <div class="form-group">
                           <label>请分别选择学年和学期</label>
                           <form>
	                           <select class="form-control" name="stuyear" id="stuyear">
	                               <option>2013-2014</option>
	                               <option>2014-2015</option>
	                               <option>2015-2016</option>
	                               <option>2016-2017</option>
	                               <option>2017-2018</option>	                               
	                           </select>
	                           <br/>
	                           <select class="form-control" name="stuterm" id="stuterm">
	                               <option>1</option>
	                               <option>2</option>
	                               <option>3</option>                               
	                           </select>
	                           <br/>
	                           
                           </form>
                           	<input type="submit" id="okay" name="okay" value="okay">
                     </div>
                    </div>                   
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             成绩
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>学年</th>
                                            <th>学期</th>
                                            <th>课程名</th>
                                            <th>成绩</th>
                                            <th>积点</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dmc1">
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            
                <!-- /. ROW  -->
            
                <!-- /. ROW  -->
            
                <!-- /. ROW  -->
        </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
   
</body>
</html>
