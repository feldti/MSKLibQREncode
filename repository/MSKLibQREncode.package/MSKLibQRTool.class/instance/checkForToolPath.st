services
checkForToolPath
	"Throws an exception if the expected tool is not available"
	
	((GsFile existsOnServer:  self qrToolFullPath) ifNil: [ false ])
		ifFalse:[ ExLibQRNotInstalled new info: self qrToolFullPath ; signal ].
