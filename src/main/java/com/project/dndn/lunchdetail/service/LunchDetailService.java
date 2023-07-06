package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.*;

import java.util.List;

public interface LunchDetailService {


    LunchBoxDTO getLunchBoxDetail(String period, String seq);

    List<StoreLocationDTO> getStoreLocations();

    int addOrDeleteWish(String id, String sellboardseq);

    int checkBoardWishList(String name, int parseInt);

    int addCart(AddCartDTO cartdto);

    List<CartDTO> listCart(String id);

    int delCart(List<String> cartseqList);

    String maxCartseq(String id);

    List<CartDTO> orderCartList(String id, List<String> cartseqList);

    List<CouponDTO> getUserCouponList(String id);

    int orderTransaction(OrderDTO order);

    int getUserPoint(String id);
}
