package com.ssdut.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {

    private int aid;
    private String username;
    private String password;
    private String name;
    private String phone;

}
