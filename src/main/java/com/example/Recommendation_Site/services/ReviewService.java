package com.example.Recommendation_Site.services;

import com.example.Recommendation_Site.models.Review;
import com.example.Recommendation_Site.models.User;
import com.example.Recommendation_Site.repositories.ReviewRepository;
import com.example.Recommendation_Site.repositories.UserRepository;
import com.example.Recommendation_Site.models.Image;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;
    private final UserRepository userRepository;

    public List<Review> listReviews(String title) {
        if (title != null) return reviewRepository.findByTitle(title);
        return reviewRepository.findAll();
    }

    public void saveReview(Principal principal, Review review, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        review.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            review.addImageToReview(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            review.addImageToReview(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            review.addImageToReview(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", review, review.getUser().getEmail());
        Review productFromDb = reviewRepository.save(review);
        if (file1.getSize() != 0) {
            productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        }
            else
            productFromDb.setPreviewImageId((long) -1);
        reviewRepository.save(review);

    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }


    public void deleteReview(Long id){
        reviewRepository.deleteById(id);
    }

    public Review getReviewById(Long id) {
        return reviewRepository.findById(id).orElse(null);
    }

    public List<Review> getReviewByUser(User user){
        return reviewRepository.findByUser(user);
    }
}
