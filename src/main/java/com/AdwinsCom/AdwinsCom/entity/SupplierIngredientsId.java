package com.AdwinsCom.AdwinsCom.entity;

import java.io.Serializable;
import java.util.Objects;

public class SupplierIngredientsId implements Serializable {
    private Integer supplierId;
    private Integer ingredientId;

    // Default constructor
    public SupplierIngredientsId() {}

    // Parameterized constructor
    public SupplierIngredientsId(Integer supplierId, Integer ingredientId) {
        this.supplierId = supplierId;
        this.ingredientId = ingredientId;
    }

    // Getters and Setters
    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(Integer ingredientId) {
        this.ingredientId = ingredientId;
    }

    // hashCode and equals
    @Override
    public int hashCode() {
        return Objects.hash(supplierId, ingredientId);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        SupplierIngredientsId that = (SupplierIngredientsId) obj;
        return Objects.equals(supplierId, that.supplierId) &&
                Objects.equals(ingredientId, that.ingredientId);
    }
}
