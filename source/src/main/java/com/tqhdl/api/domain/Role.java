package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "_Role")
@AttributeOverride(name = "id", column = @Column(name = "ID_role"))
@Getter
@Setter
public class Role extends AbstractEntity{

    @Column(name = "RoleName")
    private String roleName;

    @Column(name = "ID_admin")
    private Integer adminId;

    @Column(name = "ID_userShop")
    private Integer userShopId;
}
