package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Room;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface RoomService {

    int insertRoom(Room room);

    int deleteRoom(int rid);

    int updateRoom(Room room);

    PageInfo<Room> getRoom(Map map,Integer startPage,Integer pageSize);

    PageInfo<Room> getAllRoom(Integer startPage,Integer pageSize);

    boolean roomIsExisted(String building,String number);

    String getNextRoomByBuilding(String building,String floor);

}
