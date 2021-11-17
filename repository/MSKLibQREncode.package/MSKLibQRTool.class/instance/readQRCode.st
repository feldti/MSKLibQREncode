services
readQRCode
	"^<String | nil> reads the content of the QR image ...

		Binding to http://fukuchi.org/works/qrencode/manual/functions.html

	| aMSKLibQRTool |

		aMSKLibQRTool := MSKLibQRTool newPNGFor: 'www.spiegel.de'  path: '/var/www/html/test.png' .
		aMSKLibQRTool
			moduleSize: 15 ;
			foreground: Color black ;
			background: Color white;
			checkForToolPath ;
			removeOutputFile ;
			createQRCode ;
			waitForProcessState ;
			checkForOutputFile ;
			checkForReturnCode.

		aMSKLibQRTool := MSKLibQRTool readQRCodeFromPath: '/var/www/html/test.png' .
		aMSKLibQRTool
			readQRCode ;
			waitForProcessState ;
			checkForReturnCode ;
			qrContent
	"

	| commandLine  |

	self checkForToolPath.

	self checkForOutputFile.

	commandLine := WriteStream on: String new.

	commandLine 
		nextPutAll: self qrToolFullPath ;
		space ; nextPutAll: ' --raw ' ;
		nextPutAll: self filename.

	self process: (GsHostProcess fork: commandLine contents).

	"I close the stdin, so the forked process may terminate, but beware - the process may now a zombie process"
	self process stdin close.

	"so this is the attempt to reap a possible zombie process"
	self process childStatus.
