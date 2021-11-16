tool-support
qrToolCreateQRCode: aMSKLibQRToolOptions
	"
		Binding to http://fukuchi.org/works/qrencode/manual/functions.html

	| aMSKLibQRToolOptions |

		aMSKLibQRToolOptions := MSKLibQRToolOptions newPNGFor: 'www.schrievkrom.de/extfiles/public-smalltalk'  path: '/var/www/html/extfiles/test.png' .
		aMSKLibQRToolOptions
			moduleSize: 15 ;
			foreground: Color black ;
			background: Color white.

		MSKLibQREncodeLibrary qrToolCreateQRCode: aMSKLibQRToolOptions
	"

	| commandLine process |

	((GsFile existsOnServer:  aMSKLibQRToolOptions qrToolFullPath) ifNil: [ false ])
		ifFalse:[ ExLibQRNotInstalled new info: aMSKLibQRToolOptions qrToolFullPath ; signal ].

	commandLine := WriteStream on: String new.

	commandLine 
		nextPutAll: aMSKLibQRToolOptions qrToolFullPath ;
		space ;
		nextPutAll: '-s ' ; nextPutAll: (aMSKLibQRToolOptions moduleSize isNil ifTrue:[ '3' ] ifFalse:[ aMSKLibQRToolOptions moduleSize asString ]); space ;
		nextPutAll: '-l ' ; nextPutAll: ( aMSKLibQRToolOptions correctionLevel isNil ifTrue:[ 'L' ] ifFalse:[ aMSKLibQRToolOptions correctionLevel asString ]); space ;
		nextPutAll: '-v ' ; nextPutAll: (aMSKLibQRToolOptions symbolVersion isNil ifTrue:[ 'auto' ] ifFalse:[ aMSKLibQRToolOptions symbolVersion asString ]); space ;
		nextPutAll: '-m ' ; nextPutAll: (aMSKLibQRToolOptions marginsWidth isNil ifTrue:[ '4' ] ifFalse:[ aMSKLibQRToolOptions marginsWidth asString ]); space ;
		nextPutAll: '-d ' ; nextPutAll: (aMSKLibQRToolOptions pngDPI isNil ifTrue:[ '72' ] ifFalse:[ aMSKLibQRToolOptions pngDPI asString ]); space ;
		nextPutAll: '-t ' ; nextPutAll: (aMSKLibQRToolOptions graphicsFormat isNil ifTrue:[ 'PNG' ] ifFalse:[ aMSKLibQRToolOptions graphicsFormat asString ]); space ;
		nextPutAll: '-o ' ; nextPutAll: aMSKLibQRToolOptions filename ; space.

	aMSKLibQRToolOptions assumeKanjiMode ifTrue:[ commandLine nextPutAll: '-k ' ].
	aMSKLibQRToolOptions enableMicroCode ifTrue:[ commandLine nextPutAll: '-M ' ].
	aMSKLibQRToolOptions makeStructuredSymbols ifTrue:[ commandLine nextPutAll: '-S ' ].

	aMSKLibQRToolOptions foreground isNil ifFalse:[
		commandLine
			nextPutAll: '--foreground=' ; nextPutAll: aMSKLibQRToolOptions foreground hex ; space
	].

	aMSKLibQRToolOptions background isNil ifFalse:[
		commandLine
			nextPutAll: '--background=' ; nextPutAll: aMSKLibQRToolOptions background hex ; space
	].
	commandLine
		nextPutAll: aMSKLibQRToolOptions text asString.

	"Transcript show: commandLine contents ; cr."

	process := GsHostProcess fork: commandLine contents.

	"[ process childHasExited ] whileFalse: [
		(Delay forMilliseconds: 10) wait
	]."

	((GsFile existsOnServer:  aMSKLibQRToolOptions filename) ifNil: [ false ])
		ifFalse:[ ExLibQROutputNotCreatable new info: aMSKLibQRToolOptions filename ; signal ].

	^process childStatus = 0 
		ifTrue:[ 
			| stream |

			stream := ReadStream on: (process stdout readString: 4096).
			stream nextLine
		] 
		ifFalse:[ nil ]
