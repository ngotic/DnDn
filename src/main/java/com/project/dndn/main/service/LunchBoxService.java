package com.project.dndn.main.service;

import java.util.List;

import com.project.dndn.main.domain.LunchBoardDTO;

public interface LunchBoxService {
	List<LunchBoardDTO> getRecentLunchServce();

	List<LunchBoardDTO> getHotLunchServce();

	List<LunchBoardDTO> getLunchBoardByCategory(String category);
}
