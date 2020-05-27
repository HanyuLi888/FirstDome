<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SinopecCloudControl.UI.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title></title>
    <link href="css/common.css" rel="stylesheet" />
    <link href="css/easyui.css" rel="stylesheet" />
    <link href="css/jquery.mCustomScrollbar.css" rel="stylesheet" />
    <link href="css/rewrite-easyui.css" rel="stylesheet" />
    <script src="js/jquery-1.9.0.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/jquerysession.js"></script>
    <script src="js/index.js"></script>
    <script src="js/Menu.js"></script>
    <script src="js/scrollTop.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/jssetting.js"></script>
    <script src="js/easyui-lang-zh_CN.js"></script>
    <script src="js/jssetting.js"></script>
    <link href="css/sy.css" rel="stylesheet" />
    <script src="js/checkishaspower.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
</head>
<body>
    <input type="hidden" id="cid" value="<%=CloudResourceID %>" />
    <div class="top">
        <ul class="top_left">
            <li><a href="#" id="welComeTitle"></a></li>
            <%--<li><button id="bbb">aaa</button></li>--%>
        </ul>
        <ul class="top_right">
            <li>
                <%
                   
                    Response.Write("欢迎你：<span>" + UserName + "</span>");
                %>
            </li>
            <li><%
                    if (HttpContext.Current.Request.Cookies["pcitc_login_username"] == null)
                    {
                        Response.Write("<a id='aLogin' href='javascript:' onclick='Quit();'>退出</a>");
                    }
                    else
                    {
                        Response.Write("<a href=# onClick=Quit1()>注销</a>");
                    }
            %></li>


            <li><a href="#">用户帮助</a></li>
            <li><a href="<%if ((HttpContext.Current.Request.Cookies["pcitc_login_username"] == null))
                           {
                               Response.Write(ConfigurationManager.AppSettings["PostBackUrl"]);
                           }
                           else
                           {
                               Response.Write(ConfigurationManager.AppSettings["PostBackUrlTYSF"]);
                           }%>">云门户</a></li>
        </ul>
    </div>

    <div class="banner">
        <div class="nav_top">
            <!--<header class="nav_bg"></header>-->
            <div class="nav">

                <div class="logo">
                    <img id="bgPicture" alt="微软云资源管控台" />
                </div>
                <ul class="topmenu">
                    <li class="on"><a href="javascript:void(0)" title="" onclick="changeSession(3)" class="zy">资源池管理</a>

                    </li>
                    <li>
                        <a href="javascript:void(0)" title="" id="opn" class="zy" onclick="fun_a()">应用系统管理</a></li>

                    <li><a href="javascript:void(0)" title="" onclick="changeConfigSession(3)" class="zy">配置项维护</a>

                    </li>
                    <li><a href="#" title="" class="zy" onclick="fun_logs()">日志查看</a></li>

                </ul>

            </div>
        </div>

        <ul class="pic" id="pics">
            <li>
                <img src="images/img1.png" width="100%" height="436"></li>
            <li>
                <img src="images/img2.png" width="100%" height="436"></li>
            <li>
                <img src="images/img1.png" width="100%" height="436"></li>
            <li>
                <img src="images/img2.png" width="100%" height="436"></li>
        </ul>
        <div class="hd">
            <ul class="num" id="num">
                <li class="">1</li>
                <li>2</li>
                <li class="">3</li>
                <li class="">4</li>
            </ul>
        </div>
    </div>



    <div class="con clearfix" id="NHasQueue">
        <div>
            <dl>
                <dt>
                    <img src="images/wlicon.png"></dt>
                <dd>物理服务器</dd>
            </dl>
            <p id="s_pool_info1"></p>
        </div>
        <div class="mgl67">
            <dl>
                <dt>
                    <img src="images/xnicon.png"></dt>
                <dd>虚拟机</dd>
            </dl>
            <p id="s_pool_info2">
            </p>
        </div>
        <div class="mgl67">
            <dl>
                <dt>
                    <img src="images/ccicon.png"></dt>
                <dd>存储</dd>
            </dl>
            <p id="s_pool_info3"></p>
        </div>
        <div class="mgl67" id="HasQueue" style="display: none">
            <dl>
                <dt>
                    <img src="images/zyimg2.png"></dt>
                <dd>队列</dd>
            </dl>
            <p id="s_pool_info4">
            </p>
        </div>
    </div>



    <div class="bottom">地址:中国北京市朝阳区朝阳门北大街22号  邮政编码:100728   技术支持:石化盈科信息技术有限责任公司</div>

    <script type="text/javascript">
        var index = 0;
        var timer = null;
        onload = function () {
            var nums = document.getElementById('num').getElementsByTagName('li');
            var pics = document.getElementById('pics');
            timer = setInterval(function () {
                index++;
                if (index >= nums.length) {
                    index = 0;
                }
                //console.log(index);
                for (var i = 0; i < nums.length; i++) {
                    nums[i].className = '';
                }
                nums[index].className = 'on';
                pics.style.top = -436 * index + 'px';
            }, 5000)
        }

        $(function () {
            $(".topmenu li").click(function () {
                $(this).addClass("on").siblings().removeClass();
                if ($(this).has() == true) {
                    $(".zy").addClass("on");

                }

            })

        });
        function Login(url) {
            location.href = url;
        }


    </script>

