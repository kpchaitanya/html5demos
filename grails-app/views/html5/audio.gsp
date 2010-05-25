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
				
				if (!$i.hasAudio())
					msg += 'Audio tag is NOT recognized<br/>';
				else
				{
					msg += 'Audio tag is recognized<br/>';
					
					formats = {mp3 : 'audio/mpeg;', vorbis : 'audio/ogg; codecs="vorbis"', wav : 'audio/wav; codecs="1"', aac : 'audio/mp4; codecs="mp4a.40.2"'};
					for (pos in formats)
					{
						audio = document.createElement('audio');
						if(!!(audio.canPlayType && audio.canPlayType(formats[pos]).replace(/no/, '')))
							msg += pos + ' can be played<br/>';
						else
							msg += pos + ' cannot be played<br/>';
					}
				}
					
				detectionNode.innerHTML = msg;
				
				if (!$i.hasAudio())
					return;
					
					
			    var podcast = document.getElementById('podcast');
			
				document.getElementById('play').addEventListener('click', function(e){
					podcast.play();
				}, true);
				
				document.getElementById('pause').addEventListener('click', function(e){
					podcast.pause();
				}, true);
				
				var chain = {one: 'two', two: 'three', three: 'one'};
				var swapAudio = function(e){
					var reg = /.*\/([a-z]*)\.mp3$/;
					var current = reg.exec(podcast.src)[1];
					alert(current + ' ended');
					podcast.src = 'http://hansamann.podspot.de/files/' + chain[current] + '.mp3';
					podcast.load();
					podcast.play();

				};
				
				podcast.addEventListener('ended', swapAudio, true);				
				podcast.addEventListener('error', function(error) {
					alert(error + " / Current media error code: " + podcast.error);
					
				}, true);	
					
				
				
			};
			
			$i.hasAudio = function()
			{
				return !!document.createElement('audio').canPlayType;
			};
			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">Detection</div>
		</div>
		<audio id="podcast" style="display:none;" src="http://hansamann.podspot.de/files/one.mp3">Fallback, Audio-Tag not recognized</audio>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox">
					<p id="detection"></p>
				</li>
				<li class="button">

					<input id="play" type="submit" value="Play podcast"/>
				</li>
				<li class="button">
					<input id="pause" type="submit" value="Pause playback"/>
				</li>																					
			</ul>			
		</div>
    </body>
</html>