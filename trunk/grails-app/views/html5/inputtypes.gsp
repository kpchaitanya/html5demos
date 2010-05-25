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
			
			};
			
			document.addEventListener("DOMContentLoaded", $i.init, false);			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">New Input Types</div>
		</div>
		<div id="content">
			<ul class="pageitem">
				<li class="bigfield">
					<input placeholder="text" type="text" autofocus="true"/>
				</li>
				<li class="bigfield">
					<input placeholder="text autocorrect" type="text" autocorrect="on"/>
				</li>	
				<li class="bigfield">
					<input placeholder="text autocapitalize off" type="text" autocapitalize="off"/>
				</li>											
				<li class="bigfield">
					<input placeholder="tel" type="tel" />
				</li>								
				<li class="bigfield">
					<input placeholder="url" type="url" />
				</li>
				<li class="bigfield">
					<input placeholder="email" type="email" />
				</li>
				<li class="bigfield">
					<input placeholder="password" type="password" />
				</li>		
				<li class="bigfield">
					<input placeholder="number" type="number" />
				</li>	
				<li class="bigfield">
					<input placeholder="text pattern" type="text" pattern="[0-9]*"/>
				</li>				
				<li class="checkbox"><span class="name">Checkbox </span>
					<input type="checkbox" /> 
				</li>	
				<li class="radiobutton">
					<span class="name">A</span><input name="GroupName" type="radio" value="A" />
				</li>				
				<li class="radiobutton">
					<span class="name">B</span><input name="GroupName" type="radio" value="B" />
				</li>															
				
				<li class="bigfield">
					<input type="range" value="0" min="0" max="10" step="2"/>
				</li>																
				<li class="bigfield">
					<input placeholder="datetime*" type="datetime" />
				</li>	
				<li class="bigfield">
					<input placeholder="date*" type="date" />
				</li>
				<li class="bigfield">
					<input placeholder="month*" type="month" />
				</li>
				<li class="bigfield">
					<input placeholder="week*" type="week" />
				</li>	
				<li class="bigfield">
					<input placeholder="time*" type="time" />
				</li>
				<li class="bigfield">
					<input placeholder="datetime-local*" type="datetime-local" />
				</li>
				<li class="bigfield">
					<input placeholder="color*" type="color" />
				</li>
																																	
			</ul>			
		</div>
    </body>
</html>