package com.project.dndn.inform.service;

import java.util.List;
import java.util.Map;

import com.project.dndn.inform.domain.FaqDTO;
import com.project.dndn.inform.domain.NoticeDTO;

public interface NoticeService {

	//글쓰기
	int add(NoticeDTO dto);

	//공지사항 목록보기
	List<NoticeDTO> noticelist();

	//상세보기
	NoticeDTO noticeget(String noticeseq);
	
	//공지 수정하기
	int noticeedit(NoticeDTO dto);

	//공지 삭제하기
	int noticedel(NoticeDTO dto);

	void views(String noticeseq);

	int getCount();

	List<NoticeDTO> getSearchPageList(Map<String, Integer> map, String column, String word);

	List<NoticeDTO> getPageList(Map<String, Integer> map);

	int getSearchCount(String column, String word);

	int getCount(String column, String word);

	List<NoticeDTO> mainlist();

	int main(NoticeDTO dto);

	int mainquit(NoticeDTO dto);

	List<NoticeDTO> faqlist(FaqDTO dto);

	List<FaqDTO> categorylist(String category);







	

}
