// 타임스탬프 값을 년월일로 변환
function Unix_timestampDate(t) {
	var date = new Date(t);
	var year = date.getFullYear();
	var month = "0" + (date.getMonth() + 1);
	var day = "0" + date.getDate();


	return year + "-" + month.substr(-2) + "-" + day.substr(-2);
}


function Unix_timestampTime(t) {
	var date = new Date(t);
	var hour = "0" + date.getHours();
	var minute = "0" + date.getMinutes();
	var second = "0" + date.getSeconds();


	return  hour.substr(-2) + ":" + minute.substr(-2) + ":" + second;
}



$('#searchBtn').click(function() {
	let searchType2 = "";
	let keyword2 = $('#newKeyword').val();
	console.log("검색어 : " + keyword2);
	if ($('#newSearchType option:selected').val() == "사번") {
		searchType2 = "empno"
	} else if ($('#newSearchType option:selected').val() == "이름") {
		searchType2 = "ename"
	} else if ($('#newSearchType option:selected').val() == "본부") {
		searchType2 = "headname"
	} else if ($('#newSearchType option:selected').val() == "부서") {
		searchType2 = "deftname"
	}
	$.ajax({
		url: "/attendance/attPage.do",
		type: "POST",
		dataType: "JSON",
		data: {
			searchType2: searchType2,
			keyword2: keyword2
		},
		success: (data) => {
			console.log("sdawd");
			$('#oldSearchType2').val(searchType2);
			$('#oldKeyword2').val(keyword2);
			insertDatabyAjax(data);
		}
	});
	$('#newKeyword').val("");
})


$(document).on("click", ".page-btn", function() {
	let searchType2;
	let keyword2;
	if( $('#oldSearchType2').val() === null || $('#oldSearchType2').val().trim() === "" ){
		searchType2 = $('#oldSearchType').val();
		keyword2 = $('#oldKeyword').val();
	}else {
		searchType2 = $('#oldSearchType2').val();
		keyword2 = $('#oldKeyword2').val();
	}
	let perPageNum = $('#oldPerPageNum').val();
	let page = $(this)[0].text;
	$.ajax({
		url: "/attendance/attPage.do",
		type: "POST",
		dataType: "JSON",
		data: {
			searchType2: searchType2,
			keyword2: keyword2,
			perPageNum: perPageNum,
			page: page
		},
		success: (data) => {
			console.log(data);

			insertDatabyAjax(data);
		}
	})
});

$(document).on("click", ".page-btn-prev", function() {
	let searchType2;
	let keyword2;
	if( $('#oldSearchType2').val() === null || $('#oldSearchType2').val().trim() === "" ){
		searchType2 = $('#oldSearchType').val();
		keyword2 = $('#oldKeyword').val();
	}else {
		searchType2 = $('#oldSearchType2').val();
		keyword2 = $('#oldKeyword2').val();
	}
	let perPageNum = $('#oldPerPageNum').val();
	let page = ($('#oldPage').val()-1);	
	console.log(page);
	$.ajax({
		url: "/attendance/attPage.do",
		type: "POST",
		dataType: "JSON",
		data: {
			searchType2: searchType2,
			keyword2: keyword2,
			perPageNum: perPageNum,
			page: page
		},
		success: (data) => {
			console.log(data);
			insertDatabyAjax(data);
		}
	})
});

$(document).on("click", ".page-btn-next", function() {
	let searchType2;
	let keyword2;
	if( $('#oldSearchType2').val() === null || $('#oldSearchType2').val().trim() === "" ){
		searchType2 = $('#oldSearchType').val();
		keyword2 = $('#oldKeyword').val();
	}else {
		searchType2 = $('#oldSearchType2').val();
		keyword2 = $('#oldKeyword2').val();
	}
	let perPageNum = $('#oldPerPageNum').val();
	let page = (parseInt($("#oldPage").val())+1);
	console.log(page);
	$.ajax({
		url: "/attendance/attPage.do",
		type: "POST",
		dataType: "JSON",
		data: {
			searchType2: searchType2,
			keyword2: keyword2,
			perPageNum: perPageNum,
			page: page
		},
		success: (data) => {

			insertDatabyAjax(data);
		}
	})
});




function insertDatabyAjax(data) {
	console.log(data.criteria);
	console.log(data.list);
	console.log(data.pagination);
	console.log(data.auth);
	//console.log(new Date(t).format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
	$('#attListTable').empty();
	let inputListData = "";
	
	for (let i = 0; i < data.list.length; i++) {
		inputListData += "<tr>"
			+"<td>" + Unix_timestampDate(Number(data.list[i].starttime))+"</td>"
			+ "<td name='empno'>" + data.list[i].empno + "</td>"
			+ "<td>" + data.list[i].ename + "</td>"
			+ "<td>" + data.list[i].deptname + "</td>";
		
		if(data.list[i].starttime == null){
			inputListData += "<td>" + "</td>";	
		}else{ 
			inputListData += "<td>" + Unix_timestampTime(Number(data.list[i].starttime)) 	+ "</td>";
		}
		if(data.list[i].endtime == null){
			inputListData += "<td>" + "</td>";	
		}else{
			inputListData += "<td>" + Unix_timestampTime(Number(data.list[i].endtime)) 	+ "</td>";
		}
			
		
			for(let i=0; i<data.auth.length; i++){
				if(data.auth[i].authority == "ROLE_MANAGER"){
			inputListData += "<td><label class="+'userCheck'+"><input class="+'filter'+" type="+'radio'+" name = "+'user'+" ></label></td>";;
				}
			}
		}

			inputListData += "</tr>";
	$('#attListTable').html(inputListData);


	$('#pagination').empty();
	let inputPaginationData = "";
	if (data.pagination.prev == true) {
		inputPaginationData += "<li class='page-item'>"
			+ "<a class='page-link page-btn-prev' href='#' aria-label='Previous'>"
			+ "<span aria-hidden='true'>&laquo;</span>"
			+ "<span class='sr-only'>Previous</span>"
			+ "</a></li>"
	}
	for(let i=data.pagination.startPage; i<=data.pagination.endPage; i++){
	    if(i == data.criteria.page){
		        inputPaginationData += "<li class='page-item page-link'>"
									+ "<b>"
									+i +"</b></li>"
					    }else{
					        inputPaginationData += "<li class='page-item'>"
													+ "<a class='page-link page-btn' href='#'>" +i
													+"</a></li>"
		} 
	}	
	if (data.pagination.next == true) {
		inputPaginationData += "<li class='page-item'>"
			+ "<a class='page-link page-btn-next' href='#' aria-label='Next'>"
			+ "<span aria-hidden='true'>&raquo;</span>"
			+ "<span class='sr-only'>Next</span>"
			+ "</a></li>"
	}
	$('#pagination').html(inputPaginationData);


	$('#oldSearchType').val(data.criteria.searchType);
	$('#oldKeyword').val(data.criteria.keyword);
	$('#oldperPageNum').val(data.criteria.perPageNum);
	$('#oldPage').val(data.criteria.page);
}

$('#collapseAtt').addClass('show');
		$('#collapseAtt').prev().removeClass('collapsed');
		$('#collapseAtt').prev().children().css("color","#fff");
		
