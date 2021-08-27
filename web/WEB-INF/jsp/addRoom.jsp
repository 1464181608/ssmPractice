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
        <div class="layui-logo layui-hide-xs layui-bg-black">layout demo</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
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
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">学生管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/student_layui;">学生名单</a></dd>
                        <dd><a href="/addStudent_layui">学生信息录入</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">班级管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/studentClass">班级名单</a></dd>
                        <dd><a href="/addStudentClass:;">班级信息录入</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
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
                <label class="layui-form-label">宿舍楼</label>
                <div class="layui-input-block">
                    <select id="building" name="building" lay-verify="required" lay-filter="building">
                        <option value=""></option>
                        <option value="1号楼">1号楼</option>
                        <option value="2号楼">2号楼</option>
                        <option value="3号楼">3号楼</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">楼层</label>
                <div class="layui-input-block">
                    <select id="floor" name="floor" lay-verify="required" lay-filter="floor">
                        <option value=""></option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">房间号</label>
                <div class="layui-input-inline">
                    <input type="text" id="number" name="number" required lay-verify="required" lay-filter="number" placeholder="请输入房间号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">床位总数</label>
                <div class="layui-input-block">
                    <select name="bedTotal" lay-verify="required" lay-filter="bedTotal">
                        <option value=""></option>
                        <option value="0">0</option>
                        <option value="2">2</option>
                        <option value="4">4</option>
                        <option value="6">6</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>

        <script>
            layui.use('form', function(){
                let form = layui.form;

                //监听下拉框building和floor，当两者都被赋值时，根据宿舍楼信息找到下一个可能的房间号，并将下一个房间号赋值给number输入框
                form.on('select(building)', function(data){
                    console.log("floor="+$('#floor').val());
                    if($('#floor').val()!=""){
                        $.ajax({
                            url:'/room/getNextRoom',
                            type:'post',
                            data:"building="+data.value+"&floor="+$('#floor').val(),//获取select里面的值
                            async:false,
                            success:function(data){
                                let d = JSON.parse(data);
                                console.log(d["data"]);
                                document.getElementById('number').value=d["data"];
                                form.render('input','number');//菜单渲染 把内容加载进去
                            }
                        })
                    }
                });
                form.on('select(floor)', function(data){
                    console.log("building="+$('#building').val());
                    if($('#building').val()!=""){
                        $.ajax({
                            url:'/room/getNextRoom',
                            type:'post',
                            data:"floor="+data.value+"&building="+$('#building').val(),//获取select里面的值
                            async:false,
                            success:function(data){
                                let d = JSON.parse(data);
                                console.log(d["data"]);
                                document.getElementById('number').value=d["data"];
                                form.render('input','number');//菜单渲染 把内容加载进去
                            }
                        })
                    }
                });

                //监听提交
                form.on('submit(formDemo)', function(data){
                    let index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
                    $.ajax({
                       type: "post",
                       contentType: "application/json",
                       url: "/room/add",
                       data: JSON.stringify(data.field),//ajax请求的参数直接用data.field获取表单里含有name属性的元素的值
                       dataType: "json",
                       success:function (d){
                           layer.msg(d["msg"],{time:3000});
                       },
                       error:function(){
                           layer.msg("请求失败",{time:3000});
                       }
                    });
                    return false;
                });
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