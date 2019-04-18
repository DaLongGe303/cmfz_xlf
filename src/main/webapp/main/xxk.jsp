<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>

<head>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="../js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(function () {
            // 添加对话框转换控件
            $("#addForm").dialog({
                title: "修改对话框",
                width: 300,
                height: 300,
                buttons: "#wtm",
                closed: true
            })

            $('#dg_banner').edatagrid({
                method: 'get',
                url: '${pageContext.request.contextPath}/banner/selectAllBanner',
                pagination: true,
                columns: [[
                    {field: 'title', title: '标题', width: 100},
                    {
                        field: 'status', title: '状态', width: 100, editor: {
                            type: 'text',
                            options: {required: true}
                        }
                    },
                    {field: 'creatdate', title: '日期', width: 100}
                ]],
            });
        })

        // 添加按钮显示添加对话框
        function addCategory() {
            console.log("--------------")
            $("#addForm").dialog("open");
        }

        //添加事件
        function tianjia() {
            console.log("=====--==")
            $("#idAdd").form("submit", {
                url: 'banner/insertBanner',
                onSubmit: function () {
                    return $(this).form("validate");
                },
                success: function (data) {//如果成功接收控制台返回值
                    data = JSON.parse(data);//用json.parse字符串转对象
                    console.log(data + "----------")
                    if (data.isInsert) { //如果添加成功
                        $("#addForm").dialog("close");//关闭添加对话框

                    } else {
                        alert("添加失败了");//如果失败，提示信息
                    }
                    $("#dg_banner").datagrid("load"); //最后刷新页面
                }
            })
        }
    </script>
</head>
<body>

<%--添加按钮--%>
<div id="addButton">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-option="iconCls:'icon-add'"
       onclick="addCategory()">添加</a>
</div>

<table id="dg_banner"></table>

<%--添加表单--%>
<div id="addForm">
    <form id="idAdd" method="post" enctype="multipart/form-data">
        轮播图名:<input type="text" name="title" id="name"> <br/>
        选择图片:<input type="file" class="imgpath" name="file1"/>
    </form>
</div>

<%--添加对话框按钮--%>
<div id="wtm">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="tianjia()">提交</a>
</div>

</div>
</body>