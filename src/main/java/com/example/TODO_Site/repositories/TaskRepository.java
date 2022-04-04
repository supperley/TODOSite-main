package com.example.TODO_Site.repositories;

import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByTitle(String title);
    List<Task> findByUser(User user);
}