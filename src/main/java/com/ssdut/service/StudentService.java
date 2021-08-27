package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.Student;

import java.util.Map;

public interface StudentService {

    /**
     * 新增学生信息
     * @param student
     * @return 影响行数
     */
    int insertStudent(Student student);

    /**
     * 删除学生信息
     * @param sid
     * @return 影响行数
     */
    int deleteStudent(int sid);

    /**
     * 修改学生信息
     * @param student
     * @return 影响行数
     */
    int updateStudent(Student student);

    /**
     * 根据条件分页获取学生信息
     * @param map
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<Student> getStudent(Map map,Integer startPage,Integer pageSize);

    /**
     * 根据学生学号获取学生（注意参数是学号，不是学生sid）
     * @param id
     * @return
     */
    Student getStudentById(String id);

    /**
     * 根据班级id获取学生数
     * @param cid
     * @return
     */
    int getStudentCountByCid(String cid);

    /**
     * 分页获取全部学生
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<Student> getAllStudent(Integer startPage,Integer pageSize);

}
