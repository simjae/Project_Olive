
document.addEventListener('DOMContentLoaded', function() {
	
	$('[data-toggle="tooltip"]').tooltip();

	var calendarEl = document.getElementById('calendar');
	//db일정 받아오기 
	var eventFeed = function(info, successCallback,
		failureCallback) {
		$.ajax({
			type: "GET",
			url: "/attendance/calendarList.do",
			dataType: "json",
			display:'block',
			success: function(data) {
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
			
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'custom,dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			buttonText: {
				today: '오늘',
				month: '월',
				week: '주',
				day: '일',
				list: '주간 일정표'
			},

			//initialDate : '2020-09-12', // 캘린더 지정날짜로 보이게하기 
			
			navLinks: true, // can click day/week names to navigate views
			nowIndicator: true,
			weekNumbers: true,
			weekNumberCalculation: 'ISO',
			editable: true,
			selectable: true,
			dayMaxEvents: true, // allow "more" link when too many events
	
			events: eventFeed

		});
	calendar.render();

});
