package com.project.dndn.inform.domain;

import lombok.Data;

@Data
public class NoticeDTO {
	
	private String rnum;

	private String noticeseq;
	private String title;
	private String content;
	private String regdate;
	private String views;
	private String id;
	private String mainnotice;
	
	private String column;
	private String word;


}
