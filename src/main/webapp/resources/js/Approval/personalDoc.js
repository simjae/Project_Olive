$(function(){
	var today = new Date();
	
	console.log(today);


	$('.doc').on("click",function(){
	let html = '';
	console.log($(this).val());
		 
	$.ajax({
		url:"getArrangedDocList.do",
		dataType: "json",
		mehtod:"get", 
		contentType: "application/json; charset=utf-8",
		data:{
			statusCode:$(this).val(),
			},
		success:function(data){
			$('#docBody').empty();
			console.log(data);
			
			$.each(data.pagingList,(index,item)=>{ 
				let time = new Date(item.writedate);
				let html='<tr><td>'+item.docno+'</td>\
						<td>'+item.typename+'</td>\
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
						<div class="col-md-5 px-0 mx-0">'+item.statusname+'</div>\
						</div></td></tr>';
				$('#docBody').append(html);
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
				
				
				$('#oldSearchType').val(data.cri.searchType);
				$('#oldKeyword').val(data.cri.keyword);
				$('#oldperPageNum').val(data.cri.perPageNum);
				$('#oldPage').val(data.cri.page);
			});
		
		}
		

		});		
	 
	console.log(html); 
});




$('a[name=document]').on("click",function(){
	console.log($(this).innerText);
});



})