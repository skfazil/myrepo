<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Event Service Provider View</title>
<meta name="viewport" content="width=700">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="css/non-responsive.css">
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<!-- Google Map API Key Source -->
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<!-- Google Map  Source -->
<script type="text/javascript" src="js/gmaps.js"></script>
<script type="text/javascript" src="js/customjs.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/jquery.mCustomScrollbar.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="css/datepicker.css">
<script src="js/customjs.js"></script>

<style type="text/css">
	.timeline_object {
		margin-top: 54px;
	}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('#myprofile').hide();
		
		//code to restrict right scroll in dates, when the dates are reached to their end
		var total_left=0;
        var click_count=0;
        var scroll_limit=32;
        var total_scroll=0;
        $(document).on('click','.carousel-control.right',function()
        { 
          if(total_scroll >= arrayLength){
          	$(this).attr("disabled","disabled");
          } else{
             total_left+=295;
             $(".carousel-caption1").css("margin-left",-total_left);
             click_count+=11;
             total_scroll=scroll_limit+click_count;
            
             return false;
          }
        });
        //Scroll right
        $(document).on('click','.carousel-control.left',function(){
         
         $(".carousel-control.right").attr("disabled",'enabled');
           if(total_left==0)
           return false;
            total_left-=295;
            console.log(total_left);
            $(".carousel-caption1").css("margin-left",-total_left);
             click_count-=11;
             total_scroll=scroll_limit+click_count;
             return false;
        });

	});
	 function getDatepick(){
		 $('#mydatePickerVal').datepicker({
				autoclose : true,
				format : "dd/mm/yyyy"
			});
		 $('#mydatePickerVal').datepicker('show');
	 }
	 function getMyProfileForm(){
 	    
	      	return false;
	        }
