package com.AdwinsCom.AdwinsCom.Service;

import com.AdwinsCom.AdwinsCom.DTO.IngredientDTO;
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
    public ResponseEntity<?> AddNewIngredient(IngredientDTO ingredientDTO, String userName) {

        Ingredient ingredient = ingredientRepository.getIngredientByIngredientCode(ingredientDTO.getIngredientCode());
        if(ingredient != null){
            return ResponseEntity.badRequest().body("Duplicate entry for Ingredient Code : "+ ingredientDTO.getIngredientCode());
        }
        Ingredient newIngredient = new Ingredient().mapDTO(null,ingredientDTO,userName);
        ingredientRepository.save(newIngredient);
        return ResponseEntity.ok("Ingredient Added Successfully");
    }

    @Override
    public ResponseEntity<?> GetAllIngredients() {
        List<Ingredient> ingredientList = ingredientRepository.findAll();
        return ResponseEntity.ok(ingredientList);
    }

    @Override
    public ResponseEntity<?> UpdateIngredient(IngredientDTO ingredientDTO, String userName) {
        Ingredient ingredient = ingredientRepository.getIngredientByIngredientCode(ingredientDTO.getIngredientCode());

        Ingredient updatedIngredient = new Ingredient().mapDTO(ingredient,ingredientDTO,userName);

        ingredientRepository.save(updatedIngredient);
        return ResponseEntity.ok("Ingredient Updated Successfully");
    }

    @Override
    public ResponseEntity<?> DeleteIngredient(Integer id) {
        ingredientRepository.deleteById(id);
        return ResponseEntity.ok("Ingredient Deleted Successfully");
    }

    public Ingredient GetIngredient(Integer id){
        return ingredientRepository.findById(id).get();
    }
}