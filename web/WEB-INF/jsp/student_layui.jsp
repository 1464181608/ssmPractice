<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>

<body>
<script src="layui//layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">管理模块名称</div>
        <%--<!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="">nav 1</a></li>
            <li class="layui-nav-item layui-hide-xs"><a href="">nav 2</a></li>
            <li class="layui-nav-item layui-hide-xs"><a href="">nav 3</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">nav groups</a>
                <dl class="layui-nav-child">
                    <dd><a href="">menu 11</a></dd>
                    <dd><a href="">menu 22</a></dd>
                    <dd><a href="">menu 33</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                    tester
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">Your Profile</a></dd>
                    <dd><a href="">Settings</a></dd>
                    <dd><a href="">Sign out</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>--%>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">学生管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/student_layui">学生名单</a></dd>
                        <dd><a href="/addStudent_layui">学生信息录入</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">班级管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/studentClass">班级名单</a></dd>
                        <dd><a href="/addStudentClass">班级信息录入</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">房间管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/room">房间信息</a></dd>
                        <dd><a href="/addRoom">新增房间</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">入住管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/roomIn">入住信息</a></dd>
                        <dd><a href="/addRoomIn">新生入住</a></dd>
                        <dd><a href="javascript:;">入住变更</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <form class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">学号:</label>
                    <div class="layui-input-inline">
                        <input type="text" id="id" name="id" placeholder="请输入9位纯数字学号" autocomplete="off" class="layui-input" style="width: 240px;">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">姓名:</label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="name" placeholder="请输入姓名" autocomplete="off" class="layui-input" style="width: 240px;">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">性别:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女">
                        <input type="radio" name="sex" value="不限" title="不限" checked>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">年龄范围:</label>
                    <div class="layui-input-inline" style="width: 240px;">
                        <input type="text" id="age_min" name="age_min" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline" style="width: 240px;">
                        <input type="text" id="age_max"name="age_max" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">专业:</label>
                    <div class="layui-input-block">
                        <select id="major" name="major" lay-filter="major">
                            <option value=""></option>
                            <option value="化工">化工</option>
                            <option value="数学">数学</option>
                            <option value="计算机">计算机</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">班级:</label>
                    <div class="layui-input-block">
                        <select id="className" name="className" lay-filter="className">
                            <option value="请先选择专业，再选择班级">请先选择专业，再选择班级</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-block">
                        <button id="formDemo" class="layui-btn" lay-submit lay-filter="formDemo">提交查询</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置条件</button>
                    </div>
                </div>
            </div>
        </form>

        <table class="layui-hide" id="studentTable" lay-filter="studentTable"></table>
        <script type="text/html" id="barDemo">
            <div id="buttonDemo">
                <a class="layui-btn layui-btn-xs" lay-event="edit">保存</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </div>
        </script>
        <script>
            layui.use(['table','form'], function(){
                let table = layui.table;
                let form = layui.form;
                table.render({
                    elem: '#studentTable'
                    ,url:'/student/allStudent'
                    ,method: 'post'
                    ,request: {
                        pageName: 'startPage'
                        ,limitName: 'pageSize'
                    }
                    ,height: 480
                    ,sort: true
                    ,page: {
                        layout: ['count', 'limit', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,groups: 1
                        ,limits: [10,25,50,100]
                        ,first: '首页'
                        ,last: '尾页'
                        ,prev: '上一页'
                        ,next: '下一页'
                    }
                    ,cols: [[{
                            field:'id',
                            align:'center',
                            width:200,
                            title: '学号',
                            sort: true,
                            edit:'text'
                        },{
                            field:'name',
                            align:'center',
                            width:100,
                            title: '姓名',
                            sort: true,
                            edit:'text'
                        },{
                            field:'sex',
                            align:'center',
                            width:100,
                            title: '性别',
                            sort: true
                        },{
                            field:'phone',
                            align:'center',
                            width:200,
                            title: '电话',
                            sort: true,
                            edit:'text'
                        },{
                            field:'age',
                            align:'center',
                            width:100,
                            title: '年龄',
                            sort: true,
                            edit:'text'
                        },{
                            field:'studentClass.major',
                            templet:function (fileIng){
                                return fileIng.studentClass.major;
                            },
                            align:'center',
                            width:200,
                            title: '专业',
                            sort: true
                        },{
                            field:'studentClass.className',
                            templet:function (fileIng){
                                return fileIng.studentClass.name;
                            },
                            align:'center',
                            width:80,
                            title: '班级',
                            sort: true
                        },{
                            field:'hasRoom',
                            templet:function (fileIng){
                                return (fileIng.hasRoom===true)?'是':'否';
                            },
                            align:'center',
                            width:120,
                            title: '是否已入住',
                            sort: true
                        },{
                            field:'operation',
                            title: '操作',
                            fixed:'right',
                            align:'center',
                            width:200,
                            toolbar:'#barDemo'
                        }
                    ]]
                    ,done:function (res,curr,count) {
                        res.data.forEach(function(item,index){
                            if(item.hasRoom){
                                $('div[lay-id="studentTable"]').
                                find('tr[data-index="'+index+'"]').
                                find('td[data-field="hasRoom"]').
                                css('background-color','#009688');
                            }else{
                                $('div[lay-id="studentTable"]').
                                find('tr[data-index="'+index+'"]').
                                find('td[data-field="hasRoom"]').
                                css('background-color','#FF5722');

                                $('div[lay-id="studentTable"]').
                                find('tr[data-index="'+index+'"]').
                                find('td[data-field="operation"]').
                                find('div[id="buttonDemo"]').
                                append("<a href='/addRoomIn' class=\"layui-btn layui-btn-xs\" lay-event=\"jump\">入住</a>");
                            }
                        });
                    }
                });

                //监听下拉框major，然后根据major的值给下拉框className的option赋值
                form.on('select(major)', function(data){
                    //每次major下拉框重新取值时，清除上一次的className下拉框取值
                    document.getElementById("className").options.length = 0;
                    $.ajax({
                        url:'/student/getClassNameByMajor',
                        type:'post',
                        data:"major="+data.value,//获取select里面的值
                        async:false,
                        success:function(data){
                            let d = JSON.parse(data);
                            $("#className").append("<option value='全部班级'>全部班级</option>");
                            $.each(d.data,function(index,item){
                                $("#className").append("<option value='"+item.name+"'>"+item.name+"</option>");//往下拉菜单里添加元素
                            })
                            form.render('select');//菜单渲染 把内容加载进去
                        }
                    })
                });

                //监听单元格编辑事件
                table.on('edit(studentTable)',function (obj){
                    //获取修改前的值，以便重新赋值
                    let oldValue = $(this).prev().text();
                    switch (obj.field) {
                        case "id":
                            $.ajax({
                                type:"post",
                                url:'/student/verifyId',
                                async:false,//改为同步请求
                                data:{"id":obj.value},
                                success:function(data) {
                                    if (data) {
                                        let id_reg = /^\d{9}$/;
                                        if(!id_reg.test(obj.value)){
                                            layer.alert('学号格式错误',{icon:2,time:3000});
                                            $(obj.tr.selector + ' td[data-field="' + obj.field + '"] input').val(oldValue);
                                        }
                                    } else {
                                        layer.alert("学号:"+obj.value+" 已存在，请重新输入！",{icon:2,time:3000});
                                        $(obj.tr.selector + ' td[data-field="' + obj.field + '"] input').val(oldValue);
                                    }
                                }
                            });
                            break;
                        case "name":
                            let name_reg = /^[\u4e00-\u9fa5]{2,4}$/;
                            if(!name_reg.test(obj.value)){
                                layer.alert('姓名应为2~4位中文',{icon:2,time:3000});
                                $(obj.tr.selector + ' td[data-field="' + obj.field + '"] input').val(oldValue);
                            }
                            break;
                        case "phone":
                            let phone_reg = /^[1][3,4,5,7,8][0-9]{9}$/;    //11位手机号码正则
                            if(!phone_reg.test(obj.value)){
                                layer.alert('手机格式错误',{icon:2,time:3000});
                                $(obj.tr.selector + ' td[data-field="' + obj.field + '"] input').val(oldValue);
                            }
                            break;
                        case "age":
                            let age_reg = /^([123]\d|40)$/;
                            if(!age_reg.test(obj.value)){
                                layer.alert('年龄应在10~40岁之间',{icon:2,time:3000});
                                $(obj.tr.selector + ' td[data-field="' + obj.field + '"] input').val(oldValue);
                            }
                            break;
                    }
                });

                //监听工具条事件
                table.on('tool(studentTable)',function (obj){
                    let data = obj.data; //获得当前行数据
                    let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    if(layEvent === 'edit'){ //编辑
                        let index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
                        $.ajax({
                            type: "post",
                            contentType: "application/json",
                            url: "/student/updateStudent",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success:function (d){
                                console.log(d);
                                layer.msg("请求成功，"+d["msg"],{time:3000});
                            },
                            error:function(d){
                                console.log(d);
                                layer.msg("请求失败，"+d["msg"],{time:3000});
                            }
                        });
                    } else if(layEvent === 'del'){ //删除
                        let oldId = data.id;
                        let oldName = data.name;
                        layer.confirm('确认删除学号为 '+oldId+' ，姓名为 '+oldName+' 的学生信息吗?', function(index){
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            layer.close(index);
                            //向服务端发送删除指令
                            let index2 = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
                            $.ajax({
                                type: "post",
                                url: "/student/deleteStudent",
                                data: {"sid":data["sid"]},
                                dataType: "json",
                                success:function (d){
                                    layer.msg(d["msg"],{time:3000});
                                },
                                error:function(d){
                                    layer.msg("请求失败",{time:3000});
                                }
                            });
                        });
                    }
                });

                //监听查询表单提交
                form.on('submit(formDemo)', function(data){
                    active['reload'].call(this);
                    return false;
                });
                let $ = layui.$,active = {
                    reload:function (){
                        let id = $('#id');
                        let name = $('#name');
                        let sex;
                        let age_min = $('#age_min');
                        let age_max = $('#age_max');
                        let major = $('#major');
                        let className = $('#className');
                        for (let i = 0,sexes = document.getElementsByName('sex'); i < sexes.length; i++) {
                            if(sexes[i].checked){
                                sex = sexes[i].value;
                                break;
                            }
                        }
                        let index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:1000,shade:0.8});
                        //执行重载
                        table.reload('studentTable',{
                            page: {
                                curr: 1
                            },
                            method: "post",
                            contentType: "application/json",
                            url: "/student/getStudent",
                            where: {
                                id: id.val(),
                                name: name.val(),
                                sex: sex,
                                age_min: age_min.val(),
                                age_max: age_max.val(),
                                major: major.val(),
                                className: className.val()
                            }
                        },'data');
                    }
                };
            });
        </script>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>

<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;
        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });
    });
</script>
</body>
</html>