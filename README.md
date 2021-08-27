## 数据表设计：

管理员表t_admin（id，用户名，密码，姓名，手机号码）
班级表t_class（id，班级名，专业名，辅导员）
房间表t_room（id，宿舍楼，房间号，床位总数）
入住信息表t_room_in（id，房间id，学生id，床位号）
入住信息变更表t_room_in_change（id，学生id，原房间id，原床位号，新房间id，新床位号）
学生表t_student（id，学号，姓名，性别，年龄，手机号码，班级id）
维修人员表t_repairer（id，姓名，手机号码）
维修信息表t_repair（id，房间id，维修人员id，维修描述，维修时间）
访客表t_visitor（id，访客姓名，访客手机号，房间id，到来时间，离开时间）

## 主要模块功能及截图

### 班级管理（实现）

![_(X2S21H})$LGRIDR09S63U](https://user-images.githubusercontent.com/76779590/131141815-5e01dc96-fdda-4055-ae21-3b36d4c24fda.png)

班级信息增删改查，支持上图表单查询，辅导员姓名支持模糊查询。

![image-20210827220209430](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210827220209430.png)

新增班级界面，没啥好说的。。

### 学生管理（实现）

![img](file:///C:\Users\Lenovo\Documents\Tencent Files\1464181608\Image\C2C\S8$WVW1G{JXSNO{3V]K5MH9.png)

学生增删改查（要完成入住功能，应前往入住管理模块），支持上图所示的表单查询。

![image-20210827220138740](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210827220138740.png)

emm，也没啥好说的。。

### 房间管理（实现）

![image-20210827213719595](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210827213719595.png)

能够进行房间的增删改查，能根据图中（如上图）表单信息进行查询，房间只能删除，且只能在已使用床位数为0的情况下删除，不能修改。

![image-20210827215344049](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210827215344049.png)

上图为新增房间页面，选定宿舍楼和房间号后，可以自动生成下一个房间号（例如3号楼2层已有房间201~212，则新增时会自动生成213），另外也支持自己设定房间号，房间号重复会进行弹窗提示，床位总数为下拉框的形式，支持0、2、4、6，目前所有房间床位数都是4。

### 入住管理（仅实现了查）

![image-20210827213739040](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210827213739040.png)

入住信息增删改查，能根据图中表单信息进行查询，其中宿舍楼，专业和班级为下拉框的形式。

新增入住信息时（如下图所示），在选择宿舍楼和楼层号后能够自动生成当前未入住的最小的房间号，以及空闲床位号，也可以修改为其它空闲房间号和床位号。

![image-20210827214709933](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210827214709933.png)

选定宿舍楼和楼层号后，若该宿舍楼在该楼层没有空闲房间，会进行弹窗提示。

### 维修管理（未实现）

维修人员信息增删改查，维修记录增删改查，以便于确认哪些设备老旧需要更换。

### 访客管理（未实现）

访客记录增删改查，能详细统计访客到来及离开时间，记录来访原因。

### 管理员登陆（未实现）

管理员登陆，管理员信息修改等。
