constants-functions
fnQRcode_encodeString
	"QRcode* QRcode_encodeString (const char *  	string,
		int  	version,
		QRecLevel  	level,
		QRencodeMode  	hint,
		int  	casesensitive 
	) 	
	"

	^SessionTemps current 
		at: #libQRcode_encodeString
		ifAbsent: [
			SessionTemps current 
				at: #libQRcode_encodeString
				put:  (CCallout library: self cLibrary name: 'QRcode_encodeString' result: #ptr args: #(#ptr #int #int #int #int)). ]
