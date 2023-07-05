package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.lunchdetail.mapper.LunchDetailMapper;
import org.springframework.transaction.annotation.Transactional;

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


    @Override
    public int checkBoardWishList(String id, int sellboardseqInt) {
        return mapper.readUserWishList(id, sellboardseqInt);
    }


    @Transactional
    @Override
    public int addOrDeleteWish(String id, String sellboardseq) {
        int sellboardseqInt = Integer.parseInt(sellboardseq);

        int result = checkBoardWishList(id, sellboardseqInt);

        if(result > 0)
              mapper.deleteUserWishList(id, sellboardseqInt);
        else
              mapper.insertUserWishList(id, sellboardseqInt);

        return 1;
    }

    @Override
    public int addCart(AddCartDTO cartdto) {
        return mapper.addCart(cartdto);
    }

    @Override
    public List<CartDTO> listCart(String id) {
        return mapper.listCart(id);
    }

    @Override
    public int delCart(List<String> cartseqList) {
        return mapper.delCart(cartseqList);
    }

    @Override
    public String maxCartseq(String id) {
        return mapper.maxCartseq(id);
    }

    @Override
    public List<CartDTO> orderCartList(String id, List<String> cartseqList) {
        return mapper.orderCartList(id, cartseqList);
    }

    @Override
    public List<CouponDTO> getUserCouponList(String id) {
        return mapper.getUserCouponList(id);
    }


}
