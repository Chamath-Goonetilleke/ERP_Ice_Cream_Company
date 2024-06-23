package com.AdwinsCom.AdwinsCom.entity;// package com.forevercityhotel.supplier.entity;

 import jakarta.persistence.Entity;
 import jakarta.persistence.Id;
 import jakarta.persistence.JoinColumn;
 import jakarta.persistence.ManyToOne;
 import jakarta.persistence.Table;
 import lombok.AllArgsConstructor;
 import lombok.Data;
 import lombok.NoArgsConstructor;

 @Entity
 @Table(name = "supplier_has_ingredient")
 @Data
 @AllArgsConstructor
 @NoArgsConstructor
 public class supplierHasIngredient {

     @Id
     @ManyToOne(optional = false)
     @JoinColumn(name = "supplier_id", referencedColumnName = "id")
     private Supplier supplier_id;

     @Id
     @ManyToOne(optional = false)
     @JoinColumn(name = "ingredient_id", referencedColumnName = "id")
     private Ingredient ingredient_id;
 }
