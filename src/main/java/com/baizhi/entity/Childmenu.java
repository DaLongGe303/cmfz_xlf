package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "menu")
public class Childmenu {
    @Id
    @Column(name = "b_menuId")
    private Integer childId;

    @Column(name = "b_menuTitle")
    private String childTitle;

    @Column(name = "b_menuJspUrl")
    private String childJspUrl;

}
