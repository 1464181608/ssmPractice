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
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
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
                <li class="layui-nav-item">
                    <a href="javascript:;">房间管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">房间信息</a></dd>
                        <dd><a href="/addRoom">新增房间</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">入住管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/roomIn">入住信息</a></dd>
                        <dd><a href="javascript:;">list 2</a></dd>
                        <dd><a href="">超链接</a></dd>
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
                    <label class="layui-form-label">宿舍楼:</label>
                    <div class="layui-input-block">
                        <select id="building" name="building" lay-filter="building">
                            <option value=""></option>
                            <option value="1号楼">1号楼</option>
                            <option value="2号楼">2号楼</option>
                            <option value="3号楼">3号楼</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">房间号:</label>
                    <div class="layui-input-inline">
                        <input type="text" id="number" name="number" placeholder="请输入房间号" autocomplete="off" class="layui-input" style="width: 240px;">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">查看有剩余床位的房间:</label>
                    <div class="layui-input-inline">
                        <input type="checkbox" name="getBedRestRoom" lay-skin="switch" lay-text="是|否">
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

        <table class="layui-hide" id="roomTable" lay-filter="roomTable"></table>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
        <script>
            layui.use(['table','form'], function(){
                let table = layui.table;
                let form = layui.form;
                table.render({
                    elem: '#roomTable'
                    ,url:'/room/all'
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
                            field:'building',
                            align:'center',
                            width:200,
                            title: '宿舍楼',
                            sort: true
                        },{
                            field:'number',
                            align:'center',
                            width:200,
                            title: '房间号',
                            sort: true
                        },{
                            field:'bedTotal',
                            align:'center',
                            width:200,
                            title: '总床位数',
                            sort: true
                        },{
                            field:'bedUsed',
                            align:'center',
                            width:200,
                            title: '已使用床位数',
                            sort: true
                        },{
                            fixed:'right',
                            align:'center',
                            width:200,
                            toolbar:'#barDemo'
                        }
                    ]]
                });

                //监听工具条事件
                table.on('tool(roomTable)',function (obj){
                    let data = obj.data; //获得当前行数据
                    let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    if(layEvent === 'del'){ //删除
                        let building = data.building;
                        let number = data.number;
                        let bedUsed = data.bedUsed;
                        layer.confirm('确认删除位于 '+building+' ，房间号为 '+number+' 的房间信息吗?', function(index){
                            if(bedUsed>0){
                                layer.msg(building+" "+number+" 仍有学生入住，无法删除",{time:3000});
                            }else{
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(index);
                                //向服务端发送删除指令
                                let index2 = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
                                $.ajax({
                                    type: "post",
                                    url: "/room/delete",
                                    data: {"rid":data["rid"]},
                                    dataType: "json",
                                    success:function (d){
                                        layer.msg(d["msg"],{time:3000});
                                    },
                                    error:function(d){
                                        layer.msg("请求失败",{time:3000});
                                    }
                                });
                            }
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
                        let building = $('#building');
                        let number = $('#number');
                        let getBedRestRoom = "off";
                        if(document.getElementsByName("getBedRestRoom")[0].checked){
                            getBedRestRoom = "on";
                        }
                        let index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:1000,shade:0.8});
                        //执行重载
                        table.reload('roomTable',{
                            page: {
                                curr: 1
                            },
                            method: "post",
                            contentType: "application/json",
                            url: "/room/get",
                            where: {
                                building: building.val(),
                                number: number.val(),
                                getBedRestRoom: getBedRestRoom
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