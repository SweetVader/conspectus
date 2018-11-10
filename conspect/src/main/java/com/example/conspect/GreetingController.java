package com.example.conspect;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class GreetingController {
    @GetMapping("/greeting")
    public String greeting(
            @RequestParam(name="name", required=false, defaultValue="Sweetie") String name,
            Map<String, Object> model
    ) {
        model.put("name", name);
        return "greeting";
    }
    @GetMapping
    public String main(Map<String , Object> model) {
        model.put("some", "Hello, Sunshine!");
        return "main";
    }

}