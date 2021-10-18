constants-functions
fnQRcode_free
	"void QRcode_free  	( 	QRcode *  	qrcode	) 	"

	^SessionTemps current 
		at: #libQRcode_free
		ifAbsent: [
			SessionTemps current 
				at: #libQRcode_free
				put:  (CCallout library: self cLibrary name: 'QRcode_free' result: #void args: #(#ptr )). ]
