package com.AdwinsCom.AdwinsCom.entity;

import com.AdwinsCom.AdwinsCom.DTO.IngredientAddDTO;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "ingredient")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ingredient {
    public enum IngredientStatus {
        InStock,
        LowStock,
        OutOfStock
    }
    public enum UnitType {
        ML, L, KG, G
    }

    @Id
    @Column(name = "id", unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ingredient_code", unique = true, length = 10)
    @NotNull
    private String ingredientCode;

    @Column(name = "name")
    @NotNull
    private String ingredientName;

    @Column(name = "note")
    private String note;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "unit_size")
    @NotNull
    @Enumerated(EnumType.STRING)
    private UnitType unitType;

    @Column(name = "rop")
    private Integer rop;

    @Column(name = "roq")
    private Integer roq;

    @Column(name = "ingredient_status")
    @Enumerated(EnumType.STRING)
    private IngredientStatus ingredientStatus;

    @Column(name = "added_user")
    @NotNull
    private String addedUser;

    @Column(name = "added_date")
    private LocalDateTime addedDate;

    @JoinColumn(name = "updated_user")
    private String updatedUser;

    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    public Ingredient mapDTO(IngredientAddDTO addDTO,String userName) {
        Ingredient newIngredient = new Ingredient();
        newIngredient.setIngredientCode(addDTO.getIngredientCode());
        newIngredient.setIngredientName(addDTO.getIngredientName());
        newIngredient.setNote(addDTO.getNote());
        newIngredient.setQuantity(addDTO.getQuantity());
        newIngredient.setUnitType(addDTO.getUnitType());
        newIngredient.setRop(addDTO.getRop());
        newIngredient.setRoq(addDTO.getRoq());
        newIngredient.setIngredientStatus(addDTO.getIngredientStatus());
        newIngredient.setAddedUser(userName);
        newIngredient.setAddedDate(LocalDateTime.now());
        return newIngredient;
    }
}
