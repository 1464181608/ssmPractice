package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Room;

import java.util.Map;

public interface RoomService {

    /**
     * 新增房间信息
     * @param room
     * @return 影响行数
     */
    int insertRoom(Room room);

    /**
     * 删除房间信息
     * @param rid
     * @return 影响行数
     */
    int deleteRoom(int rid);

    /**
     * 更新房间信息
     * @param room
     * @return 影响行数
     */
    int updateRoom(Room room);

    /**
     * 根据条件分页获取房间信息
     * @param map
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<Room> getRoom(Map map,Integer startPage,Integer pageSize);

    /**
     * 分页获取全部房间信息
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<Room> getAllRoom(Integer startPage,Integer pageSize);

    /**
     * 判断给定房间是否存在
     * @param building 宿舍楼
     * @param number 房间号
     * @return boolean
     */
    boolean roomIsExisted(String building,String number);

    /**
     * 给定宿舍楼和楼层号，返回该层最大房间号+1
     * @param building 宿舍楼
     * @param floor 楼层数
     * @return 返回该层最大房间号+1
     */
    String getNextRoomByBuilding(String building,String floor);

}
