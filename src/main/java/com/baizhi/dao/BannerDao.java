package com.baizhi.dao;

import com.baizhi.entity.Banner;
import tk.mybatis.mapper.common.Mapper;

public interface BannerDao extends Mapper<Banner> {
    //增
    void insertBanner(Banner banner);

    void deleteBanner(int id);

    void updateBanner(Banner banner);

}
