package com.jamesFallouh.final_BMS4.controller;

import com.jamesFallouh.final_BMS4.model.Order;
import com.jamesFallouh.final_BMS4.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/employee/orders")
public class EmployeeOrderController {

    private final OrderService orderService;

    @Autowired
    public EmployeeOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public String listOrders(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "employee/order-list";
    }

    @GetMapping("/add")
    public String showAddOrderForm(Model model) {
        model.addAttribute("order", new Order());
        return "employee/add-order";
    }

    @PostMapping("/add")
    public String addOrder(@ModelAttribute("order") Order order) {
        orderService.saveOrder(order);
        return "redirect:/employee/orders";
    }

    @GetMapping("/edit/{id}")
    public String showEditOrderForm(@PathVariable Long id, Model model) {
        Order order = orderService.getOrderById(id).orElseThrow(() -> new IllegalArgumentException("Invalid order Id:" + id));
        model.addAttribute("order", order);
        return "employee/edit-order";
    }

    @PostMapping("/edit/{id}")
    public String updateOrder(@PathVariable Long id, @ModelAttribute("order") Order order) {
        orderService.saveOrder(order);
        return "redirect:/employee/orders";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
        return "redirect:/employee/orders";
    }
}
