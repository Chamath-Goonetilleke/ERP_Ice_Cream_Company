package com.AdwinsCom.AdwinsCom.entity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDateTime;


@Entity // make as an persistence entity
@Table(name = "product") // for map table name
@Data // generate getters, setters, tostring

@NoArgsConstructor
@AllArgsConstructor
public class Product {

    @Id // PK
    @Column(name = "id", unique = true) // column mapping
    @GeneratedValue(strategy = GenerationType.IDENTITY) // AI
    private Integer id;

    @Column(name = "productcode", unique = true, length = 10)
    @NotNull // not null
    private String productcode;

    @Column(name = "productname")
    @NotNull
    private String productname;

    @Column(name = "reorderpoint")
    private BigDecimal reorderpoint;

    @Column(name = "reorderquantity")
    private BigDecimal reorderquantity;

    @Column(name = "note")
    private String note;

    @Column(name = "addeddatetime")
    @NotNull
    private LocalDateTime addeddatetime;

    @Column(name = "lastmodifydatetime")
    private LocalDateTime lastmodifydatetime;

    @Column(name = "deletedatetime")
    private LocalDateTime deletedatetime;

    @Column(name = "salesprice")
    private BigDecimal salesprice;

    @Column(name = "unit_size")
    @NotNull
    private Integer unitsize;

    @Column(name = "photopath")
    private String photopath;

    @ManyToOne
    @JoinColumn(name = "unittype_id" ,referencedColumnName = "id")
    private Unittype unittype_id;

    @ManyToOne
    @JoinColumn(name = "packagetype_id" ,referencedColumnName = "id")
    private Packagetype packagetype_id;

    @ManyToOne
    @JoinColumn(name = "productstatus_id" ,referencedColumnName = "id")
    private ProductStatus productstatus_id;

    @ManyToOne
    @JoinColumn(name = "flavours_id" ,referencedColumnName = "id")
    private Flavours flavours_id;

    @ManyToOne
    @JoinColumn(name = "category_id" ,referencedColumnName = "id")
    private Category category_id;

    @ManyToOne
    @JoinColumn(name = "added_user" ,referencedColumnName = "id")
    private User added_user_id;

    @ManyToOne(optional = true)
    @JoinColumn(name = "update_user" ,referencedColumnName = "id")
    private User update_user_id;

    @Column(name = "delete_user")
    private Integer delete_user;

    public Product( Integer id, String productcode,String productname, BigDecimal salesprice, ProductStatus productstatus_id, Integer delete_user,Packagetype packagetype_id){

        this.id = id;
        this.productcode = productcode;
        this.productname = productname;
        this.salesprice = salesprice;
        this.productstatus_id = productstatus_id;
        this.delete_user = delete_user;
        this.packagetype_id = packagetype_id;


    }


}
