tool-support
zbarReadQRCode: filePath executivePath: exePath
	"^<String | nil>
		Binding to http://fukuchi.org/works/qrencode/manual/functions.html

	| aMSKLibQRToolOptions |

		aMSKLibQRToolOptions := MSKLibQRToolOptions newPNGFor: 'schrievkrom.wordpress.com'  path: '/var/www/html/test.png' .
		aMSKLibQRToolOptions
			moduleSize: 15 ;
			foreground: Color black ;
			background: Color white.
		MSKLibQREncodeLibrary qrToolCreateQRCode: aMSKLibQRToolOptions.

		MSKLibQREncodeLibrary zbarReadQRCode: '/var/www/html/test1.png' 
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
