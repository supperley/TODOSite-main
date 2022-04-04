package com.example.TODO_Site.repositories;

import com.example.TODO_Site.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