function getProfile() {
	$.ajax({

		type: "GET",
        url: "getEventAdminUserProfile.htm",
     
        success: function(data) {
        	var response=jQuery.parseJSON(data); 
        	var html='';
        	//alert(data);
        	
    		   $(response).each(function(i,res) {
    		//alert(res.userName);
    		
    		html+='<div class="form-group">';
				
			html+='<label for="inputEmail3" class="col-md-2 control-label">UserName</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="userName" value="'+res.userName+'" class="form-control" id="userName"  readonly="true" required="true">';
			html+='</div>';
            html+='</div>';
            html+='<input type="hidden" name="userId" value="'+res.userId+'" >';
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Password</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="password" name="password" value="'+res.password+'" class="form-control" id="mypassword" >';
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Confirm Password</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="password" name="confirmPassWord" value="'+res.confirmPassWord+'" class="form-control" id="confirmPassWord"  required="true">';
			html+='</div>';
            html+='</div>';	
             html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Title</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<select name="title" class="form-control"   >';
			if(res.title === 'Mr'){
				html+='<option value="'+res.title+'"  selected="selected">'+res.title+'</option>';
			}else{
				html+='<option value="'+res.title+'">Mr</option>';
			}
			
			if(res.title === 'Miss'){
				html+='<option value="'+res.title+'"  selected="selected">'+res.title+'</option>';
			}else{
				html+='<option value="Miss">Miss</option>';
			}
			
			if(res.title === 'Mrs'){
				html+='<option value="'+res.title+'"  selected="selected">'+res.title+'</option>';
			}else{
				html+='<option value="Mrs">Mrs</option>';
			}
		
			
			html+='</select>';
			html+='</div>';
            html+='</div>';	
           
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">First Name</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="firstName" value="'+res.firstName+'" class="form-control" id="inputEmail3"" >';
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Last Name</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="lastName" value="'+res.lastName+'" class="form-control" id="inputEmail3">';
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Street</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="streetName" value="'+res.streetName+'" class="form-control" id="inputEmail3"  >';
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Pincode</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="postalCode" value="'+res.postalCode+'" class="form-control" id="inputEmail3">';
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">City</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="city" value="'+res.city+'" class="form-control" id="inputEmail3"  >';
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Country</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<select name="country" class="form-control"  >';
			if(  res.country === 'USA'){
				html+='<option value="'+res.country+'" selected="selected">'+res.country+'</option>';
			}else{
				html+='<option value="USA">USA</option>';
			}
			
			if(  res.country === 'Germany'){
				html+='<option value="'+res.country+'" selected="selected">'+res.country+'</option>';
			}else{
				html+='<option value="Germany">Germany</option>';
			}
			
			if( res.country === 'UK'){
				html+='<option value="'+res.country+'" selected="selected">'+res.country+'</option>';
			}else{
				html+='<option value="UK">UK</option>';
			}
			
			if( res.country  === 'France'){
				html+='<option value="'+res.country+'" selected="selected">'+res.country+'</option>';
			}else{
				html+='<option value="France">France</option>';
			}
			
			if( res.country === 'Spain' ){
				html+='<option value="'+res.country+'" selected="selected">'+res.country+'</option>';
			}else{
				html+='<option value="Spain">Spain</option>';
			}
			
			if( res.country === 'Others'){
				html+='<option value="'+res.country+'" selected="selected">'+res.country+'</option>';
			}else{
				html+='<option value="Others">Others</option>';
			}
			
			html+='</select>';
			html+='</div>';
            html+='</div>';	
				html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Date Of Birth</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="dob" value="'+res.dob+'" class="form-control" id="mydatePickerVal" onclick="getDatepick()" >';
			html+='</div>';
            html+='</div>';	
			html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Email</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="email" value="'+res.email+'" class="form-control" id="inputEmail3" readonly="true">';
			html+='</div>';
            html+='</div>';	 
				html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Phone</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="phoneNumber" value="'+res.phoneNumber+'" class="form-control" id="inputEmail3" >';
			html+='</div>';
            html+='</div>';	 
			html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Language</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<select name="language" class="form-control" id="inputEmail3"  >';
			if('English' === res.language){
				html+='<option value="'+res.language+'" selected="selected">'+res.language+'</option>';
			}else{
				html+='<option value="English">English</option>';
			}
			if('Germany' === res.language){
				html+='<option value="'+res.language+'" selected="selected">'+res.language+'</option>';
			}else{
				html+='<option value="Germany">Germany</option>';				
			}
			if('Deutsche' === res.language){
				html+='<option value="'+res.language+'" selected="selected">'+res.language+'</option>';
			}else{
				html+='<option value="Deutsche">Deutsche</option>';				
			}
			
			html+='</select>';
			
			html+='</div>';
            html+='</div>';	
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Join Date</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<input type="text" name="dateJoin" value="'+res.dateJoin+'" class="form-control" id="inputEmail3" readonly="true" >';
			html+='</div>';
            html+='</div>';	 
            html+='<div class="form-group">';
			
			html+='<label for="inputEmail3" class="col-md-2 control-label">Notification Duration</label>';
			html+='<div class="col-sm-9 col-xs-12">';
			html+='<select name="notificationDuration" class="form-control" id="inputEmail3"  >';
			if(res.notificationDuration === '24 Hours'){
				html += '<option value="'+res.notificationDuration+'" selected="selected">'+res.notificationDuration+'</option>';
			}else{
				html+='<option value="24 Hours">24 Hours</option>';
			}
			if(res.notificationDuration === '48 Hours'){
				html += '<option value="'+res.notificationDuration+'" selected="selected">'+res.notificationDuration+'</option>';
			}else{
				html+='<option value="48 Hours">48 Hours</option>';
			}
			if(res.notificationDuration === '72 Hours'){
				html += '<option value="'+res.notificationDuration+'" selected="selected">'+res.notificationDuration+'</option>';
			}else{
				html+='<option value="72 Hours">72 Hours</option>';
			} 
			
			
			html+='</select>';
			
			html+='</div>';
            html+='</div>';	
				
			
    	});
		  
    		  
        	
        	   $('#myProfileFromAjax').html(html);
        	$('#myprofile').show();
        }
	});
}
	function getMyReservations() {
		//alert('response first::');
		$
				.ajax({
					url : "getMyEventReservations.htm",
					type : 'POST',
					success : function(data) {
						//alert('response second ::'+data);
						var response = jQuery.parseJSON(data);

						var html = '';
						$('#reservationHistory').empty();
						html += '<div class="reservation-data-section">';
						html += '<div class="col-xs-5 col-md-5">';
						html += '<strong>User Details</strong>';
						html += '</div>';
						html += '<div class="col-xs-5 col-md-5">';
						html += '<strong>Reservation Details</strong>';
						html += '</div>';
						html += '<div class="col-xs-2 col-md-2">';
						html += '</div>';
						html += '</div>';

						for (i in response) {
							//alert('response third::'+response[i].status);
							html += '<div class="reservation-data-section">';
							html += '<div class="col-xs-5 col-md-5">';
							html += '<p>';
							html += '<strong>' + response[i].userName
									+ '</strong><br />';
							html += response[i].email + '<br />';
							html += 'Ph : ' + response[i].eventOrgPhoneNumber
									+ '<br />';
							html += '</p>';
							html += '</div>';
							html += '<div class="col-xs-5 col-md-5">';
							html += '<p>';
							html += '<strong>EventOrganisationName:</strong> '
									+ response[i].eventOrgName + '<br / >';
							html += 'Reference No : '
									+ response[i].referenceNumber + '<br / >';
							html += 'Start Time : ' + response[i].checkInTime
									+ '<br / >';
							html += 'End Time : ' + response[i].checkOutTime
									+ '<br />';
							html += 'Period : ' + response[i].numberOfDays
									+ '<br / >';
							html += '</p>';
							html += '</div>';
							/* html += '<div class="col-xs-2 col-md-2">';
							html += '</div>';
							html += '</div>'; */
							if (response[i].status == 'active'
									&& response[i].arrived == false) {
								//alert('response third::+active false');
								html += '<div class="col-xs-2 col-md-2">';
								html += '<button class="btn btn-default btn-save bookingID" id="cancelBtn" type="button">';
								html += '<input type="hidden" id = "bookingId" value="'+response[i].reserveId+'"/>';
								html += 'Cancel';
								html += '</button>';

								html += '<button class="btn btn-default btn-success btn-change " type="button" id="changeBtn" onclick= "changeEventReservtn('
										+ response[i].reserveId
										+ ','
										+ response[i].referenceNumber + ')">';
								html += '<input type="hidden"  value="'+response[i].reserveId+'"/>';
								html += 'Change</button>';
								html += '</div>';
							} else if (response[i].status == 'active'
									&& response[i].arrived == true) {
								//alert('response third:: active true');
								html += '<div class="col-xs-2 col-md-2">';
								html += '<div class="flag_icon"><span class="glyphicon glyphicon-ok green" aria-hidden="true"></span></div>';
								html += '<div class="flag_icon">';
								html += '<button class="btn btn-default btn-icon" type="button">';
								html += '<span class="glyphicon glyphicon-trash arrivedResrvtn" aria-hidden="true">';
								html += '<input type="hidden" id="deleteBtn" value="'+response[i].reserveId+'"/>';
								html += '</span>';
								html += '</button>';
								html += '</div>';
								html += '</div>';
							} else if (response[i].status == 'cancel') {
								//alert('response third:: cancel');
								html += '<div class="col-xs-2 col-xs-2">';
								html += '<div class="flag_icon"><span class="red">Cancelled</span>';
								html += '</div>';

								html += '<div class="flag_icon">';
								html += '<button class="btn btn-default btn-icon" type="button">';
								html += '<span class="glyphicon glyphicon-trash notVisitedReservtn" aria-hidden="true">';
								html += '<input type="hidden" id="refNo" value="'+response[i].referenceNumber+'"/>';
								html += '<input type="hidden" id="resvId" value="'+response[i].reserveId+'"/>';
								html += '</span>';
								html += '</button>';
								html += '</div>';
								html += '</div>';
							} else if (response[i].status == 'not visited') {
								//alert('response third:: not visited');
								html += '<div class="col-xs-2 col-md-2">';
								html += '<div class="flag_icon"><span class="glyphicon glyphicon-minus red" aria-hidden="true"></span></div>';
								html += '<div class="flag_icon">';
								html += '<button class="btn btn-default btn-icon" type="button">';
								html += '<span class="glyphicon glyphicon-trash notVisitedReservtn" aria-hidden="true">';
								html += '<input type="hidden" id="refNo" value="'+response[i].referenceNumber+'"/>';
								html += '<input type="hidden" id="resvId" value="'+response[i].reserveId+'"/>';
								html += '</span>';
								html += '</button>';
								html += '</div>';
								html += '</div>';
							}
							html += '</div>';
						}
						//alert('hotelinfo');
						$
								.ajax({
									url : 'bookingEventHistory.htm',
									type : 'POST',
									success : function(data) {
										//alert('hotelinfo data' +data);
										var response = jQuery.parseJSON(data);
										for (i in response) {
											html += '<div class="reservation-data-section">';
											html += '<div class="col-xs-5 col-md-5">';
											html += '<p>';
											html += '<strong>'
													+ response[i].userName
													+ '</strong><br />';
											html += response[i].email
													+ '<br />';
											html += 'Ph : '
													+ response[i].phoneNumber
													+ '<br />';
											html += '<br />';
											html += '</p>';
											html += '</div>';
											html += '<div class="col-xs-5 col-md-5">';
											html += '<p>';
											html += '<strong>HotelName</strong> : '
													+ response[i].hotelName
													+ '<br / >';
											html += 'Reference Number: '
													+ response[i].reservationNumber
													+ '';
											html += '<br /> ';
											html += 'Category Name :'
													+ response[i].categoryName
													+ ', Room NO :'
													+ response[i].roomId + '';
											html += '<br /> ';
											html += 'Check In :'
													+ response[i].checkInDt
													+ '';
											html += '<br /> ';
											html += 'Check Out :'
													+ response[i].checkOutDt
													+ '';
											html += '<br /> ';
											html += 'Period :'
													+ response[i].numberOfDays
													+ ' Night(s)';
											html += '</p>';
											html += '</div>';

											if (response[i].status == 'active'
													&& response[i].arrivedVal == '0') {
												html += '<div class="col-xs-2 col-md-2">';
												html += '<button class="btn btn-default btn-save hotelBookingID" id="cancelBtn" type="button">';
												html += '<input type="hidden" id = "bookingId" value="'+response[i].bookingId+'"/>';
												html += 'Cancel';
												html += '</button>';

												html += '<button class="btn btn-default btn-success btn-change " type="button" id="changeBtn" onclick= "changeReservtn('
														+ response[i].bookingId
														+ ','
														+ response[i].reservationNumber
														+ ')">';
												html += '<input type="hidden"  value="'+response[i].bookingId+'"/>';
												html += 'Change</button>';
												html += '</div>';
											} else if (response[i].status == 'active'
													&& response[i].arrivedVal == '1') {
												html += '<div class="col-xs-2 col-md-2">';
												html += '<div class="flag_icon"><span class="glyphicon glyphicon-ok green" aria-hidden="true"></span></div>';
												html += '<div class="flag_icon">';
												html += '<button class="btn btn-default btn-icon" type="button">';
												html += '<span class="glyphicon glyphicon-trash arrivedHotelResrvtn" aria-hidden="true"></span>';
												html += '<input type="hidden" id="deleteBtn" value="'+response[i].bookingId+'"/>';
												html += '</button>';
												html += '</div>';
												html += '</div>';
											} else if (response[i].status == 'cancel') {
												html += '<div class="col-xs-2 col-xs-2">';
												html += '<div class="flag_icon"><span class="red">Cancelled</span>';
												html += '</div>';

												html += '<div class="flag_icon">';
												html += '<button class="btn btn-default btn-icon" type="button">';
												html += '<span class="glyphicon glyphicon-trash notVisitedReservtnHotel " aria-hidden="true">';
												html += '<input type="hidden" id="deleteBtn" value="'+response[i].bookingId+','+response[i].reservationNumber+'"/>';
												html += '</span>';
												html += '</button>';
												html += '</div>';
												html += '</div>';
											} else if (response[i].status == 'not visited') {
												html += '<div class="col-xs-2 col-md-2">';
												html += '<div class="flag_icon"><span class="glyphicon glyphicon-minus red" aria-hidden="true"></span></div>';
												html += '<div class="flag_icon">';
												html += '<button class="btn btn-default btn-icon" type="button">';
												html += '<span class="glyphicon glyphicon-trash notVisitedReservtnHotel" aria-hidden="true">';
												html += '<input type="hidden" id="deleteBtn" value="'+response[i].bookingId+','+response[i].reservationNumber+'"/>';
												html += '</span>';
												html += '</button>';
												html += '</div>';
												html += '</div>';
											}
											html += '</div>';
										}// for loop close.
										$('#reservationHistory').html(html);
										//$('#deleteReservtn_popUp').hide();
										//$('#myeventreservation_details').show();
									}//success close.
								});
						$('#reservationHistory').html(html);
						$('#deleteReservtn_popUp').hide();
						$('#myeventreservation_details').show();
					}
				});
	}

	jQuery(document).on('click', ".bookingID", function() {
		var bookingID = jQuery(this).find('input').val();

		$.ajax({
			url : 'cancelEventReservation.htm?bookingID=' + bookingID,
			type : 'POST',
			success : function(data) {
				getMyReservations();
				$('#statusInformtn').html(data);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.

	});

	jQuery(document).on('click', ".arrivedResrvtn", function() {
		var deleteRcrdId = jQuery(this).find('input').val();

		$.ajax({
			url : 'deleteEventReservation.htm?deleteRcrdId=' + deleteRcrdId,
			type : 'POST',
			success : function(data) {
				getMyReservations();
				$('#statusInformtn').html(data);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.

	});

	jQuery(document)
			.on(
					'click',
					".notVisitedReservtn",
					function() {
						var delteReservtnNum = $("#refNo").val();
						var deleteRcrdId = $("#resvId").val();
						var btnsDiv = '';
						var html = '';
						html += 'on clicking delete, reservation with reference number  '
								+ delteReservtnNum + ',  ';
						html += 'will be cleared from your reservation history.';
						$('#deleteReservtnText').html(html);

						btnsDiv += '<div class="form-group" style="padding: 10px;">';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="dltReservtn">';
						btnsDiv += '<input type="hidden" value="'+deleteRcrdId+'"/>';
						btnsDiv += 'Delete</button>';
						btnsDiv += '</div>';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="cancelReservationBtn">';
						//btnsDiv += '<input type="hidden" value="'+hotelId+'"/>';
						btnsDiv += 'Cancel</button>';
						btnsDiv += '</div>';
						btnsDiv += '</div>';
						$('#deleteAndCancelBtns').html(btnsDiv);

						$('#myeventreservation_details').hide();
						$('#deleteReservtn_popUp').show();
						document.getElementById('fade').style.display = 'block';

					});

	jQuery(document)
			.on(
					'click',
					".notVisitedReservtnHotel",
					function() {
						
						var deleteRcrdInfo = jQuery(this).find('input').val();
						var deleteArray = deleteRcrdInfo.split(',');
						var deleteRcrdId = deleteArray[0];//record Id 
						var delteReservtnNum = deleteArray[1];//reservation Num
						var btnsDiv = '';
						var html = '';
						html += 'on clicking delete, reservation with reference number  '
								+ delteReservtnNum + ',  ';
						html += 'will be cleared from your reservation history.';
						$('#deleteReservtnText').html(html);

						btnsDiv += '<div class="form-group" style="padding: 10px;">';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="dltHotelReservtn">';
						btnsDiv += '<input type="hidden" value="'+deleteRcrdId+'"/>';
						btnsDiv += 'Delete</button>';
						btnsDiv += '</div>';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="cancelReservationBtn">';
						//btnsDiv += '<input type="hidden" value="'+hotelId+'"/>';
						btnsDiv += 'Cancel</button>';
						btnsDiv += '</div>';
						btnsDiv += '</div>';
						$('#deleteAndCancelBtns').html(btnsDiv);

						$('#myeventreservation_details').hide();
						$('#deleteReservtn_popUp').show();
						document.getElementById('fade').style.display = 'block';

					});
	//dltReservtn
	jQuery(document).on('click', "#dltHotelReservtn", function() {
		var deleteRcrdId = jQuery(this).find('input').val();

		$.ajax({
			url : 'deleteReservation.htm?deleteRcrdId=' + deleteRcrdId,
			type : 'POST',
			success : function(data) {
				var statusInformtn = data;
				getMyReservations();
				$('#statusInformtn').html(statusInformtn);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.
	});
	//delete reservation. 
	jQuery(document).on('click', ".deleteHotelRecrdID", function() {
		var deleteRcrdId = jQuery(this).find('input').val();
		$.ajax({
			url : 'deleteReservation.htm?deleteRcrdId=' + deleteRcrdId,
			type : 'POST',
			success : function(data) {
				getMyReservations();
				$('#statusInformtn').html(data);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.
	});

	jQuery(document).on('click', ".arrivedHotelResrvtn", function() {
		var deleteRcrdId = jQuery(this).find('input').val();

		$.ajax({
			url : 'deleteReservation.htm?deleteRcrdId=' + deleteRcrdId,
			type : 'POST',
			success : function(data) {
				bookingHistry();
				$('#statusInformtn').html(data);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.

	});

	//cancel reservation.
	jQuery(document).on('click', ".hotelBookingID", function() {
		var bookingID = jQuery(this).find('input').val();

		$.ajax({
			url : 'cancelReservation.htm?bookingID=' + bookingID,
			type : 'POST',
			success : function(data) {
				getMyReservations();
				$('#statusInformtn').html(data);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.

	});
	function changeReservtn(bookingId, reservationNumber) {

		$
				.ajax({
					url : 'isSameHotel.htm?bookingId=' + bookingId,
					type : 'POST',
					success : function(data) {
						var hotelId = jQuery.parseJSON(data);

						var html = '';
						var btnsDiv = '';
						html += 'you are about to change your reservation : Reference number: '
								+ reservationNumber + ',  ';
						html += 'please on clicking on any available reservation field your current reservation will be ';
						html += 'transferred to selected reservation field after clicking on change button.';
						$('#changeReservtnText').html(html);

						btnsDiv += '<div class="form-group" style="padding: 10px;">';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="changeReservation">';
						btnsDiv += '<input type="hidden" value="'+hotelId+'"/>';
						btnsDiv += 'Change</button>';
						btnsDiv += '</div>';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="cancelReservationBtn">';
						//btnsDiv += '<input type="hidden" value="'+hotelId+'"/>';
						btnsDiv += 'Cancel</button>';
						btnsDiv += '</div>';
						btnsDiv += '</div>';
						$('#changeAndCancelBtns').html(btnsDiv);

						$('#myeventreservation_details').hide();
						$('#changeReservtn_popUp').show();
						document.getElementById('fade').style.display = 'block';

					}
				});
	}//changeReservtn close

	function changeEventReservtn(reserveId, referenceNumber) {
		$
				.ajax({
					url : 'isSameEventOrg.htm?bookingId=' + reserveId,
					type : 'POST',
					success : function(data) {
						var eventOrgId = jQuery.parseJSON(data);

						var html = '';
						var btnsDiv = '';
						html += 'you are about to change your reservation : Reference number: '
								+ referenceNumber + ',  ';
						html += 'please on clicking on any available reservation field your current reservation will be ';
						html += 'transferred to selected reservation field after clicking on change button.';
						$('#changeReservtnText').html(html);

						btnsDiv += '<div class="form-group" style="padding: 10px;">';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="changeEventReservation">';
						btnsDiv += '<input type="hidden" value="'+eventOrgId+'"/>';
						btnsDiv += 'Change</button>';
						btnsDiv += '</div>';

						btnsDiv += '<div class="col-sm-6" >';
						btnsDiv += '<button type="button" class="btn btn-default btn-save" id="cancelReservationBtn">';
						//btnsDiv += '<input type="hidden" value="'+hotelId+'"/>';
						btnsDiv += 'Cancel</button>';
						btnsDiv += '</div>';
						btnsDiv += '</div>';
						$('#changeAndCancelBtns').html(btnsDiv);

						$('#myeventreservation_details').hide();
						$('#changeReservtn_popUp').show();
						document.getElementById('fade').style.display = 'block';

					}
				});
	}

	jQuery(document).on('click', "#changeEventReservation", function() {
		var eventOrgId = jQuery(this).find('input').val();
		changeEventOrganisation(eventOrgId);
	});
	function changeEventOrganisation(eventOrgId) {
		document.location.href = "changeEvnetOrg.htm?eventOrgId=" + eventOrgId;
	}
	function changeHotel(hotelId) {
		document.location.href = "changeHotel.htm?hotelId=" + hotelId;
	}
	jQuery(document).on('click', "#changeReservation", function() {
		var hotelId = jQuery(this).find('input').val();
		changeHotel(hotelId);
	});

	/*   jQuery(document).on('click', "#cancelReservationBtn", function(){
	   document.location.href = "returnToServiceEvent.htm";

	  }); */

	//dltReservtn
	jQuery(document).on('click', "#dltReservtn", function() {
		var deleteRcrdId = jQuery(this).find('input').val();

		$.ajax({
			url : 'deleteEventReservation.htm?deleteRcrdId=' + deleteRcrdId,
			type : 'POST',
			success : function(data) {
				var statusInformtn = data;
				getMyReservations();
				$('#statusInformtn').html(statusInformtn);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.
	});

	//delete reservation. 
	jQuery(document).on('click', ".deleteRecrdID", function() {
		var deleteRcrdId = jQuery(this).find('input').val();
		$.ajax({
			url : 'deleteEventReservation.htm?deleteRcrdId=' + deleteRcrdId,
			type : 'POST',
			success : function(data) {
				getMyReservations();
				$('#statusInformtn').html(data);
				$('#statusInformtn').show().fadeOut(3000);
			}
		}); //ajax function close.
	});
</script>

<!-- whitelist and blacklist user script starts -->
<script>
	function getServiceWhiteList() {

		$.ajax({
			url : "getEventWhiteListCategoryCustmrs.htm",
			type : 'POST',
			success : function(data) {
				var response = jQuery.parseJSON(data);
				var html = '';
				$('#whitelistdetails').empty();
				for (i in response) {
					html += '<div class="col-xs-7 col-md-7">';
					html += '<p>';
					html += '<strong>Name of Restaurant</strong><br />';
					html += '' + response[i].hotelName + '';
					html += '<br />';
					html += '' + response[i].hotelAddress + ','
							+ response[i].city + '';
					html += '<br />';
					html += '' + response[i].phoneNumber + '';
					html += '<br />';
					html += '</p>';
					html += '</div>';
					html += '<div class="col-xs-5 col-md-5">';
					html += '<p>';
					html += 'Since : ' + response[i].startDate + '';
					html += '<br /> ';
					html += '</p>';
					html += '</div>';
				}
				$('#whitelistdetails').html(html);
				$('#mywhite_list').show();
			}

		});

	}
	function getServiceBlackList() {

		$.ajax({
			url : "getEventBlackListCategoryCustmrs.htm",
			type : 'POST',
			success : function(data) {
				var response = jQuery.parseJSON(data);
				var html = '';
				$('#blacklistdetails').empty();
				for (i in response) {
					html += '<div class="col-xs-7 col-md-7">';
					html += '<p>';
					html += '<strong>Name of Restaurant</strong><br />';
					html += '' + response[i].hotelName + '';
					html += '<br />';
					html += '' + response[i].hotelAddress + ','
							+ response[i].city + '';
					html += '<br />';
					html += '' + response[i].phoneNumber + '';
					html += '<br />';
					html += '</p>';
					html += '</div>';
					html += '<div class="col-xs-5 col-md-5">';
					html += '<p>';
					html += 'Since : ' + response[i].strtDate + '';
					html += '<br /> ';
					html += '</p>';
					html += '</div>';
				}
				$('#blacklistdetails').html(html);
				$('#myblack_list').show();
			}
		});

	}

	function getEmailVisible() {

		$
				.ajax({
					url : "getEventEmailListDet.htm",
					type : 'GET',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';
						$('#emailVisibleForm').empty();

						for (i in response) {
							html += '<div class="reservation-data-section">';
							html += '<div class="col-xs-5 col-md-5">';
							html += '<p>';
							html += '<strong>Name of Restaurant</strong><br />';
							html += '' + response[i].eventOrgName + '';
							html += '<br />';
							html += '' + response[i].eventOrgAddress + '';
							html += '<br />';
							html += '' + response[i].eventOrgPhoneNumber + ','
									+ response[i].eventOrgCity + ','
									+ response[i].eventOrgPostalCode + '';
							html += '<br />';

							html += '</p>';
							html += '</div>';
							html += '<div class="col-xs-4 col-md-4">';
							html += '<p>';
							html += 'Since : ' + response[i].strtDate + '';
							html += '<br /> ';
							html += '</p>';
							html += '</div>';

							html += '<div class="col-xs-3 col-md-3">';
							html += '<button class="btn btn-default" type="button" onclick="getStopSharing()"> Stop Sharing </button>';

							html += '</div>';
							html += '<br /> ';
							html += '</div>';

						}// for loop close.

						$('#emailVisibleForm').html(html);
						$('#myemail_list').show();
					}

				});
	}

	function getStopSharing() {

		$.ajax({
			url : "getEventOrgUpdateEmail.htm",
			type : 'GET',
			success : function(data) {
				var response = data;
				$('#emailreservation').empty();
				if (response.emailShare = "inactive") {
					$('#myemail_list').hide();
					$("#alertMsgPopUp3").show();
					$("#alertPopSpanId").empty();
					$("#alertPopSpanIdGreen").append(emailShare);
				} else {
					$('#myemail_list').show();
				}
			}
		});
	}

	function adminWhiteList() {
		//alert('admin whitelist');
		$('#whiteListInput').val('');
		$('#adminWhteLstExprtBtn').prop('enabled', true);

		$
				.ajax({
					url : 'eventWhiteListAdmin.htm',
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						//alert('admin whitelist'+response);
						var html = '';
						if (response == 'there is no Info about white customer exits in table') {
							alert('there is no Info about white customer exits in list');
						} else {

							for (i in response) {
								//alert('admin whitelist'+response[i].userId);
								if (response[i].userId != null) {
									html += '<div class="panel panel-default">';
									if (i == 0) {
										html += '<div class="panel-heading" role="tab" id="headingOne1">';
									} else {
										html += '<div class="panel-heading" role="tab" id="headingOne">';
									}
									html += '<h4 class="panel-title">';
									var colpse = 'collapse' + i;
									html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
									html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '
											+ response[i].userName + '';
									html += '</a>';

									html += '<a class="right btn btn-default rmveWhteCustmr" type="button" id="" style=" margin-left: 20px; margin-top: -10px;"  value="'+response[i].userId+'">';
									html += '<input type="hidden" value="'+response[i].userId+'"/>';
									html += 'Remove</a>';

									html += '<a class="right">'
											+ response[i].email + '</a>';
									html += '<a class="right" style="padding-right:20px;">'
											+ response[i].phoneNumber + '</a>';
									html += '</h4>';
									html += '</div>';
									if (i == 0) {
										html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';
									} else {
										html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
									}
									html += '<div class="panel-body">';
									html += '<div class="col-md-12">Since : '
											+ response[i].startDate + '</div>';
									html += '</div>';
									html += '</div>';
									html += '</div>';
								} else if (response[i].guestId != null) {

									html += '<div class="panel panel-default">';
									if (i == 0) {
										html += '<div class="panel-heading" role="tab" id="headingOne1">';
									} else {
										html += '<div class="panel-heading" role="tab" id="headingOne">';
									}
									html += '<h4 class="panel-title">';
									var colpse = 'collapse' + i;
									html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
									html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '
											+ response[i].userName + '';
									html += '</a>';

									html += '<a class="right btn btn-default rmveWhteGuestCustmr" style=" margin-left: 20px; margin-top: -10px;" value="'+response[i].guestId+'">';
									html += '<input type="hidden" value="'+response[i].guestId+'"/>';
									html += 'Remove</a>';

									html += '<a class="right">'
											+ response[i].email + '</a>';
									html += '<a class="right" style="padding-right:20px;">'
											+ response[i].phoneNumber + '</a>';
									html += '</h4>';
									html += '</div>';
									if (i == 0) {
										html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';
									} else {
										html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
									}
									html += '<div class="panel-body">';
									html += '<div class="col-md-12">Since : '
											+ response[i].startDate + '</div>';
									html += '</div>';
									html += '</div>';
									html += '</div>';

								}
							}
							$('#adminWhtLst').html(html);
							$('#admin_white_list').show();
							document.getElementById('fade').style.display = 'block';
						}

					}
				});
	}

	function adminBlackList() {

		$('#blckLstSearchInput').val('');
		$('#adminBlackLstExprtBtn').prop('enabled', true);

		$
				.ajax({
					url : 'eventBlackListAdmin.htm',
					type : 'POST',
					success : function(data) {
						//alert(data);
						var response = jQuery.parseJSON(data);

						if (response == 'there is no Info about black customer exits in list') {
							alert('there is no Info about white customer exits in list');

						} else {
							var html = '';
							for (i in response) {
								if (response[i].userId != null) {
									html += '<div class="panel panel-default">';
									if (i == 0) {
										html += '<div class="panel-heading" role="tab" id="headingOne1">';
									} else {
										html += '<div class="panel-heading" role="tab" id="headingOne">';
									}
									html += '<h4 class="panel-title">';
									var colpse = 'collaps' + i;
									html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
									html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '
											+ response[i].userName + '';
									html += '</a>';

									html += '<a class="right btn btn-default rmveBlackCustmr" style="margin-left: 20px;margin-top: -10px;" href="#" id="blckUsrId" value="'+response[i].userId+'">';
									html += '<input type="hidden" value="'+response[i].userId+'"/>';
									html += 'Remove</a>';

									html += '<a class="right">'
											+ response[i].email + '</a>';
									html += '<a class="right" style="padding-right:20px;">'
											+ response[i].phoneNumber + '</a>';
									html += '</h4>';
									html += '</div>';
									if (i == 0) {
										html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';
									} else {
										html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
									}
									html += '<div class="panel-body">';
									html += '<div class="col-md-6">Since : '
											+ response[i].strtDate + '</div>';
									html += '</div>';
									html += '</div>';
									html += '</div>';
									html += '</div>';
								} else if (response[i].guestId != null) {
									html += '<div class="panel panel-default">';
									if (i == 0) {
										html += '<div class="panel-heading" role="tab" id="headingOne1">';
									} else {
										html += '<div class="panel-heading" role="tab" id="headingOne">';
									}
									html += '<h4 class="panel-title">';
									var colpse = 'collaps' + i;
									html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
									html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '
											+ response[i].userName + '';
									html += '</a>';

									html += '<a class="right btn btn-default rmveBlackGuestCustmr" style="margin-left: 20px;margin-top: -10px;"  href="#"  id="blckGustUsrId" value="'+response[i].guestId+'">';
									html += '<input type="hidden" value="'+response[i].guestId+'"/>';
									html += 'Remove</a>';

									html += '<a class="right">'
											+ response[i].email + '</a>';
									html += '<a class="right" style="padding-right:20px;">'
											+ response[i].phoneNumber + '</a>';
									html += '</h4>';
									html += '</div>';
									if (i == 0) {
										html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';
									} else {
										html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
									}
									html += '<div class="panel-body">';
									html += '<div class="col-md-6">Since : '
											+ response[i].strtDate + '</div>';
									html += '</div>';
									html += '</div>';
									html += '</div>';
									html += '</div>';
								}
							}
							$('#blckCustmrsLst').html(html);
							$('#admin_black_list').show();
							document.getElementById('fade').style.display = 'block';
						}

					}
				});
	}


	function adminCustomerList() {
		$('#custmrName').val('');
		$('#custmtrLstExprtBtn').prop('enabled', true);
		$
				.ajax({
					url : 'eventCustmrList.htm',
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';
						for (i in response) {
							html += '<div class="panel panel-default staff-container">';
							html += '<div class="panel-heading" role="tab" id="headingOne">';
							if (i == 1) {
							}
							var colapse = 'collapse' + i;
							html += '<h4 class="panel-title">';
							html += ' <a data-toggle="collapse" data-parent="#accordion" class = "usrBookedRecrdId"  href="#'+colapse+'" aria-expanded="true" aria-controls="collapseOne" id="">';
							html += ' <input type="hidden" value="'+response[i].userId+','+colapse+'" id="customerName">';
							html += ' <span class="glyphicon glyphicon-user" aria-hidden="true">';
							html += '</span> ';
							html += '' + response[i].userName + '';
							html += '</a>';
							html += '<a class="right" id="mailId">';
							html += '' + response[i].email + '';
							html += '</a>';
							html += '<a class="right" style="padding-right:20px;" id="phneNumbr">';
							html += '' + response[i].phoneNumber + '';
							html += '</a>';
							html += '</h4>';
							html += '</div>';

							html += '</div>';
						}
						$('#custmrReservtnDataSection').html(html);
						$('#admin_customer_list').show();

						document.getElementById('fade').style.display = 'block';
					}
				});

	}
	function customerReservationList() {

		$('#custmrReservtnInputVal').val('');
		$('#CustmrResrvtnExprtBtn').prop('enabled', true);

		$
				.ajax({
					url : 'eventcustmrsBookingHistory.htm',
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';

						if (response == "there is no customer history exists for this hotel") {
							var msg = 'there is no customer history exists for this hotel';
							$('#adminReservtnMsg').html(msg);
							$('#adminReservtnMsgDiv').show().fadeOut(4000);
						} else {
							for (i in response) {

								if (response[i].userId != null) {
									html += '<div class="reservation-data-section" id="custmrRecord">';
									html += '<div class="col-xs-6 col-md-6" >';
									html += '<p>';
									html += '<strong>' + response[i].userName
											+ '</strong><br/>';
									html += '' + response[i].phoneNumber
											+ '<br/>';
									html += '' + response[i].email + '';
									html += '</p>';
									html += '</div>';

									html += '<div class="col-xs-6 col-md-6">';
									html += '<p>';
									html += '<strong>Event Name : '+response[i].eventName+'</strong></br>';
									html += 'Reference Number : ' + response[i].referenceNumber
											+ '<br/>';
									html += 'Start Time  : '
											+ response[i].startTime + '<br/>';
									html += 'End Time : ' + response[i].endTime
											+ '<br/>';
									html += 'Period : ' + response[i].duration
											+ ' Hour(s)';
									html += '</p>';
									html += '</div>';
									html += '</div>';
								} else {
									html += '<div class="reservation-data-section" id="guestRecord">';
									html += '<div class="col-xs-6 col-md-6" >';
									html += '<p>';
									html += '<strong>' + response[i].userName
											+ '</strong><br/>';
									html += '' + response[i].phoneNumber
											+ '<br/>';
									html += '' + response[i].email + '';
									html += '</p>';
									html += '</div>';

									html += '<div class="col-xs-6 col-md-6">';
									html += '<p>';
									html += '<strong>Event Name : '+response[i].eventName+'</strong></br>';
									html += 'Reference Number : ' + response[i].referenceNumber
									+ '<br/>';
									html += 'Start Time  : '
											+ response[i].startTime + '<br/>';
									html += 'End Time  : '
											+ response[i].endTime + '<br/>';
									html += 'Period : ' + response[i].duration
											+ ' Hour(s)';
									html += '</p>';
									html += '</div>';
									html += '</div>';
								}//else close.

							}//for function close.
							$('#custmrHstryRecrds').html(html);
							$('#admin_myreservation_details').show();
							document.getElementById('fade').style.display = 'block';
						}

					}
				});
	}
	function customerEmailList() {
		$('#custmrEmailLstExprtBtn').prop('enabled', true);
		$('#custmrEmailListId').val('');
		$
				.ajax({
					url : 'eventAdminCustmrList.htm',
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';
						for (i in response) {
							html += '<div class="col-md-12 listpad" id="custmrEmailList">';
							html += '<div class="col-md-4 nopadding">'
									+ response[i].userName + '</div>';
							html += '<div class="col-md-4">'
									+ response[i].email + '</div>';
							html += '<div class="col-md-4">'
									+ response[i].phoneNumber + '</div>';
							html += '</div>';
						}

						$('#custmrEmailList').html(html);
						$('#admin_email_list').show();
						document.getElementById('fade').style.display = 'block';
					}
				});
	}
</script>
<!-- whitelist and blacklist user script ends -->
<!-- guest event reservation validation -->
<script type="text/javascript">
	$(document).ready(function() {
		var validateGuestReservation = jQuery("#guestReservationForm").validate({
			rules : {
				userName : {
					required:true,minlength:3,maxlength:20,letters:true,
				},
				email : {
					required:true,
				},
				phone : {
					required:true,
					minlength:10,
					phoneFormat:true,
				},
				guestSelectedSeats : {
					min : 1,
				},
			},
			
			messages : {
				userName : "Username is required!",
				email : "Enter valid Email address!",
				phone : "Enter valid Phone Number!",
				guestSelectedSeats : "Select at least one seat!",
			},
			
			errorElement : "span",
			errorClass : "help-inline-error",
			submitHandler : function(form) {
				
				var userName = $("#guestUser").val();
				var email = $("#guestEmail").val();
				var phone = $("#guestPhone").val();
				var notes = $("#notes").val();
				var slctdSeats = $("#noOfSeats").val();

				var json = '{"userName":"' + userName + '","email":"' + email
						+ '","phone":"' + phone + '","slctdSeats":"' + slctdSeats
						+ '","notes":"' + notes + '","scheduleId":"' + globalScheduleId
						+ '","strtTime":"' + gStrtTme + '","endTime":"' + gEndTme
						+ '","duration":"' + gDuration + '","availSeats":"'
						+ gAvailSeats + '","eventName":"' + gEventName + '"}';
				
				var parseJson = JSON.parse(json);
				var duration = gDuration.slice(0, 1);
				
				$.ajax({
							url : "saveGuestReservation.htm",
							type : 'POST',
							data : {
								json : json
							},
							success : function(data) {
								var response = jQuery.parseJSON(data);
								var html1 = '';
								var html2 = '';
								var html3 = '';

								html1 += '<div class="col-xs-12">';
								html1 += '<div class="alert alert-success" role="alert" style="padding:5px 12px;margin-bottom:5px;">';
								html1 += '<strong><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span> Success!</strong> You successfully made reservation. </div>';
								html1 += '<p class="center">Reference Number : <b>'
										+ response + '</b></p></div>';

								html2 += '<div class="col-xs-1">';
								html2 += '<span class="glyphicon glyphicon-time" aria-hidden="true"></span></div>';
								html2 += '<div class="col-xs-11"><p>';
								html2 += gStrtTme + '<br />';
								html2 += gEndTme;
								html2 += '<span style="float:right;">' + duration
										+ ' hours</span><br/>';
								html2 += slctdSeats + ' Seat(s)';
								html2 += '</p></div>';

								html3 += '<div class="col-xs-1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>';
								html3 += '<div class="col-xs-11"><p>';
								html3 += userName + ' <br/>';
								html3 += email + ' <br/>';
								html3 += '+' + phone + '</p></div>';

								$("#refConfirm").html(html1);
								$("#timeConfirm").html(html2);
								$("#userConfirm").html(html3);

								$("#myreservation").hide();
								$("#myreservation_confirm").show();
								document.getElementById('fade').style.display = 'block';

							}
						});
			}
		});
		
		$.validator.addMethod("phoneFormat",
			    function(value, element) {
			        return value.match(/^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/);
			    },
			    "Invalid format, valid formats are 123456789,(123).456.7899,(123)-456-7899");
		
		$.validator.addMethod("letters", function(value,element) {
			return this.optional(element) || value == value.match(/^[a-zA-Z0-9_]+$/);
		},"Letters and underscores only!");
	});
</script>
<!-- whitelist service side starts -->
<script>
	var currentDt;
	var arrLength;
	var globalScheduleId;
	var gStrtTme;
	var gEndTme;
	var gDuration;
	var gAvailSeats;
	var gEventName;
	var gEventId;
	var clickDt;
	var currDt;//this is date for dd-MM-yyyy format
	var deleteEntry = false;
	var clickedTime = '';
	var clickedEvent = '';
	var arrayLength = 0;

	//var selectSeats = 0;

	 $(document).ready(function(){
			 
				 
		 $('#adminWhiteList').click(function(){
	      		adminWhiteList();
	      	 });
		 
		 $('#whiteLstGOBtn').click(function(){
		
  		 var userName = $('#whiteListInput').val();
  		 
  		 $.ajax({
  			 url   : 'getEventWhitCustmrRecrd.htm?userName='+userName,
  			 type  : 'POST',
  			 success : function(data){
  				 var response = jQuery.parseJSON(data);
  				 var html = '';
  				 if(response.statusMsg == 'no customer exists in white list'){
  					 if(userName.length == 0){
  						//$('#adminWhteLstExprtBtn').prop('disabled', true);
  						var msg = 'please enter customer name';
  						$('#deleteWhteUsrStatusMsg').html(msg);
				 			$('#deleteWhteUsrStatusMsgDiv').show().fadeOut(4000);
				 			$('#whiteListInput').val('');
				 			adminWhiteList();
				 			$('#adminWhtLst').show();
  					 }else{
  						$('#adminWhteLstExprtBtn').prop('disabled', true);
  						 var msg = 'no customer exists in white list';
  						$('#deleteWhteUsrStatusMsg').html(msg);
				 			$('#deleteWhteUsrStatusMsgDiv').show().fadeOut(4000);
				 			$('#whiteListInput').val('');
				 			$('#adminWhtLst').hide();
  					 }
  					 event.preventdefault();
  				 }else{
  					if(response.userId != null){
  						html += '<div class="panel panel-default">';
  						if(i ==0){
  							html += '<div class="panel-heading" role="tab" id="headingOne1">';
  						}else{
  							html += '<div class="panel-heading" role="tab" id="headingOne">';
  						}
      					html += '<h4 class="panel-title">';
      					var colpse = 'collapse'+i;
      					html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
      					html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '+response.userName+'';
      					html += '</a>';
      					
      					html += '<a class="right btn btn-default rmveWhteCustmr" type="button" id="" style=" margin-left: 20px; margin-top: -10px;"  value="'+response.userId+'">';
      					html += '<input type="hidden" value="'+response.userId+'"/>';
      					html += 'Remove</a>';
      					
      					html += '<a class="right">'+response.email+'</a>';
      					html += '<a class="right" style="padding-right:20px;">'+response.phoneNumber+'</a>';
      					html += '</h4>';
      					html += '</div>';
      					if(i == 0){
      						html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';	
      					}else{
      						html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
      					}
      					html += '<div class="panel-body">';
      					html += '<div class="col-md-12">Since : '+response.startDate+'</div>';
      					html += '</div>';
      					html += '</div>';
      					html += '</div>';
  					}else if(response.guestId != null){
  						html += '<div class="panel panel-default">';
  						if(i ==0){
  							html += '<div class="panel-heading" role="tab" id="headingOne1">';
  						}else{
  							html += '<div class="panel-heading" role="tab" id="headingOne">';
  						}
      					html += '<h4 class="panel-title">';
      					var colpse = 'collapse'+i;
      					html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
      					html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '+response.userName+'';
      					html += '</a>';
      					
      					html += '<a class="right btn btn-default rmveWhteGuestCustmr" style=" margin-left: 20px; margin-top: -10px;" value="'+response.guestId+'">';
      					html += '<input type="hidden" value="'+response.guestId+'"/>';
      					html += 'Remove</a>';
      					
      					html += '<a class="right">'+response.email+'</a>';
      					html += '<a class="right" style="padding-right:20px;">'+response.phoneNumber+'</a>';
      					html += '</h4>';
      					html += '</div>';
      					if(i == 0){
      						html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';	
      					}else{
      						html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
      					}
      					html += '<div class="panel-body">';
      					html += '<div class="col-md-12">Since : '+response.startDate+'</div>';
      					html += '</div>';
      					html += '</div>';
      					html += '</div>';
  					}
  					
          				$('#adminWhtLst').html(html);
          				$('#adminWhtLst').show();
          				$('#admin_white_list').show();
  					
          				//enable Export Btn.
          				$('#adminWhteLstExprtBtn').prop('disabled', false);
  				 }
  				 
  			 }
  		 });
  	 });
		 
		 
		 jQuery(document).on('click', ".rmveWhteCustmr", function(){
      	 var userId = jQuery(this).find('input').val();
      	
      	 $.ajax({
      		url  : "removeEventWhteCustmrFrmLst.htm",
      		type : 'GET',
      		data : {userId:userId},
      		success : function(data){
      			if(data === 'true'){
      				var msg = 'customer has been deleted from white list';
      				$('#deleteWhteUsrStatusMsg').html(msg);
			 			$('#deleteWhteUsrStatusMsgDiv').show().fadeOut(4000);
			 			adminWhiteList();
      			}else{
      				var msg = 'customer has failed to deleted from white list';
      				$('#deleteWhteUsrStatusMsg').html(msg);
			 			$('#deleteWhteUsrStatusMsgDiv').show().fadeOut(4000);
			 			adminWhiteList();
      			}
      		}
      	 });
  	 });
		 
		 
		 jQuery(document).on('click', ".rmveWhteGuestCustmr", function(){
      	 var userId = jQuery(this).find('input').val();
      	// alert('user id'+userId);
      	 $.ajax({
          		url  : "removeEventWhteGuestUsrFrmLst.htm",
          		type : 'GET',
          		data : {userId:userId},
          		success : function(data){
          			if(data === 'true'){
          				var msg = 'customer has been deleted from white list';
          				$('#deleteWhteUsrStatusMsg').html(msg);
				 			$('#deleteWhteUsrStatusMsgDiv').show().fadeOut(4000);
				 			adminWhiteList();
          			}else{
          				var msg = 'customer has failed to deleted from white list';
          				$('#deleteWhteUsrStatusMsg').html(msg);
				 			$('#deleteWhteUsrStatusMsgDiv').show().fadeOut(4000);
				 			adminWhiteList();
          			}
          		}
          	 });
  	 });
		 
		 
		 $('#whteUsrCSVBtn').click(function(){
  		 var userName = $('#whiteListInput').val();
  		 if(userName !=''){
  			 document.location.href = "exportEventWhiteCustmrCSV.htm?userName="+userName;
	          	 }else{
	          		document.location.href = "exportAllEventWhiteCustmrCSV.htm";
	          	 }
  	 });
		 
		 

		 
			$('#adminBlckList').click(function(){
	       	 adminBlackList();
	        });
			
			 $('#blckGOBtn').click(function(){
	      		
	     		 var userName = $('#blckLstSearchInput').val();
	     		
	     		 $.ajax({
	     			url   : 'getEventBlackCustmrRecrd.htm?userName='+userName,
	     			type  : 'POST',
	     			success : function(data){
	     				//alert(data);
	     				var response =  jQuery.parseJSON(data);
	     				var html = '';
	     				if(response.statusMsg == 'no customer exists in black list'){
	     					if(userName.length == 0){
	     						//$('#adminBlackLstExprtBtn').prop('disabled', true);
	     						var msg = 'please enter customer name';
	     						$('#deleteBlackUsrStatusMsg').html(msg);
	     						$('#deleteBlackUsrStatusMsgDiv').show().fadeOut(4000);
	     						 adminBlackList();
	     						$('#blckCustmrsLst').show(); 
	     					}else{
	     						$('#adminBlackLstExprtBtn').prop('disabled', true);
	     						var msg = 'no customer exists in black list';
	     						$('#deleteBlackUsrStatusMsg').html(msg);
	     						$('#deleteBlackUsrStatusMsgDiv').show().fadeOut(4000);
	     						$('#blckLstSearchInput').val('');
	     						$('#blckCustmrsLst').hide(); 
	     					}
	     					 event.preventdefault();
	     				 }else{
	         				 if(response.userId  != null){
		         					html += '<div class="panel panel-default">';
	         						if(i ==0){
	         							html += '<div class="panel-heading" role="tab" id="headingOne1">';
	         						}else{
	         							html += '<div class="panel-heading" role="tab" id="headingOne">';
	         						}
	             					html += '<h4 class="panel-title">';
	             					var colpse = 'collaps'+i;
	             					html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
	             					html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '+response.userName+'';
	             					html += '</a>';
	             					
	             					html += '<a class="right btn btn-default rmveBlackCustmr" style="margin-left: 20px;margin-top: -10px;" href="#" id="blckUsrId" value="'+response.userId+'">';
	             					html += '<input type="hidden" value="'+response.userId+'"/>';
	             					html += 'Remove</a>';
	             					
	             					html += '<a class="right">'+response.email+'</a>';
	             					html += '<a class="right" style="padding-right:20px;">'+response.phoneNumber+'</a>';
	             					html += '</h4>';
	             					html += '</div>';
	             					if(i == 0){
	             						html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';	
	             					}else{
	             						html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
	             					}
	             					html += '<div class="panel-body">';
	             					html += '<div class="col-md-6">Since : '+response.strtDate+'</div>';
	             					html += '</div>';
	             					html += '</div>';
	             					html += '</div>';
	             					html += '</div>';
	         					 }else if(response.guestId != null) {
	         						 //alert('gust info'+response.guestId);
	         						html += '<div class="panel panel-default">';
	         						if(i ==0){
	         							html += '<div class="panel-heading" role="tab" id="headingOne1">';
	         						}else{
	         							html += '<div class="panel-heading" role="tab" id="headingOne">';
	         						}
	             					html += '<h4 class="panel-title">';
	             					var colpse = 'collaps'+i;
	             					html += '<a data-toggle="collapse" data-parent="#accordion1" href="#'+colpse+'" aria-expanded="true" aria-controls="collapseOne">';
	             					html += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '+response.userName+'';
	             					html += '</a>';
	             					
	             					html += '<a class="right btn btn-default rmveBlackGuestCustmr" style="margin-left: 20px;margin-top: -10px;"  href="#"  id="blckGustUsrId" value="'+response.guestId+'">';
	             					html += '<input type="hidden" value="'+response.guestId+'"/>';
	             					html += 'Remove</a>';
	             					
	             					html += '<a class="right">'+response.email+'</a>';
	             					html += '<a class="right" style="padding-right:20px;">'+response.phoneNumber+'</a>';
	             					html += '</h4>';
	             					html += '</div>';
	             					if(i == 0){
	             						html += '<div id="'+colpse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne1">';	
	             					}else{
	             						html += '<div id="'+colpse+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">';
	             					}
	             					html += '<div class="panel-body">';
	             					html += '<div class="col-md-6">Since : '+response.strtDate+'</div>';
	             					html += '</div>';
	             					html += '</div>';
	             					html += '</div>';
	             					html += '</div>';
	         					 }
	         				$('#blckCustmrsLst').html(html);
	         				$('#blckCustmrsLst').show(); 
	         				$('#admin_black_list').show(); 
	         				//enable Export Btn...
	         				$('#adminBlackLstExprtBtn').prop('disabled', false);
	     				 }
	     				
	     				
	     			}
	     			
	     		});
	     	 });
	     	 
	     	 $('#blckUsrCSVBtn').click(function(){
	     		var userName = $('#blckLstSearchInput').val();
	     		 if(userName !=''){
	     			document.location.href = "exportEventBlckCustmrCSV.htm?userName="+userName;
	          	 }else{
	          		document.location.href = "exportAllEventBlckCustmrCSV.htm";
	          	 }
	     	 });
	     	 
	     	jQuery(document).on('click', ".rmveBlackCustmr", function(){
	        	 var userId = jQuery(this).find('input').val();
	        	 
	        	 $.ajax({
	            		url   : 'removeEventBlackUser.htm',
	            		type  : 'GET',
	            		data  :  {userId:userId},
	            		success : function(data){
	            			if(data === 'true'){
	            				var msg = 'customer has been deleted from Black list';
	            				$('#deleteBlackUsrStatusMsg').html(msg);
					 			$('#deleteBlackUsrStatusMsgDiv').show().fadeOut(4000);
					 			adminBlackList();
	            			}else{
	            				var msg = 'customer has failed to deleted from Black list';
	            				$('#deleteBlackUsrStatusMsg').html(msg);
					 			$('#deleteBlackUsrStatusMsgDiv').show().fadeOut(4000);
					 			adminBlackList();
	            			}
	            		}
	        	});
	        	 
	    	});
	    	
	    	jQuery(document).on('click', ".rmveBlackGuestCustmr", function(){
	        	 var userId = jQuery(this).find('input').val();
	        	
	        	 $.ajax({
	        		url   : 'removeEventBlackGuestUser.htm',
	        		type  : 'GET',
	        		data  :  {userId:userId},
	        		success : function(data){
	        			
	        			if(data === 'true'){
	        				var msg = 'customer has been deleted from Black list';
	        				$('#deleteBlackUsrStatusMsg').html(msg);
				 			$('#deleteBlackUsrStatusMsgDiv').show().fadeOut(4000);
				 			adminBlackList();
	        			}else{
	        				var msg = 'customer has failed to deleted from Black list';
	        				$('#deleteBlackUsrStatusMsg').html(msg);
				 			$('#deleteBlackUsrStatusMsgDiv').show().fadeOut(4000);
				 			adminBlackList();
	        			}
	        			
	        		}
	        	 });
	    	});
			 

			 $('#custmrsEmailList').click(function(){
				 customerEmailList();
	         });
			 
			 
			 $('#custmrEmailListSearchBtn').click(function(){
	        	 
	         $('#custmrEmailLstExprtBtn').prop('disabled', false);
	        	 var custmrName = $('#custmrEmailListId').val();
	        	 $.ajax({
	        		url   : 'getEventCustomerInfo.htm?custmrName='+custmrName,
	        		type : 'POST',
	        		success : function(data){
	        			var response = jQuery.parseJSON(data);
	        			var html = '';
	        			
	        			if(response.status != "no record with this user name" ){
	        				html += '<div class="col-md-12 listpad" id="custmrEmailList">';
	        				html += '<div class="col-md-4 nopadding">'+response.userName+'</div>';
	            			html += '<div class="col-md-4">'+response.email+'</div>';
	            			html += '<div class="col-md-4">'+response.phoneNumber+'</div>';
	            			html += '</div>';
	            		
	            			$('#custmrEmailList').html(html);
	            			$('#custmrEmailList').show();
	            			$('#admin_email_list').show();
	        			}else{
	        				if(custmrName.lenght == 0 || custmrName == ''){
	        					var msg = 'please enter customer name to search';
	        					$('#adminEmailLstStatusMsg').html(msg);
	        					$('#adminEmailLstMsgStatusDiv').show().fadeOut(4000);
	        					customerEmailList();
	        					$('#custmrEmailList').show();
	        				}else{
	        					var msg  = "customer name is not in list";
	        					 $('#custmrEmailLstExprtBtn').prop('disabled', true);
	        					$('#adminEmailLstStatusMsg').html(msg);
	        					$('#adminEmailLstMsgStatusDiv').show().fadeOut(4000);
	        					$('#custmrEmailListId').val('');
	        					$('#custmrEmailList').hide();
	        				}
	        				
	        			}	
	        			
	        		}
	        	 });
	         });
			 
			   $('#custmrEmailCsvBtn').click(function(){
	          	 var custmrName = $('#custmrEmailListId').val();
	          	 //document.location.href = "exportEventCustmrEmailCSV.htm?un="+custmrName;
	          	 if(custmrName !=''){
	          		 document.location.href = "exportEventCustmrEmailCSV.htm?un="+custmrName;
	          	 }else{
	          		document.location.href = "exportAllEventCustmrEmailCSV.htm";
	          	 }
	          	 
	           });
			 
			   

				
			 $('#adminCustmrList').click(function(){
				 adminCustomerList();
	         });
			 
			 var userName = '';
	     	 $('#searchBtn').click(function(event){
	     		 var custmrName = $('#custmrName').val();
	     		$.ajax({
	     			url : 'getEventCustomerInfo.htm?custmrName='+custmrName,
	     			type : 'POST',
	     			success : function(data, status, xhr){
	     				var response = jQuery.parseJSON(data);
	     				if( response.status != "no record with this user name" ){
	     					var html = '';
	     					html += '<div class="panel panel-default staff-container">';
	        				html += '<div class="panel-heading" role="tab" id="headingOne">';
	        				
	        				var colapse = 'collapse'+i;
	        				html += '<h4 class="panel-title">';
	        				html += ' <a data-toggle="collapse" data-parent="#accordion" class = "usrBookedRecrdId"  href="#'+colapse+'" aria-expanded="true" aria-controls="collapseOne" >';
	        				html += ' <input type="hidden" value="'+response.userId+','+colapse+'" id="customerName">';
	        				html += ' <span class="glyphicon glyphicon-user" aria-hidden="true">';
	        				html += '</span> ';
	        				html += ''+response.userName+'';
	        				html += '</a>';
	        				html += '<a class="right" id="mailId">';
	        				html += ''+response.email+'';
	        				html += '</a>';
	        				html += '<a class="right" style="padding-right:20px;" id="phneNumbr">';
	        				html += ''+response.phoneNumber+'';
	        				html += '</a>';
	        				html += '</h4>';
	        				html += '</div>';
	        				
	        				html += '<div id="'+colapse+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">';
	        			    html += '<div class="panel-body" id="reservtn_toggle">';
	        			    
	        			    html += '</div>';
	        			    html += '</div>';
	        				
	        				html += '</div>';
	        				
	        			$('#custmrReservtnDataSection').html(html);
	        			$('#custmrReservtnDataSection').show();
	        			$('#admin_customer_list').show();
	        			$('#custmtrLstExprtBtn').prop('disabled', false);
	     				}else{
	     					var status  = "customer name is not in list";
	     					if(custmrName.length == 0){
	     						//$('#custmtrLstExprtBtn').prop('disabled', true);
	     						var msg = 'please enter customer name to search';
	     						
	     						$('#adminCustmrsMsg').html(msg);
					 			$('#adminCustmrsMsgDiv').show().fadeOut(4000);
					 			adminCustomerList();
					 			$('#custmrReservtnDataSection').show();
	     					}else{
	     						$('#custmtrLstExprtBtn').prop('disabled', true);
	     						$('#adminCustmrsMsg').html(status);
					 			$('#adminCustmrsMsgDiv').show().fadeOut(4000);
					 			$('#custmrName').val('');
					 			$('#custmrReservtnDataSection').hide();
	     					}
	         					
	     				}
	     			}
	     		});
	     	}); 
	     	 
	     	 $('#custmrLstCSV').click(function(){
	     		 var userName = $('#custmrName').val();
	     		
	     		if(userName !=''){
	     			 document.location.href = "exportEventCustomerLstCSV.htm?userName="+userName;
	          	 }else{
	          		document.location.href = "exportAllEventCustomerLstCSV.htm";
	          	 }
	     	 });
	     	 
	     	 
	     	  //sohowing customer reservation details on popup.
	         $('#custmrReservtns').click(function(){
	        	 customerReservationList();
	         });
	     	  
	         //customer reservation details search option.
	         $('#custmrReservtnGOBtn').click(function(){
	        	 var cstmrName = $('#custmrReservtnInputVal').val();
	        	
	        	 $.ajax({
	        		 url   : 'getEventsCustomerReservtnDetails.htm?cstmrName='+cstmrName,
	        		 type  : 'POST',
	        		 success : function(data){
	        			 var response = jQuery.parseJSON(data);
	        			 var html = '';
	        			 
	        			 if(response == 'user name is not exits in list'){
	        				 if(cstmrName.length == 0){
	        					// $('#CustmrResrvtnExprtBtn').prop('disabled', true);
	        					 var msg = 'please enter customer name to search';
	        					 $('#adminReservtnMsg').html(msg);
	        					 $('#adminReservtnMsgDiv').show().fadeOut(4000);
	        					 customerReservationList();
	        					 $('#custmrHstryRecrds').show();
	        				 }else{
	        					 $('#CustmrResrvtnExprtBtn').prop('disabled', true);
	        					 var msg = 'Customer name is not exists in list';
	        					 $('#adminReservtnMsg').html(msg);
	        					 $('#adminReservtnMsgDiv').show().fadeOut(4000);
	        					 $('#custmrReservtnInputVal').val('');
	        					 $('#custmrHstryRecrds').hide();
	        				 }
	        			 }else{
	        				 for(i in response){
	                				if(response[i].userId != null){
	                					html += '<div class="reservation-data-section" id="custmrRecord">';
		                				html += '<div class="col-xs-6 col-md-6" >';
		                				html += '<p>';
		                				html += '<strong>'+response[i].userName+'</strong><br/>';
		                				html += ''+response[i].phoneNumber+'<br/>';
		                				html += ''+response[i].email+'';
		                				html += '</p>';
		                				html += '</div>';
		                				
		                				html += '<div class="col-xs-6 col-md-6">';
		                				html += '<p>';
		                				html += '<strong>Event Name : '+response[i].eventName+'</strong></br>';
										html += 'Reference Number : ' + response[i].referenceNumber
												+ '<br/>';
		                				html += 'Start Time  : '+response[i].startTime+'<br/>';
		                				html += 'End Time : '+response[i].endTime+'<br/>';
		                				html += 'Period : '+ response[i].duration+' Hour(s)';
		                				html += '</p>';
		                				html += '</div>';
		                				html += '</div>';
	                				}else {
	                					html += '<div class="reservation-data-section" id="guestRecord">';
		                				html += '<div class="col-xs-6 col-md-6" >';
		                				html += '<p>';
		                				html += '<strong>'+response[i].userName+'</strong><br/>';
		                				html += ''+response[i].phoneNumber+'<br/>';
		                				html += ''+response[i].email+'';
		                				html += '</p>';
		                				html += '</div>';
		                				
		                				html += '<div class="col-xs-6 col-md-6">';
		                				html += '<p>';
		                				html += '<strong>Event Name : '+response[i].eventName+'</strong></br>';
										html += 'Reference Number : ' + response[i].referenceNumber
												+ '<br/>';
		                				html += 'Start Time  : '+response[i].startTime+'<br/>';
		                				html += 'End Time  : '+response[i].endTime+'<br/>';
		                				html += 'Period : '+response[i].duration+' Hour(s)';
		                				html += '</p>';
		                				html += '</div>';
		                				html += '</div>';
	                				}//else close.
	                				
	                			}//for function close.
	                			$('#custmrHstryRecrds').html(html);
	                			 $('#custmrHstryRecrds').show();
	                			$('#admin_myreservation_details').show();
	                			
	                			//enable Export Btn.
	                			$('#CustmrResrvtnExprtBtn').prop('disabled', false);
	        			 }
	        			 
	        		 }
	        	 });
	         });
	        
	         $('#custmrReservtnCSV').click(function(){
	        	var userName = $('#custmrReservtnInputVal').val();
	        	
	        	if(userName !=''){
	        		document.location.href = "exportEventCustmrReservntHstryCSV.htm?un="+userName;
	          	 }else{
	          		document.location.href = "exportAllEventCustmrReservntHstryCSV.htm";
	          	 }
	         });
	     	  

	 		$('#addToWhitLstCat').click(function(){
	     		 $('#roomNum').val('');
	     		 $.ajax({
	     			 url   : 'getEventAdminCatgryLst.htm',
	     			 type  : 'POST',
	     			 success : function(data){
	     				 var response = jQuery.parseJSON(data);
	     				 var html = '';
	     				 html +=  '<option value="0">Select Tour</option>';
	     				 for(i in response){
	     					 html += '<option value="'+response[i].eventId+'">'+response[i].eventName+'</option>'
	     				 }
	     				 $('#roomCategryLst').html(html);
	     				 $('#admin_addwhite_list').show();
	     				document.getElementById('fade').style.display='block';
	     			 }
	     		 });
	     	 });
	 		
	 		
	 		 $('#roomCategryLst').change(function() {
	 			
	      		 var catVal  = $('#roomCategryLst').val();
	      		 
	      		 $.ajax({
	      			url  : 'getEventAdminRoomsLst.htm?catVal='+catVal,
	      			type  : 'POST',
	      			success : function(data){
	      				var response = jQuery.parseJSON(data);
	      				console.log('jsonww :'+JSON.stringify(data));
	      				 
	      				  var html = '';
	      				  html +=  '<option value="0">Select Guide</option>';
	      				  for(i in response){
	      					html += '<option value="'+response[i].guideName+'">'+response[i].guideName+'</option>'
	      				 } 
	      				  $('#roomNum').html(html);
	      			}
	      		 });
	      	 });
	 		 
	 		 
	 		 
	 		 $('#adminAddBtn').click(function(){
	      		 var guideName = $('#roomNum').val();
	      		 var eventId  = $('#roomCategryLst').val();
	      		 $.ajax({
	      			 url   :  'addEventTOWhteLst.htm?eventId='+eventId+'&guideName='+guideName,
	      			 type  : 'POST',
	      			 success : function(data){
	      				 var response = data;
	      				 if(response == guideName){
	      					 var status = 'Event Guide : '+guideName+' added to white list category successfully';
	      					 $('#addRoomToWhteStstusMsg').html(status);
	      					 $('#addRoomToWhteStstusMsg').show().fadeOut(4000);
	      					
	      				 }
	      			 }
	      		 });
	      	 });

						$('#selectTour')
								.change(
										function() {
											clickedEvent = '';
											var eventId = $('#selectTour')
													.val();
											var frmtdDt = formatDate(clickDt);
											var html = '<option value="0">Select Guide</option>';
											if (parseInt(eventId) != 0) {
												availGuidesBsdOnTour(eventId);
											} else {
												$('#availGuides').html(html);
											}
											primaryDates(currDt);
											$('.timescale')
													.removeClass('green');

											//primaryDates(currDt);
											if (eventId == 0) {
												getEventWidget(clickDt);
											} else {
												getWidgetDataByEventGuide(
														frmtdDt, clickDt);
											}

										});

						//On guide change
						$('#availGuides').change(function() {
							var eventId = $('#selectTour').val();
							var frmtdDt = formatDate(clickDt);

							$('.timescale').removeClass('green');
							primaryDates(currDt);
							if (eventId == 0) {
								getEventWidget(clickDt);
							} else {
								getWidgetDataByEventGuide(frmtdDt, clickDt);
							}
						});
						
						jQuery(document).on('keypress','#seatCount', function(e) {
							if(e.which == 13 || ((e.which >= 48) && (e.which <= 57))) {
								
							}else {
								e.preventDefault();
							}
						});

						//on count value change
						$('#seatCount').change(function() {
							var eventId = $('#selectTour').val();
							var guideId = $('#availGuides').val();
							var clickedDt = currentDt;
							var frmtdDt = formatDate(clickedDt);
							var seatCount = $('#seatCount').val();
							if (seatCount == '') {
								seatCount = 0;
							}

							primaryDates(currDt);

						});

						//on pageload.
						currentDt = getCurrentDate();
						currDt = getCurrentDate().replace('/', '-');
						clickDt = currDt = currDt.replace('/', '-');
						selectTour();
						selectGuide();
						onLoad();
						getStrtAndEndTime();

					});//document.ready function close.

	function availGuidesBsdOnTour(tourVal) {
		$('#selectTour').val();

		$.ajax({
			url : 'getGuidesLst.htm?tourVal=' + tourVal,
			type : 'POST',
			success : function(data) {
				var html = '';
				var response = jQuery.parseJSON(data);

				html += '<option value="0">Select Guide</option>';
				for (i in response) {
					html += '<option value='+response[i].guideId+'>'
							+ response[i].guideName + '</option>';
				}

				$('#availGuides').html(html);
			}
		});

		//availGuides
	}

	function selectTour() {
		$
				.ajax({
					url : 'selectTour.htm',
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';
						var sEventId = parseInt(gEventId);
						html += '<option value="0">Select Tour</option>';
						for (i in response) {
							if (response[i].eventId == sEventId) {
								html += '<option value='+response[i].eventId+' selected>'
										+ response[i].eventName + '</option>';
							} else {
								html += '<option value='+response[i].eventId+'>'
										+ response[i].eventName + '</option>';
							}
						}
						$('#selectTour').html(html);

					}
				});
	}

	function selectGuide() {
		var html = '';
		html += '<option value="0">Select Guide</option>';
		$("#availGuides").html(html);
	}

	function getStrtAndEndTime() {

		var html = '';

		html += '<div class="cell timescale" id="zero"><span class="timevalue">00:00<input type="hidden" value="00:00" /></span></div>';
		html += '<div class="cell timescale" id="thirty"><span class="timevalue">00:30<input type="hidden" value="00:30" /></span></div>';
		html += '<div class="cell timescale" id="one"><span class="timevalue">01:00<input type="hidden" value="01:00" /></span></div>';
		html += '<div class="cell timescale" id="onethirty"><span class="timevalue">01:30<input type="hidden" value="01:30" /></span></div>';
		html += '<div class="cell timescale" id="two"><span class="timevalue">02:00<input type="hidden" value="02:00" /></span></div>';
		html += '<div class="cell timescale" id="twothirty"<span class="timevalue">02:30<input type="hidden" value="02:30" /></span></div>';
		html += '<div class="cell timescale" id="three"><span class="timevalue">03:00<input type="hidden" value="03:00" /></span></div>';
		html += '<div class="cell timescale" id="threethirty"><span class="timevalue">03:30<input type="hidden" value="03:30" /></span></div>';
		html += '<div class="cell timescale" id="four"><span class="timevalue">04:00<input type="hidden" value="04:00" /></span></div>';
		html += '<div class="cell timescale" id="fourthirty"><span class="timevalue">04:30<input type="hidden" value="04:30" /></span></div>';
		html += '<div class="cell timescale" id="five"><span class="timevalue">05:00<input type="hidden" value="05:00" /></span></div>';
		html += '<div class="cell timescale" id="fivethirty"><span class="timevalue">05:30<input type="hidden" value="05:30" /></span></div>';
		html += '<div class="cell timescale" id="six"><span class="timevalue">06:00<input type="hidden" value="06:00" /></span></div>';
		html += '<div class="cell timescale" id="sixthirty"><span class="timevalue">06:30<input type="hidden" value="06:30" /></span></div>';
		html += '<div class="cell timescale" id="seven"><span class="timevalue">07:00<input type="hidden" value="07:00" /></span></div>';
		html += '<div class="cell timescale" id="seventhirty"><span class="timevalue">07:30<input type="hidden" value="07:30" /></span></div>';
		html += '<div class="cell timescale" id="eight"><span class="timevalue">08:00<input type="hidden" value="08:00" /></span></div>';
		html += '<div class="cell timescale" id="eightthirty"><span class="timevalue">08:30<input type="hidden" value="08:30" /></span></div>';
		html += '<div class="cell timescale" id="nine"><span class="timevalue">09:00<input type="hidden" value="09:00" /></span></div>';
		html += '<div class="cell timescale" id="ninethirty"><span class="timevalue">09:30<input type="hidden" value="09:30" /></span></div>';
		html += '<div class="cell timescale" id="ten"><span class="timevalue">10:00<input type="hidden" value="10:00" /></span></div>';
		html += '<div class="cell timescale" id="tenthirty"><span class="timevalue">10:30<input type="hidden" value="10:30" /></span></div>';
		html += '<div class="cell timescale" id="eleven"><span class="timevalue">11:00<input type="hidden" value="11:00" /></span></div>';
		html += '<div class="cell timescale" id="eleventhirty"><span class="timevalue">11:30<input type="hidden" value="11:30" /></span></div>';
		html += '<div class="cell timescale" id="twelve"><span class="timevalue">12:00<input type="hidden" value="12:00" /></span></div>';
		html += '<div class="cell timescale" id="twelvethirty"><span class="timevalue">12:30<input type="hidden" value="12:30" /></span></div>';
		html += '<div class="cell timescale" id="thirteen"><span class="timevalue">13:00<input type="hidden" value="13:00" /></span></div>';
		html += '<div class="cell timescale" id="thirteenthirty"><span class="timevalue">13:30<input type="hidden" value="13:30" /></span></div>';
		html += '<div class="cell timescale" id="fourteen"><span class="timevalue">14:00<input type="hidden" value="14:00" /></span></div>';
		html += '<div class="cell timescale" id="fourteenthirty"><span class="timevalue">14:30<input type="hidden" value="14:30" /></span></div>';
		html += '<div class="cell timescale" id="fifteen"><span class="timevalue">15:00<input type="hidden" value="15:00" /></span></div>';
		html += '<div class="cell timescale" id="fifteenthirty"><span class="timevalue">15:30<input type="hidden" value="15:30" /></span></div>';
		html += '<div class="cell timescale" id="sixteen"><span class="timevalue">16:00<input type="hidden" value="16:00" /></span></div>';
		html += '<div class="cell timescale" id="sixteenthirty"><span class="timevalue">16:30<input type="hidden" value="16:30" /></span></div>';
		html += '<div class="cell timescale" id="seventeen"><span class="timevalue">17:00<input type="hidden" value="17:00" /></span></div>';
		html += '<div class="cell timescale" id="seventeenthirty"><span class="timevalue">17:30<input type="hidden" value="17:30" /></span></div>';
		html += '<div class="cell timescale" id="eighteen"><span class="timevalue">18:00<input type="hidden" value="18:00" /></span></div>';
		html += '<div class="cell timescale" id="eighteenthirty"><span class="timevalue">18:30<input type="hidden" value="18:30" /></span></div>';
		html += '<div class="cell timescale" id="nineteen"><span class="timevalue">19:00<input type="hidden" value="19:00" /></span></div>';
		html += '<div class="cell timescale" id="nineteenthirty"><span class="timevalue">19:30<input type="hidden" value="19:30" /></span></div>';
		html += '<div class="cell timescale" id="twenty"><span class="timevalue">20:00<input type="hidden" value="20:00" /></span></div>';
		html += '<div class="cell timescale" id="twentythirty"><span class="timevalue">20:30<input type="hidden" value="20:30" /></span></div>';
		html += '<div class="cell timescale" id="twentyone"><span class="timevalue">21:00<input type="hidden" value="21:00" /></span></div>';
		html += '<div class="cell timescale" id="twentyonethirty"><span class="timevalue">21:30<input type="hidden" value="21:30" /></span></div>';
		html += '<div class="cell timescale" id="twentytwo"><span class="timevalue">22:00<input type="hidden" value="22:00" /></span></div>';
		html += '<div class="cell timescale" id="twentytwothirty"><span class="timevalue">22:30<input type="hidden" value="22:30" /></span></div>';
		html += '<div class="cell timescale" id="twentythree"><span class="timevalue">23:00<input type="hidden" value="23:00" /></span></div>';
		html += '<div class="cell timescale" id="twentythreethirty"><span class="timevalue">23:30<input type="hidden" value="23:30" /></span></div>';

		$('#showStrtAndEndTimeDiv').html(html);

	}

	function getCurrentDate() {
		//current date
		var currentDate = new Date;
		var Day = currentDate.getDate();
		if (Day < 10) {
			Day = '0' + Day;
		} //end if
		var Month = currentDate.getMonth() + 1;
		if (Month < 10) {
			Month = '0' + Month;
		} //end if
		var Year = currentDate.getFullYear();
		var fullDate = Day + '/' + Month + '/' + Year;
		return fullDate;
	}

	function getEventReservedUsers(scheduleId) {
		$
				.ajax({
					url : "getEventReservedUsers.htm?scheduleId=" + scheduleId,
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';
						var list;
						for (key in response) {
							var parsedKey = JSON.parse(key);
							list = response[key];
							html += '<form class="form-horizontal">';
							html += '<div id="statusInfoDiv" align="center">';
							html += '<span id="statusInfoSpan" style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span></div>';
							html += '<div class="reservation-data-section">';
							html += '<div class="col-xs-1">';
							html += '<span class="glyphicon glyphicon-flag" aria-hidden="true"></span></div>';
							html += '<div class="col-xs-11">';
							html += '<p>';
							html += parsedKey.eventName + ' ('
									+ parsedKey.guideName + ') <br/>';
							html += parsedKey.evntStrtTme + '<br/>';
							html += parsedKey.evntEndTme;
							html += '</p></div></div>';
							var serial = 1;
							var count = 0;
							var reservedId;
							for (j in response[key]) {
								if (response[key][j].status == "active") {
									count++;
									reservedId = response[key][j].reserveId;
									html += '<div class="reservation-data-section">';
									html += '<div class="col-xs-1">'
											+ (serial++) + '</div>';
									html += '<div class="col-xs-8">';
									html += '<p>';
									html += response[key][j].email + '<br/>';
									html += '+' + response[key][j].phoneNumber
											+ '<br/>';
									html += 'Booked Seats : '
											+ response[key][j].noOfPeople
											+ '</p>';
									html += '<button type="button" class="btn btn-default btn-blank" id="whiteList" onclick="addToWhiteList('
											+ parsedKey.scheduleId
											+ ', '
											+ reservedId
											+ ')"><img src="images/whitelist.png" /></button>';
									html += '<button type="button" class="btn btn-default btn-blank" id="blackList" onclick="addToBlackList('
											+ parsedKey.scheduleId
											+ ', '
											+ reservedId
											+ ')"><img src="images/blacklist.png" /></button>';
									html += '<button type="button" class="btn btn-default btn-blank" id="isPaid" onclick="setPaid('
											+ parsedKey.scheduleId
											+ ', '
											+ reservedId
											+ ')"><img src="images/payment.png" /></button>';
									html += '<button type="button" class="btn btn-default btn-blank" id="isArrived" onclick="setArrived('
											+ parsedKey.scheduleId
											+ ', '
											+ reservedId
											+ ')"><img src="images/arrived.png" /></button>';
									html += '<textarea class="form-control" readonly="true" id="inputEmail3" rows="1">'
											+ response[key][j].notes
											+ '\</textarea>';
									html += '</div>';
									html += '<div class="col-xs-3">';
									html += '<button type="button" class="btn btn-default btn-xs btn-danger" title="Cancel Reservation" onclick="deleteReservation('
											+ parsedKey.scheduleId
											+ ', '
											+ reservedId + ')">X</button>';
									html += '</div></div>';
								}
							}
							html += '<div class="clearfix"></div>';
							html += '</form>';

						}

						if (deleteEntry == false && count == 0) {
							$("#noReservationsGreen").html(
									"No reservations found for this Schedule!");
							$("#noReservations").show();
							document.getElementById('fade').style.display = 'block';
						} else {
							$("#reservedList").html(html);
							$("#reservation_details").show();
							document.getElementById('fade').style.display = 'block';
							if (count == 0) {
								deleteEntry = false;
							}
						}

					}
				});
	}

	function addToWhiteList(scheduleId, reserveId) {

		$
				.ajax({
					url : "addToWhitelist.htm?reserveId=" + reserveId
							+ "&scheduleId=" + scheduleId,
					type : 'POST',
					success : function(status) {
						$
								.ajax({
									url : "getEventReservedUsers.htm?scheduleId="
											+ scheduleId,
									type : 'POST',
									success : function(data) {
										var response = jQuery.parseJSON(data);
										var html = '';
										var list;
										for (key in response) {
											var parsedKey = JSON.parse(key);
											list = response[key];
											html += '<form class="form-horizontal">';
											html += '<div id="statusInfoDiv" align="center">';
											html += '<span id="statusInfoSpan" style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span></div>';
											html += '<div class="reservation-data-section">';
											html += '<div class="col-xs-1">';
											html += '<span class="glyphicon glyphicon-flag" aria-hidden="true"></span></div>';
											html += '<div class="col-xs-11">';
											html += '<p>';
											html += parsedKey.eventName + ' ('
													+ parsedKey.guideName
													+ ') <br/>';
											html += parsedKey.evntStrtTme
													+ '<br/>';
											html += parsedKey.evntEndTme;
											html += '</p></div></div>';
											var serial = 1;
											var count = 0;
											var reservedId;
											for (j in response[key]) {
												if (response[key][j].status != "cancelled") {
													count++;
													reservedId = response[key][j].reserveId;
													html += '<div class="reservation-data-section">';
													html += '<div class="col-xs-1">'
															+ (serial++)
															+ '</div>';
													html += '<div class="col-xs-8">';
													html += '<p>';
													html += response[key][j].email
															+ '<br/>';
													html += '+'
															+ response[key][j].phoneNumber
															+ '<br/>';
													html += 'Booked Seats : '
															+ response[key][j].noOfPeople
															+ '</p>';
													html += '<button type="button" class="btn btn-default btn-blank" id="whiteList" onclick="addToWhiteList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/whitelist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="blackList" onclick="addToBlackList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/blacklist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isPaid" onclick="setPaid('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/payment.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isArrived" onclick="setArrived('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/arrived.png" /></button>';
													html += '<textarea class="form-control" readonly="true" id="inputEmail3" rows="1">'
															+ response[key][j].notes
															+ '\</textarea>';
													html += '</div>';
													html += '<div class="col-xs-3">';
													html += '<button type="button" class="btn btn-default btn-xs btn-danger" title="Cancel Reservation" onclick="deleteReservation('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')">X</button>';
													html += '</div></div>';
												}
											}
											html += '<div class="clearfix"></div>';
											html += '</form>';

										}

										if (count > 0) {
											$("#reservedList").html(html);
											$("#reservation_details").show();
											$("#statusInfoSpan").html(status);
											$("#statusInfoDiv").show().fadeOut(
													4000);
											document.getElementById('fade').style.display = 'block';
										} else {
											$("#noReservationsGreen")
													.html(
															"No reservations found for this Schedule!");
											$("#noReservations").show();
											document.getElementById('fade').style.display = 'block';
										}

									}
								});

					}
				});

	}

	function addToBlackList(scheduleId, reserveId) {

		$
				.ajax({
					url : "addToBlacklist.htm?reserveId=" + reserveId
							+ "&scheduleId=" + scheduleId,
					type : 'POST',
					success : function(status) {
						$
								.ajax({
									url : "getEventReservedUsers.htm?scheduleId="
											+ scheduleId,
									type : 'POST',
									success : function(data) {
										var response = jQuery.parseJSON(data);
										var html = '';
										var list;
										for (key in response) {
											var parsedKey = JSON.parse(key);
											list = response[key];
											html += '<form class="form-horizontal">';
											html += '<div id="statusInfoDiv" align="center">';
											html += '<span id="statusInfoSpan" style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span></div>';
											html += '<div class="reservation-data-section">';
											html += '<div class="col-xs-1">';
											html += '<span class="glyphicon glyphicon-flag" aria-hidden="true"></span></div>';
											html += '<div class="col-xs-11">';
											html += '<p>';
											html += parsedKey.eventName + ' ('
													+ parsedKey.guideName
													+ ') <br/>';
											html += parsedKey.evntStrtTme
													+ '<br/>';
											html += parsedKey.evntEndTme;
											html += '</p></div></div>';
											var serial = 1;
											var count = 0;
											var reservedId;
											for (j in response[key]) {
												if (response[key][j].status != "cancelled") {
													count++;
													reservedId = response[key][j].reserveId;
													html += '<div class="reservation-data-section">';
													html += '<div class="col-xs-1">'
															+ (serial++)
															+ '</div>';
													html += '<div class="col-xs-8">';
													html += '<p>';
													html += response[key][j].email
															+ '<br/>';
													html += '+'
															+ response[key][j].phoneNumber
															+ '<br/>';
													html += 'Booked Seats : '
															+ response[key][j].noOfPeople
															+ '</p>';
													html += '<button type="button" class="btn btn-default btn-blank" id="whiteList" onclick="addToWhiteList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/whitelist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="blackList" onclick="addToBlackList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/blacklist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isPaid" onclick="setPaid('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/payment.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isArrived" onclick="setArrived('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/arrived.png" /></button>';
													html += '<textarea class="form-control" readonly="true" id="inputEmail3" rows="1">'
															+ response[key][j].notes
															+ '\</textarea>';
													html += '</div>';
													html += '<div class="col-xs-3">';
													html += '<button type="button" class="btn btn-default btn-xs btn-danger" title="Cancel Reservation" onclick="deleteReservation('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')">X</button>';
													html += '</div></div>';
												}
											}
											html += '<div class="clearfix"></div>';
											html += '</form>';

										}

										if (count > 0) {
											$("#reservedList").html(html);
											$("#reservation_details").show();
											$("#statusInfoSpan").html(status);
											$("#statusInfoDiv").show().fadeOut(
													4000);
											document.getElementById('fade').style.display = 'block';
										} else {
											$("#noReservationsGreen")
													.html(
															"No reservations found for this Schedule!");
											$("#noReservations").show();
											document.getElementById('fade').style.display = 'block';
										}

									}
								});
					}
				});
	}

	function setPaid(scheduleId, reserveId) {

		$
				.ajax({
					url : "setPaid.htm?reserveId=" + reserveId,
					type : 'POST',
					success : function(status) {
						$
								.ajax({
									url : "getEventReservedUsers.htm?scheduleId="
											+ scheduleId,
									type : 'POST',
									success : function(data) {
										var response = jQuery.parseJSON(data);
										var html = '';
										var list;
										for (key in response) {
											var parsedKey = JSON.parse(key);
											list = response[key];
											html += '<form class="form-horizontal">';
											html += '<div id="statusInfoDiv" align="center">';
											html += '<span id="statusInfoSpan" style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span></div>';
											html += '<div class="reservation-data-section">';
											html += '<div class="col-xs-1">';
											html += '<span class="glyphicon glyphicon-flag" aria-hidden="true"></span></div>';
											html += '<div class="col-xs-11">';
											html += '<p>';
											html += parsedKey.eventName + ' ('
													+ parsedKey.guideName
													+ ') <br/>';
											html += parsedKey.evntStrtTme
													+ '<br/>';
											html += parsedKey.evntEndTme;
											html += '</p></div></div>';
											var serial = 1;
											var count = 0;
											var reservedId;
											for (j in response[key]) {
												if (response[key][j].status != "cancelled") {
													count++;
													reservedId = response[key][j].reserveId;
													html += '<div class="reservation-data-section">';
													html += '<div class="col-xs-1">'
															+ (serial++)
															+ '</div>';
													html += '<div class="col-xs-8">';
													html += '<p>';
													html += response[key][j].email
															+ '<br/>';
													html += '+'
															+ response[key][j].phoneNumber
															+ '<br/>';
													html += 'Booked Seats : '
															+ response[key][j].noOfPeople
															+ '</p>';
													html += '<button type="button" class="btn btn-default btn-blank" id="whiteList" onclick="addToWhiteList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/whitelist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="blackList" onclick="addToBlackList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/blacklist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isPaid" onclick="setPaid('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/payment.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isArrived" onclick="setArrived('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/arrived.png" /></button>';
													html += '<textarea class="form-control" readonly="true" id="inputEmail3" rows="1">'
															+ response[key][j].notes
															+ '\</textarea>';
													html += '</div>';
													html += '<div class="col-xs-3">';
													html += '<button type="button" class="btn btn-default btn-xs btn-danger" title="Cancel Reservation" onclick="deleteReservation('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')">X</button>';
													html += '</div></div>';
												}
											}
											html += '<div class="clearfix"></div>';
											html += '</form>';

										}

										if (count > 0) {
											$("#reservedList").html(html);
											$("#reservation_details").show();
											$("#statusInfoSpan").html(status);
											$("#statusInfoDiv").show().fadeOut(
													4000);
											document.getElementById('fade').style.display = 'block';
										} else {
											$("#noReservationsGreen")
													.html(
															"No reservations found for this Schedule!");
											$("#noReservations").show();
											document.getElementById('fade').style.display = 'block';
										}

									}
								});
					}
				});
	}

	function setArrived(scheduleId, reserveId) {

		$
				.ajax({
					url : "setArrived.htm?reserveId=" + reserveId,
					type : 'POST',
					success : function(status) {
						$
								.ajax({
									url : "getEventReservedUsers.htm?scheduleId="
											+ scheduleId,
									type : 'POST',
									success : function(data) {
										var response = jQuery.parseJSON(data);
										var html = '';
										var list;
										for (key in response) {
											var parsedKey = JSON.parse(key);
											list = response[key];
											html += '<form class="form-horizontal">';
											html += '<div id="statusInfoDiv" align="center">';
											html += '<span id="statusInfoSpan" style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span></div>';
											html += '<div class="reservation-data-section">';
											html += '<div class="col-xs-1">';
											html += '<span class="glyphicon glyphicon-flag" aria-hidden="true"></span></div>';
											html += '<div class="col-xs-11">';
											html += '<p>';
											html += parsedKey.eventName + ' ('
													+ parsedKey.guideName
													+ ') <br/>';
											html += parsedKey.evntStrtTme
													+ '<br/>';
											html += parsedKey.evntEndTme;
											html += '</p></div></div>';
											var serial = 1;
											var count = 0;
											var reservedId;
											for (j in response[key]) {
												if (response[key][j].status != "cancelled") {
													count++;
													reservedId = response[key][j].reserveId;
													html += '<div class="reservation-data-section">';
													html += '<div class="col-xs-1">'
															+ (serial++)
															+ '</div>';
													html += '<div class="col-xs-8">';
													html += '<p>';
													html += response[key][j].email
															+ '<br/>';
													html += '+'
															+ response[key][j].phoneNumber
															+ '<br/>';
													html += 'Booked Seats : '
															+ response[key][j].noOfPeople
															+ '</p>';
													html += '<button type="button" class="btn btn-default btn-blank" id="whiteList" onclick="addToWhiteList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/whitelist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="blackList" onclick="addToBlackList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/blacklist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isPaid" onclick="setPaid('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/payment.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isArrived" onclick="setArrived('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/arrived.png" /></button>';
													html += '<textarea class="form-control" readonly="true" id="inputEmail3" rows="1">'
															+ response[key][j].notes
															+ '\</textarea>';
													html += '</div>';
													html += '<div class="col-xs-3">';
													html += '<button type="button" class="btn btn-default btn-xs btn-danger" title="Cancel Reservation" onclick="deleteReservation('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')">X</button>';
													html += '</div></div>';
												}
											}
											html += '<div class="clearfix"></div>';
											html += '</form>';

										}

										if (count > 0) {
											$("#reservedList").html(html);
											$("#reservation_details").show();
											$("#statusInfoSpan").html(status);
											$("#statusInfoDiv").show().fadeOut(
													4000);
											document.getElementById('fade').style.display = 'block';
										} else {
											$("#noReservationsGreen")
													.html(
															"No reservations found for this Schedule!");
											$("#noReservations").show();
											document.getElementById('fade').style.display = 'block';
										}

									}
								});
					}
				});
	}

	function showReservationPopup(scheduleId) {

		$
				.ajax({
					url : "getEventReservedUsers.htm?scheduleId=" + scheduleId,
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var html = '';
						for (key in response) {
							var parsedKey = JSON.parse(key);
							globalScheduleId = parsedKey.scheduleId;
							gStrtTme = parsedKey.evntStrtTme;
							gEndTme = parsedKey.evntEndTme;
							gDuration = parsedKey.duration;
							gAvailSeats = parsedKey.availableSeats;
							gEventName = parsedKey.eventName;
							html += '<div class="col-xs-1">';
							html += '<span class="glyphicon glyphicon-time" aria-hidden="true"></span></div>';
							html += '<div class="col-xs-11"><p>';
							html += parsedKey.evntStrtTme + '<br />';
							html += parsedKey.evntEndTme + '</p></div>';
							html += '<div class="col-xs-1">';
							html += '<span class="glyphicons glyphicon-times" aria-hidden="true">#</span></div>';
							html += '<div class="col-xs-11">';
							html += '<p>' + parsedKey.eventName + '</p>';
							html += '<select class="form-control" id="noOfSeats" name="guestSelectedSeats">';
							html += '<option value="0">Select Seats</option>';
							var seats = getIncrementalArray(parsedKey.availableSeats);
							for (var i = 1; i <= seats.length; i++) {
								if (i < 10) {
									html += '<option value="'+i+'">&nbsp;&nbsp;'
											+ i + ' Seat(s)</option>';
								} else {
									html += '<option value="'+i+'">' + i
											+ ' Seat(s)</option>';
								}

							}
							html += '</select>';
							html += '<div id="seatsStatusDiv" align="center">';
							html += '<span id="seatsStatus" style="margin: 0px 100px 0px; color: red; font-weight: 600;"></span></div></div>';
						}

						$("#selectSeats").html(html);
						$("#myreservation").show();
						document.getElementById('fade').style.display = 'block';
					}
				});
	}

	function showReservationList() {
		var scheduleId = globalScheduleId;
		$('#myreservation').hide();
		getEventReservedUsers(scheduleId);
	}
	
	//validate user name
	 function validateUserName(userName) {
	   //var a = document.getElementById(txtPhone).value;
	   var filter = /^[A-Za-z0-9_]{3,20}$/;
	   if (filter.test(userName)) {
	    return true;
	   }else {
	    return false;
	    }
	   }

	function deleteReservation(scheduleId, reservedId) {
		deleteEntry = true;
		$
				.ajax({
					url : "cancelEvntReservation.htm?reserveId=" + reservedId,
					type : 'POST',
					success : function(status) {
						$
								.ajax({
									url : "getEventReservedUsers.htm?scheduleId="
											+ scheduleId,
									type : 'POST',
									success : function(data) {
										var response = jQuery.parseJSON(data);
										var html = '';
										var list;
										for (key in response) {
											var parsedKey = JSON.parse(key);
											list = response[key];
											html += '<form class="form-horizontal">';
											html += '<div id="statusInfoDiv" align="center">';
											html += '<span id="statusInfoSpan" style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span></div>';
											html += '<div class="reservation-data-section">';
											html += '<div class="col-xs-1">';
											html += '<span class="glyphicon glyphicon-flag" aria-hidden="true"></span></div>';
											html += '<div class="col-xs-11">';
											html += '<p>';
											html += parsedKey.eventName + ' ('
													+ parsedKey.guideName
													+ ') <br/>';
											html += parsedKey.evntStrtTme
													+ '<br/>';
											html += parsedKey.evntEndTme;
											html += '</p></div></div>';
											var serial = 1;
											var count = 0;
											var reservedId;
											for (j in response[key]) {
												if (response[key][j].status == "active") {
													count++;
													reservedId = response[key][j].reserveId;
													html += '<div class="reservation-data-section">';
													html += '<div class="col-xs-1">'
															+ (serial++)
															+ '</div>';
													html += '<div class="col-xs-8">';
													html += '<p>';
													html += response[key][j].email
															+ '<br/>';
													html += '+'
															+ response[key][j].phoneNumber
															+ '<br/>';
													html += 'Booked Seats : '
															+ response[key][j].noOfPeople
															+ '</p>';
													html += '<button type="button" class="btn btn-default btn-blank" id="whiteList" onclick="addToWhiteList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/whitelist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="blackList" onclick="addToBlackList('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/blacklist.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isPaid" onclick="setPaid('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/payment.png" /></button>';
													html += '<button type="button" class="btn btn-default btn-blank" id="isArrived" onclick="setArrived('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')"><img src="images/arrived.png" /></button>';
													html += '<textarea class="form-control" readonly="true" id="inputEmail3" rows="1">'
															+ response[key][j].notes
															+ '\</textarea>';
													html += '</div>';
													html += '<div class="col-xs-3">';
													html += '<button type="button" class="btn btn-default btn-xs btn-danger" title="Cancel Reservation" onclick="deleteReservation('
															+ parsedKey.scheduleId
															+ ', '
															+ reservedId
															+ ')">X</button>';
													html += '</div></div>';
												}
											}
											html += '<div class="clearfix"></div>';
											html += '</form>';

										}

										if (deleteEntry == false && count == 0) {
											$("#noReservationsGreen")
													.html(
															"No reservations found for this Schedule!");
											$("#noReservations").show();
											document.getElementById('fade').style.display = 'block';
										} else {
											$("#reservedList").html(html);
											$("#reservation_details").show();
											$("#statusInfoSpan").html(status);
											$("#statusInfoDiv").show().fadeOut(
													4000);
											document.getElementById('fade').style.display = 'block';
											if (count == 0) {
												deleteEntry = false;
											}
										}
									}
								});
					}
				});
	}

	function primaryDates(date) {
		var monthArray = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July',
				'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ];

		$
				.ajax({
					url : "getPrimaryDates.htm?date=" + date,
					type : 'POST',
					success : function(data) {
						var response = JSON.parse(data);
						var html = '';
						var seatCount = $('#seatCount').val();
						if (seatCount == '') {
							seatCount = 0;
						}
						var keys = Object.keys(response);
						arrayLength = keys.length;

						html += '<div class="piece">';
						html += '<div class="small_square">';

						var firstDate= null;
						for (var i = 0, key = Object.keys(response), ii = key.length; i < ii; i++) {
							/* if (i == 0 || i == 14) {
								var monthNum = key[i].slice(3, 5);
								monthNum = (monthNum - 1);
								jQuery.each(monthArray, function(i, mnthName) {
									if (monthNum == i) {
										html += '<span class="month_title">'
												+ mnthName + '</span>';
									}
								});
							} */
							
							if(currDt==key[i]) {
								var monthNum = key[i].slice(3, 5);
								monthNum = (monthNum - 1);
								jQuery.each(monthArray, function(i, mnthName) {
									if (monthNum == i) {
										html += '<span class="month_title">'
												+ mnthName + '</span>';
									}
								});
						
							}else if(date!=key[i]) {
								firstDate= key[i].slice(0,2);
							}
							
							if(firstDate==01) {
								var monthNum = key[i].slice(3, 5);
								monthNum = (monthNum - 1);
								jQuery.each(monthArray, function(i, mnthName) {
									if (monthNum == i) {
										html += '<span class="month_title">'
												+ mnthName + '</span>';
									}
								});
							}
							
							if(firstDate==15) {
								var monthNum = key[i].slice(3, 5);
								monthNum = (monthNum - 1);
								jQuery.each(monthArray, function(i, mnthName) {
									if (monthNum == i) {
										html += '<span class="month_title">'
												+ mnthName + '</span>';
									}
								});
							}
							
							var haveResrvtn = isHaveReservation(response[key[i]]);
							var minSeats = isHaveOneSeat(response[key[i]]);
							var countSeats = isHaveCountSeats(response[key[i]],
									seatCount);

							if (currDt == key[i]) {
								if(key[i] == clickDt) {
									html += '<span class="cal_date current_date mark_date hiddenSpan">'
										+ key[i].slice(0, 2) + '';
									html += '<input type = "hidden" value="'+key[i]+'" />';
									html += '</span>';
								}else {
									html += '<span class="cal_date current_date hiddenSpan">'
										+ key[i].slice(0, 2) + '';
									html += '<input type = "hidden" value="'+key[i]+'" />';
									html += '</span>';
								}
								
							} else if (haveResrvtn == true) {
								if(key[i] == clickDt){
									html += '<span class="cal_date loggedin mark_date hiddenSpan">'
										+ key[i].slice(0, 2) + '';
									html += '<input type = "hidden" value="'+key[i]+'" />';
									html += '</span>';
								}else {
									html += '<span class="cal_date loggedin hiddenSpan">'
										+ key[i].slice(0, 2) + '';
									html += '<input type = "hidden" value="'+key[i]+'" />';
									html += '</span>';
								}
								
							} else if (countSeats == true) {
								if (seatCount > 0) {
									if(key[i] == clickDt) {
										html += '<span class="cal_date green mark_date hiddenSpan">'
											+ key[i].slice(0, 2) + '';
										html += '<input type = "hidden" value="'+key[i]+'" />';
										html += '</span>';
									}else {
										html += '<span class="cal_date green hiddenSpan">'
											+ key[i].slice(0, 2) + '';
										html += '<input type = "hidden" value="'+key[i]+'" />';
										html += '</span>';
									}									
								} 
								
								else if((clickedTime != '') || (clickedEvent != '')){
									if((clickedTime != '') && (clickedEvent != '')) {
										var boolTimeEvent = haveScheduleForTimeEvent(response[key[i]],clickedTime,clickedEvent);
										if(boolTimeEvent == true){
											if(key[i] == clickDt) {
												html += '<span class="cal_date green mark_date hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}else {
												html += '<span class="cal_date green hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}											
										}else {
											if(key[i] == clickDt) {
												html += '<span class="cal_date mark_date hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}else {
												html += '<span class="cal_date hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}
										}
									}
									else if(clickedEvent != ''){
										var boolEvent = haveScheduleForEvent(response[key[i]],clickedEvent);
										if(boolEvent == true){
											if(key[i] == clickDt) {
												html += '<span class="cal_date green mark_date hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}else {
												html += '<span class="cal_date green hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}
											
										}else {
											if(key[i] == clickDt) {
												html += '<span class="cal_date mark_date hiddenSpan" >'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}else {
												html += '<span class="cal_date hiddenSpan" >'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}
											
										}
									}else if(clickedTime != ''){
										var boolTime = haveScheduleForTime(response[key[i]],clickedTime);
										if(boolTime == true){
											if(key[i] == clickDt) {
												html += '<span class="cal_date green mark_date hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}else {
												html += '<span class="cal_date green hiddenSpan">'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}
											
										}else {
											if(key[i] == clickDt) {
												html += '<span class="cal_date mark_date hiddenSpan" >'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}else {
												html += '<span class="cal_date hiddenSpan" >'
													+ key[i].slice(0, 2) + '';
												html += '<input type = "hidden" value="'+key[i]+'" />';
												html += '</span>';
											}											
										}
									}
								}
								
								else if (minSeats == true) {
									if(key[i] == clickDt) {
										html += '<span class="cal_date green mark_date hiddenSpan">'
											+ key[i].slice(0, 2) + '';
										html += '<input type = "hidden" value="'+key[i]+'" />';
										html += '</span>';
									}else {
										html += '<span class="cal_date green hiddenSpan">'
											+ key[i].slice(0, 2) + '';
										html += '<input type = "hidden" value="'+key[i]+'" />';
										html += '</span>';
									}									
								}else {
									if(key[i] == clickDt) {
										html += '<span class="cal_date mark_date hiddenSpan" >'
											+ key[i].slice(0, 2) + '';
										html += '<input type = "hidden" value="'+key[i]+'" />';
										html += '</span>';
									}else {
										html += '<span class="cal_date hiddenSpan" >'
											+ key[i].slice(0, 2) + '';
										html += '<input type = "hidden" value="'+key[i]+'" />';
										html += '</span>';
									}									
								}

							} else {
								if(key[i] == clickDt) {
									html += '<span class="cal_date mark_date hiddenSpan" >'
										+ key[i].slice(0, 2) + '';
									html += '<input type = "hidden" value="'+key[i]+'" />';
									html += '</span>';
								}else {
									html += '<span class="cal_date hiddenSpan" >'
										+ key[i].slice(0, 2) + '';
									html += '<input type = "hidden" value="'+key[i]+'" />';
									html += '</span>';
								}								
							}
						}
						html += '</div></div>';
						$("#datesListDiv").html(html);
					}
				});
	}

	function getEventWidget(date) {
		$
				.ajax({
					url : "getEventWidgetData.htm?date=" + date,
					type : 'POST',
					success : function(data) {
						var response = JSON.parse(data);
						var map = {
							'00:00' : 'zero',
							'00:30' : 'thirty',
							'01:00' : 'one',
							'01:30' : 'onethirty',
							'02:00' : 'two',
							'02:30' : 'twothirty',
							'03:00' : 'three',
							'03:30' : 'threethirty',
							'04:00' : 'four',
							'04:30' : 'fourthirty',
							'05:00' : 'five',
							'05:30' : 'fivethirty',
							'06:00' : 'six',
							'06:30' : 'sixthirty',
							'07:00' : 'seven',
							'07:30' : 'seventhirty',
							'08:00' : 'eight',
							'08:30' : 'eightthirty',
							'09:00' : 'nine',
							'09:30' : 'ninethirty',
							'10:00' : 'ten',
							'10:30' : 'tenthirty',
							'11:00' : 'eleven',
							'11:30' : 'eleventhirty',
							'12:00' : 'twelve',
							'12:30' : 'twelvethirty',
							'13:00' : 'thirteen',
							'13:30' : 'thirteenthirty',
							'14:00' : 'fourteen',
							'14:30' : 'fourteenthirty',
							'15:00' : 'fifteen',
							'15:30' : 'fifteenthirty',
							'16:00' : 'sixteen',
							'16:30' : 'sixteenthirty',
							'17:00' : 'seventeen',
							'17:30' : 'seventeenthirty',
							'18:00' : 'eighteen',
							'18:30' : 'eighteenthirty',
							'19:00' : 'nineteen',
							'19:30' : 'nineteenthirty',
							'20:00' : 'twenty',
							'20:30' : 'twentythirty',
							'21:00' : 'twentyone',
							'21:30' : 'twentyonethirty',
							'22:00' : 'twentytwo',
							'22:30' : 'twentytwothirty',
							'23:00' : 'twentythree',
							'23:30' : 'twentythreethirty'
						};

						var minEvent = {
							'00:00' : '',
							'00:30' : '',
							'01:00' : '',
							'01:30' : '',
							'02:00' : '',
							'02:30' : '',
							'03:00' : '',
							'03:30' : '',
							'04:00' : '',
							'04:30' : '',
							'05:00' : '',
							'05:30' : '',
							'06:00' : '',
							'06:30' : '',
							'07:00' : '',
							'07:30' : '',
							'08:00' : '',
							'08:30' : '',
							'09:00' : '',
							'09:30' : '',
							'10:00' : '',
							'10:30' : '',
							'11:00' : '',
							'11:30' : '',
							'12:00' : '',
							'12:30' : '',
							'13:00' : '',
							'13:30' : '',
							'14:00' : '',
							'14:30' : '',
							'15:00' : '',
							'15:30' : '',
							'16:00' : '',
							'16:30' : '',
							'17:00' : '',
							'17:30' : '',
							'18:00' : '',
							'18:30' : '',
							'19:00' : '',
							'19:30' : '',
							'20:00' : '',
							'20:30' : '',
							'21:00' : '',
							'21:30' : '',
							'22:00' : '',
							'22:30' : '',
							'23:00' : '',
							'23:30' : ''
						};

						var html = '';

						for (var i = 0, key = Object.keys(response), ii = key.length; i < ii; i++) {
							if (i < 4) {

								if (i == 0) {
									html += '<div class="item active">';
									html += '<div class="carousel-caption">';
								}
								
								if(clickedEvent == key[i]) {
									html += '<div class="col-xs-3 col-xs-3 col-xs-3 nopadding book_info">';
									html += '<div class="cell cell_byobject cell_header sticker mark_date hiddenEvent">';
									html += '<span><input type="hidden" value="'+key[i]+'" />'+key[i]+'</span></div>';
								}else {
									html += '<div class="col-xs-3 col-xs-3 col-xs-3 nopadding book_info">';
									html += '<div class="cell cell_byobject cell_header sticker hiddenEvent">';
									html += '<span><input type="hidden" value="'+key[i]+'" />'+key[i]+'</span></div>';
								}								

								for (var j = 0, jkeys = Object.keys(map), jj = jkeys.length; j < jj; j++) {
									var val = null;
									
									if((clickedTime != '') || (clickedEvent != '')) {
										if((clickedTime != '') && (clickedEvent != '')) {
											if(clickedEvent == key[i]) {
												if(clickedTime == jkeys[j]) {
													val = contains(response[clickedEvent],
															clickedTime);
													
												}
											}
										}else if(clickedEvent != '') {
											if(clickedEvent == key[i]) {
												val = contains(response[clickedEvent],
														jkeys[j]);
											}
										}else if(clickedTime != '') {
											if(clickedTime == jkeys[j]){
												val = contains(response[key[i]],
														clickedTime);
											}
										}
									}else {
										val = contains(response[key[i]],
												jkeys[j]);
									}
									
									if (val != null) {
										
										/* if(clickedTime == ''){
											minEvent[jkeys[j]] = val;
										} */
										minEvent[jkeys[j]] = val;
										
										if (val.availableSeats > 0) {
											html += '<div class="cell eventreserved-'+val.divCount+' booked">';
											html += '<p class="merge_padding">';
											html += '<a href="javascript:void(0)" onclick="showReservationPopup('
													+ val.scheduleId + ')">';
											if (val.availableSeats > 2) {
												html += '>2 <br/>'
														+ val.guideName
														+ '</a>';
											} else {
												html += val.availableSeats
														+ '<br/>'
														+ val.guideName
														+ '</a>';
											}
											html += '</p></div>';
										}

										else {
											html += '<div class="cell eventbooked-'+val.divCount+'">';
											html += '<div class="cell_event_addition-info">';
											if (val.haveNote == true) {
												html += '<span class="glyphicon glyphicon-pencil left" aria-hidden="true"></span>';
											}
											if (val.havePaid == true) {
												html += '<span class="glyphicon glyphicon-ok right" aria-hidden="true"></span>';
											}
											html += '</div>';
											html += '<p class="merge_padding">';
											html += '<a href ="javascript:void(0)"  onclick = "getEventReservedUsers('
													+ val.scheduleId + ')">';
											html += 'X <br/>';
											html += val.guideName;
											html += '</a>';
											html += '</p>';
											html += '</div>';
										}
										if (val.divCount > 1) {
											j = j + ((val.divCount) - 1);
										}
									} else {
										html += '<div class="cell storeclose"></div>';
									}
								}
								html += '</div>';

								if (i == 3) {
									html += '</div></div>';
								}
							}
							if (i >= 4 && i < 8) {

								if (i == 4) {
									html += '<div class="item">';
									html += '<div class="carousel-caption">';
								}

								if(clickedEvent == key[i]) {
									html += '<div class="col-xs-3 col-xs-3 col-xs-3 nopadding book_info">';
									html += '<div class="cell cell_byobject cell_header sticker mark_date hiddenEvent">';
									html += '<span><input type="hidden" value="'+key[i]+'" />'+key[i]+'</span></div>';
								}else {
									html += '<div class="col-xs-3 col-xs-3 col-xs-3 nopadding book_info">';
									html += '<div class="cell cell_byobject cell_header sticker hiddenEvent">';
									html += '<span><input type="hidden" value="'+key[i]+'" />'+key[i]+'</span></div>';
								}

								for (var j = 0, jkeys = Object.keys(map), jj = jkeys.length; j < jj; j++) {
									var val = null;
									
									if((clickedTime != '') || (clickedEvent != '')) {
										if((clickedTime != '') && (clickedEvent != '')) {
											if(clickedEvent == key[i]) {
												if(clickedTime == jkeys[j]) {
													val = contains(response[clickedEvent],
															clickedTime);
													
												}
											}
										}else if(clickedEvent != '') {
											if(clickedEvent == key[i]) {
												val = contains(response[clickedEvent],
														jkeys[j]);
											}
										}else if(clickedTime != '') {
											if(clickedTime == jkeys[j]){
												val = contains(response[key[i]],
														clickedTime);
											}
										}
									}else {
										val = contains(response[key[i]],
												jkeys[j]);
									}
									
									if (val != null) {
										
										/* if(clickedTime == ''){
											minEvent[jkeys[j]] = val;
										} */
										minEvent[jkeys[j]] = val;
										
										if (val.availableSeats > 0) {
											html += '<div class="cell eventreserved-'+val.divCount+' booked">';
											html += '<p class="merge_padding">';
											html += '<a href="javascript:void(0)" onclick="showReservationPopup('
													+ val.scheduleId + ')">';
											if (val.availableSeats > 2) {
												html += '>2 <br/>'
														+ val.guideName
														+ '</a>';
											} else {
												html += val.availableSeats
														+ '<br/>'
														+ val.guideName
														+ '</a>';
											}
											html += '</p></div>';

										} else {
											html += '<div class="cell eventbooked-'+val.divCount+'">';
											html += '<div class="cell_event_addition-info">';
											if (val.haveNote == true) {
												html += '<span class="glyphicon glyphicon-pencil left" aria-hidden="true"></span>';
											}
											if (val.havePaid == true) {
												html += '<span class="glyphicon glyphicon-ok right" aria-hidden="true"></span>';
											}
											html += '</div>';
											html += '<p class="merge_padding">';
											html += '<a href ="javascript:void(0)"  onclick = "getEventReservedUsers('
													+ val.scheduleId + ')">';
											html += 'X <br/>';
											html += val.guideName;
											html += '</a>';
											html += '</p>';
											html += '</div>';
										}
										if (val.divCount > 1) {
											j = j + ((val.divCount) - 1);
										}
									} else {
										html += '<div class="cell storeclose"></div>';
									}
								}
								html += '</div>';
							}
							if (i == key.length) {
								html += '</div></div>';
							}
						}
						for (keyVal in minEvent) {
							if (minEvent[keyVal] != '') {
								var id = '#' + map[keyVal];
								$(id).addClass("green");
							}
						}

						$("#dateButton").html(date);
						$("#carousalDatesLst").html(html);
						$('.ajax_loader_inner').removeClass();

					}
				});
	}

	//function to get the widget data
	function getWidgetDataByEventGuide(clickedDt, frmtdDt) {

		var eventId = $('#selectTour').val();
		var guideId = $('#availGuides').val();

		$
				.ajax({
					url : "loadDataByClickedDt.htm?clickedDt=" + clickedDt
							+ "&eventId=" + eventId + "&guideId=" + guideId,
					type : 'POST',
					success : function(data) {
						var response = jQuery.parseJSON(data);
						var k = 0;
						var map = {
							'00:00' : 'zero',
							'00:30' : 'thirty',
							'01:00' : 'one',
							'01:30' : 'onethirty',
							'02:00' : 'two',
							'02:30' : 'twothirty',
							'03:00' : 'three',
							'03:30' : 'threethirty',
							'04:00' : 'four',
							'04:30' : 'fourthirty',
							'05:00' : 'five',
							'05:30' : 'fivethirty',
							'06:00' : 'six',
							'06:30' : 'sixthirty',
							'07:00' : 'seven',
							'07:30' : 'seventhirty',
							'08:00' : 'eight',
							'08:30' : 'eightthirty',
							'09:00' : 'nine',
							'09:30' : 'ninethirty',
							'10:00' : 'ten',
							'10:30' : 'tenthirty',
							'11:00' : 'eleven',
							'11:30' : 'eleventhirty',
							'12:00' : 'twelve',
							'12:30' : 'twelvethirty',
							'13:00' : 'thirteen',
							'13:30' : 'thirteenthirty',
							'14:00' : 'fourteen',
							'14:30' : 'fourteenthirty',
							'15:00' : 'fifteen',
							'15:30' : 'fifteenthirty',
							'16:00' : 'sixteen',
							'16:30' : 'sixteenthirty',
							'17:00' : 'seventeen',
							'17:30' : 'seventeenthirty',
							'18:00' : 'eighteen',
							'18:30' : 'eighteenthirty',
							'19:00' : 'nineteen',
							'19:30' : 'nineteenthirty',
							'20:00' : 'twenty',
							'20:30' : 'twentythirty',
							'21:00' : 'twentyone',
							'21:30' : 'twentyonethirty',
							'22:00' : 'twentytwo',
							'22:30' : 'twentytwothirty',
							'23:00' : 'twentythree',
							'23:30' : 'twentythreethirty'
						};

						var minEvent = {
							'00:00' : '',
							'00:30' : '',
							'01:00' : '',
							'01:30' : '',
							'02:00' : '',
							'02:30' : '',
							'03:00' : '',
							'03:30' : '',
							'04:00' : '',
							'04:30' : '',
							'05:00' : '',
							'05:30' : '',
							'06:00' : '',
							'06:30' : '',
							'07:00' : '',
							'07:30' : '',
							'08:00' : '',
							'08:30' : '',
							'09:00' : '',
							'09:30' : '',
							'10:00' : '',
							'10:30' : '',
							'11:00' : '',
							'11:30' : '',
							'12:00' : '',
							'12:30' : '',
							'13:00' : '',
							'13:30' : '',
							'14:00' : '',
							'14:30' : '',
							'15:00' : '',
							'15:30' : '',
							'16:00' : '',
							'16:30' : '',
							'17:00' : '',
							'17:30' : '',
							'18:00' : '',
							'18:30' : '',
							'19:00' : '',
							'19:30' : '',
							'20:00' : '',
							'20:30' : '',
							'21:00' : '',
							'21:30' : '',
							'22:00' : '',
							'22:30' : '',
							'23:00' : '',
							'23:30' : ''
						};

						var monthArray = [ 'Jan', 'Feb', 'Mar', 'Apr', 'May',
								'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov',
								'Dec' ];

						var dateSet = Object.keys(response);
						var html2 = '';
						var count = 0;

						for (var i = 0, keys = Object.keys(response), ii = keys.length; i < ii; i++) {
							var list = response[keys[i]];
							if (i < 7) {
								if (i == 0) {
									html2 += '<div class="item active">';
									html2 += '<div class="carousel-caption">';
								}

								html2 += '<div class="col-xs-3 col-xs-3-dateline nopadding book_info">';
								html2 += '<div class="cell cell_header cell_byobject">'
										+ keys[i] + '</div>';

								for (var j = 0, jkeys = Object.keys(map), jj = jkeys.length; j < jj; j++) {
									var val = null;
									
									if(clickedTime != '') {
										if(clickedTime == jkeys[j]) {
											val = contains(response[keys[i]],
													clickedTime);
										}										
									}else {
										val = contains(response[keys[i]],
												jkeys[j]);
									}
									
									if (val != null) {
										
										/* if(clickedTime == ''){
											minEvent[jkeys[j]] = val;
										} */
										minEvent[jkeys[j]] = val;
										
										if (val.availableSeats > 0) {
											html2 += '<div class="cell eventreserved-'+val.divCount+' booked">';
											html2 += '<p class="merge_padding">';
											html2 += '<a href="javascript:void(0)" onclick = "showReservationPopup('
													+ val.scheduleId + ')">';
											if (val.availableSeats > 2) {
												html2 += '>2 <br/>'
														+ val.guideName
														+ '</a>';
											} else {
												html2 += val.availableSeats
														+ '<br/>'
														+ val.guideName
														+ '</a>';
											}
											html2 += '</p></div>';
										} else {
											html2 += '<div class="cell eventbooked-'+val.divCount+'">';
											html2 += '<div class="cell_event_addition-info">';
											if (val.haveNote == true) {
												html2 += '<span class="glyphicon glyphicon-pencil left" aria-hidden="true"></span>';
											}
											if (val.havePaid == true) {
												html2 += '<span class="glyphicon glyphicon-ok right" aria-hidden="true"></span>';
											}
											html2 += '</div>';
											html2 += '<p class="merge_padding">';
											html2 += '<a href ="javascript:void(0)"  onclick = "getEventReservedUsers('
													+ val.scheduleId + ')">';
											html2 += 'X <br/>';
											html2 += val.guideName;
											html2 += '</a>';
											html2 += '</p>';
											html2 += '</div>';
										}
										j = j + ((val.divCount) - 1);
									} else {
										html2 += '<div class="cell storeclose"></div>';
									}

								}
								html2 += '</div>';
							}

							if (i == 6) {
								html2 += '</div>';
								html2 += '</div>'; //item active close
							}

							if (i == 7) {
								html2 += '<div class="item">';
								html2 += '<div class="carousel-caption">';
							}

							if (i >= 7 && i < 14) {
								html2 += '<div class="col-xs-3 col-xs-3-dateline nopadding book_info">';
								html2 += '<div class="cell cell_header cell_byobject">'
										+ keys[i] + '</div>';

								for (var j = 0, jkeys = Object.keys(map), jj = jkeys.length; j < jj; j++) {
									var val = null;
									
									if(clickedTime != '') {
										if(clickedTime == jkeys[j]) {
											val = contains(response[keys[i]],
													clickedTime);
										}										
									}else {
										val = contains(response[keys[i]],
												jkeys[j]);
									}
									
									if (val != null) {
										
										/* if(clickedTime == ''){
											minEvent[jkeys[j]] = val;
										} */
										minEvent[jkeys[j]] = val;
										
										if (val.availableSeats > 0) {
											html2 += '<div class="cell eventreserved-'+val.divCount+' booked">';
											html2 += '<p class="merge_padding">';
											html2 += '<a href="javascript:void(0)" onclick="document.getElementById(\'myreservation\').style.display=\'block\';document.getElementById(\'fade\').style.display=\'block\'">';
											if (val.availableSeats > 2) {
												html2 += '>2 <br/>Guide 3</a>';
											} else {
												html2 += val.availableSeats
														+ '<br/>Guide 3</a>';
											}
											html2 += '</p></div>';
										} else {
											html2 += '<div class="cell eventbooked-'+val.divCount+'">';
											html2 += '<div class="cell_event_addition-info">';
											if (val.haveNote == true) {
												html2 += '<span class="glyphicon glyphicon-pencil left" aria-hidden="true"></span>';
											}
											if (val.havePaid == true) {
												html2 += '<span class="glyphicon glyphicon-ok right" aria-hidden="true"></span>';
											}
											html2 += '</div>';
											html2 += '<p class="merge_padding">';
											html2 += '<a href ="javascript:void(0)"  onclick = "getEventReservedUsers('
													+ val.scheduleId + ')">';
											html2 += 'X <br/>';
											html2 += 'Anmol';
											html2 += '</a>';
											html2 += '</p>';
											html2 += '</div>';
										}
										j = j + ((val.divCount) - 1);
									} else {
										html2 += '<div class="cell storeclose"></div>';
									}
								}
								html2 += '</div>';
							}
							if (i == keys.length) {
								html2 += '</div>';
								html2 += '</div>';
							}
						}
						for (keyVal in minEvent) {
							if (minEvent[keyVal] != '') {
								var id = '#' + map[keyVal];
								$(id).addClass("green");
							}
						}

						$('#dateButton').html(frmtdDt);
						$('#carousalDatesLst').html(html2);
						$('.ajax_loader_inner').removeClass();
					}
				});
	}

	function validatePhone(phneNum) {
		//var a = document.getElementById(txtPhone).value;
		var filter = /^[0-9-+]+$/;
		if (filter.test(phneNum)) {
			return true;
		} else {
			return false;
		}
	}

	function validateEmail(sEmail) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(sEmail)) {
			return true;
		} else {
			return false;
		}

	}

	function getIncrementalArray(noOfSeats) {
		var arr = new Array;
		for (var i = 1; i <= noOfSeats; i++) {
			arr.push((i));
		}
		return arr;
	}

	function isHaveReservation(arr) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].haveReservation == true) {
				return true;
			}
		}
		return false;
	}

	function isHaveOneSeat(arr) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].availableSeats > 0) {
				return true;
			}
		}
		return false;
	}

	function isHaveCountSeats(arr, seatCount) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].availableSeats >= seatCount) {
				return true;
			}
		}
		return false;
	}

	function contains(arr, str) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].evntStrtTme == str) {
				return arr[i];
			}
		}
		return null;
	}
	
	function haveScheduleForTimeEvent(arr,time,eventName) {
		for(var i=0;i<arr.length;i++) {
			if((arr[i].evntStrtTme == time) && (arr[i].eventName == eventName) && (arr[i].availableSeats > 0)){
				return true;
			}
		}
		return false;
	}
	
	function haveScheduleForEvent(arr,eventName) {
		for(var i=0;i<arr.length;i++) {
			if((arr[i].eventName == eventName) && (arr[i].availableSeats > 0)){
				return true;
			}
		}
		return false;
	}
	
	function haveScheduleForTime(arr,time) {
		for(var i=0;i<arr.length;i++) {
			if((arr[i].evntStrtTme == time) && (arr[i].availableSeats > 0)){
				return true;
			}
		}
		return false;
	}

	function formatDate(date) {
		var frmtdDt = date.slice(0, 2) + "/" + date.slice(3, 5) + "/"
				+ date.slice(6, 10);
		return frmtdDt;
	}

	function isSeatsAvailable(arr, seatCount) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].availableSeats >= seatCount) {
				return true;
			}
		}
		return false;
	}
	
	function saveTheGuestReservation() {
		return false;
	}

	function onLoad() {
		clickedTime = '';
		clickedEvent = '';
		var eventId = $('#selectTour').val();
		if (eventId == null) {
			eventId = '0';
		}
		var clickedDt = currentDt;// in dd/MM/yyyy format

		var hDate = clickedDt.replace('/', '-');
		hDate = hDate.replace('/', '-');

		$('.timescale').removeClass('green');
		primaryDates(currDt);
		if (eventId == 0) {
			getEventWidget(hDate);
		} else {
			getWidgetDataByEventGuide(clickedDt, hDate);
		}
	}

	//on date click functionality-------------------------------
	jQuery(document).on('click', ".hiddenSpan", function() {
		var clickedDt = jQuery(this).find('input').val();
		clickDt = clickedDt;
		var frmtdDt = formatDate(clickedDt);
		var eventId = $('#selectTour').val();
		if (eventId == null) {
			eventId = '0';
		}
		primaryDates(currDt);
		$('.timescale').removeClass('green');
		if (eventId == 0) {
			getEventWidget(clickedDt);
		} else {
			getWidgetDataByEventGuide(frmtdDt, clickedDt);
		}

	});
	
	jQuery(document).on('click', ".timescale", function() {
		var selectedTime = jQuery(this).find('input').val();
		clickedTime = selectedTime;
		var frmtdDt = formatDate(clickDt);
		var eventId = $("#selectTour").val();
		primaryDates(currDt);
		$('.timescale').removeClass('green');
		if (eventId == 0) {
			getEventWidget(clickDt);
		} else {
			getWidgetDataByEventGuide(frmtdDt, clickDt);
		}
	});
	
	jQuery(document).on('click', ".hiddenEvent", function() {
		var selectedEvent = jQuery(this).find('input').val();
		clickedEvent = selectedEvent;
		primaryDates(currDt);
		$('.timescale').removeClass('green');
		getEventWidget(clickDt);		
	});

	function resetPage() {
		document.location.href = "returnToServiceEvent.htm";
	}
	
	jQuery(document).on('click',".hiddenDateButton",function() {
		selectTour();
		selectGuide();
		getEventWidget(clickDt);
		clickedTime = '';
		clickedEvent = '';
		$(".timescale").css("background","none");
		$("#seatCount").val('');		
		primaryDates(currDt);
	});
	
