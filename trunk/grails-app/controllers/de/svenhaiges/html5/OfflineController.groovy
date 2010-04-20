package de.svenhaiges.html5

class OfflineController {

    def index = { 

	def pathList = []
	new File("./web-app/offline").eachFile {
		pathList << 'html5' + it.path[1..-1]
	}
	render pathList.join('\n')

	}

	def detection = { 
	
	}
}
