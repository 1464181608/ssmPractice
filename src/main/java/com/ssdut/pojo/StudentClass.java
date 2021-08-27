package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentClass {

    private int cid;
    private String name;
    private String major;
    private String counsellorName;
    private String counsellorPhone;
    private int count;//班级人数，非数据库字段

}
