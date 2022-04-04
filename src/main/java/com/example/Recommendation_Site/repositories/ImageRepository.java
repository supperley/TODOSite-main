package com.example.Recommendation_Site.repositories;

import com.example.Recommendation_Site.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.*;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
