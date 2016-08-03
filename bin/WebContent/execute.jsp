<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.ADB"%>
<%@ page import="com.example.entity.Device" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
	List<Device> devices = ADB.getDevices();
	request.setAttribute("devices", devices);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Execute</title>

	<link href="css/custom.css" rel="stylesheet" type="text/css">
	
    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/freelancer.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">Execute</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#device">Devices</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#wearable">Wearable</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#script">Upload script</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <Form Method="GET" Action="PythonUiAutomatorServlet" Enctype="Multipart/Form-Data">
	    <section id="device">
	        <div class="container">
	    		<!-- Team Members Row -->
		        <div class="row">
		            <div class="col-lg-12">
		                <h2 class="page-header">Our Devices</h2>
		            </div>
		            <c:forEach var="device" items="${devices}">
			            <div class="col-lg-4 col-sm-6 text-center">
			                <img class="img-circle img-responsive img-centered" src="http://placehold.it/200x200" alt="">
			                <h3><input type="checkbox" name=${ device.getModelAliasWithDash() } value=${ device.getSerialNum() } style="display:inline; margin:10px"/>${ device.getModelAlias() }</h3>
			                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
			            </div>
		            </c:forEach>
		        </div>
	        </div>
		</section>
		
		<section id="wearable">
			<div class="container">
			    <div class="col-lg-12">
			        <h2 class="page-header">Our Wearable</h2>
			    </div>
		    </div>
		</section>
		
		<section id="script">
			<div class="container">
			    <div class="col-lg-12">
			        <h2 class="page-header">Upload Script</h2>
			    </div>
			    <div class="col-lg-8 col-lg-offset-2 myFile btn btn-default btn-lg text-center">
			    	Upload File
	  				<input type="file" id="testscript" Name="testscript"/>
				</div>
		    </div>
		</section>
	    
	    <div class="col-lg-8 col-lg-offset-2 text-center">
	    	<div class="btn btn-default btn-lg">
	        	<Input Type="Submit" Name="build">Build
	        </div>
	    </div>
    </Form>
</body>
</html>