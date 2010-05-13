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
				window.addEventListener("online", function() {
					alert("We're now online");
				}, true);

				window.addEventListener("offline", function() {
				  alert("We're now offline");
				}, true);				
				
				document.getElementById('message').innerHTML = (navigator.onLine) ? 'online' : 'offline';
			};
	

			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">Online/Offline</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>Your browser is <span id="message"></span></p>
				</li>
														
			</ul>			
		</div>
    </body>
</html>