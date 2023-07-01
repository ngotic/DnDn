package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.mapper.LunchDetailMapper;

import java.util.List;

@Service
public class LunchDetailServiceImpl implements LunchDetailService {

    @Autowired
    private LunchDetailMapper mapper;

    @Override
    public LunchBoxDTO getLunchBoxDetail(String period, String seq) {
        LunchBoxDTO dto = mapper.getLunchBoxDetail(period, seq);
        dto.setDetailUrl(mapper.lunchBoxDetailList(seq));
        return dto;
    }

    @Override
    public List<StoreLocationDTO> getStoreLocations() {
        return mapper.getStoreLocations();
    }


}
