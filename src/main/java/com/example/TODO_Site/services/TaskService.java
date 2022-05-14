package com.example.TODO_Site.services;

import com.example.TODO_Site.models.Image;
import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import com.example.TODO_Site.repositories.ImageRepository;
import com.example.TODO_Site.repositories.TaskRepository;
import com.example.TODO_Site.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
@Slf4j
@RequiredArgsConstructor
public class TaskService {
    private final TaskRepository taskRepository;
    private final UserRepository userRepository;
    private final ImageRepository imageRepository;
    private final UserService userService;
    private final ImageService imageService;

    public List<Task> listTasks(User user, String title, String priority) {
        //List<Task> result = taskRepository.findAll();
        List<Task> result = user.getProducts();

        if (priority != null && !Objects.equals(priority, ""))
        {
            long priority_id = 0L;
            switch (priority) {
                case ("High"):
                    priority_id = 3L;
                    break;
                case ("Medium"):
                    priority_id = 2L;
                    break;
                case ("Low"):
                    priority_id = 1L;
                    break;
            }

            if (title != null) {
                title = "%" + title + "%";
                result = taskRepository.findByTitleLikeIgnoreCaseAndPriorityAndUser(title, priority_id, user);
            } else {
                result = taskRepository.findByPriorityAndUser(priority_id, user);
            }
            return result;
        }
        if (title != null)
        {
            title = "%" + title + "%";
            result = taskRepository.findByTitleLikeIgnoreCaseAndUser(title, user);
        }

        return result;
    }

    public void saveTask(Principal principal, Task task, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        User user = userService.getUserByPrincipal(principal);
        task.setUser(user);
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = imageService.toImageEntity(file1);
            image1.setPreviewImage(true);
            image1.setUser(user);
            task.addImageToTask(image1);
        }
        if (file2.getSize() != 0) {
            image2 = imageService.toImageEntity(file2);
            image2.setUser(user);
            task.addImageToTask(image2);
        }
        if (file3.getSize() != 0) {
            image3 = imageService.toImageEntity(file3);
            image3.setUser(user);
            task.addImageToTask(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", task.getTitle(), task.getUser().getEmail());
        Task productFromDb = taskRepository.save(task);
        if (file1.getSize() != 0) {
            productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        }
        else
            productFromDb.setPreviewImageId((long) -1);
        taskRepository.save(task);
    }

    public void editTask(Principal principal, Task new_task, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        Task task = getTaskById(new_task.getId());
        User user = userService.getUserByPrincipal(principal);
        task.setUser(user);
        task.setTitle(new_task.getTitle());
        task.setTag(new_task.getTag());
        task.setDescription(new_task.getDescription());
        task.setPriority(new_task.getPriority());
        Image image1;
        Image image2;
        Image image3;
        List<Image> old_images = task.getImages();
        task.setImages(null);
//        imageRepository.delete(old_images.get(0));
//        imageRepository.delete(old_images.get(1));
//        imageRepository.delete(old_images.get(2));
        List<Image> new_images = new ArrayList<>();
        log.info("ImagesSizeOld: {}", old_images.size());
        if (file1.getSize() != 0) {
            image1 = imageService.toImageEntity(file1);
            image1.setPreviewImage(true);
            image1.setTask(task);
            image1.setUser(user);
            if (old_images.size() > 0) {
                log.info("Id: {}", old_images.get(0).getId());
                deleteImage(old_images.get(0).getId());
            }
            new_images.add(image1);
        }
        if (file2.getSize() != 0) {
            image2 = imageService.toImageEntity(file2);
            image2.setTask(task);
            image2.setUser(user);
            if (old_images.size() > 1) {
                deleteImage(old_images.get(1).getId());
            }
            new_images.add(image2);
        }
        if (file3.getSize() != 0) {
            image3 = imageService.toImageEntity(file3);
            image3.setTask(task);
            image3.setUser(user);
            if (old_images.size() > 2) {
                deleteImage(old_images.get(2).getId());
            }
            new_images.add(image3);
        }
        task.setImages(new_images);
        log.info("Editing Product. Title: {}; Author email: {}", task.getTitle(), task.getUser().getEmail());
        Task productFromDb = taskRepository.save(task);
        if (file1.getSize() != 0) {
            productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        }
        log.info("ImagesSizeNew: {}", task.getImages().size());
        taskRepository.save(task);
    }

    public void deleteTask(Long id){
        Task task = taskRepository.getById(id);
        User user = task.getUser();
//        List<Task> tasks = user.getProducts();
//        Log.info("{}", tasks.size());
        user.getProducts().remove(task);
        task.setUser(null);
        taskRepository.deleteById(id);

    }

    public void deleteImage(Long id) {
        imageRepository.deleteById(id);
    }

    public void deleteImagesByTaskId(Long id) {
        Task task = taskRepository.getById(id);
        task.setPreviewImageId(-1L);
        List<Image> images = taskRepository.getById(id).getImages();
        task.setImages(null);
        for (Image x: images) {
            x.setTask(null);
            x.setUser(null);
            deleteImage(x.getId());
        }
    }

    public void checkTask(Long id){
        Task task = getTaskById(id);
        task.setIsChecked(!task.getIsChecked());
        taskRepository.save(task);
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    }

    public List<Task> getTaskByUser(User user){
        return taskRepository.findByUser(user);
    }
}
