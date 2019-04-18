package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("selectAllBanner")
    @ResponseBody
    public Map selectAllBanner(int page, int rows) {
        System.out.println("=======0234156======");
        System.out.println(page + "  " + rows);
        return bannerService.selectAllBanner(page, rows);
    }

    @RequestMapping("insertBanner")
    @ResponseBody
    public Map insertBanner(Banner banner) {
        System.out.println(banner + "****************--");
        Map map = new HashMap();

        try {
            bannerService.insertBanner(banner);
            map.put("isInsert", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("isInsert", false);
        }
        return map;
    }

}
