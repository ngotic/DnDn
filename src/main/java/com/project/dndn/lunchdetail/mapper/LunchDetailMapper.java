package com.project.dndn.lunchdetail.mapper;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LunchDetailMapper {
    LunchBoxDTO getLunchBoxDetail(@Param("period") String period,@Param("seq")  String seq);
    List<String> lunchBoxDetailList(String seq);

    List<StoreLocationDTO> getStoreLocations();
}
