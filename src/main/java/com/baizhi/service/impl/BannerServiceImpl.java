package com.baizhi.service.impl;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;

    public Map selectAllBanner(int page, int rows) {
        Map map = new HashMap();

        PageHelper.startPage(page, rows);
        PageInfo<Banner> pageInfo = new PageInfo<>(bannerDao.selectAll());

        // 获取当前页数据
        List<Banner> list = pageInfo.getList();
        // 获去总条数
        long total = pageInfo.getTotal();
        map.put("rows", list);
        map.put("total", total);
        return map;
    }

    @Override
    public void insertBanner(Banner banner) {
        System.out.println(banner + "--------------------");
        bannerDao.insertBanner(banner);
    }


}
