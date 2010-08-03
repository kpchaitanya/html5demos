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
			$i.vars.callbacks = 0;
			$i.vars.usedCallbacks = 0;
			$i.vars.lastUpdate = null;
			
			$i.init = function()
			{	
				if ($i.hasGeo)
				{
					$i.vars.watchID = navigator.geolocation.watchPosition($i.showLocation, $i.handleError, {timeout:30000, maximumAge:300000, enableHighAccuracy:true});
					document.getElementById('stop').addEventListener('click', function(event) {
						if ($i.vars.watchID !== null)
						{
							navigator.geolocation.clearWatch($i.vars.watchID);
							alert('Cleared watch with ID:' +$i.vars.watchID);
							$i.vars.watchID = null;
							this.value = 'start watching';
						}
						else
						{
							$i.vars.watchID = navigator.geolocation.watchPosition($i.showLocation, $i.handleError, {timeout:30000, maximumAge:300000, enableHighAccuracy:true});							
							this.value = 'stop watching';
						}
					}, true);
				}
				else
					document.getElementById('message').innerHTML = 'Sorry, no Geolocation API available!';
			};
			
			$i.showLocation = function(position)
			{				
				$i.vars.callbacks++;
				document.getElementById('message1').innerHTML = $i.vars.callbacks;
				if (!$i.vars.map)
				{
				    var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				    var myOptions = {
				      zoom: 17,
				      center: latlng,
				      mapTypeId: google.maps.MapTypeId.ROADMAP
				    };
				    $i.vars.map = new google.maps.Map(document.getElementById("map"), myOptions);					
				}
				
				if ($i.vars.lastUpdate)
				{
					var differenceInSeconds = (new Date().getTime() - $i.vars.lastUpdate) / 1000;
					if (differenceInSeconds < 15)
						return;
				}

				$i.vars.lastUpdate = new Date().getTime();
				$i.vars.usedCallbacks++;
				document.getElementById('message2').innerHTML = $i.vars.usedCallbacks;
			
				// Create our "tiny" marker icon
			  var image = 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png';
			  var markerLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			  var beachMarker = new google.maps.Marker({
			      position: markerLatLng,
			      map: $i.vars.map,
			      icon: image
			  });
			
			  
			}
			
			$i.handleError = function(error)
			{
				var msgNode = document.getElementById('message');
				
				switch (error.code)
				{
					case error.TIMEOUT:
						msgNode.innerHTML += 'timed out...';
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
			<div id="title">watchPosition</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p><input type="button" id="stop" value="stop watching"/> Callbacks: <span id="message1"></span>/<span id="message2"></span></p>
				</li>													
			</ul>	
			<div style="width: 100%; height:350px;" id="map"></div>		
		</div>
    </body>
</html>