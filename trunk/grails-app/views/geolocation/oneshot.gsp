<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script type="text/javascript" src="http://www.google.com/jsapi?key=ABQIAAAAk6AH6TdjmGE76Sg-VZ_hzRSYyF8ynozO6JFpZ6CDrLxUILeJ4BRcA2RZA26oyr7iw013JXdKrPSuCw"></script>
		
		
		<script>
			
		(function my() {
			
			var $i = {};
			$i.vars = {};
			
			$i.init = function()
			{	
				if ($i.hasGeo)
				{
					navigator.geolocation.getCurrentPosition($i.showLocation, $i.handleError, {timeout:30000, maximumAge:300000, enableHighAccuracy:true})
				}
				else
					document.getElementById('message').innerHTML = 'Sorry, no Geolocation API available!';
			};
			
			$i.showLocation = function(position)
			{
				document.getElementById('message').innerHTML = 'latitude: ' + position.coords.latitude + ' / longitude: ' + position.coords.longitude + ' / accuracy: ' + position.coords.accuracy + 'meters (acquired '+new Date(position.timestamp)+')';
				
				var map = new google.maps.Map2(document.getElementById("map"));
			    map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude), 13);
			}
			
			$i.handleError = function(error)
			{
				var msgNode = document.getElementById('message');
				
				switch (error.code)
				{
					case error.TIMEOUT:
						msgNode.innerHTML += 'timed out...';
						navigator.geolocation.getCurrentPosition($i.showLocation, $i.handleError, {timeout:30000, maximumAge:300000});
						break;
					case error.PERMISSION_DENIED:
						msgNode.innerHTML += 'user declined positioning';
						break;
					case error.POSITION_UNAVAILABLE:
						msgNode.innerHTML += 'position not available';
						break;
				}
				
				msgNode.innerHTML +=  ' - error message: ' + error.message;
			}
			
			$i.hasGeo = function()
			{
				if (navigator.geolocation)
					return true;
				else
					return false;
			};
			
			//document.addEventListener("DOMContentLoaded", $i.init, false);			
			google.load("maps", "2.x");
			google.setOnLoadCallback($i.init);			
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
					<p>Geolocation API: <span id="message"></span></p>
				</li>									
			</ul>	
			<div style="width: 100%; height:200px" id="map"></div>		
		</div>
		<div id="footer">
			<a class="noeffect" href="http://iwebkit.net">Powered by iWebKit</a>
		</div>
    </body>
</html>