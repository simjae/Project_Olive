/**
 * 
 */
$(document).ready(function($) {



	createHeadList();
	getClassList();
	getPositionList();
	// DB에서 가져와 만들어진 option 태그에 이벤트 생성
	$('select[id="head"]').on({
		"change": getDeptList
	});

	$('.datepicker').flatpickr();

	$("#resetBtn").click(function() {
		let empno = $("#empNo").val();
		$.ajax({
			url: "/HR_managementRest/resetAccount.do",
			type: "POST",
			data: { empno: empno },
			success: function(data){
				location.href = "/HR_management/empEdit.do?empno="+data;
			},
			error: (xhr) => {
				console.log(xhr.status + " : showHeadQuarters() ERROR");
			}
		});
	})

	$("#retireBtn").click(function() {
		let empno = $("#empNo").val();
		$.ajax({
			url: "/HR_managementRest/retireAccount.do",
			type: "POST",
			data: { empno: empno },
			success: (data) => {
				location.href = "/HR_management/empEdit.do?empno="+data;
			},
			error: (xhr) => {
				console.log(xhr.status + " : showHeadQuarters() ERROR");
			}
		});
	})


})


// 본부 select > option 뿌려주기
function createHeadList() {
	$.ajax({
		url: "/HR_managementRest/getHead.do",
		type: "POST",
		success: (data) => {
			getHeadList(data);
		},
		error: (xhr) => {
			console.log(xhr.status + " : showHeadQuarters() ERROR");
		}
	});
}

function getHeadList(data) {
	let headQuarters = "<option value='null'>본부 선택</option>";
	data.forEach((element) => {
		headQuarters += "<option value='" + element.headCode + "'>" + element.headName.trim() + "</option>";
	});
	$("#head").append(headQuarters);
}

// class : 부서 가져오기
function getDeptList() {
	$.ajax({
		url: "/HR_managementRest/getDept.do",
		type: "POST",
		data: { headCode: $(head).val() },
		success: (data) => {
			$("#dept").empty();
			let depts = "<option value='null'>" + $("#head option:selected").html() + "본부 소속의 부서 선택</option>";
			data.forEach((element) => {
				depts += "<option value='" + element.deptCode + "'>" + element.deptName.trim() + "</option>";
			});
			$("#dept").append(depts);
		},
		error: (xhr) => {
			console.log(xhr.status + " : makeDeptOptions() ERROR");
		}
	});
}

// class : 직급 가져오기
function getClassList() {
	$.ajax({
		url: "/HR_managementRest/getClass.do",
		type: "POST",
		success: (data) => {
			let classes = "<option value='null'>직위 선택</option>";
			data.forEach((element) => {
				classes += "<option value='" + element.classCode + "'>" + element.className.trim() + "</option>";
			});
			$("#class").append(classes);
		},
		error: (xhr) => {
			console.log(xhr.status + " : getclass() ERROR")
		}
	});
}

// position : 직책 가져오기
function getPositionList() {
	$.ajax({
		url: "/HR_managementRest/getPosition.do",
		type: "POST",
		success: (data) => {
			let positions = "<option value='null'>직책 선택</option>";
			data.forEach((element) => {
				positions += "<option value='" + element.positionCode + "'>" + element.positionName.trim() + "</option>";
			});
			$("#position").append(positions);
		},
		error: (xhr) => {
			console.log(xhr.status + " : getPosition() ERROR")
		}
	});
}
