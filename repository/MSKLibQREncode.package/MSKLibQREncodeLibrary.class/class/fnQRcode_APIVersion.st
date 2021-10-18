constants-functions
fnQRcode_APIVersion
	"extern void QRcode_APIVersion(int *major_version, int *minor_version, int *micro_version);"

	^SessionTemps current 
		at: #libQRcode_APIVersion
		ifAbsent: [
			SessionTemps current 
				at: #libQRcode_APIVersion
				put:  (CCallout library: self cLibrary name: 'QRcode_APIVersion' result: #void args: #(#ptr #ptr #ptr )). ]
