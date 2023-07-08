package com.project.dndn.lunchdetail.mapper;

import com.project.dndn.lunchdetail.domain.*;
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

    List<CartDTO> listCart(String id);
    int delCart(List<String> cartseqList);

    // 바로주문인경우 
    List<CartDTO> orderCartList(@Param("id") String id, @Param("list") List<String> cartseqList); // 주문페이지로 선택된 장바구니를 가져올 때 쓴다.

    // 장바구니에서 한번에 여러개 주문인 경우
    String maxCartseq(String id);

    List<CouponDTO> getUserCouponList(String id);

    int insertAddress(OrderDTO order);

    int insertOrder(OrderDTO order);

    int updateOrderCart( @Param("list") List<String>  list);

    int updateCoupon(@Param("couponmemberseq") String couponmemberseq, @Param("id") String id);

    int updateMemberPoint(@Param("id") String id, @Param("point") int point);

    int getUserPoint(String id);

    int reviewWrite(ReviewDTO reviewdto);
    
	List<ReviewDTO> listReview(String seq);
	
	int reviewRemove(Integer rseq);
	
	int reviewReplyWrite(ReviewReplyDTO rdto);
	
	int reviewReplyDelete(Integer rrseq);
    
}
