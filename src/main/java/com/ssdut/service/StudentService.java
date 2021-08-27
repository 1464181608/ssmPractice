package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Student;

import java.util.Map;

public interface StudentService {

    int insertStudent(Student student);

    int deleteStudent(int sid);

    int updateStudent(Student student);

    PageInfo<Student> getStudent(Map map,Integer startPage,Integer pageSize);

    Student getStudentById(String id);

    int getStudentCountByCid(String cid);

    PageInfo<Student> getAllStudent(Integer startPage,Integer pageSize);

}
