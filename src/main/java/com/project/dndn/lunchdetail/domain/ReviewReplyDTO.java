package com.project.dndn.lunchdetail.domain;

import lombok.Data;

@Data
public class ReviewReplyDTO {
	private String reviewreplyseq;
	private Integer reviewseq;
	private String id;
	private String regdate;
	private String content;
}
