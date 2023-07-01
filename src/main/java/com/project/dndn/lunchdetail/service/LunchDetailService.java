package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import com.project.dndn.lunchdetail.mapper.LunchDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface LunchDetailService {


    LunchBoxDTO getLunchBoxDetail(String period, String seq);


    List<StoreLocationDTO> getStoreLocations();
}
