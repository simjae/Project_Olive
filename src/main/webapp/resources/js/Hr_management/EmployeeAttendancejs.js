/*
	파일명: searchAndPaging.js
    설명: 인사관리 - 직원 근태 휴가 관리 
    작성일: 2021-01-012
    작성자: 박채연 
*/
	
	// 타임스탬프 값을 년월일로 변환
	function Unix_timestamp(t) {
		var date = new Date(t);
		var year = date.getFullYear();
		var month = "0" + (date.getMonth() + 1);
		var day = "0" + date.getDate();
		var hour = "0" + date.getHours();
		var minute = "0" + date.getMinutes();
		var second = "0" + date.getSeconds();

		return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}
	
	$('#searchBtn').click(function() {
		let searchType = "";
		let keyword = $('#newKeyword').val();
		if ($('#newSearchType option:selected').val() == "사번") {
			searchType = "EMPNO"
		} else if ($('#newSearchType option:selected').val() == "부서") {
			searchType = "DEPTNAME"
		} else if ($('#newSearchType option:selected').val() == "이름") {
			searchType = "ENAME"
		}
		$.ajax({
			url: "/HR_managementRest/getAttList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType: searchType,
				keyword: keyword
			},
			success: (data) => {
				console.log("검색버튼 클릭");
				console.log(data);
				insertDatabyAjax1(data);
			}
		});
		$('#newKeyword').val("");
	})
	
	
	$(document).on("click", ".page-btn",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = $(this)[0].text;
		console.log(perPageNum);
		console.log(page);
		$.ajax({
			url: "/HR_managementRest/getAttList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				console.log("페이징클릭");
				console.log("durl");
				console.log(data);
				insertDatabyAjax1(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-prev",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = ($('#oldPage').val()-1);
		console.log(page);
		$.ajax({
			url: "/HR_managementRest/getAttList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax1(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-next",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = (parseInt($("#oldPage").val())+1);
		console.log(page);
		$.ajax({
			url: "/HR_managementRest/getAttList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax1(data);
			}
		})
	});
	
	
	function insertDatabyAjax1(data){
			console.log(data.criteria);
			console.log(data.list);
			console.log(data.pagination);
			console.log(data.list[0].empno);
			console.log(data.list[0].starttime);
			console.log("durl!!!!!!");
			$('#attListTable').empty();
			let inputListData = "";
			for (let i=0; i < data.list.length; i++) {
				inputListData += "<tr>"
							  	+"<td>"+data.list[i].empno+"</td>"
								+"<td>"+data.list[i].ename+"</td>"
								+"<td>"+data.list[i].deptname+"</td>"
								+"<td>"+Unix_timestamp(Number(data.list[i].starttime))+"</td>"
								+"<td>"+Unix_timestamp(Number(data.list[i].endtime))+"</td>"
								+"<td>"+data.list[i].attname+"</td>"
								+"</tr>"			
			}
			$('#attListTable').html(inputListData);
			console.log("여기");
			console.log(inputListData);
			
			$('#pagination').empty();
			let inputPaginationData = "";
			if(data.pagination.prev == true){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-prev' href='#' aria-label='Previous'>"
									  +"<span aria-hidden='true'>&laquo;</span>"
									  +"<span class='sr-only'>Previous</span>"
									  +"</a></li>"
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
			if(data.pagination.next == true){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-next' href='#' aria-label='Next'>"
									  +"<span aria-hidden='true'>&raquo;</span>"
									  +"<span class='sr-only'>Next</span>"
									  +"</a></li>"
			}
			$('#pagination').html(inputPaginationData);
			
			
			$('#oldSearchType').val(data.criteria.searchType);
			$('#oldKeyword').val(data.criteria.keyword);
			$('#oldperPageNum').val(data.criteria.perPageNum);
			$('#oldPage').val(data.criteria.page);	
	}
	
	
	
	////휴가전용
		$('#searchBtn2').click(function() {
		let searchType = "";
		let keyword = $('#newKeyword2').val();
		if ($('#newSearchType2 option:selected').val() == "사번") {
			searchType = "EMPNO"
		} else if ($('#newSearchType2 option:selected').val() == "부서") {
			searchType = "DEPTNAME"
		} else if ($('#newSearchType2 option:selected').val() == "이름") {
			searchType = "ENAME"
		}
		$.ajax({
			url: "/HR_managementRest/getAnnList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType: searchType,
				keyword: keyword
			},
			success: (data) => {
				insertDatabyAjax2(data);
			}
		});
		$('#newKeyword2').val("");
	})
	
	
	$(document).on("click", ".page-btn2",function(){
		let searchType = $('#oldSearchType2').val();
		let keyword = $('#oldKeyword2').val();
		let perPageNum = $('#oldPerPageNum2').val();
		let page = $(this)[0].text;
		console.log(perPageNum);
		console.log(page);
		$.ajax({
			url: "/HR_managementRest/getAnnList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				console.log("durl");
				console.log(data);
				insertDatabyAjax2(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-prev2",function(){
		let searchType = $('#oldSearchType2').val();
		let keyword = $('#oldKeyword2').val();
		let perPageNum = $('#oldPerPageNum2').val();
		let page = ($('#oldPage2').val()-1);
		console.log(page);
		$.ajax({
			url: "/HR_managementRest/getAnnList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax2(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-next2",function(){
		let searchType = $('#oldSearchType2').val();
		let keyword = $('#oldKeyword2').val();
		let perPageNum = $('#oldPerPageNum2').val();
		let page = (parseInt($("#oldPage2").val())+1);
		console.log(page);
		$.ajax({
			url: "/HR_managementRest/getAnnList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax2(data);
			}
		})
	});
	
	
	
	
	function insertDatabyAjax2(data){
			console.log(data.criteria);
			console.log(data.list);
			console.log(data.pagination);
			console.log(data.list[0].empno);
			console.log(data.list[0].startdate);
			$('#annListTable').empty();
			let inputListData = "";
			for (let i=0; i < data.list.length; i++) {
				inputListData += "<tr>"
								+"<td>"+Unix_timestamp(Number(data.list[i].startdate))+"</td>"
								+"<td>"+data.list[i].empno+"</td>"
								+"<td>"+data.list[i].ename+"</td>"
								+"<td>"+data.list[i].deptname+"</td>"
								+"<td>"+data.list[i].annaul+"</td>"
								+"<td>"+data.list[i].COUNT+"</td>"
								+"<td>"+data.list[i].DIFF+"</td>"
								+"</tr>"			
			}
			$('#annListTable').html(inputListData);
			
			
			$('#pagination2').empty();
			let inputPaginationData = "";
			if(data.pagination.prev == true){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-prev2' href='#' aria-label='Previous'>"
									  +"<span aria-hidden='true'>&laquo;</span>"
									  +"<span class='sr-only'>Previous</span>"
									  +"</a></li>"
			}
			for(let i=data.pagination.startPage; i<=data.pagination.endPage; i++){
				if(i == data.criteria.page){
				inputPaginationData += "<li class='page-item page-link'>"
				+ "<b>"
				+i +"</b></li>"
				}else{
				inputPaginationData += "<li class='page-item'>"
				+ "<a class='page-link page-btn2' href='#'>" +i
				+"</a></li>"
				} 
			}
			if(data.pagination.next == true){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-next2' href='#' aria-label='Next'>"
									  +"<span aria-hidden='true'>&raquo;</span>"
									  +"<span class='sr-only'>Next</span>"
									  +"</a></li>"
			}
			$('#pagination2').html(inputPaginationData);
			
			
			$('#oldSearchType2').val(data.criteria.searchType);
			$('#oldKeyword2').val(data.criteria.keyword);
			$('#oldperPageNum2').val(data.criteria.perPageNum);
			$('#oldPage2').val(data.criteria.page);	
	}
