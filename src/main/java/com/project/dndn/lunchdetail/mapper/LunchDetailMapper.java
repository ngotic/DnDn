package com.project.dndn.lunchdetail.mapper;

import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LunchDetailMapper {
    LunchBoxDTO getLunchBoxDetail(@Param("period") String period,@Param("seq")  String seq);
    List<String> lunchBoxDetailList(String seq);

    List<StoreLocationDTO> getStoreLocations();

    // 다수의 인자인 경우 파람으로 표기해주기
    int readUserWishList(@Param("id") String id ,@Param("sellboardseq") int sellboardseq );
    void deleteUserWishList(@Param("id") String id , @Param("sellboardseq") int sellboardseq );
    void insertUserWishList(@Param("id")String id , @Param("sellboardseq") int sellboardseq );

    int addCart(CartDTO cartdto);
}
