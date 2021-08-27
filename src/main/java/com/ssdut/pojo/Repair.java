package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Repair {

    private int rid;
    private Repairer repairer;
    private Room room;
    private String message;
    private Date repairTime;

}
