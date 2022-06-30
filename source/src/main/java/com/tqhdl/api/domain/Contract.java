package com.tqhdl.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "_Contract")
@AttributeOverride(name = "id", column = @Column(name = "ID_contract"))
@Getter
@Setter
public class Contract extends AbstractEntity{

    @Column(name = "Activity")
    private Integer activity;

    @Column(name = "ID_admin")
    private Integer adminId;

    @JoinColumn(name = "ID_userShop")
    @ManyToOne(fetch = FetchType.LAZY)
    private User userShop;
}
