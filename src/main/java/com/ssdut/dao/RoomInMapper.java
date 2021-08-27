package com.ssdut.dao;

import com.ssdut.pojo.RoomIn;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoomInMapper {

    int insertRoomIn(Map map);

    List<RoomIn> getAllRoomIn();

    List<RoomIn> getRoomIn(Map map);

    //给定宿舍楼及楼层号，返回该宿舍楼的该楼层的最小未住满房间号，若房间不存在返回null
    String getNextFreeRoom(@Param("building") String building, @Param("floor") String floor);

    //给定宿舍楼和房间号（未住满），返回最小空闲床位号
    int getNextFreeBedNumber(@Param("building") String building, @Param("number") String number);

}