</script>


</head>
<div id="alertMsgPopUp" class="white_content"
	style="display: none; z-index: 999; width: 467px; margin: 0px -98px 0px;">
	<h3 align="center">Alert Message</h3>
	<a href="javascript:void(0)" class="close_popup"
		onclick="document.getElementById('alertMsgPopUp').style.display='none';document.getElementById('fade').style.display='none'">
		<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
	</a>
	<div style="padding: 20px 100px;">
		<span id="alertPopSpanIdRed" style="color: red; font-weight: bold;"></span>
		<span id="alertPopSpanIdGreen"
			style="color: green; font-weight: bold;"></span>
	</div>
</div>

<div id="noReservations" class="white_content"
	style="display: none; z-index: 1002; width: 467px; margin: 0px -98px 0px;">
	<h3 align="center">No Reservations!</h3>
	<a href="javascript:void(0)" class="close_popup"
		onclick="document.getElementById('noReservations').style.display='none';document.getElementById('fade').style.display='none'">
		<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
	</a>
	<div style="padding: 20px 100px;">
		<span id="noReservationsRed" style="color: red; font-weight: bold;"></span>
		<span id="noReservationsGreen"
			style="color: green; font-weight: bold;"></span>
	</div>
</div>
<div id="fade" class="black_overlay"></div>

