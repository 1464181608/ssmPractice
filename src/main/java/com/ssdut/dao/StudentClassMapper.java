package com.ssdut.dao;

import com.ssdut.pojo.StudentClass;

import java.util.List;
import java.util.Map;

public interface StudentClassMapper {

    List<StudentClass> getStudentClassList(Map map);

    List<StudentClass> getAllStudentClassList();

    int insertStudentClass(StudentClass studentClass);

    int updateStudentClass(StudentClass studentClass);

    int deleteStudentClass(int cid);

}
