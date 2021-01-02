/*
	파일명: validationBeforeInsert.js
	설명: 계정 관리 >> 사원 신규 등록 유효성 검사 + 부서 코드 select
	작성일: 2021-01-02
	작성자: 백희승
*/
jQuery(document).ready(function($) {
	
	$('.datepicker').datepicker();
	
	// 본부 select > option 뿌려주기
	function showHeadQuarters(){
		$.ajax({
			url: "getHead.do",
			type: "POST",
			success: (data) => {
				makeHQOptions(data);
			},
			error:(xhr) => {
				console.log(xhr.status + " : ERROR");
			}
		});
	}
	
	function makeHQOptions(data){
		let headQuarters = "<option value='null'>소속될 본부 선택</option>";
		data.forEach( (element) => {
			headQuarters += "<option value='" + element.headCode + "'>" + element.headName.trim() + "</option>";
		});
		$("#head").append(headQuarters);
	} // 본부 select > option 뿌려주기
	
	// DB에서 가져온 본부 option 보여주기 실행
	showHeadQuarters();
	
	
	
	
	// DB에서 가져와 만들어진 option 태그에 동적 이벤트 생성
	$('select[id="head"]').on({
		"change": makeDeptOptions
	});
	
	function makeDeptOptions() {
		$.ajax({ 
			url : "getDept.do",
			type : "POST",
			data : { headCode : $(this).val() },
			success: (data) => {
				$("#dept").empty();
				console.log($("#head").children());
				let depts = "<option value='null'>" + $("#head option[selected]").val() +"본부 소속의 부서 선택</option>";
				data.forEach( (element) => {
					depts += "<option value='" + element.deptCode + "'>" + element.deptName.trim() + "</option>";
				});
				$("#dept").append(depts);
			},
			error:(xhr) => {
				console.log(xhr.status + " : ERROR");
			}
		});
	}
	
	// 중복 empno 유효성 검사
	$('#empNo').keyup( (e) => {
		$.ajax({
			url: "checkEmpNo.do",
			data:{empNo:$('#empNo').val()},
			type:"POST",
			success: (data) => {
				$('#checkEmpNo').empty();
				
				if(data == ""){
					$('#checkEmpNo').html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + $('#empNo').val() + "는 사용 가능한 사번입니다.");
				}else if (data != null){
					$('#checkEmpNo').html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.empNo + "는 이미 존재하는 사번입니다.");
				}
			},
			error:(xhr) => {
				alert(xhr.status + " : ERROR");
			}
		});
	}); // 중복 empno 유효성 검사
	
	
	
	
});

// 값 validation
function empSubmit() {
};