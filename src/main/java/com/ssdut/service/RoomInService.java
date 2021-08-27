package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.RoomIn;

import java.util.List;
import java.util.Map;

public interface RoomInService {

    int insertRoom(Map<String,String> map);

    PageInfo<RoomIn> getAllRoomIn(Integer startPage,Integer pageSize);

    PageInfo<RoomIn> getRoomIn(Map<String,String> map,Integer startPage,Integer pageSize);

    //给定宿舍楼及楼层号，返回该宿舍楼的该楼层的最小未住满房间号，若房间不存在返回null
    String getNextFreeRoom(String building,String floor);

    //给定宿舍楼和房间号（未住满），返回最小空闲床位号
    int getNextFreeBedNumber(String building,String number);

}
