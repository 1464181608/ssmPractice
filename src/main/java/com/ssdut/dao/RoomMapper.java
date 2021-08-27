package com.ssdut.dao;

import com.ssdut.pojo.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoomMapper {

    int insertRoom(Room room);

    int deleteRoom(int rid);

    int updateRoom(Room room);

    List<Room> getRoom(Map map);

    String getNextRoomByBuilding(@Param("building") String building, @Param("floor") String floor);

}
