package com.ssdut.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssdut.dao.StudentMapper;
import com.ssdut.pojo.Student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentServiceImpl implements StudentService{

    private StudentMapper studentMapper;

    public void setStudentMapper(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    public int insertStudent(Student student) {
        return studentMapper.insertStudent(student);
    }

    @Override
    public int deleteStudent(int sid) {
        return studentMapper.deleteStudent(sid);
    }

    @Override
    public int updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    @Override
    public PageInfo<Student> getStudent(Map map, Integer startPage, Integer pageSize) {
        PageHelper.startPage(startPage,pageSize);
        List<Student> studentList = studentMapper.getStudent(map);
        PageInfo<Student> pageInfo = new PageInfo<>(studentList);
        return pageInfo;
    }

    @Override
    public Student getStudentById(String id) {
        Map<String,String> map = new HashMap<>();
        if(id!=null&&id.length()>0){
            map.put("id",id);
            List<Student> list = studentMapper.getStudent(map);
            if(list.size()>0){
                return list.get(0);
            }
        }
        return null;
    }

    @Override
    public int getStudentCountByCid(String cid) {
        Map<String,String> map = new HashMap<>();
        map.put("cid",cid);
        return studentMapper.getStudentCount(map);
    }

    @Override
    public PageInfo<Student> getAllStudent(Integer startPage,Integer pageSize) {
        if(startPage==null){
            startPage = 1;
        }
        if(pageSize==null){
            pageSize = 10;
        }
        PageHelper.startPage(startPage,pageSize);
        List<Student> studentList = studentMapper.getAllStudent();
        PageInfo<Student> pageInfo = new PageInfo<>(studentList);
        return pageInfo;
    }
}
