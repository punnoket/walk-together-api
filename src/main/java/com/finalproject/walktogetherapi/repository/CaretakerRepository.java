package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CaretakerRepository extends JpaRepository<Caretaker, Long> {
    @Query("select c from Caretaker c where c.userName = ?1")
    Caretaker findByUserName(String username);

    @Query("select c from Caretaker c where c.email = ?1")
    Caretaker findByEmail(String email);

    @Query("select c from Caretaker c where c.tell = ?1")
    Caretaker findByTell(String tell);

    @Query("select c from Caretaker c where c.caretakerNumber = ?1")
    Caretaker findByNumberCaretaker(String number);
}
