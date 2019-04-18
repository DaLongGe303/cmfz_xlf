package com.baizhi.controller;

import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @RequestMapping("selectAllMenu")
    @ResponseBody
    public List<Menu> selectAllMenu() {
        List<Menu> list = menuService.selectMenu();
        System.out.println("9999999999999999999" + list);
        return list;
    }


}
