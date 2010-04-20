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
			<span class="graytitle">Your User-Agent:</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>${request.getHeader('User-Agent')}</p>
				</li>
			</ul>			
			<span class="graytitle">HTML5</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>Examples demonstrating key concepts of HTML5 currently implemented.</p>
				</li>
				<li class="menu">
					<a href="${createLink(controller:'html5', action:'canvas_basic')}"><span class="name">Basic Canvas</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="${createLink(controller:'html5', action:'canvas_features')}"><span class="name">Canvas Features</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="${createLink(controller:'html5', action:'canvas_flot')}"><span class="name">Canvas Charting</span><span class="arrow"></span></a>						
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
					<a href="${createLink(controller:'geolocation', action:'detection_modernizr')}"><span class="name">Detection (Modernizr)</span><span class="arrow"></span></a>						
				</li>				
				<li class="menu">
					<a href="${createLink(controller:'geolocation', action:'oneshot')}"><span class="name">One-Shot</span><span class="arrow"></span></a>						
				</li>	
				<li class="menu">
					<a href="${createLink(controller:'geolocation', action:'combined')}"><span class="name">Zunehmende Genauigkeit</span><span class="arrow"></span></a>						
				</li>				
				<li class="menu">
					<a href="${createLink(controller:'geolocation', action:'watch')}"><span class="name">Watch</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="${createLink(controller:'geolocation', action:'reverse')}"><span class="name">Reverse Geocoding</span><span class="arrow"></span></a>						
				</li>												
			</ul>	
			<span class="graytitle">Offline Web Applications</span>
			<ul class="pageitem">
				<li class="textbox">
					<p>Web Apps that work without internet connection.</p>
				</li>
				<li class="menu">
					<a href="${createLink(controller:'offline', action:'detection')}"><span class="name">Online check</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="page.html"><span class="name">Offline</span><span class="arrow"></span></a>						
				</li>	
			</ul>
			<span class="graytitle">Web SQL Database & Web Storage</span>
			<ul class="pageitem">
				<li class="menu">
					<a href="${createLink(controller:'storage', action:'detection')}"><span class="name">Storage &amp; SQL Detection</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="${createLink(controller:'storage', action:'sessionstorage')}"><span class="name">sessionStorage</span><span class="arrow"></span></a>						
				</li>				
				<li class="menu">
					<a href="${createLink(controller:'storage', action:'localstorage')}"><span class="name">localStorage</span><span class="arrow"></span></a>						
				</li>
				<li class="menu">
					<a href="${createLink(controller:'storage', action:'storageevent')}"><span class="name">StorageEvent</span><span class="arrow"></span></a>						
				</li>					
			</ul>								
		</div>		
	</body>	
</html>