<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
/* MENU-LEFT
-------------------------- */
/* layout */
#left ul.nav {
    margin-bottom: 2px;
    font-size: 12px; /* to change font-size, please change instead .lbl */
}
#left ul.nav ul,
#left ul.nav ul li {
    list-style: none!important;
    list-style-type: none!important;
    margin-top: 1px;
    margin-bottom: 1px;
}
#left ul.nav ul {
    padding-left: 0;
    width: auto;
}
#left ul.nav ul.children {
    padding-left: 40px;
    width: auto;
}
#left ul.nav ul.children li{
    margin-left: 0px;
}
#left ul.nav li a:hover {
    text-decoration: none;
}

#left ul.nav li a:hover .lbl {
    color: #999!important;
}

#left ul.nav li.current>a .lbl {
    background-color: #999;
    color: #fff!important;
}

/* parent item */
#left ul.nav li.parent a {
    padding: 0px;
    color: #ccc;
}
#left ul.nav>li.parent>a {
    border: solid 1px #999;
    text-transform: uppercase;
}    
#left ul.nav li.parent a:hover {
    background-color: #fff;
    -webkit-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);
    -moz-box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);
    box-shadow:inset 0 3px 8px rgba(0,0,0,0.125);    
}

/* link tag (a)*/
#left ul.nav li.parent ul li a {
    color: #222;
    border: none;
    display:block;
    padding-left: 5px;    
}

#left ul.nav li.parent ul li a:hover {
    background-color: #fff;
    -webkit-box-shadow:none;
    -moz-box-shadow:none;
    box-shadow:none;  
}

/* sign for parent item */
#left ul.nav li .sign {
    display: inline-block;
    width: 14px;
    padding: 13px 30px;
    background-color: transparent;
    color: #fff;
}
#left ul.nav li.parent>a>.sign{
    margin-left: 0px;
    background-color: #999;
}

/* label */
#left ul.nav li .lbl {
    padding: 5px 12px;
    display: inline-block;
}
#left ul.nav li.current>a>.lbl {
    color: #fff;
}
#left ul.nav  li a .lbl{
    font-size: 12px;
}

/* THEMATIQUE
------------------------- */
/* theme 1 */
#left ul.nav>li.item-1.parent>a {
    border: solid 1px #ff6307;
}
#left ul.nav>li.item-1.parent>a>.sign,
#left ul.nav>li.item-1 li.parent>a>.sign{
    margin-left: 0px;
    background-color: #ff6307;
}
#left ul.nav>li.item-1 .lbl {
    color: #ff6307;
}
#left ul.nav>li.item-1 li.current>a .lbl {
    background-color: #ff6307;
    color: #fff!important;
}

/* theme 2 */
#left ul.nav>li.item-8.parent>a {
    border: solid 1px #51c3eb;
}
#left ul.nav>li.item-8.parent>a>.sign,
#left ul.nav>li.item-8 li.parent>a>.sign{
    margin-left: 0px;
    background-color: #51c3eb;
}
#left ul.nav>li.item-8 .lbl {
    color: #51c3eb;
}
#left ul.nav>li.item-8 li.current>a .lbl {
    background-color: #51c3eb;
    color: #fff!important;
}

/* theme 3 */
#left ul.nav>li.item-15.parent>a {
    border: solid 1px #94cf00;
}
#left ul.nav>li.item-15.parent>a>.sign,
#left ul.nav>li.item-15 li.parent>a>.sign{
    margin-left: 0px;
    background-color: #94cf00;
}
#left ul.nav>li.item-15 .lbl {
    color: #94cf00;
}
#left ul.nav>li.item-15 li.current>a .lbl {
    background-color: #94cf00;
    color: #fff!important;
}

/* theme 4 */
#left ul.nav>li.item-22.parent>a {
    border: solid 1px #ef409c;
}
#left ul.nav>li.item-22.parent>a>.sign,
#left ul.nav>li.item-22 li.parent>a>.sign{
    margin-left: 0px;
    background-color: #ef409c;
}
#left ul.nav>li.item-22 .lbl {
    color: #ef409c;
}
#left ul.nav>li.item-22 li.current>a .lbl {
    background-color: #ef409c;
    color: #fff!important;
}
</style>
<body>
	<h3>Menu multi level</h3>
	<div class="container">
		<div class="row">
			<div id="left" class="span3">
				<ul id="menu-group-0" class="nav menu">
					<jsp:include page="/WEB-INF/views/_category.jsp"></jsp:include>
				</ul>
			</div>
		</div>
	</div>
	
<div class="container">
<div id="render-div"></div>
<div id="sliders">
    <table>
        <tr>
        	<td>Alpha Angle</td>
        	<td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-value" class="value"></span></td>
        </tr>
        <tr>
        	<td>Beta Angle</td>
        	<td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
        </tr>
        <tr>
        	<td>Depth</td>
        	<td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
        </tr>
    </table>
</div>
</div>	
<script type="text/javascript" charset="utf-8">


//Set up the chart
var chart = new Highcharts.Chart({
	
 chart: {
     renderTo: 'render-div',
     type: 'column',
     options3d: {
         enabled: true,
         alpha: 15,
         beta: 15,
         depth: 50,
         viewDistance: 25
     }
 },
 title: {
     text: 'Quantity sale in 2017'
 },
 subtitle: {
     text: 'Chart for iphone'
 },
 xAxis: {
     categories: Highcharts.getOptions().lang.shortMonths
 },
 yAxis: {
     title: {
         text: 'Products'
     }
 },
 plotOptions: {
     column: {
         depth: 25
     }
 },
 series: [{
     data: [
     	<%for(int i = 0; i< 12; i++){
     		int data[] = (int[])request.getAttribute("data");
     	%>	
     		<%= data[i] +( i==11 ? "" : "," )%>
     	<%} %>       
     ]
 }]
});

function showValues() {
 $('#alpha-value').html(chart.options.chart.options3d.alpha);
 $('#beta-value').html(chart.options.chart.options3d.beta);
 $('#depth-value').html(chart.options.chart.options3d.depth);
}

//Activate the sliders
$('#sliders input').on('input change', function () {
 chart.options.chart.options3d[this.id] = parseFloat(this.value);
 showValues();
 chart.redraw(false);
});

showValues();

!function ($) {
    
    $(document).on("click","#left ul.nav li.parent > a > span.sign", function(){          
        $(this).find('i:first').toggleClass("icon-minus");      
    }); 
    

}(window.jQuery);
</script>
</body>
</html>
