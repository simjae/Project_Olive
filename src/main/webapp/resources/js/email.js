jQuery(document).ready(function($) {
	
	// 엔터 키 막기
	$('#email, #code').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	});
	
	// 인증번호 보내기 클릭 이벤트
	$('#submitBtn').click( () => {
		if( checkEmail($('#email').val()) ){
			sendEmail();
		}
	});

	// 이메일 유효성검사
	function checkEmail(email){
		const email_Regex = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/i;
		let flag = false;
		
		if(email.trim() === ''){
			console.log("이메일을 입력해주세요.");
		}else if( !email_Regex.test(email) ){
			console.log("올바른 이메일 형식을 입력해주세요.");
		}else {
			flag = true;
		}
		return flag;
	}
	
	// 이메일 보내기
	function sendEmail(){
		$('.loader').css('visibility', 'visible');
		$('.loader').css('oppacity','1');
		$.ajax({ 
			url : "registEmail.do",
			type : "POST",
			data : { email : $('#email').val() },
			success : () => {
				$('.loader').css('visibility', 'hidden');
				$('.loader').css('oppacity','0');
				swal("인증번호 발송 완료", $('#email').val() + " 이메일로 인증번호가 발송되었습니다.", "success");
				$('#code').attr('readonly', false);
				
				$('#finalCheck').removeClass('btn-secondary').addClass('btn-primary').attr('disabled',false);
			},
			error : (xhr) => {
				console.log(xhr.status);
			}
		});
	}
	
	// 코드 유효성검사
	function checkCode(code){
		let flag = false;
		
		if(code.trim() === ''){
			swal('인증번호를 입력해주세요.');
		}else if(code.trim().length <= 5){
			swal('올바른 인증번호를 입력해주세요.');
		}else {
			flag = true;
		}
		return flag;
	}
	
	// 인증번호 체크
	$('#finalCheck').click( () => {
		if( checkCode($('#code').val()) ) {
				
			$.ajax({
				url : "certificate.do",
				type : "POST",
				data : { inputCode : $('#code').val() ,
						 email : $('#email').val() },
				success : ( isCorrect ) => {
					if(isCorrect){
						
						swal({
							title: "인증 완료",
							text: $('#email').val()+ " 이메일로 인증이 완료되었습니다!",
							icon: "success",
						});
						
						// 시각적으로 완료되었음을 표시
						$('#finalCheck').removeClass('btn-primary').addClass('btn-secondary').attr('disabled', true);
						$('#submitBtn').removeClass('btn-primary').addClass('btn-secondary').attr('disabled', true);
						$('#email').attr('readonly', true);
						$('#code').attr('readonly', true);
						
						// 완료되어 페이지 이동 버튼 생성
						let homeBtn = "<button type='button' id='goToWork' class='btn btn-success btn-user btn-block'>Let's go to Work!</button>";
						$('#goToMain').append(homeBtn);
					}else{
						
						swal("인증 실패", "인증번호를 확인해주세요", "error");
					}
				},
				error : (xhr) => {
					swal("서버 오류", "처음부터 다시 시도하기 바랍니다.", "warning");
				}
			});
		}
	}); // 인증번호 체크
	
	// 일하러 가기 버튼 : 이메일 인서트, role 부여, 상태코드 20 부여
	$(document).on('click', 'button[id="goToWork"]', () => {
		$.ajax({ 
			url : "goToWork.do",
			type : "POST",
			data : { email : $('#email').val() },
			success : (url) => {
				location.href = "/" + url;
			},
			error : (xhr) => {
				console.log(xhr.status);
			}
		});
	});
	
});