package com.ssdut.controller;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Student;
import com.ssdut.pojo.StudentClass;
import com.ssdut.service.StudentClassService;
import com.ssdut.service.StudentService;
import com.ssdut.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/studentClass")
public class StudentClassController {

    @Autowired
    @Qualifier("StudentClassServiceImpl")
    private StudentClassService studentClassService;

    @Autowired
    @Qualifier("StudentServiceImpl")
    private StudentService studentService;

    @RequestMapping(value = "/all",method = RequestMethod.POST)
    public String allStudentClass(@RequestParam("startPage") String startPage, @RequestParam("pageSize")String pageSize){
        if(startPage.equals("")){
            startPage = "1";
        }
        if(pageSize.equals("")){
            pageSize = "10";
        }
        PageInfo<StudentClass> pageInfo = studentClassService.getAllStudentClassList(Integer.parseInt(startPage),Integer.parseInt(pageSize));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateStudentClass(@RequestBody StudentClass studentClass){
        String msg = "";
        if(studentClassService.updateStudentClass(studentClass)>0){
            msg = "修改成功";
        }else{
            msg = "修改失败";
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String deleteStudentClass(@RequestParam("cid") String cid){
        String msg = "";
        if(studentService.getStudentCountByCid(cid)>0){
            msg = "删除失败，该班级仍有学生信息，请先删除该班级的学生信息";
        }else{
            if(studentClassService.deleteStudentClass(Integer.parseInt(cid))>0){
                msg = "删除成功";
            }else{
                msg = "删除失败";
            }
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/get",method = RequestMethod.POST)
    public String getStudentClass(@RequestBody Map<String,String> map){
        String startPage = map.containsKey("startPage")?map.get("startPage"):"1";
        String pageSize = map.containsKey("pageSize")?map.get("pageSize"):"10";
        if(map.get("major").equals("")){
            map.remove("major");
        }
        if(map.get("name").equals("")){
            map.remove("name");
        }
        if(map.get("counsellorName").equals("")){
            map.remove("counsellorName");
        }
        if(map.get("counsellorPhone").equals("")){
            map.remove("counsellorPhone");
        }
        PageInfo<StudentClass> pageInfo = studentClassService.getStudentClassList(map,Integer.parseInt(startPage),Integer.parseInt(pageSize));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addStudentClass(@RequestBody Map<String,String> map){
        String msg = "";
        if(studentClassService.studentClassIsExisted(map.get("major"),map.get("name"))){
            msg = map.get("major")+" "+map.get("name")+" 已存在";
            return ConstantUtil.getLayerJson(null,msg,1);
        }

        StudentClass studentClass = new StudentClass();
        studentClass.setName(map.get("name"));
        studentClass.setMajor(map.get("major"));
        studentClass.setCounsellorName(map.get("counsellorName"));
        studentClass.setCounsellorPhone(map.get("counsellorPhone"));

        if(studentClassService.insertStudentClass(studentClass)>0){
            msg = "新增班级成功";
        }else{
            msg = "新增班级失败";
        }
        System.out.println(ConstantUtil.getLayerJson(null,msg,1));
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    //给定专业名和班级名，验证该班级是否存在
    @RequestMapping(value = "/verifyClassName",method = RequestMethod.POST)
    public boolean verifyClassName(@RequestParam("major") String major,@RequestParam("className") String className){
        System.out.println("major=" + major + " className=" + className);
        List<StudentClass> studentClassList = studentClassService.getStudentClassByMajor(major);
        for(StudentClass c:studentClassList){
            if(c.getName()==className){
                return true;
            }
        }
        return false;
    }

}
