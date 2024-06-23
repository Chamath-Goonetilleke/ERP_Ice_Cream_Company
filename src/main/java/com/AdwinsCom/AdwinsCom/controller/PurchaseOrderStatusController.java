package com.AdwinsCom.AdwinsCom.controller;
import com.AdwinsCom.AdwinsCom.Repository.PurchaseOrderStatusDao;
import com.AdwinsCom.AdwinsCom.entity.PurchaseOrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PurchaseOrderStatusController {
    
    @Autowired
    private PurchaseOrderStatusDao statusRepo;

    @GetMapping(value = "/purchaseorderstatus/list", produces = "application/json")
    public List<PurchaseOrderStatus> findall(){

        return statusRepo.findAll();
    }
}
