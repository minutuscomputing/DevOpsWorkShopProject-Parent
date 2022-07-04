package com.crm.crm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;;

@Component
public class DemoLoader implements CommandLineRunner {

    private final ContactRepo repo;

    @Autowired
    public DemoLoader(ContactRepo repo) {
        this.repo = repo;
    }

    @Override
    public void run(String... args) throws Exception {
        this.repo.save(new Contact("Neelam", "Test", "Test@.3.com"));
        
    }

}
