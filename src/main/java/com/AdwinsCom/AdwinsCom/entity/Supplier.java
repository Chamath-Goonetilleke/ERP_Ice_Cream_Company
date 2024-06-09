package com.AdwinsCom.AdwinsCom.entity;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "supplier")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Supplier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "regno", unique = true)
    @NotNull
    private String regno;

    @Column(name = "suppliername")
    @NotNull
    private String suppliername;

    @Column(name = "contactpersonname")
    @NotNull
    private String contactpersonname;

    @Column(name = "contactno")
    @NotNull
    private String contactno;

    @Column(name = "email", unique = true)
    @NotNull
    private String email;

    @Column(name = "address")
    @NotNull
    private String address;

    @Column(name = "brn")
    private String brn;

    @Column(name = "note")
    private String note;

    @ManyToOne
    @JoinColumn(name = "supplierstatus_id", referencedColumnName = "id")
    private SupplierStatus supplierstatus_id;

    @ManyToMany
    @JoinTable(name = "supplier_has_ingredient", joinColumns = @JoinColumn(name = "supplier_id"), inverseJoinColumns = @JoinColumn(name = "ingredeint_id"))
    private Set<Ingredeint> ingredients;

    public Supplier(Integer id, String suppliername){
        this.id = id;
        this.suppliername = suppliername;
    }

}
