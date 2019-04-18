<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="../js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        <%--$(function () {--%>
        <%--$.ajax({--%>
        <%--type: 'get',--%>
        <%--url: '${pageContext.request.contextPath}/json/menu.json',--%>
        <%--dataType: 'JSON',--%>
        <%--success: function (data) {--%>
        <%--}--%>
        <%--})--%>
        <%--})--%>

        // function xxk() {
        //     console.log(a + "====" + b + "====33333======" + c);
        //     $('#tt').tabs('add', {
        //         title: 'New Tab',
        //         content: 'Tab Body',
        //         tools: [{
        //             iconCls: 'icon-mini-refresh',
        //             handler: function () {
        //                 alert('refresh');
        //             }
        //         }]
        //     })
        // }


        $(function () {
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/menu/selectAllMenu',
                dataType: 'JSON',
                success: function (data) {
                    console.log("6666666666");
                    console.log(data)
                    //第一个参数是要遍历的集合对象，函数中第一个参数是遍历的下标 注意：两次遍历的下标名字不要相同  第二个参数是每次遍历出来的对象
                    $.each(data, function (index1, first) {
                        //console.log(first.title)
                        var c = "<div align='center'>";
                        console.log("2222222222222222222" + c)
                        $.each(first.children, function (index2, second) {
                            console.log(second.childTitle)
                            //js中无法直接传递一个json对象   需要将json对象转化为json字符串再进行传输
                            console.log("1111111111111111111")
                            var child = JSON.stringify(second);

                            c += "<p><a class='easyui-linkbutton' onclick='addTabs(" + child + ")'>" + second.menuTitle + "</a></p>";
                        })
                        c += "</div>";
                        $('#aa').accordion('add', {
                            title: first.menuTitle,
                            iconCls: first.menuconCls,
                            content: c,
                            selected: false
                        });
                    })
                }
            })
        })

        function addTabs(second) {
            //alert()
            // add a new tab panel
            var isExists = $('#tt').tabs('exists', second.menuTitle);
            if (!isExists) {
                $('#tt').tabs('add', {
                    title: second.menuTitle,
                    href: '${pageContext.request.contextPath}' + second.menuJspUrl,
                    // iconCls: second.menuconCls,
                    closable: true,
                    tools: [{
                        iconCls: 'icon-mini-refresh',
                        handler: function () {
                            //alert('refresh');
                        }
                    }]
                });

            } else {
                $('#tt').tabs('select', second.menuTitle);
            }

        }


    </script>

</head>
<body class="easyui-layout">
<%--上--%>
<div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px">
        持名法州后台管理系统
    </div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:xxxxx
        &nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="#"
                                                                                                              class="easyui-linkbutton"
                                                                                                              data-options="iconCls:'icon-01'">退出系统</a>
    </div>
</div>
<%--下--%>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体">☀☀☀☀☀☀ &nbsp;㊣大龙哥 &nbsp; ☀☀☀☀☀☀</div>
</div>
<%--左--%>
<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">
        <%--<c:forEach var="c" items="${sessionScope.all}">--%>
        <%--<div title="${c.menuTitle}" id="xx" onclick=""></div>--%>

        <%--<c:forEach var="d" items="${c.childmenu}">--%>
        <%--&lt;%&ndash;<intput type="button" value="${d.childTitle}"/>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="">${d.childTitle}</a>&ndash;%&gt;--%>
        <%--<a href="javascript:void(0)" id="btn" data-options="iconCls:'icon-search'" class="easyui-linkbutton" onclick="xxk()" >${d.childTitle}</a>--%>
        <%--</c:forEach>--%>

        <%--</c:forEach>--%>
    </div>
</div>
<%--中--%>
<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',"
             style="background-image:url(${pageContext.request.contextPath}/main/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>
</div>

</body>
</html>