package com.ssdut.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssdut.dao.RoomInMapper;
import com.ssdut.pojo.RoomIn;

import java.util.List;
import java.util.Map;

public class RoomInServiceImpl implements RoomInService{

    private RoomInMapper roomInMapper;

    public void setRoomInMapper(RoomInMapper roomInMapper) {
        this.roomInMapper = roomInMapper;
    }

    @Override
    public int insertRoom(Map<String, String> map) {
        return roomInMapper.insertRoomIn(map);
    }

    @Override
    public PageInfo<RoomIn> getAllRoomIn(Integer startPage,Integer pageSize) {
        return this.getRoomIn(null,startPage,pageSize);
    }

    @Override
    public PageInfo<RoomIn> getRoomIn(Map<String, String> map, Integer startPage, Integer pageSize) {
        PageHelper.startPage(startPage,pageSize);
        List<RoomIn> roomInList = roomInMapper.getRoomIn(map);
        PageInfo<RoomIn> pageInfo = new PageInfo<>(roomInList);
        return pageInfo;
    }

    @Override
    public String getNextFreeRoom(String building, String floor) {
        return roomInMapper.getNextFreeRoom(building,floor);
    }

    @Override
    public int getNextFreeBedNumber(String building, String number) {
        return roomInMapper.getNextFreeBedNumber(building,number);
    }
}
