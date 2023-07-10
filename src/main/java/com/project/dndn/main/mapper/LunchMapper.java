package com.project.dndn.main.mapper;

import java.util.List;

import com.project.dndn.main.domain.LunchBoardDTO;
import com.project.dndn.main.domain.pagingDTO;

public interface LunchMapper {
	List<LunchBoardDTO> getRecentLunchBoard();

	List<LunchBoardDTO> getHotLunchBoard();

	List<LunchBoardDTO> getPeriodLunchServce();
	
	List<LunchBoardDTO> getLunchBoardByCategory(String category);

	List<LunchBoardDTO> getLunchBoardServiceFull();

	List<LunchBoardDTO> getLunchBoardList(pagingDTO pdto);

	int getTotalCnt(pagingDTO pdto);
	
}
