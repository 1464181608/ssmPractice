package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {

    private int sid;
    private String id;
    private String name;
    private String sex;
    private int age;
    private String phone;
    private StudentClass studentClass;
    private boolean hasRoom;//是否已入住 非数据库字段

}
