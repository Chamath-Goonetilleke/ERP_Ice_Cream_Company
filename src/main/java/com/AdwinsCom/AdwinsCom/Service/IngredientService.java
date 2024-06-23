package com.AdwinsCom.AdwinsCom.Service;

import com.AdwinsCom.AdwinsCom.DTO.IngredientAddDTO;
import com.AdwinsCom.AdwinsCom.Repository.IngredientRepository;
import com.AdwinsCom.AdwinsCom.entity.Ingredient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IngredientService implements IIngredientService {

    @Autowired
    private IngredientRepository ingredientRepository;

    @Override
    public ResponseEntity<?> AddNewIngredient(IngredientAddDTO ingredientAddDTO ,String userName) {
        Ingredient newIngredient = new Ingredient().mapDTO(ingredientAddDTO,userName);
        ingredientRepository.save(newIngredient);
        return ResponseEntity.ok("Added");
    }

    @Override
    public List<Ingredient> GetAllIngredients() {
        return null;
    }
}
