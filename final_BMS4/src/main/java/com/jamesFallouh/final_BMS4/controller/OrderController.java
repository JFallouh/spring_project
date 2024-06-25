package com.jamesFallouh.final_BMS4.controller;

import com.jamesFallouh.final_BMS4.model.Book;
import com.jamesFallouh.final_BMS4.service.BookService;
import com.jamesFallouh.final_BMS4.service.OrderService;
import com.jamesFallouh.final_BMS4.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final BookService bookService;
    private final UserService userService;

    @Autowired
    public OrderController(OrderService orderService, BookService bookService, UserService userService) {
        this.orderService = orderService;
        this.bookService = bookService;
        this.userService = userService;
    }

    @PostMapping("/place")
    public String placeOrder(@RequestParam Long bookId, Authentication authentication, Model model) {
        String username = authentication.getName();
        orderService.createOrder(bookId, username);
        
        // Fetch the ordered book details
        Book orderedBook = bookService.getBookById(bookId).orElseThrow(() -> new IllegalArgumentException("Invalid book Id:" + bookId));
        
        // Add the book to the model
        model.addAttribute("books", List.of(orderedBook));
        
        return "order-confirmation";
    }
}
