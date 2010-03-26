<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script>
		
		(function my() {
			
			var $i = {};
			$i.vars = {};
			
			$i.init = function()
			{	
				document.getElementById('message').innerHTML = (navigator.onLine) ? 'online' : 'offline';
			};
	
		
			
	
			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">One-Shot</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>Your browser is <span id="message"></span></p>
				</li>									
			</ul>			
		</div>
		<div id="footer">
			<a class="noeffect" href="http://iwebkit.net">Powered by iWebKit</a>
		</div>
    </body>
</html>