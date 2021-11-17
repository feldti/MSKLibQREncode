services
checkForOutputFile
	"Throws an exception if the expected outfile file is not available"
	
	((GsFile existsOnServer:  self filename) ifNil: [ false ])
		ifFalse:[ ExLibQROutputNotCreatable new info: self filename ; signal ].
