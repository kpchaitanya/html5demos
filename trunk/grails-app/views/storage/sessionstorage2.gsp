<html>
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
				if (!Modernizr.sessionstorage)
				{
					alert ('No sessionStorage!');
					return
				}
								
				document.getElementById('location').textContent = sessionStorage.location;
				
			};
			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">sessionStorage [2/2]</div>
			<div id="leftnav"><a href="${createLink(action:'sessionstorage')}">back</a> </div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>Previously, you selected: <span id="location"></span></p>
				</li>
			</ul>	
		</div>
    </body>
</html>