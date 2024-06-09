package com.AdwinsCom.AdwinsCom.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;


@Entity // make as an persistence entity
@Table(name = "ingredeint") // for map table name
@Data // generate getters, setters, tostring

@NoArgsConstructor
@AllArgsConstructor
public class Ingredeint {

    @Id // PK
    @Column(name = "id", unique = true) // column mapping
    @GeneratedValue(strategy = GenerationType.IDENTITY) // AI
    private Integer id;

    @Column(name = "ingredeint_code", unique = true, length = 10)
    @NotNull // not null
    private String ingredeintcode;

    @Column(name = "name")
    @NotNull
    private String ingredeintname;

    @Column(name = "added_user")
    @NotNull
    private String addeduser;

    @Column(name = "note")
    private String note;

    @Column(name = "deleted_date")
    private LocalDateTime deleteddate;

    @Column(name = "updated_date")
    private LocalDateTime updateddate;


    @Column(name = "rop")
    private Integer rop;

    @Column(name = "unit_size")
    @NotNull
    private String unitsize;

    @Column(name = "reorder_quantity")
    private BigDecimal roq;

    @ManyToOne
    @JoinColumn(name = "purchaseunittype_id" ,referencedColumnName = "id")
    private PurchaseUnitType purchaseunittype_id;

    @ManyToOne
    @JoinColumn(name = "ingredeintstatus_id" ,referencedColumnName = "id")
    private IngredeintStatus ingredeintstatus_id;

    @ManyToOne
    @JoinColumn(name = "ingredeint_category_id" ,referencedColumnName = "id")
    private IngredeintCategory ingredeintcategory_id;

    @Column(name = "purchaseprice")
    private BigDecimal purchaseprice;


    public Ingredeint(Integer id, String ingredeintcode, String ingredeintname, BigDecimal purchaseprice, IngredeintStatus ingredeintstatus_id, LocalDateTime deleteddate, BigDecimal roq, Integer rop,IngredeintCategory ingredeintcategory_id,PurchaseUnitType purchaseunittype_id,String unitsize, String addeduser){

        this.id = id;
        this.ingredeintcode = ingredeintcode;
        this.ingredeintname = ingredeintname;
        this.purchaseprice = purchaseprice;
        this.ingredeintstatus_id = ingredeintstatus_id;
        this.roq = roq;
        this.rop = rop;
        this.ingredeintcategory_id = ingredeintcategory_id;
        this.deleteddate = deleteddate;
        this.purchaseunittype_id =purchaseunittype_id;
        this.unitsize = unitsize;
        this.addeduser = addeduser;



    }

    public Ingredeint(Integer id, String ingredeintcode, String ingredeintname){

        this.id = id;
        this.ingredeintcode = ingredeintcode;
        this.ingredeintname = ingredeintname;

    }


}
