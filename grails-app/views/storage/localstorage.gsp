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
				if (!Modernizr.localstorage)
				{
					alert ('No localStorage!');
					return
				}
				
				if (!localStorage.loadCount)
					localStorage.loadCount = 0;
			
				localStorage.loadCount = parseInt(localStorage.loadCount, 10) + 1;
				document.getElementById('loadCount').textContent = localStorage.loadCount;
				
				//add key/values
				document.getElementById('add').addEventListener('click', function(e){
					var lKey = document.getElementById('lKey').value;
					var lValue = document.getElementById('lValue').value;
					localStorage.setItem(lKey, lValue);
					$i.updateDisplay();
				}, true);
				
				//clear
				document.getElementById('clear').addEventListener('click', function(e){
					localStorage.clear();
					$i.updateDisplay();
				}, true);				
				
				$i.updateDisplay();
				
			};
			
			$i.updateDisplay = function() {
				var i, key;
				
				document.getElementById('count').textContent = localStorage.length;
				
				var existing = document.getElementById('existing');
				existing.textContent = '';
				
				for (i = 0; i < localStorage.length; i++)
				{
					key = localStorage.key(i);
					value = localStorage.getItem(key);
					existing.innerHTML += key + '=' + value + '<br/>';
				}
			};
			

			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">localStorage</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					You have viewed this site <span id="loadCount">0</span> times. 
				</li>
			</ul>
			
			<span class="graytitle">Existing localStorage items(<span id="count"></span>):</span>
			<ul class="pageitem">
				<li class="textbox">
					<p id="existing"></p>
				</li>
			</ul>			
			
			<ul class="pageitem">
				<li class="bigfield">
					<input id="lKey" placeholder="Key" type="text" />
				</li>
				<li class="bigfield">
					<input id="lValue" placeholder="Value" type="text" />
				</li>							
				<li class="button">
					<input id="add" type="submit" value="Add to localStorage" />
				</li>				
			</ul>
			<ul class="pageitem">		
				<li class="button">
					<input id="clear" type="submit" value="Clear all" />
				</li>				
			</ul>			

		
		</div>
    </body>
</html>