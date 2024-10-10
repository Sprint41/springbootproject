package com.example.ToDoApp.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private AuthRepository authRepository;

    public User registerUser(User user) {
        if (authRepository.findByEmail(user.getEmail()) != null) {
            throw new RuntimeException("User already exists with this email: " + user.getEmail());
        }
        return authRepository.save(user); // Save the new user
    }

    public User loginUser(String email, String password) {
        User user = authRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user; 
        }
        return null; 
    }
}
