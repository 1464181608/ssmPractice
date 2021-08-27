package com.ssdut.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssdut.dao.RoomMapper;
import com.ssdut.pojo.Room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoomServiceImpl implements RoomService{

    private RoomMapper roomMapper;

    public void setRoomMapper(RoomMapper roomMapper) {
        this.roomMapper = roomMapper;
    }

    @Override
    public int insertRoom(Room room) {
        return roomMapper.insertRoom(room);
    }

    @Override
    public int deleteRoom(int rid) {
        return roomMapper.deleteRoom(rid);
    }

    @Override
    public int updateRoom(Room room) {
        return roomMapper.updateRoom(room);
    }

    @Override
    public PageInfo<Room> getRoom(Map map, Integer startPage, Integer pageSize) {
        PageHelper.startPage(startPage,pageSize);
        List<Room> roomList = roomMapper.getRoom(map);
        PageInfo<Room> pageInfo = new PageInfo<>(roomList);
        return pageInfo;
    }

    @Override
    public PageInfo<Room> getAllRoom(Integer startPage, Integer pageSize) {
        return this.getRoom(null,startPage,pageSize);
    }

    @Override
    public boolean roomIsExisted(String building, String number) {
        Map<String,String> map = new HashMap<>();
        map.put("building",building);
        map.put("number",number);
        if (roomMapper.getRoom(map).size()>0){
            return true;
        }
        return false;
    }

    @Override
    public String getNextRoomByBuilding(String building,String floor) {
        String nextRoom = roomMapper.getNextRoomByBuilding(building,floor);
        return String.valueOf(Integer.parseInt(nextRoom) + 1);
    }
}
