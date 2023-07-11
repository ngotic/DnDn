package com.project.dndn.inform.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/notice_add.do")
public class SummerNoteUploadController {

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseBody
    public void handleFileUpload(HttpServletRequest request, HttpServletResponse response,
    		  					@RequestParam("file") MultipartFile[] files) throws IOException {
        System.out.println("This is SummerNoteUpload!!");
        request.setCharacterEncoding("UTF-8");

        try {
            String uploadPath = request.getServletContext().getRealPath("/resources/fileupload");
            System.out.println("Upload path: " + uploadPath);

            
            
            JSONArray arr = new JSONArray();
            System.out.println("1성공");
            for (MultipartFile file : files) {
                String originalFileName = file.getOriginalFilename();
                System.out.println("2성공");
                String fileName = file.getOriginalFilename();
                System.out.println("3성공");
                
                File uploadedFile = new File(uploadPath, fileName);
                FileCopyUtils.copy(file.getBytes(), uploadedFile);

                System.out.println(">" + originalFileName);
                System.out.println(">" + fileName);

                JSONObject obj = new JSONObject();
                obj.put("orgfilename", originalFileName);
                obj.put("filename", fileName);
                arr.put(obj);
            }

            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            response.getWriter().print(arr.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // Add other methods as needed
}