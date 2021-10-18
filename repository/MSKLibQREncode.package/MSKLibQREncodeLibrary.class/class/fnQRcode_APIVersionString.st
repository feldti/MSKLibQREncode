constants-functions
fnQRcode_APIVersionString
	"extern void extern char *QRcode_APIVersionString(void);"

	^SessionTemps current 
		at: #libQRcode_APIVersionString
		ifAbsent: [
			SessionTemps current 
				at: #libQRcode_APIVersionString
				put:  (CCallout library: self cLibrary name: 'QRcode_APIVersionString' result: #ptr args: #()). ]
