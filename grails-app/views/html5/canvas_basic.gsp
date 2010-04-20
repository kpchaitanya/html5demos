<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script>
		function init()
		{
			var canvas = document.getElementById('myCanvas');
			var ctx = canvas.getContext('2d');

			for (var i = 0; i < 10; i++)
			{
				var color = Math.round((i/9) * 255);
				ctx.fillStyle = "rgb("+color+","+color+","+color+")";  
				ctx.fillRect (i*28, 61, 28, 28);			
			}

			//funktioniert auf dem iPhone, ab 3.1
			var dataURL = canvas.toDataURL();
			var img = document.createElement('img');
			img.setAttribute('src', dataURL);
			document.getElementById('box').appendChild(img);
			
			//funktioniert in ff, jedoch weder auf iphone/nexus one
			var imageData = ctx.getImageData(0,0,280,150);
			document.getElementById('message').innerHTML = data.width + '/' + data.height;			
		}
		document.addEventListener("DOMContentLoaded", init, false);		
		</script>
    </head>
    <body>
		<div id="topbar">
			<div id="title">Basic Canvas</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="textbox" id="box">
					<canvas style="border: 1px dotted black;" width="280" height="150" id="myCanvas">
						Ihr Browser unterstuetzt kein HTML5 Canvas!
					</canvas>
					<p id='message'></p>	
					If you see a second image below, your browser supports canvas.toDataURL()					
				</li>
													
			</ul>
					
		</div>
    </body>
</html>

