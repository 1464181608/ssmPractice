package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomInChange {

    private int rid;
    private Student student;
    private Room oldRoom;
    private Room newRoom;
    private int oldBedNumber;
    private int newBedNumber;

}
