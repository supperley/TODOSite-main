package com.example.TODO_Site.controllers;

import com.example.TODO_Site.models.Image;
import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import com.example.TODO_Site.repositories.ImageRepository;
import com.example.TODO_Site.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.io.ByteArrayInputStream;
import java.security.Principal;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ImageRepository imageRepository;
    private final UserService userService;

    @GetMapping("/images/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Long id, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        Image image = imageRepository.findById(id).orElse(null);
        if (!user.isAdmin() && (image.getUser() == null || image.getUser() != user))
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Forbidden");
        return ResponseEntity.ok()
                .header("fileName", image.getOriginalFileName())
                .contentType(MediaType.valueOf(image.getContentType()))
                .contentLength(image.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
    }
}
