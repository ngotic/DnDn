package com.project.dndn.inform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.inform.domain.FaqDTO;
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

	@Override
	public int noticedel(NoticeDTO dto) {
		
		return noticeMapper.noticedel(dto);
	}

	@Override
	public void views(String noticeseq) {
		noticeMapper.views(noticeseq);
		
	}

	@Override
	public int getCount() {
		
		return noticeMapper.getCount();
	}

	@Override
	public List<NoticeDTO> getSearchPageList(Map<String, Integer> map, String column, String word) {
		
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("startNo", map.get("startNo") + "");
		map2.put("endNo", map.get("endNo") + "");
		
		map2.put("column", column);
		map2.put("word", word);
		
		
		return noticeMapper.getSearchPageList(map2);
	}

	@Override
	public List<NoticeDTO> getPageList(Map<String, Integer> map) {
		Map<String,String> map2 = new HashMap<String,String>();
		map2.put("startNo", map.get("startNo") + "");
		map2.put("endNo", map.get("endNo") + "");
		
		return noticeMapper.getPageList(map2);
	}

	@Override
	public int getSearchCount( String column, String word) {
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("column", column);
		map.put("word", word);
		
		return noticeMapper.getSearchCount(map);
	}

	@Override
	public int getCount(String column, String word) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("column", column);
		map.put("word", word);
		
		return noticeMapper.getCount(map);
	}

	@Override
	public List<NoticeDTO> mainlist() {
		
		return noticeMapper.mainlist();
	}

	@Override
	public int main(NoticeDTO dto) {
		
		return noticeMapper.main(dto);
	}

	@Override
	public int mainquit(NoticeDTO dto) {
		
		return noticeMapper.mainquit(dto);
	}

	@Override
	public List<NoticeDTO> faqlist(FaqDTO dto) {
		
		return noticeMapper.faqlist(dto);
	}


	

	
}
