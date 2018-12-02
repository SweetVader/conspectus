package com.example.conspectus.controller;

import com.example.conspectus.domain.Comment;
import com.example.conspectus.domain.Message;
import com.example.conspectus.domain.User;
import com.example.conspectus.domain.dto.MessageDto;
import com.example.conspectus.repos.CommentRepo;
import com.example.conspectus.repos.MessageRepo;
import com.example.conspectus.repos.UserRepo;
import com.example.conspectus.service.MessageService;
import com.example.conspectus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.util.Map;
import java.util.Set;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentRepo commentRepo;

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable,
            @AuthenticationPrincipal User user
    ) {
        Page<MessageDto> page = messageService.messageList(pageable, filter, user);

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }

    @GetMapping("/guest")
    public String notUser(Map<String, Object> model) {
        return "should";
    }

    @GetMapping("/messages/{message}/like")
    public String like(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer
    ) {
        Set<User> likes = message.getLikes();

        if (likes.contains(currentUser)) {
            likes.remove(currentUser);
        } else {
            likes.add(currentUser);
        }

        messageRepo.save(message);

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }

    @GetMapping("message/{message}")
    public String getMessagePage(
            Model model,
            @PathVariable Message message
    ){
        messageRepo.findById(message.getId());
        model.addAttribute("username", message.getAuthor());
        model.addAttribute("message", message);
        model.addAttribute("comments", commentRepo.findAll());

        return "message_page";
    }

    @PostMapping("/messages/{message}/comment")
    public String comment(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Message message,
            @Valid Comment comment,
            @RequestParam String  commentariy,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            @RequestHeader(required = false) String referer,
            Model model
    ) {
        if(commentariy != null){
            comment.setConspect(message);
            comment.setPerson(currentUser);
            comment.setText(commentariy);
            commentRepo.save(comment);
        }

        UriComponents components = UriComponentsBuilder.fromHttpUrl(referer).build();

        components.getQueryParams()
                .entrySet()
                .forEach(pair -> redirectAttributes.addAttribute(pair.getKey(), pair.getValue()));

        return "redirect:" + components.getPath();
    }
}