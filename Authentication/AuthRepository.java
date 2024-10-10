package com.example.ToDoApp.Authentication;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}

