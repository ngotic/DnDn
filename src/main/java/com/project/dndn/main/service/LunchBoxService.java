package com.project.dndn.main.service;

import java.util.List;

import com.project.dndn.main.domain.LunchBoardDTO;
import com.project.dndn.main.domain.pagingDTO;

public interface LunchBoxService {
	List<LunchBoardDTO> getRecentLunchServce();

	List<LunchBoardDTO> getHotLunchServce();

	List<LunchBoardDTO> getLunchBoardByCategory(String category);

	List<LunchBoardDTO> getPeriodLunchServce();

	List<LunchBoardDTO> getLunchBoardServiceFull();

	List<LunchBoardDTO> getLunchBoardList(pagingDTO pdto);

	int getTotalCnt(pagingDTO pdto);
}
