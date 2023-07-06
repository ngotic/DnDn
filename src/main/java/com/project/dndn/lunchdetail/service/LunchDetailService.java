package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import com.project.dndn.lunchdetail.domain.AddCartDTO;

import java.util.List;

public interface LunchDetailService {


    LunchBoxDTO getLunchBoxDetail(String period, String seq);


    List<StoreLocationDTO> getStoreLocations();


    int addOrDeleteWish(String id, String sellboardseq);

    int checkBoardWishList(String name, int parseInt);

    int addCart(AddCartDTO cartdto);

    List<CartDTO> listCart(String id);

    int delCart(List<String> cartseqList);

}
