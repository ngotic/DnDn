package com.project.dndn.lunchdetail.service;

import com.project.dndn.lunchdetail.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.lunchdetail.mapper.LunchDetailMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int orderTransaction(OrderDTO order) {

        // -------------------------------------
        // 1. 배송지 테이블에 레코드 추가 > addressseq.nextVal, id, addressname, tel, zipcode, address, addressdetail
        if ( order.getAddressname().equals("") )
            order.setAddressname("미입력");

        if(!order.getCouponmemberseq().equals("0")) {
            String[] seqs = order.getCouponmemberseq().split(",");
            order.setCouponmemberseq(seqs[0]);
            order.setCouponseq(seqs[1]);
        }

        System.out.println("----->>"+order);

        int result = mapper.insertAddress(order);
        // 2. 주문정보 추가, 추가된 배송지 정보 배송지 seq를 가져옴 > 이 때 selectKey를 사용하기

        result *= mapper.insertOrder(order);
        // --------------------------------------
        // 3. 장바구니 정보 결제 완료로 상태 update

        List<String> list = Arrays.asList(order.getCartseqList());
        result *= mapper.updateOrderCart(list);

        if(!order.getCouponmemberseq().equals("0"))
            result *= mapper.updateCoupon(order.getCouponmemberseq(), order.getId());

        // 4. 쿠폰 사용시 쿠폰 update
        // 5. 사용자 포인트 차감 or 포인트 증가
        // ---------------------------------------
        // 1. 새로 얻는 Point - 사용하는 포인트만큼 업데이트
        int point = order.getAddpoint() - order.getUsepoint();

        result *= mapper.updateMemberPoint(order.getId(), point);

        return result;
    }

    @Override
    public int getUserPoint(String id) {
        return mapper.getUserPoint(id);
    }

    @Override
    public int reviewWrite(ReviewDTO reviewdto) {
        return mapper.reviewWrite(reviewdto);
    }

	@Override
	public List<ReviewDTO> listReview(String seq) {

		return mapper.listReview(seq);
	}

	@Override
	public int reviewRemove(Integer rseq) {

		return mapper.reviewRemove(rseq);
	}

	@Override
	public int reviewReplyWrite(ReviewReplyDTO rdto) {
		return mapper.reviewReplyWrite(rdto);
	}

	@Override
	public int reviewReplyDelete(Integer rrseq) {
		return mapper.reviewReplyDelete(rrseq);
	}



}
