services
readQRCodeAndWaitForResult
	"^<String | nil> reads the content of the QR image, does checking, waits for the process end and returns the result

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

	| aMSKLibQRTool |

		aMSKLibQRTool := MSKLibQRTool readQRCodeFromPath: '/var/www/html/test.png' .
		aMSKLibQRTool
			readQRCodeAndWaitForResult
	"

	^self 
		readQRCode ;
		waitForProcessState ;
		checkForReturnCode ;
		qrContent
