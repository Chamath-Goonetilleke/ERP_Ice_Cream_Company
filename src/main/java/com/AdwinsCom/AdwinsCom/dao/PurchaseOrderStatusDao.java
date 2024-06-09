package com.AdwinsCom.AdwinsCom.dao;

import com.AdwinsCom.AdwinsCom.entity.PurchaseOrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PurchaseOrderStatusDao extends JpaRepository<PurchaseOrderStatus, Integer>{
    
}
