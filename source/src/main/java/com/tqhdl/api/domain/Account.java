package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "Account")
@AttributeOverride(name = "id", column = @Column(name = "ID_account"))
@Getter
@Setter
public class Account extends AbstractEntity{

    @JoinColumn(name = "ID_user")
    @ManyToOne(fetch = FetchType.LAZY)
    private User user;

    @Column(name = "Activity")
    private Integer activity;

    @Column(name = "pass")
    private String pass;

    @Column(name = "_role")
    private Integer role;

    @Column(name = "username")
    private String username;
}
