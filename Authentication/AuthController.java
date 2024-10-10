package com.example.ToDoApp.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class AuthController {
    @Autowired
    private AuthService authService;


    @GetMapping("/auth/register")
        public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register"; 
    } 

    @PostMapping("/auth/register")
    public String registerUser(User user, Model model) {
        try {
            authService.registerUser(user);
            return "login"; 
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage()); 
            return "register"; 
        }
    }

    @GetMapping("/auth/login")
    public String showLoginForm() {
        return "login"; 
    }

   
   
    @PostMapping("/auth/login")
    public String loginUser(String email, String password, Model model) {
        User user = authService.loginUser(email, password);
        if (user != null) {
           
            return "redirect:/"; 
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "login"; 
        }
    }
    @PostMapping("/auth/logout")
    public String logoutUser(HttpServletRequest request) {
        // Invalidate the session
        request.getSession().invalidate();
        // Redirect to the registration page
        return "redirect:/auth/register"; 
    }
}

