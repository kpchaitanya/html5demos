<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script>
		
		(function my() {
			
			var $i = {};
			
			$i.init = function()
			{
				var detectionNode, msg = '', formats, pos, audio;
				detectionNode = document.getElementById('detection');
				
				if (!$i.hasVideo())
					msg += 'Video tag is NOT recognized<br/>';
				else
				{
					msg += 'Video tag is recognized<br/>';
					formats = {
						h264 : 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"',
						theora : 'video/ogg; codecs="theora, vorbis"',
					};
						for (pos in formats)
						{
							video = document.createElement('video');
							if(!!(video.canPlayType && video.canPlayType(formats[pos]).replace(/no/, '')))
								msg += pos + ' can be played<br/>';
							else
								msg += pos + ' cannot be played<br/>';
						}				
				}
					
				
					
				detectionNode.innerHTML = msg;
				
				if (!$i.hasVideo())
					return;
					
				var movie = document.getElementById('movie');

				document.getElementById('load').addEventListener('click', function(e) {
					movie.load();
				}, false);
				
				document.getElementById('play').addEventListener('click', function(e) {
					movie.play();
				}, false);
				
				document.getElementById('pause').addEventListener('click', function(e) {
					movie.pause();
				}, false);	
				
				movie.addEventListener('progress',function(e){
		         var soFar = parseInt(((movie.buffered.end(0) / movie.duration) * 100));
		         document.getElementById("status").innerHTML =  soFar + '%';					
				},false);
				
				movie.addEventListener('canplaythrough',function(e){
					movie.play();
				},false);	
				
				movie.addEventListener('loadedmetadata',function(e){
					alert('size: ' + movie.videoWidth + '/' + movie.videoHeight);
				},false);										
					
			  
				
			};
			
			$i.hasVideo = function()
			{
				return !!document.createElement('video').canPlayType;
			};
			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
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
					<p id="detection"></p>
				</li>
				<li class="textbox">
					<p id="status"></p>
				</li>				
				<li class="textbox">
					<video id="movie" controls poster="/html5/images/poster.png" src="http://hansamann.podspot.de/files/movie.mp4" width="280">Video-Tag not recognized</video>
				</li>
				<li class="button">
					<input id="load" type="submit" value="Load video"/>
				</li>				
				<li class="button">
					<input id="play" type="submit" value="Play video"/>
				</li>
				<li class="button">
					<input id="pause" type="submit" value="Pause video"/>
				</li>																								
			</ul>			
		</div>
    </body>
</html>