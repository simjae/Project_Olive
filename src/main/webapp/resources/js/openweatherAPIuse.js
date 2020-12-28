/*
	파일명: openweatherAPIuse.js
	설명: opeaweathermap.org 날씨API 가공하여 처리하는 스크립트
	작성일: 2020-12-27
	작성자: 백희승
*/

// 타 js파일과 jQuery 충돌 방지를 위해 글로벌 객체 $(jQuery)에서 지역 객체 $w 선언한다..
// 참고 : https://yubylab.tistory.com/entry/%EB%8B%A4%EB%A5%B8-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC%EB%A1%9C%EB%B6%80%ED%84%B0-jQuery-%EB%B3%B4%ED%98%B8%ED%95%98%EA%B8%B0
jQuery(document).ready(function($w) {
	const cityName = "Seoul";
	const myAPIKey = "553443488ecc7e0c8a291ed1bfe91121";
	const weatherURI = "http://http://api.openweathermap.org/data/2.5/weather?q=" + cityName + "&appid=" + myAPIKey;
	
	// 비동기 주소를 적어넣어 데이터 받아오기.
	function getData(_targetURL){
		return new Promise((resolve, reject) => {
			// 비동기함수 수정하기
			$w.ajax(_targetURL, (response) => {
				if(response) {
					resolve(response);
				} else
				reject(new Error("Weather API Request is failed"));
			});
		});
	}
	
	
	
});