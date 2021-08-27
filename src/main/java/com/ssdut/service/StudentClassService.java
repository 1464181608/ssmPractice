package com.ssdut.service;

import com.github.pagehelper.PageInfo;
import com.ssdut.pojo.StudentClass;

import java.util.List;
import java.util.Map;

public interface StudentClassService {

    /**
     * 新增班级信息
     * @param studentClass
     * @return 影响行数
     */
    int insertStudentClass(StudentClass studentClass);

    /**
     * 删除班级信息
     * @param cid
     * @return 影响行数
     */
    int deleteStudentClass(int cid);

    /**
     * 修改班级信息
     * @param studentClass
     * @return 影响行数
     */
    int updateStudentClass(StudentClass studentClass);

    /**
     * 根据条件分页获取学生信息
     * @param map
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<StudentClass> getStudentClassList(Map map,Integer startPage, Integer pageSize);

    /**
     * 根据条件获取班级信息
     * @param map
     * @return
     */
    List<StudentClass> getStudentClassList(Map map);

    /**
     * 给定专业名，返回该专业的所有班级
     * @param major 专业名
     * @return
     */
    List<StudentClass> getStudentClassByMajor(String major);

    /**
     * 给定专业名和班级名，判断是否存在
     * @param major 专业名
     * @param className 班级名
     * @return boolean
     */
    boolean studentClassIsExisted(String major,String className);

    /**
     * 分页获取全部班级信息
     * @param startPage
     * @param pageSize
     * @return
     */
    PageInfo<StudentClass> getAllStudentClassList(Integer startPage, Integer pageSize);

}
