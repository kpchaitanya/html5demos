<html>
    <head>
        <title>HTML5</title>
		<meta name="layout" content="webkit" />

		<style type="text/css" media="screen">

		</style>
		
		<script>
		
		var canvas;
		var ctx;
		
		function init()
		{
			canvas = document.getElementById('myCanvas');
			ctx = canvas.getContext('2d');
			ctx.save();
			
			document.getElementById('feature').addEventListener('change', showFeature, false);
		}
		
		function showFeature(evt)
		{
			var featureSelect = document.getElementById('feature');
			var feature = featureSelect.options[featureSelect.selectedIndex].value;
			ctx.clearRect(0,0,280,300);
			window[feature].call();
			ctx.restore();
			document.getElementById('message').innerHTML = '';
		}
		
		function none() { }
		
		function shapes() {
			ctx.fillStyle="rgb(255,0,0)";
			ctx.fillRect(10, 10, 260, 30);

			ctx.strokeStyle="rgb(0,255,0)";
			ctx.strokeRect(10, 50, 260, 30);
			ctx.clearRect(20, 20, 100, 10);
		}
		
		function getRadians(deg)
		{
			return (Math.PI/180)*deg;
		}
		
		function paths() {
			/*
			// path API
			msising:
			void arcTo(in float x1, in float y1, in float x2, in float y2, in float radius);
		  	void clip();
			*/
			
			//2 Linien, 5px Abstand
			ctx.beginPath();
			ctx.strokeStyle="rgb(0,0,255)";
			ctx.moveTo(10, 10);
			ctx.lineTo(260, 10);
			ctx.moveTo(10, 15);
			ctx.lineTo(260, 15);
			ctx.stroke();
			
			//Dreieck
			ctx.beginPath();
			ctx.fillStyle="rgb(0,255,0)";
			ctx.moveTo(10, 50);
			ctx.lineTo(25, 20);
			ctx.lineTo(40, 50);
			ctx.fill();
			
			//Quadrat, per closePath() geschlossen
			ctx.beginPath();
			ctx.moveTo(10, 55);
			ctx.lineTo(40, 55);
			ctx.lineTo(40, 85);
			ctx.lineTo(10, 85);
			ctx.closePath();
			ctx.fill();
			
			//2 Linien, kein closePath(), kein fill() sondern stroke()
			ctx.beginPath();
			ctx.moveTo(10, 90);
			ctx.lineTo(100, 90);
			ctx.lineTo(100, 100);
			ctx.lineTo(10, 100);
			ctx.stroke();
			
			//arc - Kreisfoermige Pfade
			for (var i = 0; i < 4; i++)
			{
				ctx.beginPath();
				var x = 30 + (60*i);
				ctx.arc(x, 125, 20,  getRadians(0), getRadians(360-(90*i)), false);
				ctx.fill();				
			}

			for (var i = 0; i < 4; i++)
			{
				ctx.beginPath();
				var x = 30 + (60*i);
				ctx.arc(x, 170, 20,  getRadians(0), getRadians(360-(90*i)), false);
				ctx.stroke();				
			}
			
			//3/4 Kreis stroke()
			ctx.beginPath();
			ctx.arc(30, 215, 20,  getRadians(0), getRadians(270), false);
			ctx.lineTo(30, 215);
			ctx.lineTo(50, 215);
			ctx.stroke();
			
			
			//3/4 Kreis fill()
			ctx.beginPath();
			ctx.arc(90, 215, 20,  getRadians(0), getRadians(270), false);
			ctx.lineTo(90, 215);
			ctx.lineTo(110, 215);
			ctx.fill();	
			
			//rect
			ctx.beginPath();
			ctx.rect(200, 250, 40, 40);
			if (ctx.isPointInPath(210, 260))
				document.getElementById('message').innerHTML = '(210,260) is in this path!';
			ctx.fill();

		}		
		
		function images() {
				/*
					Keep in mind the same functions exist for HTMLVideoElement and HTMLCanvasElement - you can copy the image 
					of a canvas into an canvas
				*/
				
				var image = new Image();
				image.addEventListener('load', function(evt) { 
					ctx.drawImage(image, 10, 10); //einfachste Variante
					
					for (var i = 0; i<4; i++)
					{
						var len = 10+10*i;
						ctx.drawImage(image, (10 + len*i), 50, len, len); //scaling
					}
					
					ctx.drawImage(image, 0, 0, 10, 10, 	10, 80, 40, 40); //slicing (+resizing the sliced part)
					
					
				});
				image.src = 'http://flavor.de/html5/thumbs/calendar.png';
				
		}
		
		function arcto() { 
            ctx.beginPath();
            ctx.moveTo(100, 100);
            ctx.lineTo(160, 100);
            ctx.arcTo(180, 100, 180, 120, 20);
            ctx.lineTo(180, 180);
            ctx.arcTo(180, 200, 120, 200, 20);
            ctx.lineTo(120, 200);
            ctx.arcTo(80, 200, 80, 180, 20);
            ctx.lineTo(80, 120);
            ctx.arcTo(80, 100, 100, 100, 20);
            ctx.fill();			
		}
		
		function clip() {
			//center of canvas
			ctx.translate(140, 150);

			//create clipping 
			ctx.beginPath();
			ctx.arc(0, 0, 100,  getRadians(0), getRadians(360), false);
			ctx.clip();
			
			//draw to see clipping
			ctx.translate(-140,-150);
			ctx.fillStyle="rgb(255,0,0)";
			ctx.fillRect(10, 120, 260, 60);
		}
		
		function quadraticcurveto() {
			for (var i=0; i<300; i+=10)
			{
				ctx.beginPath();
				ctx.moveTo(0, 150);
				ctx.quadraticCurveTo(140, i, 280, 150);
				ctx.stroke();			
			}
		}
		
		function beziercurveto() {
			
			var i = 0;
			var draw = function() {
				ctx.beginPath();
				ctx.moveTo(0, 150);
				ctx.bezierCurveTo(70, i, 210, 300-i, 280, 150);
				ctx.stroke();
				i+= 10;

				if (i < 300)
					setTimeout(draw, 500);
				
			}
			setTimeout(draw, 500);
		}
		
		function fillstyle() {
			//fillStyle can be CSS color value, a gradient object, or a pattern object
			for (var i = 0; i < 10; i++){
				ctx.fillStyle = "rgb("+(Math.floor((255/10)*i))+",0, 0)";
				ctx.fillRect(i*28, i*28, 28, 28);
				
				ctx.fillStyle = "rgb(0,"+(Math.floor((255/10)*i))+", 0)";
				ctx.fillRect(252-(i*28), i*28, 28, 28);
			}
		}
		
		function strokestyle() {
			for (var i = 0; i <= 300; i+=2){
				ctx.strokeStyle = "rgb("+Math.floor((255/300)*i)+",0, 0)";
				ctx.beginPath();
				ctx.moveTo(0, i);
				ctx.lineTo(280, i);
				ctx.stroke();
			}			
			
			//draw partially transparent rectangles over this 
			for (var i = 0; i<10; i++)
			{
				ctx.globalAlpha = 0.1 + 0.1 * i;
				ctx.fillStyle = "rgb(0,0,255)";
				ctx.fillRect(50, 300/10*i, 30, 30);
			}
			
			//use rgba instead of globalAlpha
			ctx.globalAlpha = 1;
			for (var i = 0; i<10; i++)
			{
				ctx.fillStyle = "rgba(0,255,0,"+(0.1 + 0.1*i)+")";
				ctx.fillRect(200, 300/10*i, 30, 30);
			}			
		}
		
		function linestyle() {
		
			//lineWidth
			for (var i = 0; i<10; i++) {
				ctx.lineWidth = i;
				ctx.beginPath();
				ctx.moveTo(280/10*i, 0);
				ctx.lineTo(280/10*i, 20);
				ctx.stroke();
			}
			
			//lineCap
			var lineCap = ['butt','round','square']; 
			var lineStyle = "rgb(0,0,0)";
			ctx.lineWidth = 1;
			ctx.strokeRect(10, 30, 260, 260);
			
			ctx.lineWidth = 15;
			var pos;
			for (pos in lineCap)
			{
				ctx.lineCap = lineCap[pos];
				ctx.beginPath();
				ctx.moveTo((35 + 35*pos), 30);
				ctx.lineTo((35 + 35*pos), 290);
				ctx.stroke();
				
			}
			
			var lineJoin = ['round','bevel','miter']; 
			var startY;
			for (i = 0; i<3; i++)
			{
				ctx.beginPath();
				ctx.lineJoin = lineJoin[i];
				startY = 90 + (i*30);
				ctx.moveTo(150, startY);
				ctx.lineTo(170, startY-20);
				ctx.lineTo(190, startY);
				ctx.stroke();
			}
			
			//zigzag for miterLimit
			ctx.lineWidth = 2;
			ctx.lineJoin = 'miter';
			var startX;
			for (i = 0; i<5; i++)
			{
				ctx.beginPath();
				ctx.miterLimit = i*5;
				startX = (150+(i*10));
				ctx.moveTo(startX, 250);
				ctx.lineTo(startX+5, 200);
				ctx.lineTo(startX+10, 250);
				ctx.stroke();
			}
		}
		
		
		function gradients() {
			/*
		  CanvasGradient createRadialGradient(in float x0, in float y0, in float r0, in float x1, in float y1, in float r1);
		*/
			//linearGradient
			var linearGradient;
			for (i = 0; i<6; i++)
			{
				linearGradient = ctx.createLinearGradient(i*46, 0, (i*46)+40, Math.floor((40/5)*i)); //absolute to canvas!! 
				linearGradient.addColorStop(0, 'rgb(255,0,0)');
				linearGradient.addColorStop(0.5, 'rgb(0,255,0)');
				linearGradient.addColorStop(1, 'rgb(0,0,255)');
				ctx.fillStyle = linearGradient;
				ctx.fillRect(i*46,10,40,40);
			}
			
			//radialGradient
			var radialGradient;
			radialGradient = ctx.createRadialGradient(140,150,0,140,150,50);
			radialGradient.addColorStop(0, 'rgb(255,0,0)');
			radialGradient.addColorStop(0.5, 'rgb(0,255,0)');
			radialGradient.addColorStop(1, 'rgb(0,0,255)');
			
			ctx.fillStyle = radialGradient;
			ctx.beginPath();
			ctx.arc(140, 150, 50,  getRadians(0), getRadians(360), false);
			ctx.fill();			
			
		}
		
		//possible for image,canvas, video elements
		function pattern() {

			var img = new Image();  
			img.src = 'http://flavor.de/html5/thumbs/calendar.png';  
			img.onload = function() {  
				var pat = ctx.createPattern(img,'repeat');  
				ctx.fillStyle = pat;  
				ctx.fillRect(0,0,280,300);  
			}			
		}
		
		function shadows() {
			/*
       		BUG in android? shadow offset is substracted from x,y, not added? 
			CHECK in ipod touch!
			*/
			for (i = 0; i<10; i++)
			{
				ctx.shadowOffsetX = i;  
				ctx.shadowOffsetY = i;  
				ctx.shadowBlur = i;  
				ctx.shadowColor = "rgba(0, 0, 0, 0.5)";  
				var x, y;
				x = y = (280/10)*i;
				ctx.fillRect(x, y, 20, 20);
			}
			    
			
			
		}
		
		function text(){		
			var textBaseline = ["top", "hanging", "middle", "alphabetic", "ideographic", "bottom"];
			var y;
			ctx.font = "20px Georgia";
			for (pos in textBaseline)
			{
				ctx.textBaseline = textBaseline[pos];
				ctx.beginPath();
				y = (20 + (40*pos));
				ctx.lineStyle= "rgb(255,0,0)";
				ctx.moveTo(10, y);
				ctx.lineTo(270, y);
				ctx.stroke();
				ctx.fillText('baseline', 10, y); 
			}
		
			var metrics = ctx.measureText('align');
			ctx.beginPath();
			var centerTextX = 200+(metrics.width/2)
			ctx.moveTo(centerTextX, 20);
			ctx.lineTo(centerTextX, 280)
			ctx.stroke();
		
			var textAlign = ["start", "end", "left", "right", "center"];		
			for (pos in textAlign)
			{
				ctx.textAlign = textAlign[pos];
				y = (20 + (40*pos));
				ctx.fillText('align', centerTextX, y); 
			}
		}
	

		function transformations() {
			/*
		  void transform(in float m11, in float m12, in float m21, in float m22, in float dx, in float dy);
		  void setTransform(in float m11, in float m12, in float m21, in float m22, in float dx, in float dy);

		*/
			//translate the drawing context
			ctx.save();
			ctx.translate(100, 100);
			ctx.fillText('translated 100,100', 0, 0);
			ctx.restore();
			
			//rotate
			ctx.save();
			ctx.translate(140,150);
			ctx.rotate(getRadians(90));
			ctx.fillText('rotated 90deg', 0, 0);
			ctx.restore();
			
			//scale
			ctx.save();
			ctx.scale(2,2); //1 is 100%
			ctx.fillText('scaled 2x', 75,100);
			ctx.restore();
			
						
			
			
			
					
		}
		
		function compositing() {
			/*
			nexus one 2.1
			['source-over', ok 
			'source-out', wrong?
			'source-atop', NOK
			'source-in' , NOK
			'destination-atop', wrong? 
			'destination-in', 
			'destination-out', 
			'destination-over', ok
			'lighter', ok
			'copy', ok
			'xor'] ok
			*/
			
			//TODO draw in openoffice. Impl. too buggy at this point. 
			
			var types = ['source-over', 'source-out', 'source-atop', 'source-in' , 'destination-atop', 'destination-in', 'destination-out', 'destination-over', 'lighter', 'copy', 'xor'];
			var pos = 0;
			var draw = function(){
				ctx.save();
				ctx.globalCompositeOperation = 'source-over';
				ctx.clearRect(0,0, 280,300);
				ctx.globalCompositeOperation = types[pos++];
				ctx.fillStyle = 'rgb(255,0,0)';
				ctx.fillRect(75,75, 100, 100);
				ctx.fillStyle = 'rgb(0,0,255)';
				ctx.beginPath();
				ctx.arc(175, 175, 50,  getRadians(0), getRadians(360), false);
				ctx.fill();	
				ctx.fillStyle = 'rgb(0,0,0)';
				ctx.fillText(ctx.globalCompositeOperation, 10, 10);	
				ctx.restore();
				
				if (pos < types.length)
					setTimeout(draw, 2000);
			};
				
			setTimeout(draw, 0);
		
		}
		
	
		
		
		document.addEventListener("DOMContentLoaded", init, false);		
		</script>
    </head>
    <body>
		<div id="topbar">
			<div id="title">Canvas Features</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="select">
					<select id="feature">
						<option value="none">Select a feature...</option>
						<option value="shapes">Shapes</option>
						<option value="paths">Paths</option>
						<option value="arcto">Paths - ArcTo</option>
						<option value="clip">Paths - Clipping</option>
						<option value="quadraticcurveto">Paths - Quadratic</option>
						<option value="beziercurveto">Paths - Bezier</option>
						<option value="images">Images</option>
						<option value="fillstyle">fillStyle</option>
						<option value="strokestyle">strokeStyle and alpha</option>												
						<option value="linestyle">Line styles</option>						
						<option value="gradients">Gradients</option>
						<option value="pattern">Pattern</option>								
						<option value="shadows">Shadows</option>
						<option value="text">Text</option>
						<option value="transformations">Transformations</option>	
						<option value="compositing">Compositing</option>							
																	
					</select>
					<span class="arrow"></span>				
				</li>
				<li class="textbox">
					<canvas style="border: 1px dotted black;" width="280" height="300" id="myCanvas">
						Ihr Browser unterstuetzt kein HTML5 Canvas!
					</canvas>					
				</li>
				<li class="textbox">
					<p id="message"></p>
				</li>									
			</ul>			
		</div>
    </body>
</html>

