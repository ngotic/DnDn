package com.project.dndn.lunchdetail.domain;


import lombok.Data;

@Data
public class CouponDTO {
    private String couponmemberseq; // 이게 key이다.
    private String id;
    private String couponseq;
    private String getdate;
    private String isuse;
    private String name;
    private String sale;
    private String period;
}
