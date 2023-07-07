package com.project.dndn.order;

import java.util.Random;

public class test {
	  public static void main(String[] args) {
	        Random random = new Random();
	        
	        for (int i = 1; i <= 20; i++) {
	            String couponName = "쿠폰" + i;
	            int sale = random.nextInt(26) + 5; // 5 이상 30 이하의 난수 생성
	            int duration = random.nextInt(15) + 1; // 1 이상 15 이하의 난수 생성
	            
	            String insertStatement = "INSERT INTO tblcoupon (couponseq, name, sale, period) VALUES (couponseq.nextVal, '" + couponName + "', " + sale + ", " +"sysdate+"+ duration + ");";
	            
	            System.out.println(insertStatement);
	        }
	    }
}
