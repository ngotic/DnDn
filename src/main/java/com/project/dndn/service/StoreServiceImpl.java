package com.project.dndn.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.dndn.store.domain.StoreDTO;
import com.project.dndn.store.mapper.StoreMapper;


@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	@Qualifier("storeMapper")
	private StoreMapper storeMapper;
	
	public ArrayList<StoreDTO> getBuildingList() {
		
		return storeMapper.buildinglist();
	}
	
}
