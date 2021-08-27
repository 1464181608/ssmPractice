package com.ssdut.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;

public class ConstantUtil {
    /**
     * 分页时传入总的记录数和当前页对象的泛型集合
     * @param list 当前页对象的泛型集合
     * @param count 总的记录数
     * @return 当前页数据的json字符串
     */
    public static String getLayerJson(List<?> list, String msg, int count) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return "{\"code\":0,\"msg\":\""+msg+"\",\"count\":" + count + ",\"data\":" + mapper.writeValueAsString(list) + "}";
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

}
