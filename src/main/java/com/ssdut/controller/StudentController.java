package com.ssdut.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Student;
import com.ssdut.pojo.StudentClass;
import com.ssdut.service.StudentClassService;
import com.ssdut.service.StudentService;
import com.ssdut.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    @Qualifier("StudentServiceImpl")
    private StudentService studentService;

    @Autowired
    @Qualifier("StudentClassServiceImpl")
    private StudentClassService studentClassService;

    @ResponseBody
    @RequestMapping(value = "/allStudent",method = RequestMethod.POST)
    public String list(String startPage,String pageSize){
        if(startPage==null||startPage.equals("")){
            startPage = "1";
        }
        if(pageSize==null||pageSize.equals("")){
            pageSize = "10";
        }
        PageInfo<Student> pageInfo = studentService.getAllStudent(Integer.parseInt(startPage),Integer.parseInt(pageSize));
        System.out.println(ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal()));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

    @RequestMapping("/toAddStudent")
    public String toAddStudent(){
        return "addStudent_layui";
    }

    @RequestMapping("/addStudent")
    @ResponseBody
    public String addStudent(@RequestBody Map<String,String> map){
        Student student = new Student();
        student.setId(map.get("id"));
        student.setName(map.get("name"));
        student.setAge(Integer.parseInt(map.get("age")));
        student.setSex(map.get("sex"));
        student.setPhone(map.get("phone"));

        Map<String,String> classMap = new HashMap<>();
        classMap.put("name",map.get("className"));
        classMap.put("major",map.get("major"));
        List<StudentClass> list = studentClassService.getStudentClassList(classMap);
        if(list.size()<0){
            System.out.println("班级不存在");
            return ConstantUtil.getLayerJson(null,"",0);
        }
        student.setStudentClass(list.get(0));
        if(studentService.insertStudent(student)>0){
            System.out.println("新增成功");
        }
        List<Student> studentList = new ArrayList<>();
        studentList.add(student);
        return ConstantUtil.getLayerJson(studentList,"",1);
    }

    //验证学号为id的学生是否存在
    @RequestMapping(value = "/verifyId",method = RequestMethod.POST)
    @ResponseBody
    public boolean verifyId(@RequestParam("id") String id){
        System.out.println("id = " + id);
        if(studentService.getStudentById(id)==null){
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/getClassNameByMajor",method = RequestMethod.POST)
    @ResponseBody
    public String getClassNameByMajor(@RequestParam("major") String major){
        List<StudentClass> list = studentClassService.getStudentClassByMajor(major);
        System.out.println(ConstantUtil.getLayerJson(list,"",list.size()));
        return ConstantUtil.getLayerJson(list,"",list.size());
    }

    @RequestMapping(value = "/updateStudent",method = RequestMethod.POST)
    @ResponseBody
    public String updateStudent(@RequestBody Student student){
        student.setStudentClass(null);
        String msg = "";
        Student s = studentService.getStudentById(student.getId());
        if(s==null||s.getSid()==student.getSid()){
            if(studentService.updateStudent(student)>0){
                msg = "修改成功";
            }else{
                msg = "修改失败";
            }
        }else{
            msg = "学号重复";
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/deleteStudent",method = RequestMethod.POST)
    @ResponseBody
    public String deleteStudent(@RequestParam("sid") String sid){
        String msg = "";
        if(studentService.deleteStudent(Integer.parseInt(sid))>0){
            msg = "删除成功";
        }else{
            msg = "删除失败";
        }
        return ConstantUtil.getLayerJson(null,msg,1);
    }

    @RequestMapping(value = "/getStudent",method = RequestMethod.POST)
    @ResponseBody
    public String getStudent(@RequestBody Map<String,String> map){
        String startPage = map.containsKey("startPage")?map.get("startPage"):"1";
        String pageSize = map.containsKey("pageSize")?map.get("pageSize"):"10";
        if(map.get("sex").equals("不限")){
           map.remove("sex");
        }
        if(map.get("id").equals("")){
            map.remove("id");
        }
        if(map.get("name").equals("")){
            map.remove("name");
        }
        if(!map.get("major").equals("")){
            Map<String,String> classMap = new HashMap<>();
            classMap.put("major",map.get("major"));
            if(!map.get("className").equals("全部班级")){
                classMap.put("name",map.get("className"));
            }
            List<StudentClass> studentClassList = studentClassService.getStudentClassList(classMap);
            StringBuffer cid = new StringBuffer("");
            for (StudentClass c:studentClassList){
                cid.append(c.getCid()).append(",");
            }
            map.put("cid", cid.substring(0,cid.length()-1));
        }
        map.remove("major");
        map.remove("className");
        if(map.get("age_min").equals("")){
            map.put("age_min","0");
        }
        if(map.get("age_max").equals("")){
            map.put("age_max","100");
        }
        if(startPage.equals("")){
            startPage = "1";
        }
        if(pageSize.equals("")){
            pageSize = "10";
        }
        PageInfo<Student> pageInfo = studentService.getStudent(map,Integer.parseInt(startPage),Integer.parseInt(pageSize));
        return ConstantUtil.getLayerJson(pageInfo.getList(),"",(int)pageInfo.getTotal());
    }

}
