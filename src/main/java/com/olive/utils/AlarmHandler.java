package com.olive.utils;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class AlarmHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> socketList = new HashMap<String,WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		
		session.sendMessage(new TextMessage("출근 전이신가요? 출근 버튼을 누르세요"));
		super.afterConnectionEstablished(session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		super.handleMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}

	// json형태의 문자열을 파라미터로 받아서 SimpleJson의 파서를 활용하여 JSONObject로 파싱처리를 해주는 함수
	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	//알람이 오는 것  
	//1. 누군가가 문서를 기안하면 다음 결재자에게 결재를 하라고 알람이 가야함
	//2. 누군가가 받은 문서에 승인을 하면 다음 결재자에게 결재를 하라고 알람이 가야함
	//3. 최종 결재가 떨어진다면 기안을 한사람에게 결과(승인, 반려)에 대해 알람이 가야함
	//4. +a 출근하면 출근 찍으라고 알람 감
	
	// => 모든사람이 아니라 문서와 관련이 있는 사람에게만 문자가 가는 거임 => 문서번호가 하나의 방이 된다???
	// => 보통 방은 클릭해서 들어가거나 이런식인데 어떻게 하지? 
	// => 문서 번호로 방을 만든다면 문서를 보고있는 사람만 알람이 간다는 건데... 이건 아니지 
	
	// 모든 사원을 한곳에다가 다몰아 넣어 놓고 문서에 해당되는 사번을 찾은다음 그 사람에게 문자를 보내야함

}
