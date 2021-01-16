jQuery(document).ready(function($) {

	$('#startWork').click(function() {
		//alert("출근하기 ");
		$.ajax({
			type: "GET"
			, url: "/attendance/startwork.do"
			, success: function(data) {
			//	alert("성공");
			}
		});
	})
	$('#endWork').click(function() {
		//alert("퇴근하기 ");
		$.ajax({
			type: "GET"
			, url: "/attendance/endwork.do"
			, success: function(data) {
			//	alert("집에가");
			}
		});
	})
});