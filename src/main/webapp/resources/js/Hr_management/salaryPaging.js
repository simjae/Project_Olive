/*
	파일명: salaryPaging.js
    설명: 인사관리 - 급여 관리 - 게시판 비동기 
    작성일: 2021-01-06
    작성자: 정민찬
*/	


/*	$('#searchBtn').click(function() {
		let searchType = "";
		let keyword = $('#newKeyword').val();
		if ($('#newSearchType option:selected').val() == "사번") {
			searchType = "EMPNO"
		} else if ($('#newSearchType option:selected').val() == "본부") {
			searchType = "HEADNAME"
		} else if ($('#newSearchType option:selected').val() == "부서") {
			searchType = "DEPTNAME"
		} else if ($('#newSearchType option:selected').val() == "이름") {
			searchType = "ENAME"
		}
		$.ajax({
			url: "/HR_managementRest/getList.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType: searchType,
				keyword: keyword
			},
			success: (data) => {
				insertDatabyAjax(data);
			}
		});
		$('#newKeyword').val("");
	})*/
	
	
	$(document).on("click", ".page-btn",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = $(this)[0].text;
		$.ajax({
			url: "/HR_managementRest/Salary.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-prev",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = parseInt($('#oldPage').val())-1;
		$.ajax({
			url: "/HR_managementRest/Salary.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax(data);
			}
		})
	});
	
	$(document).on("click", ".page-btn-next",function(){
		let searchType = $('#oldSearchType').val();
		let keyword = $('#oldKeyword').val();
		let perPageNum = $('#oldPerPageNum').val();
		let page = parseInt($('#oldPage').val())+1;
		$.ajax({
			url: "/HR_managementRest/Salary.do",
			type: "POST",
			dataType:  "JSON",
			data: {
				searchType : searchType,
				keyword : keyword,
				perPageNum : perPageNum,
				page : page
			},
			success: (data) => {
				insertDatabyAjax(data);
			}
		})
	});
	 
	function comma(str) {
   	  str = String(str);
   	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 	}
	
	function insertDatabyAjax(data){
			console.log(data.criteria);
			console.log(data.list);
			console.log(data.pagination);
			$('#salaryTbl').empty();
			let inputListData = "";
			for (let i=0; i < data.list.length; i++) {
				var totalIncome = data.list[i].basic_pay + data.list[i].overtime_pay + data.list[i].position_pay + data.list[i].bonus + data.list[i].educational_supports + data.list[i].mess_allowance + data.list[i].maintenance_of_vehicle;
				var exemption = data.list[i].income_tax+ data.list[i].local_income_tax+data.list[i].health_insurance+data.list[i].care_insurance+data.list[i].employment_insurance+data.list[i].national_pension;
				var afterTaxIncome = totalIncome - exemption;
				var cellDate1 = moment(new Date(data.list[i].SAL_DATE)).format('YYYY-MM-DD');
				var cellDate2 = moment(data.list[i].SAL_DATE).format('YYYY년 MM월 DD일');
				inputListData += "<tr>"
							  	+"<td>"+ cellDate2 +"</td>"
								+"<td>"+data.list[i].ename+"</td>"
								+"<td>"+data.list[i].EMPNO+"</td>"
								+"<td>"+data.list[i].deptname+"</td>"
								+"<td>"+comma(totalIncome)+"</td>"
								+"<td>"+comma(exemption)+"</td>"
								+"<td>"+comma(afterTaxIncome)+"</td>"
								+"<td>"
								+"<button class='table-button salaryDetail'	value="
								+cellDate1
								+","
								+ data.list[i].EMPNO + ">보기</button>" 
								+"</td>"
								+"</tr>";		
			}
			$('#salaryTbl').html(inputListData);
			
			$('#pagination').empty();
			let inputPaginationData = "";
			if(data.pagination.prev = "true"){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-prev' href='#' aria-label='Previous'>"
									  +"<span aria-hidden='true'>&laquo;</span>"
									  +"<span class='sr-only'>Previous</span>"
									  +"</a></li>"
			}
			for(let i=data.pagination.startPage; i<=data.pagination.endPage; i++){
				console.log(i);
				inputPaginationData += "<li class='page-item'>"
									 + "<a class='page-link page-btn' href='#'>"
									 + i
									 +"</a></li>"
			}
			if(data.pagination.next = "true"){
				inputPaginationData += "<li class='page-item'>"
									  +"<a class='page-link page-btn-next' href='#' aria-label='Next'>"
									  +"<span aria-hidden='true'>&laquo;</span>"
									  +"<span class='sr-only'>Next</span>"
									  +"</a></li>"
			}
			$('#pagination').html(inputPaginationData);
			
			
			$('#oldSearchType').val(data.criteria.searchType);
			$('#oldKeyword').val(data.criteria.keyword);
			$('#oldperPageNum').val(data.criteria.perPageNum);
			$('#oldPage').val(data.criteria.page);	
	}