</body>
</html>
<script>

    $(document).ready(function () {

        //checkIsHasPower("cloudResource", 1);
        //checkIsHasPower("cloudResourceT", 2);
        //checkIsHasPower("cloudResourceJJ", 5020);

        if ($("#cid").val() == 5020) {
            document.getElementById("welComeTitle").innerText = "欢迎来到九江石化通用技术云管控台";
            document.getElementById("bgPicture").src = "images/logo1(3).png";
            $("#HasQueue").css("display", "block");
            $(".con div").css("width", "160");

        } else if ($("#cid").val() == 5024) {
            document.getElementById("bgPicture").src = "images/logo1(4).png";
            document.getElementById("welComeTitle").innerText = "欢迎来到茂名石化通用技术云管控台";
            $("#HasQueue").css("display", "block");
            $(".con div").css("width", "160");
        } else if ($("#cid").val() == 5026) {
            document.getElementById("bgPicture").src = "images/logo2(SL).png";
            document.getElementById("welComeTitle").innerText = "欢迎来到胜利油田通用技术云管控台";
            $("#HasQueue").css("display", "block");
            $(".con div").css("width", "160");

        }

        //显示资源池的状态信息
        loadResourcePoolStatistics();
        //显示任务信息
        //loadRunbookQueue();
        //发送sso_adfs_token
        //sendsso_adfs_token();

        $("#bbb").click(function () {
            location.href = "MR_ApplicationSystemManagement/ExecutantWorkOrderDetail.aspx?data={'ApplyId':1440,'WorkOrderId':287,'Configuration':{'Cpu':8,'Memory':32,'DataDisk':'300'},'ServerGuid':'2588dbe2-5c9b-4fac-b751-2ba9843832d0','Count':5,'ResourcePoolId':2020,'SystemId':1153,'OperationSystemId':4,'Type':'Server','DengBaoLevel':'NW'}";
        });
        $("#HasQueue").click(function () {
            $.session.remove('ConfigMark')
            var cloudresourceid = $("#cid").val();


            $.session.set("ConfigMark", cloudresourceid);


            location.href = "MR_ApplicationSystemManagement/QueueQuery.aspx";
        });
        $(".topmenu>li").hover(function () {
            $(".topmenu>li.on").removeClass("on");
        }, function () {
            $(".topmenu>li:eq(0)").addClass("on");
        });


    })

    function Quit(url) {


        $.ajax({
            type: "GET",
            async: false,
            dataType: "text",
            contentType: "text/plain;charset=UTF-8",
            url: "Service/HasPower.ashx?method=QuitUserADCount",
            success: function (data) {


                location.href = "<%=new index_aspx().LogOut()%>";
            }
     });

        }
        function loadResourcePoolStatistics() {
            $.ajax({
                type: "GET",
                async: false,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                headers: getHearders(),
                url: address + "/odata/ResourcePoolStatistics",
                success: function (data) {
                    var count = data.value.length;

                    for (var i = 0; i < count; i++) {
                        //资源池内200台物理服务器，8台存储设备。共2000vCPU，16000GB RAM内存，500TB存储容量。部署了30个应用系统，已分
                        //配87个虚拟机，412vCPU，2000GBRAM内存，35TB存储容量。

                        if (data.value[i].CloudResourceID == $("#cid").val()) {

                            var aSS;
                            var storeCount;
                            var systemCount;
                            var allocatedVMCount;
                            var allocatedVCpu;
                            var allocatedServerMemory;
                            var serverCount;

                            if (data.value[i].TotalStoreSize == null || data.value[i].TotalStoreSize == "") {

                                aSS = 0;
                            } else {
                                aSS = data.value[i].TotalStoreSize;
                            }

                            if (data.value[i].StoreCount == null || data.value[i].StoreCount == "") {

                                storeCount = 0;
                            } else {
                                storeCount = data.value[i].StoreCount;
                            }
                            if (data.value[i].SystemCount == null || data.value[i].SystemCount == "") {

                                systemCount = 0;
                            } else {
                                systemCount = data.value[i].SystemCount;
                            }
                            if (data.value[i].AllocatedVMCount == null || data.value[i].AllocatedVMCount == "") {

                                allocatedVMCount = 0;
                            } else {
                                allocatedVMCount = data.value[i].AllocatedVMCount;
                            }
                            if (data.value[i].AllocatedVCpu == null || data.value[i].AllocatedVCpu == "") {

                                allocatedVCpu = 0;
                            } else {
                                allocatedVCpu = data.value[i].AllocatedVCpu;
                            }
                            if (data.value[i].AllocatedServerMemory == null || data.value[i].AllocatedServerMemory == "") {

                                allocatedServerMemory = 0;
                            } else {
                                allocatedServerMemory = data.value[i].AllocatedServerMemory;
                            }
                            if (data.value[i].ServerCount == null || data.value[i].ServerCount == "") {

                                serverCount = 0;
                            } else {
                                serverCount = data.value[i].ServerCount;
                            }
                            var s_pool_info3 = storeCount + "台存储设备。" + aSS + "GB存储容量。"
                            var s_pool_info2 = "部署了" + systemCount + "个应用系统，已分配" + allocatedVMCount + "个虚拟机，" + allocatedVCpu + "vCPU，" + allocatedServerMemory + "GBRAM内存。";

                            var s_pool_info1 = "资源池内部署了" + serverCount + "台物理服务器。";

                            $("#s_pool_info1").html(s_pool_info1);
                            $("#s_pool_info2").html(s_pool_info2);
                            $("#s_pool_info3").html(s_pool_info3);

                        }



                    }



                }
            });
            var queueCount = "";
            var runingQueue = "";
            $.ajax({
                type: "GET",
                async: false,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                headers: getHearders(),
                url: address + "/odata/RunbookQueueView?$orderby=CreateTime desc&$inlinecount=allpages&$filter=CloudResourceID eq " + $("#cid").val() + "",
                success: function (data) {

                    // ResourceApplyStatusID
                    queueCount = data["odata.count"];


                }
            });
            $.ajax({
                type: "GET",
                async: false,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                headers: getHearders(),
                url: address + "/odata/RunbookQueueView?$orderby=CreateTime desc&$inlinecount=allpages&$filter=CloudResourceID eq " + $("#cid").val() + " and ResourceApplyStatusID eq 3",
                success: function (data) {


                    runingQueue = data["odata.count"];


                }
            });

            var already = queueCount - runingQueue;
            var showMessage = "共运行" + queueCount + "个任务，其中" + runingQueue + "个任务正在运行;已完成" + already + ";";

            $("#s_pool_info4").html(showMessage);
        }

        function changeSession(num) {
            $.session.remove('ConfigMark')
            var cloudresourceid = $("#cid").val();
            if (num == 3) {

                $.session.set("ConfigMark", cloudresourceid);
                window.location.href = "Default.aspx?mark=ResourcePoolJ&cloudresourceid=" + cloudresourceid;
            }
        }

        function changeConfigSession(num) {
            $.session.remove('ConfigMark')

            var cloudresourceid = $("#cid").val();
            if (num == 3) {

                $.session.set('ConfigMark', cloudresourceid);
                location.href = "Default.aspx?mark=ConfigJ&cloudresourceid=" + cloudresourceid;

            }

        }
        function fun_a() {

            $.session.remove('ConfigMark');

            var cloudresourceid = $("#cid").val();

            $.session.set("ConfigMark", cloudresourceid);


            location.href = "ApplicationSystem.aspx?cloudresourceid=" + cloudresourceid;

        }

        function fun_logs() {

            var cloudresourceid = $("#cid").val();

            $.session.remove("LogMark");
            $.session.set("LogMark", cloudresourceid);

            location.href = "MR_OperationLogs/OperationLog_Pro.aspx?cloudresourceid=" + cloudresourceid;

        }


        function Quit1() {


            $.ajax({
                type: "GET",
                async: false,
                dataType: "text",
                contentType: "text/plain;charset=UTF-8",
                url: "Service/HasPower.ashx?method=QuitUserADCount",
                success: function (data) {
                    debugger;
                    // if (data == "True") {
                    location.href = "<%=new index_aspx().LogOut1()%>";//url;
                    // }
                }
            });

        }
</script>
