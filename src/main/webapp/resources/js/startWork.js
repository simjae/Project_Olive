jQuery(document).ready(function($) {

	$('#startWork').click(function() {
		alert("출근하기 ");
		$.ajax({
			type: "GET"
			, url: "/attendance/startwork.do"
			, success: function(data) {
				alert("성공");
			}
		});
	})
});