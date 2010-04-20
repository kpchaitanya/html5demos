<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script language="javascript" src="${resource(dir:'js',file:'jquery-1.4.2.min.js')}"></script>
		<script language="javascript" type="text/javascript" src="${resource(dir:'js',file:'jquery.flot.js')}"></script>
		<script language="javascript">
		function init()
		{
			var now = new Date().getTime();
			var oneDay = 1000*60*60*24;
			
			//UTC offset at the time of writing (based in Sunnyvale, CA, April 2010): -7 hrs.
			//this should be normalized on the server side
			now -= 1000*60*60*7;
			
			var data = [ 
				{ label: "Espresso / Day", data: [[now, 3], [now+oneDay, 7], [now+(oneDay*2), 2], [now+(oneDay*3), 3] ] }	
			];
			
		  	var options = {
		    	series: {
				    lines: {
				      show: true, fill: true
				    }, 
					points: { show:true }
		    	},
				colors: ["rgba(255,0,0,0.5)"],
			  	xaxis: {
			    	mode: "time",
					minTickSize: [1, "day"]
			  	}
			  };
						
			$.plot($("#chart"), data, options );
			
		}
		document.addEventListener("DOMContentLoaded", init, false);		
		</script>
    </head>
    <body>
		<div id="topbar">
			<div id="title">Canvas Charting</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<div id="chart" style="width:280px;height:300px">			
					</div>		
				</li>									
			</ul>			
		</div>
    </body>
</html>

