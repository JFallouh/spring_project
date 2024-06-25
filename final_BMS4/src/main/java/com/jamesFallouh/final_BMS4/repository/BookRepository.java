package com.jamesFallouh.final_BMS4.repository;

import com.jamesFallouh.final_BMS4.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
