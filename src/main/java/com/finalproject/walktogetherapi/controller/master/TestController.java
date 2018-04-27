package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.entities.Test;
import com.finalproject.walktogetherapi.service.TestService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/v1/test")
public class TestController {
    private TestService testService;

    @Autowired
    public TestController(TestService testService) {
        this.testService = testService;
    }

   @GetMapping("")
   public ResponseEntity getTestAll(){
       List<Test> list =   testService.findAll();
       return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, list, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
   }

   @GetMapping("getById/{id}")
   public ResponseEntity getTestId(@PathVariable Long id){
         Test test =   testService.findById(id);
       return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, test, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
   }
    @GetMapping("getByUsername/{username}")
    public ResponseEntity getTestId(@PathVariable String username){
        List<Test> test =   testService.findByUsername(username);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, test, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity createTest(@RequestBody HashMap<String, Object>  data){
       Test test = new Test();
       test.setFirstname(data.get("firstname").toString());
        test.setUsername(data.get("username").toString());
       test.setPassword(data.get("password").toString());
       test.setTitle(data.get("title").toString());
       test.setPatient_number(Integer.parseInt(data.get("pnumner").toString()));

       Test result = testService.create(test);
       return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);

    }

    @DeleteMapping("deleteId/{id}")
    public ResponseEntity deleteId(@PathVariable Long id){
        Test result = testService.delete(id);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);

    }
    @PatchMapping("updateTest/{id}")
    public ResponseEntity updateTest(@RequestBody HashMap<String, Object>  data , @PathVariable Long id){
        Test test = testService.findById(id);

       if(data.get("firstname") != null){
           test.setFirstname(data.get("firstname").toString());
       }
       if (data.get("password") != null){
           test.setPassword(data.get("password").toString());
       }
        if (data.get("username") != null){
            test.setUsername(data.get("username").toString());
        }
        if (data.get("title") != null){
            test.setTitle(data.get("title").toString());
        }
        if (data.get("pnumner") !=null ){
            test.setPatient_number(Integer.parseInt(data.get("pnumner").toString()));
        }

        Test result = testService.create(test);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);

    }
}
