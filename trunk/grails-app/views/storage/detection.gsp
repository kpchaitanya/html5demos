<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		
		<script>
		
		(function my() {
			
			var $i = {};
			
			$i.init = function()
			{
				document.getElementById('sessionStorage').innerHTML = $i.hasSessionStorage() ? 'yes' : 'no';
				document.getElementById('localStorage').innerHTML = $i.hasLocalStorage() ? 'yes' : 'no';
				document.getElementById('sql').innerHTML = $i.hasSQL() ? 'yes' : 'no';
			};
			
			$i.hasSessionStorage = function()
			{
				return 'sessionStorage' in window;
			};
			
			$i.hasLocalStorage = function()
			{
				return 'localStorage' in window;
			};	
			
			
			//Modernizr.addTest('sqlstorage',function(){
			//  return typeof window.openDatabase == "function" ? true : false;
			//})
			//http://www.modernizr.com/docs/
			$i.hasSQL = function()
			{
				return typeof window.openDatabase == "function" ? true : false;
			};
			
			addEventListener('DOMContentLoaded', $i.init, true);					
			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">Detection</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>sessionStorage <span id="sessionStorage"></span></p>
				</li>
				<li class="textbox">
					<p>localStorage <span id="localStorage"></span></p>
				</li>	
				<li class="textbox">
					<p>SQL Database <span id="sql"></span></p>
				</li>																
			</ul>			
		</div>
		<div id="footer">
			<a class="noeffect" href="http://iwebkit.net">Powered by iWebKit</a>
		</div>
    </body>
</html>