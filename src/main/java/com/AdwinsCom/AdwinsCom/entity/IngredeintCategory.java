package com.AdwinsCom.AdwinsCom.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity // make as persistence entity
@Table(name = "ingredeint_category")
@Data

@NoArgsConstructor
@AllArgsConstructor
public class IngredeintCategory {

    @Id // pk
    @GeneratedValue(strategy = GenerationType.IDENTITY) // AI
    @Column(name = "Id")
    private Integer id;

    @Column(name = "name")
    @NotNull
    private String name;

}
