package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.ReviewDTO;
import com.project.dndn.lunchdetail.domain.ReviewReplyDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/lunchdetail")
public class ReviewController {

    @Autowired
    private LunchDetailService service;
    // 리뷰 조회
    //dndn/lunchdetail/review?seq=3
//    @GetMapping("/review")
//    public ResponseEntity<List<ReviewDTO>> list(Integer seq){
//        List<ReviewDTO> list = null;
//        try {
//
//            //list = service.getReviewList(seq);
//
//            return new ResponseEntity<List<ReviewDTO>>(list, HttpStatus.OK);
//        } catch (Exception e){
//            e.printStackTrace();
//            return new ResponseEntity<List<ReviewDTO>>(HttpStatus.BAD_REQUEST);
//        }
//    }


    // 리뷰 등록
    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PostMapping("/review") // http://localhost/dndn/lunchdetail/review/10?seq=3 / POST
    // 댓글을 등록하는 메서드
    public ResponseEntity<String> write(ReviewDTO reviewdto,
                                        Principal principal, HttpServletRequest req) {
    	System.out.println(">"+reviewdto);
        try {
        	reviewdto.setId(principal.getName());
            if ( reviewdto.getUploadImg() != null) {
                String path = req.getRealPath("/resources/reviewImgs");
                System.out.println(path);
                UUID uuid = UUID.randomUUID();
                String imgFileName = uuid + "_" + reviewdto.getUploadImg().getOriginalFilename();
                File file = new File(path + "\\" + uuid + "_" + reviewdto.getUploadImg().getOriginalFilename());
                System.out.println(">>>"+path + "\\" + uuid + "_" + reviewdto.getUploadImg().getOriginalFilename());
                reviewdto.getUploadImg().transferTo(file);
                reviewdto.setImage("/resources/reviewImgs/" + imgFileName);
            }

            int result = service.reviewWrite(reviewdto);
            if ( result !=1 )
                 throw new Exception("Write Failed");

            return new ResponseEntity<String>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("ERR",HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/review/{rseq}")  // http://localhost/dndn/lunchdetail/review/10 DELETE
    // 이거 어노테이션 순서는 상관없다.
    public ResponseEntity<String> remove(@PathVariable Integer rseq){

        System.out.println("delete 요청 : "+rseq);
        try {
            int rowCnt = service.reviewRemove(rseq);
        	if ( rowCnt !=1 )
        		throw new Exception("Delete Failed");
            return new ResponseEntity<>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
        }
    }
    
    @PreAuthorize("isAuthenticated()") 
    @PostMapping("/reviewreply/{rseq}")  // http://localhost/dndn/lunchdetail/review/10 DELETE
    // 이거 어노테이션 순서는 상관없다.
    public ResponseEntity<String> reviewreply(@PathVariable Integer rseq, HttpServletRequest req, Principal principal){
    	
    	
        System.out.println("post reviewreply 요청 : "+rseq);
        System.out.println(principal.getName());
        System.out.println("content: "+req.getParameter("content"));
        
        try {
        	String content =req.getParameter("content");
        	ReviewReplyDTO rdto = new ReviewReplyDTO();
        	rdto.setId(principal.getName());
        	rdto.setReviewseq(rseq);
        	rdto.setContent(content);
        	
        	int rowCnt = service.reviewReplyWrite(rdto);
        	if ( rowCnt !=1 )
        		throw new Exception("reviewreply Failed");
            return new ResponseEntity<>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
        }
    }
    
    @PreAuthorize("isAuthenticated()") 
    @DeleteMapping("/reviewreply/{rrseq}")  // http://localhost/dndn/lunchdetail/review/10 DELETE
    // 이거 어노테이션 순서는 상관없다.
    public ResponseEntity<String> reviewreplydelete(@PathVariable Integer rrseq, Principal principal){
    	
        try {
        	
        	int rowCnt = service.reviewReplyDelete(rrseq);
        	if ( rowCnt !=1 )
        		throw new Exception("reviewreply Failed");
            return new ResponseEntity<>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
        }
    }
    


}
