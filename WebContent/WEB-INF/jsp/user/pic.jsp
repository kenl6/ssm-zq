<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BootStrap 轮播</title>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/bootstrap/css/bootstrap.min.css"></link>
	<script type="text/javascript"
	src="<%=path%>/static/jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
	src="<%=path%>/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div id="myCarousel" class="carousel slide" width="60%">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="<%=path%>/images/slide1.png" alt="First slide">
			<div class="carousel-caption">SLIDE1</div>
		</div>
		<div class="item">
			<img src="<%=path%>/images/slide2.png" alt="Second slide">
			<div class="carousel-caption">SLIDE2</div>
		</div>
		<div class="item">
			<img src="<%=path%>/images/slide3.png" alt="Third slide">
			<div class="carousel-caption">SLIDE3</div>
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
	<!-- 控制按钮 -->
    <div style="text-align:center;">
        <input type="button" class="btn start-slide" value="Start">
        <input type="button" class="btn pause-slide" value="Pause">
        <input type="button" class="btn prev-slide" value="Previous Slide">
        <input type="button" class="btn next-slide" value="Next Slide">
        <input type="button" class="btn slide-one" value="Slide 1">
        <input type="button" class="btn slide-two" value="Slide 2">            
        <input type="button" class="btn slide-three" value="Slide 3">
    </div>
</div> 
	
	<script type="text/javascript">
	/* $(function(){
		$('#myCarousel').on('slide.bs.carousel', function () {
			alert("当调用 slide 实例方法时立即触发该事件。");
		});
	}); */
	 $('.carousel').carousel({
		 interval:500,
		 pause:"hover",
         wrap:false
	 }); 
	
	$(function(){
        // 初始化轮播
        $(".start-slide").click(function(){
            $("#myCarousel").carousel('cycle');
        });
        // 停止轮播
        $(".pause-slide").click(function(){
            $("#myCarousel").carousel('pause');
        });
        // 循环轮播到上一个项目
        $(".prev-slide").click(function(){
            $("#myCarousel").carousel('prev');
        });
        // 循环轮播到下一个项目
        $(".next-slide").click(function(){
            $("#myCarousel").carousel('next');
        });
        // 循环轮播到某个特定的帧 
        $(".slide-one").click(function(){
            $("#myCarousel").carousel(0);
        });
        $(".slide-two").click(function(){
            $("#myCarousel").carousel(1);
        });
        $(".slide-three").click(function(){
            $("#myCarousel").carousel(2);
        });
    });
	</script>
</body>
</html>