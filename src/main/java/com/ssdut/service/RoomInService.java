package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.RoomIn;

import java.util.Map;

public interface RoomInService {

    /**
     * 增加房间信息
     * @param map
     * @return 影响行数
     */
    int insertRoom(Map<String,String> map);

    /**
     * 分页获取全部入住信息
     * @param startPage
     * @param pageSize
     * @return 全部入住信息
     */
    PageInfo<RoomIn> getAllRoomIn(Integer startPage,Integer pageSize);

    /**
     * 根据条件分页获取入住信息
     * @param map
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<RoomIn> getRoomIn(Map<String,String> map,Integer startPage,Integer pageSize);

    /**
     * 给定宿舍楼及楼层号，返回该宿舍楼的该楼层的最小未住满房间号，若房间不存在返回null
     * @param building 宿舍楼
     * @param floor 楼层号，即房间号第一位
     * @return 该宿舍楼的该楼层的最小未住满房间号
     */
    String getNextFreeRoom(String building,String floor);

    /**
     * 给定宿舍楼和房间号（必须是未住满的），返回最小空闲床位号
     * @param building 宿舍楼
     * @param number 房间号
     * @return 最小空闲床位号
     */
    int getNextFreeBedNumber(String building,String number);

}
