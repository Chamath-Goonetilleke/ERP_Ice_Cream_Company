package com.AdwinsCom.AdwinsCom.entity;

import java.math.BigDecimal;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "purchaseorder_has_ingredient")
public class PurchaseOrderHasIngredient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "unitprice")
    @NotNull
    private BigDecimal unitprice;

    @Column(name = "qty")
    @NotNull
    private BigDecimal qty;

    @Column(name = "lineprice")
    @NotNull
    private BigDecimal lineprice;
    
    @ManyToOne
    @JoinColumn(name = "purchaseorder_id")
    private PurchaseOrder purchaseorder_id;
    
    @ManyToOne
    @JoinColumn(name = "ingredient_id")
    private Ingredeint ingredient_id;

}
