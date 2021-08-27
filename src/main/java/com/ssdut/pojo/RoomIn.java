package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomIn {

    private int rid;
    private Room room;
    private Student student;
    private int bedNumber;

}
