package com.project.dndn.chat.server;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/noticeserver.do")
public class NoticeServer {
	
	private static List<Session> sessionList;
	
	static {
		
		sessionList = new ArrayList<Session>();
		
	}
	
	
	@OnOpen
	public void handleOpen(Session session) {
		
		System.out.println("연결 성공");
		sessionList.add(session);
		
	}
	
	
	@OnMessage
	public void handleMessage(String msg, Session session) {
		
		System.out.println("메시지: " + msg); //공지사항
		
		// 관리자 > (전송) > 공지사항 > (수신) > 서버 > (전송) > 모든 유저
		
		for (Session s : sessionList) {
			
			if (session != s) {
				try {
					//관리자 제외한 나머지 유저들에게만 메시지 전달
					s.getBasicRemote().sendText(msg);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		
		
	}
	
	
	@OnClose
	public void handleClose() {}
	
	
	@OnError
	public void handleError(Throwable e) {}
	
	public void clearSession() {
		
		Iterator<Session> iter = sessionList.iterator();
		
		while (iter.hasNext()) {
			if (!(iter.next()).isOpen()) {
				iter.remove(); //접속이 끊긴 클라이언트 소켓(세션)을 제거
			}
		}
		
	}

}
