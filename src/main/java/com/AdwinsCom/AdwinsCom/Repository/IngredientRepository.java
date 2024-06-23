package com.AdwinsCom.AdwinsCom.Repository;
import com.AdwinsCom.AdwinsCom.entity.Ingredient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface IngredientRepository extends JpaRepository<Ingredient,Integer> {

    //Define query for get item with selected column
    @Query(value = "select new Ingredient (ing.id,ing.ingredientCode,ing.ingredientName) from Ingredient ing")
    List<Ingredient> getAvailableItemList();

}
