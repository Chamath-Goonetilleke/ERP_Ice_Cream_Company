package com.AdwinsCom.AdwinsCom.Service;

import com.AdwinsCom.AdwinsCom.DTO.SupplierWithIngredientsDTO;
import com.AdwinsCom.AdwinsCom.Repository.IngredientRepository;
import com.AdwinsCom.AdwinsCom.Repository.SupplierIngredientRepository;
import com.AdwinsCom.AdwinsCom.Repository.SupplierRepository;
import com.AdwinsCom.AdwinsCom.entity.Ingredient;
import com.AdwinsCom.AdwinsCom.entity.Supplier;
import com.AdwinsCom.AdwinsCom.entity.SupplierIngredient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class SupplierIngredientService {
    @Autowired
    private SupplierRepository supplierRepository;
    @Autowired
    private SupplierIngredientRepository supplierIngredientRepository;
    @Autowired
    private IngredientRepository ingredientRepository;

    public List<SupplierWithIngredientsDTO> GetSuppliersWithIngredients(List<Supplier> suppliers){

        List<SupplierWithIngredientsDTO> supplierList = new ArrayList<>();
        for (Supplier s: suppliers
             ) {
            List<Ingredient> ingredients =new ArrayList<>();
            List<SupplierIngredient> supplierIngredients = supplierIngredientRepository.findBySupplierId(s.getId());
            for (SupplierIngredient si: supplierIngredients
                 ) {
                Ingredient ingredient = ingredientRepository.findById(si.getIngredientId()).get();
                ingredients.add(ingredient);
            }
            SupplierWithIngredientsDTO supplier = getSupplierWithIngredientsDTO(s, ingredients);
            supplierList.add(supplier);
        }

        return supplierList;
    }

    private static SupplierWithIngredientsDTO getSupplierWithIngredientsDTO(Supplier s, List<Ingredient> ingredients) {
        SupplierWithIngredientsDTO supplier = new SupplierWithIngredientsDTO();
        supplier.setId(s.getId());
        supplier.setRegNo(s.getRegNo());
        supplier.setSupplierName(s.getSupplierName());
        supplier.setContactPersonName(s.getContactPersonName());
        supplier.setContactNo(s.getContactNo());
        supplier.setEmail(s.getEmail());
        supplier.setAddress(s.getAddress());
        supplier.setNote(s.getNote());
        supplier.setJoinDate(s.getJoinDate());
        supplier.setSupplierStatus(s.getSupplierStatus());
        supplier.setAddedUser(s.getAddedUser());
        supplier.setAddedDate(s.getAddedDate());
        supplier.setUpdatedDate(s.getUpdatedDate());
        supplier.setUpdatedUser(s.getUpdatedUser());
        supplier.setIngredients(ingredients);
        return supplier;
    }
}
