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
				
				sessionStorage.location = false;				
				document.getElementById('location').addEventListener('click', function(e) {
					sessionStorage.location = e.target.checked;
					$i.updateDisplay();
				}, true);
				
				document.getElementById('count').textContent = sessionStorage.length;
				
				//add key/values
				document.getElementById('add').addEventListener('click', function(e){
					var sKey = document.getElementById('sKey').value;
					var sValue = document.getElementById('sValue').value;
					sessionStorage.setItem(sKey, sValue);
					$i.updateDisplay();
				}, true);
				
				//clear
				document.getElementById('clear').addEventListener('click', function(e){
					sessionStorage.clear();
					$i.updateDisplay();
				}, true);				
				
				$i.updateDisplay();				
				
			};
			
			$i.updateDisplay = function() {
				var i, key;
				
				document.getElementById('count').textContent = sessionStorage.length;
				
				var existing = document.getElementById('existing');
				existing.textContent = '';
				
				for (i = 0; i < sessionStorage.length; i++)
				{
					key = sessionStorage.key(i);
					value = sessionStorage.getItem(key);
					existing.innerHTML += key + '=' + value + '<br/>';
				}
			};			
			

			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">sessionStorage [1/2]</div>
			<div id="rightnav"><a href="${createLink(action:'sessionstorage2')}">next</a> </div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="checkbox"><span class="name">Location </span>
					<input id="location" type="checkbox" /> 
				</li>
			</ul>

			<span class="graytitle">Existing sessionStorage items (<span id="count"></span>):</span>
			<ul class="pageitem">
				<li class="textbox">
					<p id="existing"></p>
				</li>
			</ul>	
			
			<ul class="pageitem">
				<li class="bigfield">
					<input id="sKey" placeholder="Key" type="text" />
				</li>
				<li class="bigfield">
					<input id="sValue" placeholder="Value" type="text" />
				</li>							
				<li class="button">
					<input id="add" type="submit" value="Add to sessionStorage" />
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