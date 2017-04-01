<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Park ME</title>
<style type="text/css">
#homediv {
	width: 500px;
	height: 150px;
	background-color: gray;
	border-radius: 20px;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	PADDING: 20PX;
	TEXT-ALIGN: center;
	vertical-align: middle;
	padding-top: 50px;
}

#headdiv {
	width: 500px;
	height: 150px;
	position: absolute; top : 0; bottom : 0; left : 0; right : 0; margin :
	auto; margin-top : 100px;
	TEXT-ALIGN: center;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	margin-top: 100px;
}
</style>
</head>
<body>
	<div id="headdiv">
		<h1>Welcome to Park ME..!</h1>
	</div>
	<div id="homediv">

		<p>
			<a href="parkMe.jsp" class="btn btn-info btn-lg"> <span
				class="glyphicon glyphicon-log-in"></span> Park ME
			</a> <a href="checkOut.jsp" class="btn btn-info btn-lg"> <span
				class="glyphicon glyphicon-log-out"></span> Check out
			</a>
		</p>
		<span id="msgbox"></span>
		 
	</div>
	<script type="text/javascript">
	$(document).ready(function() { 
		var errormsg = "${park.errorMsg}";
		if(errormsg.length>1)
			{
			$("#msgbox").text(errormsg);
			$("#msgbox").css("color","red");
			}else
			{
			$("#msgbox").text("Your Parking ID"+ ${park.parkingNumber});
			$("#msgbox").css("color","green");
			}
	});
	</script>
</body>
</html>