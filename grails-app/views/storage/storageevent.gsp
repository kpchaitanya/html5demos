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
			
				window.addEventListener('storage', function(e){
					var msgNode, msg = '';
					msgNode = document.getElementById('message');
					msg += 'StorageArea: ' + ((e.storageArea == localStorage) ? "localStorage" : "sessionStorage") + '<br/>';
					msg += 'Document URL: ' + e.url + '<br/>';
					msg += 'Key: ' + e.key + '<br/>';
					msg += 'OldValue: ' + e.oldValue + '<br/>';
					msg += 'NewValue: ' + e.newValue + '<br/>';					
					
					msgNode.innerHTML = msg;
				}, true);
			
			
				//add 
				document.getElementById('add').addEventListener('click', function(e){
					sessionStorage.setItem('myKey', new Date().toString());
				}, true);
				
				document.getElementById('clear').addEventListener('click', function(e){
					sessionStorage.clear();
				}, true);

				
			};
			
		
			

			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">Storage Events</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p id="message"></p>
				</li>
			</ul>			
			
			<ul class="pageitem">						
				<li class="button">
					<input id="add" type="submit" value="Add to sessionStorage" />
				</li>				
				<li class="button">
					<input id="clear" type="submit" value="Clear all" />
				</li>				
			</ul>			

		
		</div>
    </body>
</html>