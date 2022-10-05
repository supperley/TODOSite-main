package com.example.TODO_Site.controllers;

import com.example.TODO_Site.models.User;
import com.example.TODO_Site.models.enums.Role;
import com.example.TODO_Site.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        model.addAttribute("users", userService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "admin";
    }

//    @PostMapping("/admin/user/ban/{id}")
//    public String userBan(@PathVariable("id") Long id) {
//        userService.banUser(id);
//        return "redirect:/admin";
//    }

    @GetMapping("/admin/user/edit/{edited_user}")
    public String userEdit(@PathVariable("edited_user") User edited_user, Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("edited_user", edited_user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") Long userId, @RequestParam String role) {
        userService.changeUserRoles(userId, role);
        return "redirect:/admin";
    }
}
