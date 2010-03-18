<html>
    <head>
        <title>HTML5 Demos</title>
		<meta name="layout" content="webkit" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		<link rel="apple-touch-icon" href="./images/h5_webclip.png"/>
		<link href="./images/startup.png" rel="apple-touch-startup-image" />	
	
    </head>
    <body>
		<div id="topbar">
			<div id="title">HTML5 Demos</div>
		</div>	
		<div id="content">
			<span class="graytitle">HTML5</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>Examples demonstrating key concepts of HTML5 currently implemented.</p>
				</li>
				<li class="menu">
					<a href="page.html"><span class="name">Canvas-Tag</span><span class="arrow"></span></a>					
				</li>
				<li class="menu">
					<a href="page.html"><span class="name">Audio-Tag</span><span class="arrow"></span></a>
				</li>			
				<li class="menu">
					<a href="page.html"><span class="name">Video-Tag</span><span class="arrow"></span></a>						
				</li>									
			</ul>
			<span class="graytitle">Geolocation API</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>This API allows you to locate the current user.</p>
				</li>
				<li class="menu">
					<a href="${createLink(controller:'geolocation', action:'detection')}"><span class="name">Detection</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="${createLink(controller:'geolocation', action:'oneshot')}"><span class="name">One-Shot</span><span class="arrow"></span></a>						
				</li>					
			</ul>	
			<span class="graytitle">Offline Web Applications</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>Web Apps that work with internet connections.</p>
				</li>
				<li class="menu">
					<a href="page.html"><span class="name">Offline</span><span class="arrow"></span></a>						
				</li>	
			</ul>
			<span class="graytitle">Web SQL Database</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>Use a client-side SQL database</p>
				</li>
				<li class="menu">
					<a href="page.html"><span class="name">Detection</span><span class="arrow"></span></a>						
				</li>	
			</ul>								
		</div>		
	</body>	
</html>