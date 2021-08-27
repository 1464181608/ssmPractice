package com.ssdut.dao;

import com.ssdut.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentMapper {

    int insertStudent(Student student);

    int deleteStudent(int sid);

    int updateStudent(Student student);

    List<Student> getStudent(Map map);

    List<Student> getAllStudent();

    int getStudentCount(Map map);

}
