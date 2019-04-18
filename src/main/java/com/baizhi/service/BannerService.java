package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.Map;

public interface BannerService {
    //查
    Map selectAllBanner(int page, int rows);

    //增
    void insertBanner(Banner banner);

}
