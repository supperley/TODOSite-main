package com.example.TODO_Site.services;

import com.example.TODO_Site.models.Image;
import com.example.TODO_Site.models.User;
import com.example.TODO_Site.models.enums.Role;
import com.example.TODO_Site.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final ImageService imageService;

    public boolean createUser(User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_ADMIN);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public int editUser(User user, User user_edited, MultipartFile avatar) throws IOException {
        String old_email = user.getEmail();
        String old_phone = user.getPhoneNumber();
        String old_name = user.getName();
        String email = user_edited.getEmail();
        String phone = user_edited.getPhoneNumber();
        String name = user_edited.getName();
        log.info("User = {}, {}, {}", old_email, old_phone, old_name);
        log.info("Edit user = {}, {}, {}", email, phone, name);
        if (!old_email.equals(email)) {
            if (userRepository.findByEmail(email) != null)
                return 1;
            user.setEmail(email);
        }
        if (!old_phone.equals(phone)) {
            if (userRepository.findByPhoneNumber(phone) != null)
                return 2;
            user.setPhoneNumber(phone);
        }
        if (!old_name.equals(name)) {
            user.setName(name);
        }
        Image image;
        if (avatar.getSize() != 0) {
            image = imageService.toImageEntity(avatar);
            image.setUser(user);
            if (user.getAvatar() != null) {
                Long image_id = user.getAvatar().getId();
                user.setAvatar(null);
                imageService.deleteImage(image_id);
            }
            user.setAvatar(image);
        }
        userRepository.save(user);
        return 0;
    }
}
