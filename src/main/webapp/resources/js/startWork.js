jQuery(document).ready(function($) {

	// 출근 전 확인
	$('#startWork').click(function(e) {
		e.stopPropagation();
		$.ajax({
			type: "POST"
			, url: "/attendance/isPunchedIn.do"
			, success: function(data) {
				if(data === null || data === ""){	// 미출근 시 출근처리
					startWork();
				}else{ 								// 이미 출근 처리됨을 알림
					swal("이미 처리됨", propperTime(data.start) + " 부로 이미 처리되었습니다.", "info");
				}
			}
		});
	});
	
	// 퇴근 전 확인
	$('#endWork').click(function(e) {
		e.stopPropagation();
		$.ajax({
			type: "POST"
			, url: "/attendance/isPunchedIn.do"
			, success: function(data) {
				if(data.start === null || data.start === ""){
					swal("처리 불가", "출근 처리가 되지 않았습니다. 부서 내 관리자에게 문의바랍니다.", "warning");
				}else {
					swal({
						title: "퇴근하시겠습니까?",
						icon: "warning",
						buttons: true,
						dangerMode: true,
					}).then((end) => {
						if (end) {
							endWork();
						}
					});
				}
			}
		});
	});
	
	// 출근하기
	function startWork(){
		$.ajax({
			type: "POST"
			, url: "/attendance/startWork.do"
			, success: function(data) {
				swal("출근 처리됨", propperTime(data.start) + " 부로 출근 처리되었습니다.", "success");
			}
		});
	}
	
	// 퇴근하기
	function endWork(){
		$.ajax({
			type: "POST",
			url: "/attendance/endWork.do",
			success: function(data) {
				swal("퇴근 처리됨", propperTime(data.end) + " 부로 퇴근 처리되었습니다.", "success");
			}
		});
	}
	
	
	
	
	// TimeStamp 변환
	function propperTime(timeStamp){
		let date = new Date(timeStamp);
		
		let year = date.getFullYear().toString().slice(-2);
		let month = ("0" + (date.getMonth() + 1)).slice(-2);
		let day = ("0" + date.getDate()).slice(-2);
		let hour = ("0" + date.getHours()).slice(-2);
		let minute = ("0" + date.getMinutes()).slice(-2);
		let second = ("0" + date.getSeconds()).slice(-2); 
		
		return year + "." + month + "." + day + ". " + hour + ":" + minute + ":" + second;
	}
	
	
});