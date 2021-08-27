package com.ssdut.controller;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Room;
import com.ssdut.pojo.RoomIn;
import com.ssdut.pojo.Student;
import com.ssdut.service.RoomInService;
import com.ssdut.service.RoomService;
import com.ssdut.service.StudentService;
import com.ssdut.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/roomIn")
public class RoomInController {

    @Autowired
    @Qualifier("RoomInServiceImpl")
    private RoomInService roomInService;

    @Autowired
    @Qualifier("RoomServiceImpl")
    private RoomService roomService;

    @Autowired
    @Qualifier("StudentServiceImpl")
    private StudentService studentService;

    @RequestMapping(value = "/all",method = RequestMethod.POST)
    public String getAllRoomIn(@RequestParam("startPage") String startPage,@RequestParam("pageSize") String pageSize){
        if(startPage.equals("")){
            startPage = "1";
        }
        if(pageSize.equals("")){
            pageSize = "10";
        }
        PageInfo<RoomIn> pageInfo = roomInService.getAllRoomIn(Integer.parseInt(startPage),Integer.parseInt(pageSize));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

    @RequestMapping(value = "/get",method = RequestMethod.POST)
    public String getRoomIn(@RequestBody Map<String,String> map){
        String startPage = map.getOrDefault("startPage","1");
        String pageSize = map.getOrDefault("pageSize","10");
        Iterator<Map.Entry<String,String>> iterator = map.entrySet().iterator();
        //map.entrySet().removeIf(entry -> entry.getValue().equals(""));
        while(iterator.hasNext()){
            Map.Entry<String,String> entry = iterator.next();
            if(entry.getValue().equals("")){
                iterator.remove();
            }
        }
        if(map.get("className").length()>4){
            map.remove("className");
        }
        PageInfo<RoomIn> pageInfo = roomInService.getRoomIn(map,Integer.parseInt(startPage),Integer.parseInt(pageSize));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

    //给定宿舍楼和楼层，返回下一个可入住的房间及床位号
    @RequestMapping(value = "/getNextRoomAndBedNumber",method = RequestMethod.POST)
    public String getNextRoomAndBedNumber(@RequestParam("building") String building,
                                          @RequestParam("floor") String floor){
        List<String> list = new ArrayList<>();
        String nextFreeRoom = roomInService.getNextFreeRoom(building,floor);
        if(nextFreeRoom==null){
            String msg = building + floor + "层无空余房间";
            return ConstantUtil.getLayerJson(null,msg,1);
        }else{
            list.add(nextFreeRoom);
            list.add(String.valueOf(roomInService.getNextFreeBedNumber(building,nextFreeRoom)));
        }
        return ConstantUtil.getLayerJson(list,"",2);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addRoomIn(@RequestBody Map<String,String> map){
        String msg = "";

        String sid = String.valueOf(studentService.getStudentById(map.get("id")).getSid());
        map.put("sid",sid);

        Map<String,String> roomMap = new HashMap<>();
        roomMap.put("building",map.get("building"));
        roomMap.put("number",map.get("number"));
        Room room = roomService.getRoom(roomMap,1,1).getList().get(0);
        int rid = room.getRid();
        map.put("rid",String.valueOf(rid));

        if(Integer.parseInt(map.get("bedNumber"))>room.getBedTotal()||room.getBedUsed()>=room.getBedTotal()){
            msg = map.get("building") + map.get("number") + "无该空闲床位号";
        }else{
            if(roomInService.insertRoom(map)>0){
                msg = "新增入住信息成功";
            }else{
                msg = "新增入住信息失败";
            }
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

}
