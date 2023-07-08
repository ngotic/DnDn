package com.project.dndn.main.mapper;

import java.util.List;

import com.project.dndn.main.domain.LunchBoardDTO;

public interface LunchMapper {
	List<LunchBoardDTO> getRecentLunchBoard();

	List<LunchBoardDTO> getHotLunchBoard();

	List<LunchBoardDTO> getLunchBoardByCategory(String category);
}
