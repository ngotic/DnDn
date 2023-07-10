package com.project.dndn.main.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.dndn.main.mapper.LunchMapper;

import com.project.dndn.main.domain.LunchBoardDTO;
import com.project.dndn.main.domain.pagingDTO;

@Service
public class LunchBoxServiceImpl implements LunchBoxService{

	@Autowired
	private LunchMapper mapper; // 인텔리제이가 얘 인식을 못함..
	
	@Override
	public List<LunchBoardDTO> getRecentLunchServce() {
		return mapper.getRecentLunchBoard();
	}

	@Override
	public List<LunchBoardDTO> getHotLunchServce() {
		// TODO Auto-generated method stub
		return mapper.getHotLunchBoard();
	}
	
	@Override
	public List<LunchBoardDTO> getPeriodLunchServce() {
		return mapper.getPeriodLunchServce();
	}
	
	@Override
	public List<LunchBoardDTO> getLunchBoardByCategory(String category) {
		return mapper.getLunchBoardByCategory(category);
	}

	@Override
	public List<LunchBoardDTO> getLunchBoardServiceFull() {
		return mapper.getLunchBoardServiceFull();
	}

	@Override
	public List<LunchBoardDTO> getLunchBoardList(pagingDTO pdto){
		
		//pdto.getPage()
		// 1 page  
		// 1 ~ 9
		// 2 page
		// 10 18
		// 3 page
		//
		int nowPage;
	    int totalPage = (int) Math.ceil((double)pdto.getTotalCnt() /pdto.getPageSize());
	    int pageSize  = pdto.getPageSize();
	    
	    if( pdto.getPage() == "0"|| pdto.getPage() == null ||  pdto.getPage() == "" ) {
	    	pdto.setPage("1");
	    	nowPage = 1;
	    }
	    else {
	    	nowPage = Integer.parseInt(pdto.getPage());
	    } 
	    	
	    int begin = ((nowPage - 1) * pageSize)+1;
	    int end = begin + pageSize -1;
	    
	    
	    int naviSize = pdto.getNaviSize();
	    
	    int beginPage = (nowPage - 1) / naviSize * naviSize + 1;
	    int endPage = Math.min(beginPage-1 + naviSize, totalPage);
	    
	    
	    pdto.setPage(nowPage+"");
	    pdto.setTotalPage(totalPage);
	    pdto.setShowPrev(beginPage != 1);
	    pdto.setShowNext(endPage != totalPage);
        
	    pdto.setBeginPage(beginPage);
	    pdto.setEndPage(endPage);
	    
	    pdto.setBegin(begin);
	    pdto.setEnd(end);
		
	    System.out.println("여기가 뭐지??? "+pdto);
	    
	    
		return mapper.getLunchBoardList(pdto);
	}

	@Override
	public int getTotalCnt(pagingDTO pdto) {
		return mapper.getTotalCnt(pdto);
	}
}
