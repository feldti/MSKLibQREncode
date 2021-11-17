services
createQRCodeAndWaitForResult
	"	Write an image containing QR information - with additional checkings and waits for the end of the process

		Binding to http://fukuchi.org/works/qrencode/manual/functions.html

		| aMSKLibQRTool childState |

		aMSKLibQRTool := MSKLibQRTool newPNGFor: 'www.spiegel1.de'  path: '/var/www/html/test.png' .
		childState := aMSKLibQRTool
								moduleSize: 15 ;
								foreground: Color black ;
								background: Color white ;
								createQRCodeAndWaitForResult
	"

	^self 
		checkForToolPath ;
		removeOutputFile ;
		createQRCode ;
		waitForProcessState ;
		checkForOutputFile ;
		checkForReturnCode
