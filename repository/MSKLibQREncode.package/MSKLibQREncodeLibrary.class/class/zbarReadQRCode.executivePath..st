tool-support
zbarReadQRCode: filePath executivePath: exePath
	"
		Binding to http://fukuchi.org/works/qrencode/manual/functions.html

	| aMSKLibQRToolOptions |

		aMSKLibQRToolOptions := MSKLibQRToolOptions newPNGFor: 'www.schrievkrom.de/extfiles/public-smalltalk'  path: '/var/www/html/extfiles/test.png' .
		aMSKLibQRToolOptions
			moduleSize: 15 ;
			foreground: Color black ;
			background: Color white.

		MSKLibQREncodeLibrary zbarReadQRCode: '/var/www/html/extfiles/test.png' 
	"

	| commandLine process |

	commandLine := WriteStream on: String new.

	commandLine 
		nextPutAll: exePath ;
		space ; nextPutAll: ' --raw ' ;
		nextPutAll: filePath.

	process := GsHostProcess fork: commandLine contents.

	[ process childStatus isNil ] whileTrue:[
		(Delay forMilliseconds: 10) wait
	].

	^process childStatus = 0 
		ifTrue:[ 
			| stream |

			stream := ReadStream on: (process stdout readString: 4096).
			stream nextLine
		] 
		ifFalse:[ nil ]
