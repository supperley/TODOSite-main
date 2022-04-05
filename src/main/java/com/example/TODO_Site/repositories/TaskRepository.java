package com.example.TODO_Site.repositories;

import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByTitleLikeIgnoreCase(String title);
    List<Task> findByPriority(Long priority);
    List<Task> findByUser(User user);
    List<Task> findByTitleLikeIgnoreCaseAndUser(String title, User user);
    List<Task> findByPriorityAndUser(long priority_id, User user);
    List<Task> findByTitleLikeIgnoreCaseAndPriorityAndUser(String title, long priority_id, User user);
}