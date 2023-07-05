package com.project.dndn.inform.mapper;

import java.util.List;

import com.project.dndn.inform.domain.NoticeDTO;

public interface NoticeMapper {

	int add(NoticeDTO dto);

	List<NoticeDTO> noticelist();

	NoticeDTO noticeget(String noticeseq);

	int noticeedit(NoticeDTO dto);
	
	
	
	
	
	

}
