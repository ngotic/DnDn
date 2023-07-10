package com.project.dndn.inform.mapper;

import java.util.List;
import java.util.Map;

import com.project.dndn.inform.domain.FaqDTO;
import com.project.dndn.inform.domain.NoticeDTO;

public interface NoticeMapper {

	int add(NoticeDTO dto);

	List<NoticeDTO> noticelist();

	NoticeDTO noticeget(String noticeseq);

	int noticeedit(NoticeDTO dto);

	int noticedel(NoticeDTO dto);

	int views(String noticeseq);
	
	List<NoticeDTO> getSearchPageList(Map<String,Integer> map, String column, String word);
	int getCount();

	List<NoticeDTO> getSearchPageList(Map<String, String> map2);

	List<NoticeDTO> getPageList(Map<String, String> map2);

	int getSearchCount(Map<String, String> map2);

	int getCount(Map<String, String> map);

	List<NoticeDTO> mainlist();

	int main(NoticeDTO dto);

	int mainquit(NoticeDTO dto);

	List<NoticeDTO> faqlist(FaqDTO dto);
	
	
	
	

}
