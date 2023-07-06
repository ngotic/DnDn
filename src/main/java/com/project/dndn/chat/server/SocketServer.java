package com.project.dndn.chat.server;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;



//프로그램 <- (통신) -> 프로그램
//카톡 	   <-		-> 카톡서버
//브라우저  <-      -> 톰캣

//상대편의 고유한 주소 인식!! > IP 주소(NIC) + 포트번호 > EndPoint(종단점)
//네트워크 통신할때 상대방을 구분하는 식별자로 사용됨

//클라이언트(WebSocket) 연결을 받아주는 역할 > 웹소켓 서버

//192.168.30.31:80/server.do
@ServerEndpoint("/server.do")
public class SocketServer {

	//클라이언트가 연결 요청 하기를 기다림 > 자동 수락
	@OnOpen
	public void handleOpen() {
		
		System.out.println("클라이언트가 접속했습니다.");
	}
	
	
	//클라이언트가 연결을 종료하면 발생
	@OnClose
	public void handleClose() {
		
		System.out.println("클라이언트와 연결이 종료됐습니다.");
		
	}
	
	//클라이언트가 서버에게 메시지를 전송했을 때 발생
	@OnMessage
	public String handleMessage(String msg) { //클라이언트가 보낸 메세지
		
		System.out.println("클라이언트 메세지: " + msg);
		
		return "(응답)" + msg;//클라이언트에게 보내는 메세지
	}
	
	
	@OnError
	public void handleError(Throwable e) {
		
		System.out.println("에러 발생: " + e.getMessage());
		
	}
	
	
	
}
