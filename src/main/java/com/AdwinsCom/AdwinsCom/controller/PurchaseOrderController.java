package com.AdwinsCom.AdwinsCom.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping(value = "/purchaseorder")
public class PurchaseOrderController {
    
    @GetMapping
    public ModelAndView purchaseOrderModel(){

        ModelAndView purOrderMV = new ModelAndView();
        purOrderMV.setViewName("purchaseorder.html");
        return purOrderMV;
    }

    // @GetMapping(value = "/findall") 
    // public List<> 

}
