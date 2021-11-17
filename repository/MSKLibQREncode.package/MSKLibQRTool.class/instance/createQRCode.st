services
createQRCode
	"	Write an image containing QR information

		Binding to http://fukuchi.org/works/qrencode/manual/functions.html

		| aMSKLibQRTool childState |

		aMSKLibQRTool := MSKLibQRTool newPNGFor: 'www.spiegel.de'  path: '/var/www/html/test.png' .
		childState := aMSKLibQRTool
								moduleSize: 15 ;
								foreground: Color black ;
								background: Color white ;
								checkForToolPath ;
								removeOutputFile ;
								createQRCode ;
								waitForProcessState ;
								checkForOutputFile ;
								checkForReturnCode
	"

	| commandLine |

	commandLine := WriteStream on: String new.

	commandLine 
		nextPutAll: self qrToolFullPath ;
		space ;
		nextPutAll: '-s ' ; nextPutAll: (self moduleSize isNil ifTrue:[ '3' ] ifFalse:[ self moduleSize asString ]); space ;
		nextPutAll: '-l ' ; nextPutAll: ( self correctionLevel isNil ifTrue:[ 'L' ] ifFalse:[ self correctionLevel asString ]); space ;
		nextPutAll: '-v ' ; nextPutAll: (self symbolVersion isNil ifTrue:[ 'auto' ] ifFalse:[ self symbolVersion asString ]); space ;
		nextPutAll: '-m ' ; nextPutAll: (self marginsWidth isNil ifTrue:[ '4' ] ifFalse:[ self marginsWidth asString ]); space ;
		nextPutAll: '-d ' ; nextPutAll: (self pngDPI isNil ifTrue:[ '72' ] ifFalse:[ self pngDPI asString ]); space ;
		nextPutAll: '-t ' ; nextPutAll: (self graphicsFormat isNil ifTrue:[ 'PNG' ] ifFalse:[ self graphicsFormat asString ]); space ;
		nextPutAll: '-o ' ; nextPutAll: self filename ; space.

	self assumeKanjiMode ifTrue:[ commandLine nextPutAll: '-k ' ].
	self enableMicroCode ifTrue:[ commandLine nextPutAll: '-M ' ].
	self makeStructuredSymbols ifTrue:[ commandLine nextPutAll: '-S ' ].

	self foreground isNil ifFalse:[
		commandLine
			nextPutAll: '--foreground=' ; nextPutAll: self foreground hex ; space
	].

	self background isNil ifFalse:[
		commandLine
			nextPutAll: '--background=' ; nextPutAll: self background hex ; space
	].
	commandLine
		nextPutAll: self text asString.

	self debug ifTrue:[ GsFile gciLogServer: 'qrToolCreateQRCode: ', commandLine contents ].

	self  process: (GsHostProcess fork: commandLine contents).

	"I close the stdin, so the forked process may terminate, but beware - the process may now a zombie process"
	self process stdin close.

	"so this is the attempt to reap a possible zombie process"
	self process childStatus.
