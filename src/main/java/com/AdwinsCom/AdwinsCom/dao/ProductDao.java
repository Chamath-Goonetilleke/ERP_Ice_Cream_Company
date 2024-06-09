package com.AdwinsCom.AdwinsCom.dao;
import com.AdwinsCom.AdwinsCom.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductDao extends JpaRepository<Product,Integer> {
    @Query(value = "select new Product (i.id, i.productcode,i.productname,i.salesprice,i.productstatus_id,i.delete_user,i.packagetype_id) from Product i order by i.id desc")
    List<Product> findProductsWithSpecificAttributes();

    @Query(value = "SELECT concat('I',lpad(substring(max(i.itemcode),2)+1,10,'0')) FROM bitprojecttue.item as i;",nativeQuery = true)
    public String getNextProductCode();


}
