package com.example.Recommendation_Site.repositories;

import com.example.Recommendation_Site.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
