package com.example.assignment_java5.controller;

import com.example.assignment_java5.model.Account;
import com.example.assignment_java5.service.IAccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import java.util.List;
@SessionScope
@Controller
@RequestMapping("/mon-gau-bong")
public class AccountController {
    @Autowired
    private IAccountService iAccountService;
    @Autowired
    private HttpSession httpSession;

    @GetMapping("/login")
    public String viewLogin() {
        return "account";
    }

    @PostMapping("/login")
    public String loginPost(Model model, @RequestParam(name = "username") String username,
                            @RequestParam(name = "password") String password) {
        Account account = iAccountService.findByUsernameAndPassword(username, password);
        httpSession.setAttribute("account", account);
        if (username.isEmpty()) {
            model.addAttribute("validate", "Username cannot be left blank!");
        } else {
            model.addAttribute("validate1", "Password cannot be left blank!");
        }
        if (account != null) {
            return "redirect:/mon-gau-bong/trang-chu";
        } else {
            model.addAttribute("notification", "Login Failed!");
            model.addAttribute("username", username);
            model.addAttribute("password", password);
            return "account";
        }
    }

    @GetMapping("/logout")
    public String logout() {
        httpSession.invalidate();
        return "redirect:/mon-gau-bong/trang-chu";
    }
}
