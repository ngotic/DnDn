package com.project.dndn.security;

import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUsernameNotFoundException extends UsernameNotFoundException {
    
    private String username;
    
    public CustomUsernameNotFoundException(String username) {
        super("Username not found: " + username);
        this.username = username;
    }
    
    public String getUsername() {
        return username;
    }
}
