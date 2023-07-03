package com.project.dndn.lunchdetail.domain;

import lombok.Data;

@Data
public class CartDTO {
    private String cartseq;
    private String id;
    private String sellboardseq;
    private String periodshipseq;
    private String cnt;
    private String storeseq;
    private String status;
    private String regdate;

    private String storename;
    private String pic;
    private String content;
    private String sale;
    private String price;
}