<div id="alertMsgPopUp3" class="white_content"
	style="display: none; width: 467px; margin: 0px -98px 0px;">
	<h3 align="center">Alert Message</h3>
	<a href="javascript:void(0)" class="close_popup"
		onclick="document.getElementById('alertMsgPopUp3').style.display='none';document.getElementById('fade').style.display='none'">
		<!-- 	onclick="document.getElementById('alertMsgPopUp').style.display='none';document.getElementById('fade').style.display='none'"> -->
		<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
	</a>

	<!-- popup for showing avalable hotels  -->
	<div style="padding: 20px 100px;">
		<span id="alertPopSpanIdRed" style="color: red; font-weight: bold;"></span>
		<span id="alertPopSpanIdGreen"
			style="color: green; font-weight: bold;"></span>
		<div style="padding: 20px 100px;">
			<span id="alertPopSpanIdRed" style="color: red; font-weight: bold;"></span>
			<span id="alertPopSpanIdGreen"
				style="color: green; font-weight: bold;"></span>
		</div>

		<font size="3" color="green">email sharing is successfully
			stopped</font>

	</div>
</div>

<input type="hidden" value="${mode}" id="mode">
<body style="margin: 20px 0px;">
	<input type="hidden" id="orgName"
		value="${sessionScope.event.eventOrgName}" />
	<input type="hidden" id="orgAddress"
		value="${sessionScope.event.eventOrgAddress}" />
	<input type="hidden" id="orgPhone"
		value="${sessionScope.event.eventOrgPhoneNumber}" />
	<!-- Main COntents -->
	<div class="col-xs-12">
		<!-- widget starts -->
		<div class="col-xs-7 dummyfull">
			<div class="widget_wrapper">
				<!-------------------------------- MODAL Login --------------------------------------------->
				<div id="mylogin" class="white_content">
					<h3>Login Form</h3>
					<p class="center">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit,</p>
					<hr />
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('mylogin').style.display='none';document.getElementById('fade').style.display='none'">Close</a>
					<div style="padding: 0px 100px;">
						<form class="form-horizontal">
							<div class="form-group">
								<div class="col-xs-12">
									<input type="email" class="form-control" id="inputEmail3"
										placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<input type="email" class="form-control" id="inputEmail3"
										placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<button type="submit" class="btn btn-default btn-save">Log
										in</button>
								</div>
							</div>
						</form>
					</div>
					<p class="center already_register_tab">
						Sie haben Ihr passwort vergessen, <a href="#"
							onclick="document.getElementById('forgetpass').style.display='block';document.getElementById('mylogin').style.display='none'">klicken
							sie hier</a>
					</p>
					<div style="padding: 0px 30px 15px 30px;">
						<b>Not yet registered</b>
						<div class="checkbox">
							<label> <input type="checkbox"> Yes, I would like
								to register
							</label>
						</div>
						<ul class="register_note">
							<li>- Einmalige Registrierung für alle angeschlossen
								Anbieter</li>
							<li>- Übersciht aller vergangen und zukünftigen
								Reservierungen</li>
							<li>- Storno via one click</li>
							<li>- Sie entscheiden welcher Anieter Ihre E-mail Addresse
								Sehen kann</li>
							<li>- Hinweis bei Buchungüberlappungen</li>
						</ul>
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- MODAL Forget password --------------------------------------------->
				<div id="forgetpass" class="white_content">
					<h3>Forget Password</h3>
					<p class="center">Please Provide your registered Email Address</p>
					<hr />
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('forgetpass').style.display='none';document.getElementById('fade').style.display='none'">Close</a>
					<div style="padding: 0px 100px;">
						<form class="form-horizontal">
							<div class="form-group">
								<div class="col-xs-12">
									<input type="email" class="form-control" id="inputEmail3"
										placeholder="Email">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-12">
									<button type="submit" class="btn btn-default btn-save">Reset
										Password</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-- ------------------------------------   END   ---------------------------------------------->
				<!-------------------------------- REGISTRATION MODAL --------------------------------------------->
				<div id="myregistration" class="white_content">
					<h3>Registration</h3>
					<h4 class="center form-subtitle">Please Fill Up the Below
						Forms</h4>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('myregistration').style.display='none';document.getElementById('fade').style.display='none'">Close</a>
					<div style="padding: 0px">
						<form class="form-horizontal">
							<div class="form_scroller">
								<div class="form-group">
									<div class="col-xs-12">
										<select class="form-control" name="language">
											<option value="0">Select Language</option>
											<option value="0">English</option>
											<option value="0">Germany</option>
											<option value="0">Deutch</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="First Name">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="Last Name">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="email" class="form-control" id="inputEmail3"
											placeholder="Email Address">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="Contact Number">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="email" class="form-control" id="inputEmail3"
											placeholder="Username">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="password" class="form-control" id="inputEmail3"
											placeholder="Password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="password" class="form-control" id="inputEmail3"
											placeholder="Confirm Password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="password" class="form-control" id="inputEmail3"
											placeholder="Confirm Password">
									</div>
								</div>
							</div>
							<div style="padding: 0px 100px;">
								<div class="form-group">
									<div class="col-xs-12">
										<button type="submit" class="btn btn-default btn-save">Complete
											Registration</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<hr />
					<p style="padding: 0px 80px 15px 80px; font-size: 13px;">Durch
						klicken auf ‚ Registrieung abschließen‘ stimmen sie den
						Nutzungbedinungen und der Datenschutzerklärung von world of
						Reservation zu</p>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-- /End registration modal -->
				<!-- Contact data Modal-->
				<!-------------------------------- MYCONTACT DATA MODAL --------------------------------------------->
				<div id="mycontactdata" class="white_content">
					<h3>Contact Data</h3>
					<h4 class="center form-subtitle">Please Fill Up the Below
						Forms</h4>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('mycontactdata').style.display='none';document.getElementById('fade').style.display='none'">Close</a>
					<div style="padding: 0px">
						<form class="form-horizontal">
							<div class="form_scroller">
								<div class="form-group">
									<div class="col-xs-12">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="First Name">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="Last Name">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="email" class="form-control" id="inputEmail3"
											placeholder="Email Address">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="Contact Number">
									</div>
								</div>

							</div>
							<div style="padding: 0px 100px;">
								<div class="form-group">
									<div class="col-xs-12">
										<button type="submit" class="btn btn-default btn-save">
											Proceed as Guest<br /> Data will not be saved.
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<p class="center already_register_tab">
						Already Registered, <a href="#" id="link_login">Login Here</a>
					</p>
					<div style="padding: 0px 30px 15px 30px;">
						<b>Not yet registered</b>
						<div class="checkbox">
							<label> <input type="checkbox"> Yes, I would like
								to register
							</label>
						</div>
						<ul class="register_note">
							<li>- Einmalige Registrierung für alle angeschlossen
								Anbieter</li>
							<li>- Übersciht aller vergangen und zukünftigen
								Reservierungen</li>
							<li>- Storno via one click</li>
							<li>- Sie entscheiden welcher Anieter Ihre E-mail Addresse
								Sehen kann</li>
							<li>- Hinweis bei Buchungüberlappungen</li>
						</ul>
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-- /End contact data modal -->
				<!-------------------------------- -------------RESERVATION DATA DETAILS MODAL --------------------------------------------->
				<div id="reservation_details" class="white_content">
					<h3>Reservation Details</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="resetPage()"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="cancelStatusDiv">
						<b><span id="cancelStatusSpan"
							style="color: green; align: center"></b></span>
					</div>
					<div class="eventreservation_scroller" id="reservedList">
						<!-- <form class="form-horizontal">
					<div class="reservation-data-section">
					<div class="col-xs-1">
					<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
					</div>
					<div class="col-xs-11">
					<p>
					Couching Simone, Garrison (Laurer Backer)<br/>
					Donnerstag 14 julie, 2014 - 17:00<br/>
					Donnerstag 14 julie, 2014 - 21:00
					</p>
					</div>
					</div>
										<div class="reservation-data-section">
										<div class="col-xs-1">1</div>
										<div class="col-xs-8">
													<p>
													Davidadam@web.be<br/>
													+49-28372983893
													</p>
														<button class="btn btn-default btn-blank"><img src="images/whitelist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/blacklist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/payment.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/arrived.png" /></button>
														 <textarea class="form-control" id="inputEmail3" rows="1"></textarea>
										</div>
										<div class="col-xs-3">
											<button class="btn btn-default btn-xs btn-danger">X</button>
											<button class="btn btn-default  btn-xs btn-primary">Save</button>
										</div>
										</div>
										ends
										<div class="reservation-data-section">
										<div class="col-xs-1">2</div>
										<div class="col-xs-8">
													<p>
													Davidadam@web.be<br/>
													+49-28372983893
													</p>
														<button class="btn btn-default btn-blank"><img src="images/whitelist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/blacklist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/payment.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/arrived.png" /></button>
														 <textarea class="form-control" id="inputEmail3" rows="1"></textarea>
										</div>
										<div class="col-xs-3">
											<button class="btn btn-default btn-danger btn-xs">X</button>
											<button class="btn btn-default btn-primary btn-xs ">Save</button>
										</div>
										</div>
										/ends
										<div class="reservation-data-section">
										<div class="col-xs-1">3</div>
										<div class="col-xs-8">
													<p>
													Davidadam@web.be<br/>
													+49-28372983893
													</p>
														<button class="btn btn-default btn-blank"><img src="images/whitelist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/blacklist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/payment.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/arrived.png" /></button>
														 <textarea class="form-control" id="inputEmail3" rows="1"></textarea>
										</div>
										<div class="col-xs-3">
											<button class="btn btn-default btn-danger btn-xs">X</button>
											<button class="btn btn-default btn-primary btn-xs">Save</button>
										</div>
										</div>
										<div class="reservation-data-section">
										<div class="col-xs-1">4</div>
										<div class="col-xs-8">
													<p>
													Davidadam@web.be<br/>
													+49-28372983893
													</p>
														<button class="btn btn-default btn-blank"><img src="images/whitelist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/blacklist.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/payment.png" /></button>
														<button class="btn btn-default btn-blank"><img src="images/arrived.png" /></button>
														 <textarea class="form-control" id="inputEmail3" rows="1"></textarea>
										</div>
										<div class="col-xs-3">
											<button class="btn btn-default btn-danger btn-xs">X</button>
											<button class="btn btn-default btn-primary btn-xs ">Save</button>
										</div>
										</div>
					<div class="clearfix"></div>
				</form> -->
						<!--p class="center" style="padding:10px 0px 0px 0px;margin-bottom:2px;" >Reservation Process Continues for next <span id="log">60</span> Secs</p-->
						<!--div id="flash" class="center" ></div-->
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- -------------MYRESERVATION DATA MODAL --------------------------------------------->
				<div id="myreservation" class="white_content">
					<h3>Reservation</h3>
					<a href="javascript:void(0)" class="close_popup timeOutDisable"
						onclick="document.getElementById('myreservation').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div style="padding: 0px">
						<div class="ajax_container_inner">
							<div id="loader"></div>
							<form class="form-horizontal" id="guestReservationForm" onsubmit="return saveTheGuestReservation()">
								<div class="reservation-data-section">
									<div class="col-xs-1">
										<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
									</div>
									<div class="col-xs-11">
										<p>
											${sessionScope.event.eventOrgName} <br />
											${sessionScope.event.eventOrgAddress}<br />
											${sessionScope.event.eventOrgPhoneNumber}
										</p>
									</div>
								</div>
								<div class="reservation-data-section" id="selectSeats">
									<!-- <div class="col-xs-1">
										<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
										</div>
										<div class="col-xs-11">
										<p>
										Donnerstag 14 julie, 2014 - 17:00<br/>
										Donnerstag 14 julie, 2014 - 21:00
										</p>
										</div>
											<div class="col-xs-1">
										<span class="glyphicons glyphicon-times" aria-hidden="true">#</span>
										</div>
										<div class="col-xs-11">
										<p>Bunktertour Heinwald</p>
										<select name="" class="form-control">
											<option value="">1 Platze</option>
											<option value="">2 Platze</option>
											<option value="">2 Platze + 1 Waitlist</option>
											<option value="">2 Platze + 2 Waitlist</option>
											<option value="">2 Platze + 3 Waitlist</option>
											<option value="">2 Platze + 4 Waitlist</option>
										</select>
										</div> -->
								</div>

								<div class="reservation-data-section">
									<div class="col-xs-1">
										<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									</div>
									<div class="col-xs-11">
										<input type="text" class="form-control margin-bottom-10"
											placeholder="User Name" id="guestUser" name="userName">
										<div id="userNameStatusDiv" align="center">
											<span id="useNameStatus"
												style="margin: 0px 100px 0px; color: red; font-weight: 600;"></span>
										</div>
										<input type="email" class="form-control margin-bottom-10"
											placeholder="Email" id="guestEmail" name="email">
										<div id="EmailStatusDiv" align="center">
											<span id="EmailStatus"
												style="margin: 0px 100px 0px; color: red; font-weight: 600;"></span>
										</div>
										<input type="text" class="form-control margin-bottom-10"
											placeholder="Phone" id="guestPhone" name="phone">
										<div id="PhoneStatusDiv" align="center">
											<span id="PhoneStatus"
												style="margin: 0px 100px 0px; color: red; font-weight: 600;"></span>
										</div>
									</div>
								</div>
								<div class="col-xs-12" style="padding: 20px 20px 6px 20px;">
									<div class="form-group">
										<div class="col-xs-1">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										</div>
										<div class="col-xs-11">
											<textarea class="form-control" id="notes" rows="1" maxlength="100"></textarea>
										</div>
									</div>

								</div>
								<div class="clearfix"></div>
								<div style="padding: 0px 100px;" class="button_padding">
									<div class="form-group">
										<div class="col-xs-6">
											<button type="submit" class="btn btn-default btn-save"
												id="reserveSeats">Reserve Now</button>
										</div>
										<div class="col-xs-6 nopadding">
											<a href="javascript:void(0)" class="btn btn-default btn-save"
												onclick="showReservationList()">Reservation List</a>
										</div>
										<!-- <div class="col-xs-4">
											<button type="button" class="btn btn-default btn-save"
												onclick="document.getElementById('myreservation').style.display='none';document.getElementById('fade').style.display='none'">Cancel</button>
										</div> -->
									</div>
								</div>
							</form>
						</div>
						<div id="hideTimer">
							<p class="center"
								style="padding: 10px 0px 0px 0px; margin-bottom: 2px;">
								Reservation Process Continues for next <span id="log">60</span>
								Secs
							</p>
						</div>
						<div id="flash2" class="center"></div>

					</div>
				</div>

				<div id="fade" class="black_overlay"></div>

				<!-------------------------------- -------------ADD USeR TO LIST DATA MODAL --------------------------------------------->
				<div id="add_user_to_list" class="white_content">
					<h3>Add User to Whitelist</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('add_user_to_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div style="padding: 0px">
						<form class="form-horizontal">
							<div class="col-xs-12" style="padding: 20px 20px 6px 20px;">
								<div class="form-group">
									<div class="col-xs-12">
										<label>Enter Email Address</label> <input type="email"
											class="form-control" id="inputEmail3"
											placeholder="xxx@xxx.xom" />
									</div>
								</div>
								<div class="radio">
									<label> <input type="radio" name="groupname"
										value="black"> Blacklist
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="groupname"
										value="white"> Whitelist
									</label>
								</div>
							</div>
							<!--ends col-xs-12 -->
							<div class="clearfix"></div>

							<div style="padding: 20px 20px;">
								<div class="form-group">
									<div class="col-xs-3 col-xs-12">
										<button type="submit" class="btn btn-default btn-save">ADD</button>
									</div>
								</div>
							</div>
						</form>
						<div id="flash" class="center"></div>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-- ================================  MANUAL RESERVATION FOR SERVICE PROVIDER MODAL ==========================================-->
				<div id="myreservation_manual" class="white_content">
					<h3>Manual Reservation</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('myreservation_manual').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div style="padding: 0px">
						<form class="form-horizontal">
							<div class="reservation-data-section">
								<div class="col-xs-1">
									<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
								</div>
								<div class="col-xs-11">
									<p>
										Couching Simone, Garrison<br /> Woodway 115-445, Prisbane, GB
										Sooulfolk<br /> 49-99-999-9999
									</p>
								</div>
							</div>
							<div class="reservation-data-section">
								<div class="col-xs-1">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
								<div class="col-xs-11">
									<p>
										1st April, 2015<br /> <select name="" class="form-control">
											<option value="">19 April,2015</option>
											<option value="">20 April,2015</option>
											<option value="">21 April,2015</option>
										</select>
									<div id="change_option">Room 1 number has been slected to
										reserve from 01.10.2012 to 03.10.2012</div>
									</p>
								</div>
							</div>
							<div class="reservation-data-section">
								<div class="col-xs-1">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								</div>
								<div class="col-xs-11">
									<input type="text" class="form-control margin-bottom-10"
										placeholder="Name" /> <input type="text"
										class="form-control margin-bottom-10" placeholder="Email" />
									<input type="text" class="form-control margin-bottom-10"
										placeholder="Phone" />
									<button class="btn btn-default btn-blank">
										<img src="images/whitelist.png" />
									</button>
									<button class="btn btn-default btn-blank">
										<img src="images/blacklist.png" />
									</button>
									<button class="btn btn-default btn-blank">
										<img src="images/payment.png" />
									</button>
									<button class="btn btn-default btn-blank">
										<img src="images/arrived.png" />
									</button>
								</div>
							</div>
							<div class="col-xs-12" style="padding: 10px 20px 6px 20px;">
								<div class="form-group">
									<div class="col-xs-1">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									</div>
									<div class="col-xs-11">
										<textarea class="form-control" id="inputEmail3" rows="1"></textarea>
									</div>
								</div>

							</div>
							<!--ends col-xs-12 -->
							<div class="clearfix"></div>
							<div style="padding: 0px 100px;">
								<div class="form-group">
									<div class="col-xs-4">
										<button type="submit" class="btn btn-default btn-save">Reserve
											table</button>
									</div>
									<div class="col-xs-4 nopadding">
										<a href="javascript:void(0)" class="btn btn-default btn-save"
											onclick="document.getElementById('myreservation').style.display='none';document.getElementById('myreservation_details').style.display='block';document.getElementById('fade').style.display='block'">Reservation
											List</a>
									</div>
									<div class="col-xs-4">
										<button type="submit" class="btn btn-default btn-save">Cancel</button>
									</div>
								</div>
							</div>
						</form>
						<p class="center" style="padding: 0px 0px 0px 0px;">
							Reservation Process Continues for next <span id="log">60</span>
							Secs
						</p>
						<div id="flash" class="center"></div>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- WHITELIST DETAILS DATA MODAL --------------------------------------------->
				<div id="mywhite_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>My White List Category</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('mywhite_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div class="user_data_wrapper" style="padding: 0px">
						<form class="form-horizontal" id="mywhite_list">
							<div class="reservation-data-section">
								<div id="whitelistdetails"></div>
								<div id="startDate"></div>
								<!-- <div class="col-xs-7 col-xs-7">
						<p>
						<strong>Name of Restaurant</strong><br/>
						Street name & Num,<br/> city name, Country<br/>
						+49-99-999-9999
						</p>
					</div>
					<div class="col-xs-5 col-xs-5">
						<p>since: 01.01.2014<br/></p>
					</div> -->

							</div>
							<!--ends-->

							<!-- <div class="reservation-data-section">
					
					<div class="col-xs-7 col-xs-7">
						<p>
						<strong>Name of Restaurant</strong><br/>
						Street name & Num,<br/> city name, Country<br/>
						+49-99-999-9999
						</p>
					</div>
					<div class="col-xs-5 col-xs-5">
						<p>since: 01.01.2014<br/></p>
					</div>
					</div> -->
							<!--ends-->
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- BLACK LIST DETAILS DATA MODAL --------------------------------------------->
				<div id="myblack_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>My Black List Category</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('myblack_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div class="user_data_wrapper" style="padding: 0px">
						<form class="form-horizontal" id="myblack_list">
							<div class="reservation-data-section">
								<div id="blacklistdetails"></div>
								<div id="stratDate"></div>
								<!-- <div class="col-xs-7 col-xs-7">
						<p>
						<strong>Name of Restaurant</strong><br/>
						Street name & Num,<br/> city name, Country<br/>
						+49-99-999-9999
						</p>
					</div>
					<div class="col-xs-5 col-xs-5">
						<p>since: 01.01.2014<br/></p>
					</div> -->

							</div>
							<!--ends-->

							<!-- <div class="reservation-data-section">
					
					<div class="col-xs-7 col-xs-7">
						<p>
						<strong>Name of Restaurant</strong><br/>
						Street name & Num,<br/> city name, Country<br/>
						+49-99-999-9999
						</p>
					</div>
					<div class="col-xs-5 col-xs-5">
						<p>since: 01.01.2014<br/></p>
					</div>
					</div> -->
							<!--ends-->
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- EMAIL LIST DETAILS DATA MODAL --------------------------------------------->
				<div id="myemail_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>My Email List</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('myemail_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="statusDiv" align="center">
						<span id="isEmailShared"
							style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span>
					</div>
					<div class="user_data_wrapper" style="padding: 0px">
						<form class="form-horizontal" id="emailVisibleForm">
							<!-- <div class="reservation-data-section">
					<div class="col-xs-5 col-xs-5">
						<p>
						<strong>Name of Restaurant</strong><br/>
						Street name & Num,<br/> city name, Country<br/>
						+49-99-999-9999
						</p>
					</div>
					<div class="col-xs-4 col-xs-4">
						<p>Sharing since: 01.01.2014<br/></p>
					</div>
					<div class="col-xs-3 col-xs-3">
						<button class="btn btn-default">Stop Sharing</button>
					</div>
					
					</div>
					ends
					
					<div class="reservation-data-section">
					
					<div class="col-xs-5 col-xs-5">
						<p>
						<strong>Name of Restaurant</strong><br/>
						Street name & Num,<br/> city name, Country<br/>
						+49-99-999-9999
						</p>
					</div>
					<div class="col-xs-4 col-xs-4">
						<p>Sharing since: 01.01.2014<br/></p>
					</div>
					<div class="col-xs-3 col-xs-3">
						<button class="btn btn-default">Stop Sharing</button>
					</div>
					</div>
					ends	 -->
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- MYRESERVATION DETAILS DATA MODAL --------------------------------------------->
				<div id="myeventreservation_details" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>My Reservation Details</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="resetPage()"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>

					<div id="statusDiv" align="center">
						<span id="statusInformtn"
							style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span>
					</div>

					<div class="user_data_wrapper" style="padding: 0px">

						<form class="form-horizontal" id="reservationHistory"></form>
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- ADMIN RESERVATION DETAILS DATA MODAL --------------------------------------------->
				<div id="admin_myreservation_details" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>Customer Reservation Details</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('admin_myreservation_details').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="adminReservtnMsgDiv"
						style="margin: 0px 230px 0px; color: green; font-weight: 600; font-size: 18px;">
						<span id="adminReservtnMsg"></span>
					</div>

					<div class="user_data_wrapper" style="padding: 0px">
						<div class="col-md-12" style="margin-bottom: 10px;">
							<div class="col-md-10 nopadding">
								<div class="input-group">
									<input type="text"
										class="form-control input-medium search-query"
										placeholder="Search for..." id="custmrReservtnInputVal">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"
											id="custmrReservtnGOBtn">Go!</button>
									</span>
								</div>
							</div>
							<div class="col-md-2">
								<!-- Single button -->
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" id="CustmrResrvtnExprtBtn">
										Export As</button>
									<ul class="dropdown-menu">
										<li><a href="#">Pdf</a></li>
										<li><a href="#" id="custmrReservtnCSV">CSV</a></li>

									</ul>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<form class="form-horizontal" id="custmrHstryRecrds">
							<!--ends-->

						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- CUSTOMERS LIST DETAILS DATA MODAL --------------------------------------------->
				<div id="admin_customer_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>Customers List</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('admin_customer_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="adminCustmrsMsgDiv"
						style="margin: 0px 230px 0px; color: green; font-weight: 600; font-size: 18px;">
						<span id="adminCustmrsMsg"></span>
					</div>
					<div class="user_data_wrapper" style="padding: 0px">
						<div class="col-md-12" style="margin-bottom: 10px;">

							<!-- <form class="form-search form-inline"> -->
							<div class="col-md-10 nopadding">
								<div class="input-group">
									<input type="text"
										class="form-control input-medium search-query"
										placeholder="Search for..." id="custmrName"> <span
										class="input-group-btn">
										<button class="btn btn-default" type="submit" id="searchBtn">Go!</button>
									</span>
								</div>
							</div>
							<!-- </form> -->

							<div class="col-md-2">
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" id="custmtrLstExprtBtn">Export
										As</button>
									<ul class="dropdown-menu">
										<li><a href="#" id="custmrLstpdf">Pdf</a></li>
										<li><a href="#" id="custmrLstCSV">CSV</a></li>

									</ul>
								</div>

							</div>
						</div>
						<div class="clearfix"></div>
						<form class="form-horizontal">
							<div class="reservation-data-section">
								<!-- whitelist -->
								<div class="panel-group" role="tablist"
									aria-multiselectable="true" id="custmrReservtnDataSection">
									<div id="statusMsgDiv" align="center">
										<span id="errorStatusInfo"
											style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span>
									</div>

									<!--  panel end -->
								</div>
								<!-- end list-->

							</div>
							<!--ends-->
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- ADMIN CUSTOMERS WHITE LIST DETAILS DATA MODAL --------------------------------------------->
				<div id="admin_white_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>White List Customers</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('admin_white_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="deleteWhteUsrStatusMsgDiv"
						style="margin: 0px 230px 0px; color: green; font-weight: 600; font-size: 18px;">
						<span id="deleteWhteUsrStatusMsg"></span>
					</div>

					<div class="user_data_wrapper" style="padding: 0px">
						<div class="reservation-data-section">
							<!-- whitelist -->
							<div class="col-md-12" style="margin-bottom: 10px;">
								<div class="col-md-10 nopadding">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Search for..." id="whiteListInput"> <span
											class="input-group-btn">
											<button class="btn btn-default" type="button"
												id="whiteLstGOBtn">Go!</button>
										</span>
									</div>
								</div>
								<div class="col-md-2">
									<!-- Single button -->
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" id="adminWhteLstExprtBtn">
											Export As</button>
										<ul class="dropdown-menu">
											<li><a href="#">Pdf</a></li>
											<li><a href="#" id="whteUsrCSVBtn">CSV</a></li>

										</ul>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="panel-group" role="tablist"
								aria-multiselectable="true" id="adminWhtLst"></div>

							<!-- end list-->
						</div>
						<!--ends-->
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-- ============================= DELETE RESERVATION MODAL START =============================================-->
				<div id="deleteReservtn_popUp" class="white_content">
					<h3>Delete Reservation</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('deleteReservtn_popUp').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div style="padding: 0px">
						<form class="form-horizontal">

							<div class="reservation-data-section">

								<div class="col-xs-11">
									<span style="font-size: 16px; font-weight: 700;"
										id="deleteReservtnText"></span>
								</div>
							</div>

							<div class="clearfix"></div>
							<div style="padding: 0px 100px;"
								onclick="document.getElementById('deleteReservtn_popUp').style.display='none';document.getElementById('fade').style.display='none'"
								id="deleteAndCancelBtns"></div>
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>

				<!-- ============================= CHANGE RESERVATION MODAL START =============================================-->
				<div id="changeReservtn_popUp" class="white_content">
					<h3>Change Reservation</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('changeReservtn_popUp').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div style="padding: 0px">
						<form class="form-horizontal">

							<div class="reservation-data-section">

								<div class="col-xs-11">
									<span style="font-size: 16px; font-weight: 700;"
										id="changeReservtnText"></span>
								</div>
							</div>

							<div class="clearfix"></div>
							<div style="padding: 0px 100px;"
								onclick="document.getElementById('changeReservtn_popUp').style.display='none';document.getElementById('fade').style.display='none'"
								id="changeAndCancelBtns"></div>
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>

				<!-- ============================= CHANGE RESERVATION MODAL END =============================================-->


				<!-------------------------------- ADMIN CUSTOMERS Email LIST DETAILS DATA MODAL --------------------------------------------->
				<div id="admin_email_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>Customers Email List</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('admin_email_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="adminEmailLstMsgStatusDiv"
						style="margin: 0px 230px 0px; color: green; font-weight: 600; font-size: 18px;">
						<span id="adminEmailLstStatusMsg"></span>
					</div>

					<div class="user_data_wrapper" style="padding: 0px">
						<div class="reservation-data-section">
							<!-- whitelist -->
							<div class="col-md-12 nopadding" style="margin-bottom: 10px;">
								<div class="col-md-10 nopadding">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Search with user name" id="custmrEmailListId">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button"
												id="custmrEmailListSearchBtn">Go!</button>
										</span>
									</div>
								</div>
								<div class="col-md-2">
									<!-- Single button -->
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" id="custmrEmailLstExprtBtn">
											Export As</button>
										<ul class="dropdown-menu">
											<li><a href="#">Pdf</a></li>
											<li><a href="#" id="custmrEmailCsvBtn">CSV</a></li>

										</ul>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="col-md-12 listpad" id="custmrEmailList">
								<!-- <div class="col-md-4 nopadding">Adman Herlary</div>
								<div class="col-md-4">adman@hotmail.com</div>
								<div class="col-md-4">+77-327928289</div> -->
							</div>

							<!-- end list-->
						</div>
						<!--ends-->
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- ADMIN Add to white list DATA MODAL --------------------------------------------->
				<div id="admin_addwhite_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>Add to White List Category</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('admin_addwhite_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div class="user_data_wrapper" style="padding: 0px; height: 200px;">
						<div class="reservation-data-section">
							<!-- whitelist -->

							<form name="" class="form-horizontal">
								<!-- status message -->
								<div id="statusMsgDiv" align="center">
									<span id="addRoomToWhteStstusMsg"
										style="margin: 0px 100px 0px; color: green; font-weight: 600;"></span>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-md-3 control-label">Select
										Tour</label>
									<div class="col-md-8">
										<select class="form-control" name="language"
											id="roomCategryLst">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-md-3 control-label">Select
										Guide</label>
									<div class="col-md-8">
										<select class="form-control" name="language" id="roomNum">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-md-3 control-label"></label>
									<div class="col-md-8">
										<button class="btn btn-primary btn-default" type="button"
											id="adminAddBtn">Add</button>
									</div>
								</div>
							</form>
							<!-- end list-->
						</div>
						<!--ends-->
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- ADMIN CUSTOMERS BLACK LIST DETAILS DATA MODAL --------------------------------------------->
				<div id="admin_black_list" class="white_content"
					style="left: 8%; width: 85%;">
					<h3>Black List Customers</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="document.getElementById('admin_black_list').style.display='none';document.getElementById('fade').style.display='none'"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div id="deleteBlackUsrStatusMsgDiv"
						style="margin: 0px 230px 0px; color: green; font-weight: 600; font-size: 18px;">
						<span id="deleteBlackUsrStatusMsg"></span>
					</div>

					<div class="user_data_wrapper" style="padding: 0px">
						<div class="reservation-data-section">
							<!-- whitelist -->
							<div class="col-md-12" style="margin-bottom: 10px;">
								<div class="col-md-10 nopadding">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Search for..." id="blckLstSearchInput">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" id="blckGOBtn">Go!</button>
										</span>
									</div>
								</div>
								<div class="col-md-2">
									<!-- Single button -->
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" id="adminBlackLstExprtBtn">
											Export As</button>
										<ul class="dropdown-menu">
											<li><a href="#">Pdf</a></li>
											<li><a href="#" id="blckUsrCSVBtn">CSV</a></li>

										</ul>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="panel-group" role="tablist"
								aria-multiselectable="true" id="blckCustmrsLst"></div>

							<!-- end list-->
						</div>
						<!--ends-->
					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- RESERVATION CONFIRMATION DATA MODAL --------------------------------------------->
				<div id="myreservation_confirm" class="white_content">
					<h3>Reservation Confirmation</h3>
					<a href="javascript:void(0)" class="close_popup"
						onclick="resetPage()"><span
						class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<div style="padding: 0px">
						<form class="form-horizontal">
							<div class="reservation-data-section" id="refConfirm">
								<!-- 
						<div class="col-xs-12">
								<div class="alert alert-success" role="alert" style="padding:5px 12px;margin-bottom:5px;">
								  <strong><span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span> Success!</strong> You successfully made reservation.
								</div>
						<p class="center">Reference Number : <b>NHDJU6438</b></p>
						</div> -->
							</div>
							<div class="reservation-data-section">
								<div class="col-xs-4" style="text-align: right;">
									Sponsor By <img src="images/pepsi.jpg"
										class="img-responsive hotel_logo"
										style="margin: -25px 250px 0px; height: 50px; width: 130px;" />
								</div>
								<div class="col-xs-8"></div>
							</div>
							<div class="reservation-data-section">
								<div class="col-xs-1">
									<span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
								</div>
								<div class="col-xs-11">
									<p>
										${sessionScope.event.eventOrgName} <br />
										${sessionScope.event.eventOrgAddress}<br />
										${sessionScope.event.eventOrgPhoneNumber}
									</p>
								</div>
							</div>
							<div class="reservation-data-section" id="timeConfirm">
								<!-- <div class="col-xs-1">
										<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
										</div>
										<div class="col-xs-11">
										<p>
										Donnarster 14 July 2015 - ab 17:00<br/>
										Donnarster 14 July 2015 - bis 19:00
										<span style="float:right;">2 hours</span><br/>
										Table 2 (2)<br/>
										2 Palatz
										</p>
										</div> -->
							</div>
							<div class="reservation-data-section" id="userConfirm">
								<!-- <div class="col-xs-1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
						<div class="col-xs-11">
							<p>
							David Adams<br/>
							davidadamas@gmail.com<br/>
							+49-888-8888 
							</p>
						</div> -->
							</div>

							<div class="clearfix"></div>
							<div style="padding: 20px 100px;">
								<div class="form-group">
									<a href="#" class="btn btn-default ">I</a> <a href="#"
										class="btn btn-default">F</a> <a href="#"
										class="btn btn-default ">F</a> <a href="exportEventPDF.htm"
										class="btn btn-default">Export</a>

								</div>
							</div>
						</form>

					</div>
				</div>
				<div id="fade" class="black_overlay"></div>
				<!-------------------------------- MYRESERVATION DETAILS DATA MODAL --------------------------------------------->
				<!-------------------------------- MY PROFILE DETAILS DATA MODAL --------------------------------------------->
				<div id="myprofile" class="white_content" style="left:10%;width:80%;">
			<h3>My Profile</h3>
			<span style="color: red; padding-left: 40px; font-weight: bold;" id="invalidUpdatemessage"></span>
			<a href ="javascript:void(0)" class="close_popup" onclick = "document.getElementById('myprofile').style.display='none';document.getElementById('fade').style.display='none'"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
					<form  id="myProfileForm" class="form-horizontal" onsubmit="return getMyProfileForm()">
						<div class="reservation-data-section">
						<h5>My Profile Details</h5>
				<div class="profile_scroller">
							<div id="myProfileFromAjax"></div>
					</div>
						<div class="line"></div>
						<div class="form-group">
						 <label for="inputEmail3" class="col-xs-2 control-label"></label>
							<div class="col-xs-9">
							  <button type="submit" class="btn btn-default btn-save" style="width:auto;" >Update</button>
							</div>
						</div>
						<!--ends-->				
					</form>
				</div>
			</div>
			<div id="fade" class="black_overlay"></div>
			<!-------------------------------- Hotel Details DATA MODAL --------------------------------------------->
			<div id="hotel_details" class="white_content"
				style="left: 8%; width: 85%;">
				<h3>Contact Details</h3>
				<a href="javascript:void(0)" class="close_popup"
					onclick="document.getElementById('hotel_details').style.display='none';document.getElementById('fade').style.display='none'"><span
					class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
				<form class="form-horizontal">
					<div class="reservation-data-section">
						<div class="col-xs-10 col-xs-10">
							<p>
								<strong>Restaurant "Pegasus"</strong><br /> Address : Woodway
								115-445, Prisbane,Munich,Germany<br /> Email : pegaus@werb.de<br />
								Phone : +49-99-999-9907,+49-99-999-9908,+49-99-999-9909<br />
								Website : <a href="#">www.hotel.com</a>
							</p>
						</div>
						<div class="col-xs-2">
							<button class="btn btn-default btn-success">Download</button>
							<button class="btn btn-default" style="margin-top: 10px;">Timings</button>
						</div>
						<div class="map" id="map" style="width: 100%; height: 250px;"></div>
					</div>
				</form>
			</div>
			<div id="fade" class="black_overlay"></div>
			<!-- =========================================Main html code body==============================================================================================-->
			<div class="col-xs-3 hotel_title nopadding">
				<img src="images/logo1.png" class="img-responsive hotel_logo"
					style="margin-bottom: 5px;" />
			</div>
			<div class="col-xs-6 hotel_title"
				style="padding: 20px 20px 20px 35px;">
				<b> <!-- Hotal Alpha -->${sessionScope.event.eventOrgName}</b><br />
				<!-- Tennisclub herchiu c.v 55-0086 Munchen -->${sessionScope.event.eventOrgAddress},
				${sessionScope.event.eventOrgPhoneNumber}
			</div>
			<div class="col-xs-3" style="padding: 35px 0px 0px;">
				<div class="iconset">
					<!-- Single button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-default dropdown-toggle btn-blank"
							data-toggle="dropdown" aria-expanded="false">
							<img src="images/greenpat.png" />
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="toChngeEvntReservation.htm"><img
									src="images/brownpat.png" style="padding-right: 6px;" /></a></li>
							<!-- <li><a href="seriveprovider_view.html"><img src="images/greenpat.png" style="padding-right:6px;" /></a></li> -->
						</ul>
					</div>
					<!--ends-->
					<!-- Single button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-default dropdown-toggle btn-blank"
							data-toggle="dropdown" aria-expanded="false">
							<img src="images/germany.png" />
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><img src="images/english.png"
									style="padding-right: 6px;" />- English</a></li>

						</ul>
					</div>
					<!--ends-->
					<!-- Single button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-default dropdown-toggle btn-blank"
							data-toggle="dropdown" aria-expanded="false">
							<img src="images/green-user.png" />
						</button>
						<ul class="dropdown-menu" role="menu" style="left: -55px;">
							<li><a href="javascript:void(0)" onclick="getProfile()">My
									Profile</a></li>
							<li><a href="javascript:void(0)"
								onclick="getMyReservations()">My Reservations</a></li>
							<li><a href="javascript:void(0)"
								onclick="getServiceWhiteList()" class="circle">White List
									Category</a></li>
							<li><a href="javascript:void(0)"
								onclick="getServiceBlackList()" class="circle">Black List
									Category</a></li>
							<li><a href="javascript:void(0)" onclick="getEmailVisible()"
								class="circle">E-mail Visible </a></li>
							<div class="divider"></div>
							<li><a href="logout.htm">Logout</a></li>
							<!--li><a href = "javascript:void(0)" onclick = "document.getElementById('mylogin').style.display='block';document.getElementById('fade').style.display='block'">Login</a></li>
							<li><a href = "javascript:void(0)" onclick = "document.getElementById('myregistration').style.display='block';document.getElementById('fade').style.display='block'">Registration</a></li>
							<li><a href = "javascript:void(0)" onclick = "document.getElementById('mycontactdata').style.display='block';document.getElementById('fade').style.display='block'">As Guest</a></li-->
						</ul>
					</div>
					<!--ends-->
					<!-- Single button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-default dropdown-toggle btn-blank"
							data-toggle="dropdown" aria-expanded="false">
							<img src="images/red_user.png" />
						</button>
						<ul class="dropdown-menu" role="menu" style="left: -140px;">
							<li><a href="javascript:void(0)" id="adminCustmrList">Customers
									List</a></li>
							<li><a href="javascript:void(0)" id="custmrReservtns">Customers
									Reservation</a></li>
							<li><a href="javascript:void(0)" id="adminWhiteList">White
									List Customers</a></li>
							<li><a href="javascript:void(0)" id="adminBlckList">Black
									List Customers</a></li>
							<li><a href="javascript:void(0)" id="custmrsEmailList">Email
									Of Customers</a></li>
							<li><a href="javascript:void(0)" id="addToWhitLstCat">Add
									to White List Category</a></li>
							<!--  <li><a href = "servicebyguide.htm">By Guide</a></li> -->


						</ul>
					</div>
					<!--ends-->
					<a class="btn-blank"><img src="images/fullscreen.png" id="fs" /></a>
				</div>
			</div>
			<div class="clearfix"></div>
			<!--div class="line"></div-->
			<div class="col-xs-12 nopadding" style="display: none;">
				<div class="iconset100">
					<a href="javascript:void(0)"
						onclick="document.getElementById('myreservation_details').style.display='block';document.getElementById('fade').style.display='block'"><img
						src="images/arrows.png" style="padding-right: 6px;" /></a> <a
						href="javascript:void(0)"
						onclick="document.getElementById('myprofile').style.display='block';document.getElementById('fade').style.display='block'"><img
						src="images/user.png" style="padding-right: 6px;" /></a>
					<!--a href = "javascript:void(0)" onclick ="document.getElementById('myreservation_options').style.display='block';document.getElementById('fade').style.display='block'"><img src="images/user.png" style="padding-right:6px;" /></a-->
					<a href="javascript:void(0)"
						onclick="document.getElementById('mywhite_list').style.display='block';document.getElementById('fade').style.display='block'"
						class="circle">W</a> <a href="javascript:void(0)"
						onclick="document.getElementById('myblack_list').style.display='block';document.getElementById('fade').style.display='block'"
						class="circle">B</a> <a href="javascript:void(0)"
						onclick="document.getElementById('myemail_list').style.display='block';document.getElementById('fade').style.display='block'"
						class="circle">E</a> <a href="view_users.html"><img
						src="images/user.png" /></a> <a href="view_users.html"><img
						src="images/arrows.png" /></a> <a href="whitelist.html"><img
						src="images/whitelist.png" /></a> <a href="blacklist.html"><img
						src="images/blacklist.png" /></a> <a href="email_list.html"><img
						src="images/mails.png" /></a> <a href="javascript:void(0)"
						onclick="document.getElementById('add_user_to_list').style.display='block';document.getElementById('fade').style.display='block'"><img
						src="images/add_wlu.png" /></a>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control input-sm"
								placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
						<a href="#" class="btn btn-default"><span
							class="glyphicon glyphicon-export" aria-hidden="true"></span></a>
					</form>

				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-xs-2 nopadding">
				<button type="button" class="btn btn-default btn-current-date hiddenDateButton"
					ondblclick="resetPage()" id="dateButtonDiv">
					<span id="dateButton"> <!-- 06-06-2015 -->
					</span>
				</button>
			</div>
			<div class="col-xs-4">
				<select class="selectpicker form-control" name="" id="selectTour">
					<!-- <option value="0">Select Tour</option>
						<option value="1">Tour 1</option>
						<option value="1">Tour 2</option>				
						<option value="2">Tour 3</option>
						<option value="3">All Tours</option> -->
				</select>
			</div>
			<div class="col-xs-4 nopadding">
				<select class="selectpicker form-control" name="" id="availGuides">
					<!-- <option value="0">Select Guide</option>
						<option value="1">Guide 1</option>
						<option value="1">Guide 2</option>				
						<option value="2">Guide 3</option>
						<option value="3">Guide 4</option> -->
				</select>
			</div>
			<div class="col-xs-2" style="padding-right: 0px;">
				<input type="number" min="0" class="form-control" name=""
					Placeholder="Count" value="" id="seatCount" />
			</div>
			<div class="clearfix"></div>
			<div class="ajax_container">
				<div class="ajax_loader"></div>
				<div class="col-xs-12 nomargin_lf_rt date_wrapper">
					<div id="thumbcarousel1" class="carousel slide"
						data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-caption1" id="datesListDiv"></div>
						<!-- carousel-caption1 -->
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-triangle-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<!-- ends date list -->
				<!-- Object or week list and data -->
				<div class="clearfix"></div>
				<div class="col-xs-12 nomargin info_wrapper">
					<div class="timeline timeline_object" id="showStrtAndEndTimeDiv"
						style="top: 0px;"></div>
					<!-- timeline close. -->

					<div class="ajax_container_inner">
						<div class="ajax_loader_inner"></div>
						<div id="thumbcarousel2" class="carousel carousel_info slide"
							data-ride="carousel" style="padding-right: 19px;">
							<div class="carousel-inner" role="listbox" id="carousalDatesLst">

							</div>

							<!-- Controls -->
							<a class="myleft carousel-control" href="#thumbcarousel2"
								role="button" data-slide="prev" style="left: 0px;"> <span
								class="glyphicon glyphicon-triangle-left glyphicon glyphicon-triangle-myleft"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="myright carousel-control" href="#thumbcarousel2"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-triangle-right glyphicon glyphicon-triangle-myright"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>

					</div>
				</div>
				<!-- ends-->
			</div>

		</div>
		<ul class="footer_menu">
			<li><a href="#">AGB</a></li>
			<li><a href="#">Impressum</a></li>
			<li><a href="#">Admin</a></li>
			<li><a href="#">Über Reservat</a></li>
			<li><a href="#">Help</a></li>
		</ul>
	</div>

	<!-- ends-->
	<!--Main COntent ends -->
	</div>
	<!-- custom scrollbar plugin -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
</body>
</html>