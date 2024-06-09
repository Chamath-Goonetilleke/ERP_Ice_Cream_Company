package com.AdwinsCom.AdwinsCom.controller;

import com.AdwinsCom.AdwinsCom.dao.IngredeintDao;
import com.AdwinsCom.AdwinsCom.entity.Ingredeint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;


@RestController
@RequestMapping(value = "/ingredeint")
public class IngredeintController {
    
    @Autowired
    private IngredeintDao ingredeintDao;

    @Autowired
    private PrivilegeController privilegeController;


    // @Autowired
    // private SupplierStatus supStatusDao;

    @GetMapping
    public ModelAndView supplierModelAndView() {
        ModelAndView supplierMV = new ModelAndView();
        supplierMV.setViewName("ingredeint.html");
        return supplierMV;
    }

    @GetMapping(value = "/availblelist", produces = "application/json")
    public List<Ingredeint> getAvailableDataList(){
        //Login user authentication and authorization
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        HashMap<String ,Boolean> logUserPrivi = privilegeController.getPrivilegeByUserModule(auth.getName(), "Ingredeint");

        if(!logUserPrivi.get("select")){
            return null;
        }

        return ingredeintDao.getAvailableItemList();
    }



}
