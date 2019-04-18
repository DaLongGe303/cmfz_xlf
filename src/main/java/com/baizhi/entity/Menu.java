package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "menu")
public class Menu {
    //    菜单实体类
    @Id
    @KeySql(useGeneratedKeys = true)

    @Column(name = "b_menuId")
    private Integer menuId;

    @Column(name = "b_menuTitle")
    private String menuTitle;

    @Column(name = "b_menuconCls")
    private String menuconCls;

    @Column(name = "b_menuParentId")
    private Integer menuParentId;

    @Column(name = "b_menuJspUrl")
    private String menuJspUrl;

    @Transient
    private List<Childmenu> childmenu;
}
