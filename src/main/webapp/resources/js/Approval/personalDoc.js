/**
 * 
 */

function insertDatabyAjax(data){
			console.log(data.criteria);
			console.log(data.list);
			console.log(data.pagination);
			
			$('#docBody').empty();
			let inputListData = "";
			for (let i=0; i < data.list.length; i++) {
				inputListData ='<tr><td>'+item.docno+'</td>\
						<td>'+item.typeName+'</td>\
						<td><a href=viewDocument.do?docno='+item.docno+'&typeCode='+item.typeCode+'>'+item.title+'</a></td>\
						<td>'+item.ename+'</td>\
						<td>'+time.getFullYear() + '-' +('0' + (time.getMonth()+1)).slice(-2)+ '-' +  ('0' + time.getDate()).slice(-2) +'</td>\
						<td><div class="row">\
						<div class="col-md-7 px-0 mx-0">\
							<div class="progress">\
								<div class="progress-bar" role="progressbar" style="width:'+(100*item.curr_Approval/item.total_Approval)+'%;" \
									aria-valuenow="'+item.curr_Approval+'" aria-valuemin="0">'+item.curr_Approval+'/'+item.total_Approval+'</div>\
							</div>\
						</div>\
						<div class="col-md-5 px-0 mx-0">'+item.statusName+'</div>\
						</div></td></tr>';
	
			}
			$('#docBody').html(inputListData);
			
			
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