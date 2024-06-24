package com.AdwinsCom.AdwinsCom.DTO;

import com.AdwinsCom.AdwinsCom.entity.Ingredient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IngredientDTO {
    private String ingredientCode;
    private String ingredientName;
    private String note;
    private Integer quantity;
    private Ingredient.UnitType unitType;
    private Integer rop;
    private Integer roq;
}
