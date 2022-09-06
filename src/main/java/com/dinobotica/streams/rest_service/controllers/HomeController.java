package com.dinobotica.streams.rest_service.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class HomeController {
    
    @RequestMapping("home")
    public String getFramesChunk() {
        
        return "index.jsp";

    }
}
