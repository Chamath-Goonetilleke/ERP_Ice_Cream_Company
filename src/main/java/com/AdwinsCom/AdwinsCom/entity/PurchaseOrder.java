package com.AdwinsCom.AdwinsCom.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.hibernate.validator.constraints.Length;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.persistence.GenerationType;

import java.util.List;
@Entity
@Table(name = "purchaseorder")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseOrder {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "pocode" , unique = true)
    @NotNull
    @Length(max = 8 , min = 8)
    private String pocode;

    @Column(name = "requireddate")
    @NotNull
    private LocalDate requireddate;

    @Column(name = "totalamount")
    @NotNull
    private BigDecimal totalamount;

    @Column(name = "notes")
    private String notes;

    @Column(name = "addeddatetime")
    @NotNull
    private LocalDateTime addeddatetime;
    
    @Column(name = "lastmodifieddatetime")
    private LocalDateTime lastmodifieddatetime;

    @Column(name = "deleteddatetime")
    private LocalDateTime deleteddatetime;
    
    @Column(name = "addeduser_id")
    private Integer addeduser_id;

    @Column(name = "lastmodifieduser_id")
    private Integer lastmodifieduser_id;
    
    @Column(name = "deleteduser_id")
    private Integer deleteduser_id;


    @ManyToOne(optional = false)
    @JoinColumn(name = "supplier_id", referencedColumnName = "id")
    private Supplier supplier_id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "purchaseorderstatus_id", referencedColumnName = "id")
    private PurchaseOrderStatus purchaseorderstatus_id;

    @OneToMany(mappedBy = "purchaseorder_id")
    private List<PurchaseOrderHasIngredient> purchaseOrderHasIngredientList;

}
