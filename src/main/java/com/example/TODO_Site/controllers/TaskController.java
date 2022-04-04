package com.example.TODO_Site.controllers;

import com.example.TODO_Site.models.Task;
import com.example.TODO_Site.models.User;
import com.example.TODO_Site.services.TaskService;
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
public class TaskController {
    private final TaskService taskService;

    @GetMapping("/")
    public String tasks(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("tasks", taskService.listTasks(title));
        model.addAttribute("user", taskService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "tasks";
    }

    @GetMapping("/task/{id}")
    public String tasksInfo(@PathVariable Long id, Model model, Principal principal) {
        Task task = taskService.getTaskById(id);
        model.addAttribute("user", taskService.getUserByPrincipal(principal));
        model.addAttribute("tasks", task);
        model.addAttribute("images", task.getImages());
        model.addAttribute("authorTask", task.getUser());
        return "task-info";
    }

    @PostMapping("/task/create")
    public String createTask(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, Task task, Principal principal) throws IOException {
        taskService.saveTask(
                principal, task, file1, file2, file3);
        return "redirect:/my/tasks";
    }

    @PostMapping("/task/delete/{id}")
    public String deleteTask(@PathVariable Long id){
        taskService.deleteTask(id);
        return "redirect:/";

    }

    @GetMapping("/my/tasks")
    public String userTasks(Principal principal, Model model) {
        User user = taskService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("tasks", user.getProducts());
        return "mytasks";
    }
}
