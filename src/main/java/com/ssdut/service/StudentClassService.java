package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.StudentClass;

import java.util.List;
import java.util.Map;

public interface StudentClassService {

    int insertStudentClass(StudentClass studentClass);

    int deleteStudentClass(int cid);

    int updateStudentClass(StudentClass studentClass);

    PageInfo<StudentClass> getStudentClassList(Map map,Integer startPage, Integer pageSize);

    List<StudentClass> getStudentClassList(Map map);

    List<StudentClass> getStudentClassByMajor(String major);

    boolean studentClassIsExisted(String major,String className);

    PageInfo<StudentClass> getAllStudentClassList(Integer startPage, Integer pageSize);

}
