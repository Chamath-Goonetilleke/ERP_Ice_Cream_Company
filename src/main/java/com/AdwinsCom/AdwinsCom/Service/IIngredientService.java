package com.AdwinsCom.AdwinsCom.Service;

import com.AdwinsCom.AdwinsCom.DTO.IngredientAddDTO;
import com.AdwinsCom.AdwinsCom.entity.Ingredient;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface IIngredientService {

    public ResponseEntity<?> AddNewIngredient(IngredientAddDTO ingredientAddDTO, String userName);
    public List<Ingredient> GetAllIngredients();
}
