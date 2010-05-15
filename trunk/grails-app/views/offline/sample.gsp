<!DOCTYPE html>
<html manifest="/html5/offline/sampleManifest">
    <head>
        <title>HTML5</title>
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="apple-mobile-web-app-status-bar-style content="black"/>
		<link rel="apple-touch-startup-image" href="${resource(dir:'images',file:'startup.png')}" />
		<link rel="apple-touch-icon" href="${resource(dir:'images',file:'h5_webclip.png')}"/>

		<link href="${resource(dir:'css',file:'style.css')}" rel="stylesheet" media="screen" type="text/css" />
		<script src="${resource(dir:'js',file:'functions.js')}" type="text/javascript"></script>
		<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
		
		<script src="${resource(dir:'js',file:'modernizr-1.1.min.js')}" type="text/javascript"></script>
		
		<script>
		
		(function my() {
			
			var $i = {};
			$i.vars = {};
			
			$i.init = function()
			{				
				
				if (!$i.hasApplicationCache())
				{
					alert('No applicationCache!');
					return;
				}
				
				
				
				document.getElementById('message').innerHTML = (navigator.onLine) ? 'online' : 'offline';
				
				var cache = window.applicationCache;
				
				//setTimeout(function() {
				//	cache.update();					
				//}, 5000);

				
				document.getElementById('message').innerHTML += ' / status: ' + cache.status;
				
				//setTimeout(function() {
				//	document.getElementById('message').innerHTML += ' / status(2s): ' + cache.status;					
				//}, 2000);   
				
				var handler = function(e) {
					var eventsNode = document.getElementById('events');
					
					eventsNode.innerHTML += e.type + '<br/>';
					
					if ((e.type == 'checking' || e.type == 'progress') && !$i.startTimestamp) //on Android: no checking event
						$i.startTimestamp = e.timeStamp;
					else if (e.type == 'noupdate' || e.type == 'updateready' || e.type == 'cached')
						eventsNode.innerHTML += 'total time (s): ' + Math.abs((e.timeStamp - $i.startTimestamp) / 1000);
						
					if (e.type == 'updateready')
						window.applicationCache.swapCache();
				}
				
				cache.addEventListener('checking', handler, false);
				
				cache.addEventListener('error', handler, false);
				
				cache.addEventListener('noupdate', handler, false);								
				
				cache.addEventListener('downloading', handler, false);	
				
				cache.addEventListener('progress', handler, false);				
				
				cache.addEventListener('updateready', handler, false);	

				cache.addEventListener('cached', handler, false);				
							
				cache.addEventListener('obsolete', handler, false);				
							
				
				
			};
			
			$i.hasApplicationCache = function()
			{
				if (Modernizr.applicationcache)
					return true;
				else
					return false;
			};			
	

			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">Offline Web App</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>Your browser is <span id="message"></span></p>
				</li>
				<li class="textbox">
					<p id="events"></p>
				</li>				
														
			</ul>			
		</div>
    </body>
</html>