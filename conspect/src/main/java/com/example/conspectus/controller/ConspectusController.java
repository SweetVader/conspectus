package com.example.conspectus.controller;

import com.example.conspectus.domain.Message;
import com.example.conspectus.domain.User;
import com.example.conspectus.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class ConspectusController {

    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @PostMapping("/profile/{user}")
    public String add(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            @RequestParam("file") MultipartFile file,
            @Valid Message message,
            BindingResult bindingResult,
            Model model
    ) throws IOException {

        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            saveFile(file, message);

            model.addAttribute("message", null);

            messageRepo.save(message);
        }
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages", messages);
        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "success";
    }

  /*  @PostMapping("/delete")
    public String deleteMessage(
            @PathVariable User user,
            @RequestParam("file") MultipartFile file,
            @Valid Message message,
            Model model
            ){

        SQLiteDbSupport db = new SQLiteDbSupport();
        db.delete


        return "profile/{user}";
    }*/

 /* @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
      String[] ids = request.getParameterValues("message.id");

      if (ids != null && ids.length > 0){
          UserService userService = new UserService();
          UserService.removeAll(ids);
      }
  }*/

    private void saveFile(@RequestParam("file") MultipartFile file, @Valid Message message) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String resultFilename = file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }
    }
}


