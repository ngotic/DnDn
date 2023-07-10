package com.project.dndn.lunchdetail.domain;


import lombok.Data;

@Data
public class OrderDTO {
    private String id;
    private String price;
    private String request;
    private String couponmemberseq;
    private String couponseq;
    private String payment;
    private String addressname;
    private String tel;
    private String zipcode;
    private String address;
    private String addressdetail;
    private String eventseq;
    private int addpoint;
    private int usepoint;
    private String[] cartseqList;

    private int addressseq;

}
