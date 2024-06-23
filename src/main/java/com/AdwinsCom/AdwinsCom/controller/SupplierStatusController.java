package com.AdwinsCom.AdwinsCom.controller;
import java.util.List;
import com.AdwinsCom.AdwinsCom.Repository.SupplierStatusDao;
import com.AdwinsCom.AdwinsCom.entity.SupplierStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value = "/supplierstatus/findall")
public class SupplierStatusController {
    
    @Autowired
    private SupplierStatusDao SupplierStatusDao;

    @GetMapping
    public List<SupplierStatus> findall(){

        return SupplierStatusDao.findAll();
    }
}
