<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script type="text/javascript"
		    src="http://maps.google.com/maps/api/js?sensor=true">
		</script>
		
		
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
				
				
				var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				var	geocoder = new google.maps.Geocoder();
				
			    geocoder.geocode({'latLng': latlng}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
			        if (results[0]) { 
			          $i.showAddress(results[0]) //0 = most accurate
			        }
			      } else {
			        	alert("Geocoder failed due to: " + status);
			      }
			    });				
	
			}
			
			$i.showAddress = function(result)
			{
				    document.getElementById('message').innerHTML = '<br/><hr/>' + '<b>latlng: </b>' + result.geometry.location + '<br/>' +  '<b>Formatted Address:</b>' + result.formatted_address + '<br>';
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
			
			document.addEventListener("DOMContentLoaded", $i.init, false);						
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