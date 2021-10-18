tool-support
zbarReadQRCode: filePath
	"
		binding to package <zbar-tools>, which can be installed via sudo apt-get install zbar-tools

	| aMSKLibQRToolOptions |

		aMSKLibQRToolOptions := MSKLibQRToolOptions newPNGFor: 'www.schrievkrom.de/extfiles/public-smalltalk3'  path: '/var/www/html/extfiles/test.png' .
		aMSKLibQRToolOptions
			moduleSize: 15 ;
			foreground: Color black ;
			background: Color white.

		MSKLibQREncodeLibrary qrToolCreateQRCode: aMSKLibQRToolOptions.

		Transcript
			cr ;
			show: (MSKLibQREncodeLibrary zbarReadQRCode: '/var/www/html/extfiles/test.png' ) asString

	"

	^self zbarReadQRCode: filePath executivePath: '/usr/bin/zbarimg'
