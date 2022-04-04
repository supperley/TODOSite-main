package com.example.Recommendation_Site.repositories;

import com.example.Recommendation_Site.models.Review;
import com.example.Recommendation_Site.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByTitle(String title);
    List<Review> findByUser(User user);
}