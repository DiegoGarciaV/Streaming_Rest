package com.dinobotica.streams.rest_service.controllers;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;

import java.util.Arrays;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("api/v0/frames")
public class FramesController {

    private static final String TODAY_YEAR = "" + LocalDateTime.now().getYear();
    private static final String TODAY_MONTH = "" +  (LocalDateTime.now().getMonthValue()< 10 ? "0" + LocalDateTime.now().getMonthValue() : LocalDateTime.now().getMonthValue());
    private static final String TODAY = "" +  (LocalDateTime.now().getDayOfMonth() < 10 ? "0" + LocalDateTime.now().getDayOfMonth() : LocalDateTime.now().getDayOfMonth());
    
    public static final String FRAMES_PATH = "frames/tmp/" + TODAY_YEAR + TODAY_MONTH + TODAY + "/";
    
    @RequestMapping("getFramesChunk/{chunkId}")
    @ResponseBody
    public ResponseEntity<byte[]> getFramesChunk(@PathVariable("chunkId") String chunkId) {
        
        HttpHeaders headers = new HttpHeaders();
        
        String chunksPath = System.getenv().get("LOCAL_ENV_CHUNKS_PATH");
        String chunksPath2 = System.getenv("LOCAL_ENV_CHUNKS_PATH");

        try (BufferedInputStream fileReader = new BufferedInputStream(new FileInputStream((chunksPath == null ? "/home/diego/projects/java/Streaming/" : chunksPath) + FRAMES_PATH + "FramesChunk_" + chunkId + ".json"), 1024 << 9);)
        {
            headers.setContentDispositionFormData("attachment", "jsonChunk_" + Math.random() + ".json");
            headers.setAccessControlAllowOrigin("*");
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            byte[] lectura = new byte[1024 << 13];
            int readSize = fileReader.read(lectura);
            byte[] documentReaded = Arrays.copyOf(lectura, readSize);

            return new ResponseEntity<>(documentReaded,headers, HttpStatus.CREATED);
        } catch (IOException e) {
            return new ResponseEntity<>(e.toString().getBytes(),
                    headers, HttpStatus.CREATED);
        }

    }
}
