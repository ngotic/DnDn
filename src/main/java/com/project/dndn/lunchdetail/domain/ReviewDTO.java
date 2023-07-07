package com.project.dndn.lunchdetail.domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;


@Data
public class ReviewDTO {
    private String reviewseq;
    private String sellboardseq;
    private String regdate;
    private String content;
    private String star;
    private String id;
    private String image;

    private MultipartFile uploadImg;
}
