package com.ssdut.controller;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Room;
import com.ssdut.service.RoomService;
import com.ssdut.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/room")
public class RoomController {

    @Autowired
    @Qualifier("RoomServiceImpl")
    private RoomService roomService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addRoom(@RequestBody Room room){
        String msg = "";
        if(roomService.roomIsExisted(room.getBuilding(),room.getNumber())){
            msg = room.getBuilding() + " " + room.getNumber() +" 已存在";
        }else{
            if(roomService.insertRoom(room)>0){
                msg = "新增房间成功";
            }else{
                msg = "新增房间失败";
            }
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String deleteRoom(@RequestParam("rid") String rid){
        String msg = "";
        if(roomService.deleteRoom(Integer.parseInt(rid))>0){
            msg = "删除成功";
        }else{
            msg = "删除失败";
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateRoom(@RequestBody Room room){
        String msg = "";
        if(roomService.updateRoom(room)>0){
            msg = "修改成功";
        }else{
            msg = "修改失败";
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/all",method = RequestMethod.POST)
    public String getAllRoom(@RequestParam("startPage") String startPage,@RequestParam("pageSize") String pageSize){
        if(startPage.equals("")){
            startPage = "1";
        }
        if(pageSize.equals("")){
            pageSize = "10";
        }
        PageInfo<Room> pageInfo = roomService.getAllRoom(Integer.parseInt(startPage),Integer.parseInt(pageSize));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

    @RequestMapping(value = "/get",method = RequestMethod.POST)
    public String getRoom(@RequestBody Map<String,String> map){
        String startPage = map.getOrDefault("startPage", "1");
        String pageSize = map.getOrDefault("pageSize", "10");
        if(map.get("building").equals("")){
            map.remove("building");
        }
        if(map.get("number").equals("")){
            map.remove("number");
        }
        if(map.get("getBedRestRoom").equals("off")){
            map.remove("getBedRestRoom");
        }
        for(Map.Entry<String,String> entry:map.entrySet()){
            System.out.println(entry.getKey()+"="+entry.getValue());
        }
        PageInfo<Room> pageInfo = roomService.getRoom(map,Integer.parseInt(startPage),Integer.parseInt(pageSize));
        System.out.println(ConstantUtil.getLayerJson(pageInfo.getList(),null,(int)pageInfo.getTotal()));
        return ConstantUtil.getLayerJson(pageInfo.getList(),null,(int)pageInfo.getTotal());
    }

    @RequestMapping(value = "/getNextRoom",method = RequestMethod.POST)
    public String getNextRoomByBuilding(@RequestParam String building,@RequestParam String floor){
        System.out.println("building="+building+" floor="+floor);
        String nextRoom = roomService.getNextRoomByBuilding(building,floor);
        List<String> list = new ArrayList<>();
        list.add(nextRoom);
        return ConstantUtil.getLayerJson(list,null,1);
    }

}
