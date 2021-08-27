package com.ssdut.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssdut.dao.StudentClassMapper;
import com.ssdut.pojo.Student;
import com.ssdut.pojo.StudentClass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentClassServiceImpl implements StudentClassService{

    private StudentClassMapper studentClassMapper;

    public void setStudentClassMapper(StudentClassMapper studentClassMapper) {
        this.studentClassMapper = studentClassMapper;
    }

    @Override
    public int insertStudentClass(StudentClass studentClass) {
        return studentClassMapper.insertStudentClass(studentClass);
    }

    @Override
    public int deleteStudentClass(int cid) {
        return studentClassMapper.deleteStudentClass(cid);
    }

    @Override
    public int updateStudentClass(StudentClass studentClass) {
        return studentClassMapper.updateStudentClass(studentClass);
    }

    @Override
    public PageInfo<StudentClass> getStudentClassList(Map map,Integer startPage, Integer pageSize) {
        if(startPage==null){
            startPage = 1;
        }
        if(pageSize==null){
            pageSize = 10;
        }
        PageHelper.startPage(startPage,pageSize);
        List<StudentClass> studentClassList = studentClassMapper.getStudentClassList(map);
        PageInfo<StudentClass> pageInfo = new PageInfo<>(studentClassList);
        return pageInfo;
    }

    @Override
    public List<StudentClass> getStudentClassList(Map map) {
        return studentClassMapper.getStudentClassList(map);
    }

    @Override
    public List<StudentClass> getStudentClassByMajor(String major) {
        Map<String,String> map = new HashMap<>();
        if(major!=null&&major.length()>0){
            map.put("major",major);
            return studentClassMapper.getStudentClassList(map);
        }
        return null;
    }

    @Override
    public boolean studentClassIsExisted(String major, String className) {
        List<StudentClass> studentClassList = this.getStudentClassByMajor(major);
        for (StudentClass c:studentClassList){
            if(c.getName().equals(className)){
                return true;
            }
        }
        return false;
    }

    @Override
    public PageInfo<StudentClass> getAllStudentClassList(Integer startPage, Integer pageSize) {
        if(startPage==null){
            startPage = 1;
        }
        if(pageSize==null){
            pageSize = 10;
        }
        PageHelper.startPage(startPage,pageSize);
        List<StudentClass> studentClassList = studentClassMapper.getAllStudentClassList();
        PageInfo<StudentClass> pageInfo = new PageInfo<>(studentClassList);
        return pageInfo;
    }
}
