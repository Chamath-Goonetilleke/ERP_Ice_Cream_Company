package com.AdwinsCom.AdwinsCom.Repository;

import java.util.List;

import com.AdwinsCom.AdwinsCom.DTO.SupplierDTO;
import com.AdwinsCom.AdwinsCom.DTO.SupplierWithIngredientsDTO;
import com.AdwinsCom.AdwinsCom.entity.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier, Integer>{

    Supplier getSupplierByRegNo(String regNo);

//    @Query("select new com.AdwinsCom.AdwinsCom.DTO.SupplierWithIngredientsDTO(s.id, s.regNo, s.supplierName, s.contactPersonName, s.contactNo, s.email, s.address, s.note, s.joinDate, s.supplierStatus, s.addedUser, s.addedDate, s.updatedUser, s.updatedDate, " +
//            "new com.AdwinsCom.AdwinsCom.DTO.IngredientSDTO(i.id, i.ingredientCode, i.ingredientName, i.note, i.quantity, i.unitType, i.rop, i.roq, i.ingredientStatus, i.addedUser, i.addedDate, i.updatedUser, i.updatedDate)) " +
//            "from Supplier s " +
//            "left join s.ingredients i")
//    List<SupplierWithIngredientsDTO> getSuppliersWithIngredients();
}
