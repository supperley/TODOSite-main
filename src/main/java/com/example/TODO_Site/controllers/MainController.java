package com.example.TODO_Site.controllers;

import com.example.TODO_Site.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final UserService userService;

    @GetMapping("/functions")
    public String functions(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "functions";
    }

    @GetMapping("/about")
    public String about(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "about";
    }
}