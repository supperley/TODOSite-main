package com.example.TODO_Site.controllers;

import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import com.example.TODO_Site.services.TaskService;
import com.example.TODO_Site.services.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.security.Principal;

@Controller
@Slf4j
@RequiredArgsConstructor
public class TaskController {
    private final TaskService taskService;
    private final UserService userService;

    @GetMapping("/")
    public String index(@RequestParam(name = "priority", required = false) String priority,
                        @RequestParam(name = "title", required = false) String title,
                        Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("tasks", taskService.listTasks(user, title, priority));
        model.addAttribute("user", user);
        model.addAttribute("title", title);
        model.addAttribute("priority", priority);
        if (user.getId() == null) {
            return "index";
        } else {
            return "tasks";
        }
    }

    @GetMapping("/task/{id}")
    public String tasksInfo(@PathVariable Long id, Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        Task task = taskService.getTaskById(id);
        if (task.getUser() != user)
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Forbidden");
        model.addAttribute("task", task);
        model.addAttribute("user", user);
        model.addAttribute("images", task.getImages());
        model.addAttribute("authorTask", task.getUser());
        return "task-info";
    }

    @PostMapping("/task/create")
    public String createTask(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Task task, Principal principal) throws IOException {
        taskService.saveTask(
                principal, task, file1, file2, file3);
        return "redirect:/";
    }

    @PostMapping("/task/delete/{id}")
    public String deleteTask(@PathVariable Long id){
        taskService.deleteImagesByTaskId(id);
        taskService.deleteTask(id);
        return "redirect:/";
    }

    @PostMapping("/task/check/{id}")
    public String checkTask(@PathVariable Long id){
        taskService.checkTask(id);
        return "redirect:/";
    }

    @GetMapping("/task/{id}/edit")
    public String editTask(@PathVariable Long id, Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        Task task = taskService.getTaskById(id);
        if (task.getUser() != user)
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Forbidden");
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("task", task);
        model.addAttribute("images", task.getImages());
        model.addAttribute("authorTask", task.getUser());
        return "task-edit";
    }

    @PostMapping("/task/{id}/edit")
    public String saveTask(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Task task, Principal principal) throws IOException {
        taskService.editTask(
                principal, task, file1, file2, file3);
        return "redirect:/";
    }

    @GetMapping("/my/tasks")
    public String userTasks(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("tasks", user.getProducts());
        return "mytasks";
    }
}
