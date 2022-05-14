package com.example.TODO_Site.repositories;

import com.example.TODO_Site.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    User findByPhoneNumber(String phone);
    User findByName(String username);
}
