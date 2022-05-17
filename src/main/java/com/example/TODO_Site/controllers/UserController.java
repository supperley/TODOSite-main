package com.example.TODO_Site.controllers;

import com.example.TODO_Site.models.User;
import com.example.TODO_Site.services.TaskService;
import com.example.TODO_Site.services.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.security.Principal;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final TaskService taskService;

    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        //model.addAttribute("products", user.getProducts());
        model.addAttribute("tasks", taskService.getTaskByUser(user));
        return "user-info";
    }

    @GetMapping("/settings")
    public String settings(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "settings";
    }

    @PostMapping("/saveSettings")
    public String saveSettings(@RequestParam("file") MultipartFile file, Principal principal, User user_edited,
                               RedirectAttributes redirectAttrs) throws IOException {
        User user = userService.getUserByPrincipal(principal);
        int result = userService.editUser(user, user_edited, file);
        switch (result) {
            case 0:
                redirectAttrs.addFlashAttribute("okMessage", "Данные сохранены успешно!");
                break;
            case 1:
                redirectAttrs.addFlashAttribute("errorMessage", "Пользователь с адресом электронной почты " + user_edited.getEmail() + " уже существует");
                break;
            case 2:
                redirectAttrs.addFlashAttribute("errorMessage", "Пользователь с номером телефона " + user_edited.getPhoneNumber() + " уже существует");
                break;
        }
        redirectAttrs.addFlashAttribute("user", user);
        return "redirect:/settings";
    }
}
