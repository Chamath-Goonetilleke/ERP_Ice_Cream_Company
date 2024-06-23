package com.AdwinsCom.AdwinsCom.controller;
import com.AdwinsCom.AdwinsCom.Repository.ProductDao;
import com.AdwinsCom.AdwinsCom.Repository.UserDao;
import com.AdwinsCom.AdwinsCom.entity.Product;
import com.AdwinsCom.AdwinsCom.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private PrivilegeController privilegeController;

    @Autowired
    private UserDao userDao;

    @GetMapping(value = "/findall", produces = "application/json")
    public List<Product> findItemsWithSpecificAttributes(){
        //Login user authentication and authorization
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        HashMap<String ,Boolean> logUserPrivi = privilegeController.getPrivilegeByUserModule(auth.getName(), "Product");

        if(!logUserPrivi.get("select")){
            return null;
        }

        return productDao.findProductsWithSpecificAttributes();
    }
    @GetMapping()
    public ModelAndView ProductUI(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        HashMap<String ,Boolean> logUserPrivi = privilegeController.getPrivilegeByUserModule(auth.getName(), "product");
        if(!logUserPrivi.get("select")){
            return null;
        }
        {
            ModelAndView itemTableView = new ModelAndView();
            itemTableView.setViewName("product.html");
            return itemTableView;
        }
    }

    @GetMapping(value = "/itemform")
    public ModelAndView Item(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        HashMap<String ,Boolean> logUserPrivi = privilegeController.getPrivilegeByUserModule(auth.getName(), "Item");
        if(!logUserPrivi.get("update") || logUserPrivi.get("insert")){
            return null;
        }
        {
            ModelAndView itemView = new ModelAndView();
            itemView.setViewName("itemform.html");
            return itemView;
        }
    }

    @PostMapping
    public String saveProduct(@RequestBody Product product){
        //Authentication and Authorization
        //Login user authentication and authorization
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        HashMap<String ,Boolean> logUserPrivi = privilegeController.getPrivilegeByUserModule(auth.getName(), "Product");

        if(!logUserPrivi.get("insert"))
            return "Save Not Completed : haven't permission..!";

        //Duplicate

        try{
            //Set Auto Generated value
            product.setAddeddatetime(LocalDateTime.now());
            User loggedUser = userDao.getUserByUserName(auth.getName());
            product.setAdded_user_id(loggedUser);
            product.setDelete_user(loggedUser.getId());
            String nextProductCode = productDao.getNextProductCode();
            if(nextProductCode == null){
                product.setProductcode("1000000001");
            }else {
                product.setProductcode(nextProductCode);
            }
            //Operator
            productDao.save(product);

            return "OK";
        }catch (Exception e){
            return "Save Not Completed : " + e.getMessage();
        }

    }

}
