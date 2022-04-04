package com.example.Recommendation_Site.controllers;

import com.example.Recommendation_Site.models.Review;
import com.example.Recommendation_Site.models.User;
import com.example.Recommendation_Site.services.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService reviewService;

    @GetMapping("/")
    public String reviews(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("reviews", reviewService.listReviews(title));
        model.addAttribute("user", reviewService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "reviews";
    }

    @GetMapping("/review/{id}")
    public String reviewsInfo(@PathVariable Long id, Model model, Principal principal) {
        Review review = reviewService.getReviewById(id);
        model.addAttribute("user", reviewService.getUserByPrincipal(principal));
        model.addAttribute("reviews", review);
        model.addAttribute("images", review.getImages());
        model.addAttribute("authorReview", review.getUser());
        return "review-info";
    }

    @PostMapping("/review/create")
    public String createReview(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Review review, Principal principal) throws IOException {
        reviewService.saveReview(
                principal, review, file1, file2, file3);
        return "redirect:/my/reviews";
    }

    @PostMapping("/review/delete/{id}")
    public String deleteReview(@PathVariable Long id){
        reviewService.deleteReview(id);
        return "redirect:/";

    }

    @GetMapping("/my/reviews")
    public String userReviews(Principal principal, Model model) {
        User user = reviewService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("reviews", user.getProducts());
        return "myreviews";
    }
}
