package com.example.TODO_Site.services;

import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import com.example.TODO_Site.repositories.TaskRepository;
import com.example.TODO_Site.repositories.UserRepository;
import com.example.TODO_Site.models.Image;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TaskService {
    private final TaskRepository taskRepository;
    private final UserRepository userRepository;

    public List<Task> listTasks(String title) {
        if (title != null) return taskRepository.findByTitle(title);
        return taskRepository.findAll();
    }

    public void saveTask(Principal principal, Task task, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        task.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            task.addImageToTask(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            task.addImageToTask(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            task.addImageToTask(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", task, task.getUser().getEmail());
        Task productFromDb = taskRepository.save(task);
        if (file1.getSize() != 0) {
            productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        }
            else
            productFromDb.setPreviewImageId((long) -1);
        taskRepository.save(task);

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

    public void deleteTask(Long id){
        taskRepository.deleteById(id);
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    }

    public List<Task> getTaskByUser(User user){
        return taskRepository.findByUser(user);
    }
}
