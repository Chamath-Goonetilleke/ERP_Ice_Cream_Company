package com.AdwinsCom.AdwinsCom.dao;

import java.util.List;

import com.AdwinsCom.AdwinsCom.entity.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface SupplierDao extends JpaRepository<Supplier, Integer>{

    @Query(value = "select new Supplier(s.id, s.suppliername) from Supplier s where s.supplierstatus_id.id=1")
    List<Supplier> list();

    
    
}
