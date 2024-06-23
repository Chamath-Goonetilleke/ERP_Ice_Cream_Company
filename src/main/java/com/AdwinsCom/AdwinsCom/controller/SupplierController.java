package com.AdwinsCom.AdwinsCom.controller;
import java.util.List;
import com.AdwinsCom.AdwinsCom.Repository.SupplierDao;
import com.AdwinsCom.AdwinsCom.entity.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping(value = "/supplier")
public class SupplierController {
    
    @Autowired
    private SupplierDao suppplierDao;

    // @Autowired
    // private SupplierStatus supStatusDao;

    @GetMapping
    public ModelAndView supplierModelAndView() {
        ModelAndView supplierMV = new ModelAndView();
        supplierMV.setViewName("supplier.html");
        return supplierMV;
    }

    @GetMapping(value = "/list", produces = "application/json")
    public List<Supplier> supplierList() {
        return suppplierDao.findAll(Sort.by(Direction.DESC, "id"));
    }

    @GetMapping(value = "/suplist", produces = "application/json")
    public List<Supplier> list(){
        return suppplierDao.list();
    }

}
