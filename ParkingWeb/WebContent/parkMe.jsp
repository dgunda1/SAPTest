<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Park In</title>
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
	padding-top: 30px;
}

#headdiv {
	width: 500px;
	height: 150px;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	margin-top: 100px;
	TEXT-ALIGN: center;
}
</style>
</head>
<body>
	<div id="headdiv">
		<h1>Park IN</h1>
	</div>
	<div id="homediv">
		<form method="POST" action='ParkingController' name="frmAddCar">
			<input type="hidden" name="action" id="action" value="parkIN" />
			<table align="center" border="0px">
				<tr>
					<td><label for="carNumber">Car Number:</label></td>
					<td><input type="text" class="form-control input-sm"
						id="carNumber" name="carNumber" placeholder="Enter car number" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ></td>
				</tr>
				<tr>
					<td><label for="type">Car Size:</label></td>
					<td>
						<!-- 					<input type="text" class="form-control input-sm" id="type" name="type"> -->
						<select class="form-control" id="type" name="type">
							<option value="10">Small</option>
							<option value="11">Medium</option>
							<option value="12">Large</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit"
							class="btn btn-primary input-sm">Submit</button></td>
				</tr>

			</table>
		</form>
		
	</div>
	<script type="text/javascript">
	$("#carNumber").on('keypress',function(){   
	    if($(this).val().length>=5){
	        alert("only 5 digit car number is allowed");
	        return false;
	    }
	});
	$('form').on('submit', function() {
	    // do validation here
	   if($("#carNumber").val().length >0)
		   return true;
		   else
	        return false;
	});
	</script>
</body>
</html>