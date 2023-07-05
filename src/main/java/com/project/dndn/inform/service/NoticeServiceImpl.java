package com.project.dndn.inform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.inform.domain.NoticeDTO;
import com.project.dndn.inform.mapper.NoticeMapper;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public int add(NoticeDTO dto) {
		
		return noticeMapper.add(dto);
	}

	@Override
	public List<NoticeDTO> noticelist() {
		
		return noticeMapper.noticelist();
	}

	@Override
	public NoticeDTO noticeget(String noticeseq) {
		
		return noticeMapper.noticeget(noticeseq);
	}

	@Override
	public int noticeedit(NoticeDTO dto) {
		
		return noticeMapper.noticeedit(dto);
	}
	
	

	
}
