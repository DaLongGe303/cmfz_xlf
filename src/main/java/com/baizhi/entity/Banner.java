package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "banner")
public class Banner {
    //轮播图
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String title;
    private String imgpath;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date creatdate;
    private Integer status;


}
