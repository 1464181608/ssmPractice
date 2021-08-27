package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {

    private int rid;
    private String building;
    private String number;
    private int bedTotal;
    private int bedUsed;//已使用床位数 非数据库字段

}
