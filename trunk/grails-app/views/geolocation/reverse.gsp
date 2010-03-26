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
				
				
				var latlon = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				var	geocoder = new GClientGeocoder();
				geocoder.getLocations(latlon, $i.showAddress);
			}
			
			$i.showAddress = function(response)
			{
				if (!response || response.Status.code != 200) {
				    alert("Status Code:" + response.Status.code);
				 } else {
				 	var place = response.Placemark[0];
				    document.getElementById('message').innerHTML = '<br/><hr/>' +
				    '<b>orig latlng:</b>' + response.name + '<br/>' +
				    '<b>latlng:</b>' + place.Point.coordinates[1] + "," + place.Point.coordinates[0] + '<br>' +
				    '<b>Status Code:</b>' + response.Status.code + '<br>' +
				    '<b>Status Request:</b>' + response.Status.request + '<br>' +
				    '<b>Address:</b>' + place.address + '<br>' +
				    '<b>Accuracy:</b>' + place.AddressDetails.Accuracy + '<br>' +
				    '<b>Country code:</b> ' + place.AddressDetails.Country.CountryNameCode;
				  }				
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
			<div id="title">Reverse Geocoding</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p>Geolocation API: <span id="message"></span></p>
				</li>									
			</ul>	
		</div>
    </body>
</html>