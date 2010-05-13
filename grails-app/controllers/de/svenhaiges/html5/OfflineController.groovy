package de.svenhaiges.html5

class OfflineController {

    def index = { 

	}
	
	def manifest = {

		def pathList = []
		new File("./web-app/images").eachFile {
			if (!it.name.startsWith('.'))
				pathList << 'html5' + it.path[1..-1]
			}
			render(contentType:'text/cache-manifest', text:pathList.join('\n')); 
	
	}

	def detection = { 
	
	}
	
	def sample = {
	
	
	}
	
	def sampleManifest = {
		def manifest = """CACHE MANIFEST\n
/html5/images/startup.png
/html5/css/style.css
/html5/js/functions.js
/html5/js/modernizr-1.1.min.js
/html5/images/arrow.png\n
#REV3
""";
	
	new File("./web-app/images").eachFile {
		if (!it.name.startsWith('.') && !it.directory)
			manifest += '/html5/images/' + it.name + '\n'
	}	
		
		render(contentType:'text/cache-manifest', text:manifest);	
	
	}
}
