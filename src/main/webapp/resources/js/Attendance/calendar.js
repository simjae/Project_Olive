
document.addEventListener('DOMContentLoaded', function() {

	$('[data-toggle="tooltip"]').tooltip();
	console.log("띠용");

	var calendarEl = document.getElementById('calendar');
	//db일정 받아오기 
	var eventFeed = function(info, successCallback,
		failureCallback) {
		$.ajax({
			type: "GET",
			url: "/attendance/calendarList.do",
			dataType: "json",
			success: function(data) {
				console.log('ajsijsidj');
				successCallback(data);
				console.log(data);
			},
			error: function(xhr) {
				console.log(xhr.status)
			}
		});
	}

	var calendar = new FullCalendar.Calendar(
		calendarEl,
		{
			dateClick: function(info) {
				/* alert('Date: ' + info.dateStr);
				alert('Resource ID: ' + info.resource.id); */
				$("#myModal").modal();
				$("#sname").val(info.dateStr);
				$("#ename").val(info.dateStr);
				$("#modal-body").html("");
			},

			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'custom,dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			//출석 버튼 생생
			customButton: {
				custom: {
					text: '출석',
					id: 'startwork',
					click: function() {
						$
							.ajax({
								url: '/users/attendances',
								type: 'GET',
								dataType: "JSON",
								success: function(
									data) {
								},
								error: function() {
									alert('there was an error while fetching events!');
								}
							});
					}
				}

			},
			buttonText: {
				today: '오늘',
				month: '월',
				week: '주',
				day: '일',
				list: '주간 일정표'
			},

			//버튼 
			select: function(selectionInfo) {
				alert('selected ');
				$('#startwork').click(function() {

					console.log("dasd");
				})

			},

			//initialDate : '2020-09-12', // 캘린더 지정날짜로 보이게하기 
			navLinks: true, // can click day/week names to navigate views
			nowIndicator: true,
			weekNumbers: true,
			weekNumberCalculation: 'ISO',
			editable: true,
			selectable: true,
			dayMaxEvents: true, // allow "more" link when too many events
			/*events:[
				{
					
					  title: '휴가',
					  start: '2021-01-07',
					  end: '2021-01-10'
					} 

				]*/

			events: eventFeed

		});
	calendar.render();

});


