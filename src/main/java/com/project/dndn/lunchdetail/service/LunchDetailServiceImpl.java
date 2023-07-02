package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
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

        System.out.println("여기는 서비스단"+sellboardseq+ id);

        int result = checkBoardWishList(id, sellboardseqInt);

        System.out.println("리절트는 이겁니다. "+result);

        if(result > 0)
              mapper.deleteUserWishList(id, sellboardseqInt);
        else
              mapper.insertUserWishList(id, sellboardseqInt);

        return 1;
    }


    @Override
    public int addCart(CartDTO cartdto) {
        return mapper.addCart(cartdto);
    }

}
