package com.project.dndn.inform.service;

import java.util.List;

import com.project.dndn.inform.domain.NoticeDTO;

public interface NoticeService {

	//글쓰기
	int add(NoticeDTO dto);

	//공지사항 목록보기
	List<NoticeDTO> noticelist();

	//상세보기
	NoticeDTO noticeget(String noticeseq);

	int noticeedit(NoticeDTO dto);



	

}
