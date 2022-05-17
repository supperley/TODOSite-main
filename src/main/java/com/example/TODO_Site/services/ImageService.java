package com.example.TODO_Site.services;

import com.example.TODO_Site.models.Image;
import com.example.TODO_Site.repositories.ImageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@Slf4j
@RequiredArgsConstructor
public class ImageService {
    private final ImageRepository imageRepository;
    public Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }
    public void deleteImage(Long id) {
        Image image = imageRepository.findById(id).orElse(null);
        if (image != null) {
            image.setUser(null);
        }
        imageRepository.deleteById(id);
        log.info("Delete image id = {}", id);
    }
}
