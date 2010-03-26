<html class="no-js">
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		<script src="${resource(dir:'js',file:'modernizr-1.1.min.js')}" type="text/javascript"></script>
		<script>
		
		(function my() {
			
			var $i = {};
			
			$i.init = function()
			{
				document.getElementById('message').innerHTML = $i.hasGeo() ? 'yes' : 'no';
			};
			
			$i.hasGeo = function()
			{
				if (Modernizr.geolocation)
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
			<div id="title">Detection with Modernizr</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>Geolocation API: <span id="message"></span></p>
				</li>									
			</ul>			
		</div>
		<div id="footer">
			<a class="noeffect" href="http://iwebkit.net">Powered by iWebKit</a>
		</div>
    </body>
</html>